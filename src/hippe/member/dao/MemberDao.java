package hippe.member.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import hippe.common.SqlMapConfig;
import hippe.func.lock.Sha256Encryption;
import hippe.member.dto.MemberDto;

public class MemberDao extends SqlMapConfig{
	
	//selectMyInfo : 회원정보조회
	//insertMember : 회원가입
	//disableMember : 회원탈퇴(member_enabled를 'N'으로 수정)
	//updateMyInfo : 회원정보수정
	
	final static String NAMESPACE = "member-mapper";
	
	public MemberDto selectMyInfo(String id){
		SqlSession session = null;
		MemberDto temp = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", id);
		try {
			session = getMemberSqlSessionFactory().openSession();
			temp = session.selectOne(NAMESPACE+".selectMyInfo", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	public MemberDto findMyId(String member_email) {
		SqlSession session = null;
		MemberDto temp = new MemberDto();
		try {
			session = getMemberSqlSessionFactory().openSession();
			temp = session.selectOne(NAMESPACE+".findMyId", member_email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return temp;
	}
	
	public int updateMyInfo(MemberDto dto) {
		SqlSession session = null;
		int res = 0;

		System.out.println("id : " + dto.getMember_id());
		System.out.println("pw : " + dto.getMember_pw());
		System.out.println("phone : " + dto.getMember_phone());
		System.out.println("address : " + dto.getMember_address());
		System.out.println("email : " + dto.getMember_email());
		

		try {
			session = getMemberSqlSessionFactory().openSession(false);

			res = session.update(NAMESPACE + ".updateInfo", dto);
			
			System.out.println("res : " + res);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return res;
	}
	
	public int updatePw(MemberDto dto) {
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getMemberSqlSessionFactory().openSession();
			res = session.update(NAMESPACE+".update-pw", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int insertMember(MemberDto dto){
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getMemberSqlSessionFactory().openSession();
			res = session.insert(NAMESPACE+".insertMember",dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return res; 
	}
	
	public int disableMember(String id) {
		
		int res = 0;
		SqlSession session = null;
		
		try {
			session = getMemberSqlSessionFactory().openSession();
			res = session.delete(NAMESPACE+".deleteMember", id);
			
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return res;
	}
	
	public boolean checkID(String member_id) {
		SqlSession session = null;
		boolean flag = false; 
		MemberDto dto = new MemberDto();
		Map<String, String> map = new HashMap<String, String>();
		map.put("member_id", member_id);
		try {
			session = getMemberSqlSessionFactory().openSession();
			dto = session.selectOne(NAMESPACE+".selectMyInfo", map);
			if(dto != null) {		//null이아님: 사용중인 아이디(F) false
				flag = false;	
			}else {					//null: 사용가능한 아이디(F) false
				flag = true;
			}
		} catch (NullPointerException e) {
			flag = true;			//null: 사용가능한 아이디(F) false
		}
		return flag;
	}
	
	
}//class end







