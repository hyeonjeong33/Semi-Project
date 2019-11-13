package hippe.member.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import hippe.common.SqlMapConfig;
import hippe.member.dto.InterestDto;

public class InterestDao extends SqlMapConfig{
	
	private final String NAMESPACE = "interest.mapper.";
	
	public List<InterestDto> selectInterestList(String id){
		SqlSession session = null;
		List<InterestDto> list = new ArrayList<InterestDto>();
		
		try {
			session = getInterestSqlSessionFactory().openSession();
			list = session.selectList(NAMESPACE, id);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	   public InterestDto selectOne(int seq) {

	      InterestDto dto = new InterestDto();

	      Map<String, Integer> map = new HashMap<String, Integer>();
	      map.put("seq", seq);

	      SqlSession session = null;

	      session = getInterestSqlSessionFactory().openSession();
	      dto = session.selectOne(NAMESPACE + "selectOne", map);
	      return dto;
	   }

	   public int insert(String id, int number) {
	      int res = 0;
	      SqlSession session = null;
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("interest_id", id);
	      map.put("interest_f_num", (int)number);
	      
	      session = getInterestSqlSessionFactory().openSession();
	      res = session.insert(NAMESPACE + "insert", map);
	      if (res > 0) {
	         session.commit();
	      }
	      return res;
	   }

	   public int update(InterestDto dto) {
	      int res = 0;
	      SqlSession session = null;
	      session = getInterestSqlSessionFactory().openSession();
	      res = session.insert(NAMESPACE + "update", dto);
	      if (res > 0) {
	         session.commit();
	      }
	      return res;
	   }

	   public int delete(String id, int number) {
	      int res = 0;
	      SqlSession session = null;
	      
	      Map<String, Object> map = new HashMap<String, Object>();
	      map.put("interest_id", id);
	      map.put("interest_f_num", (int)number);
	      System.out.println("interest_id: " + map.get("interest_id"));
	      
	      session = getInterestSqlSessionFactory().openSession();
	      res = session.delete(NAMESPACE + "delete", map);
	      if (res > 0) {
	         session.commit();
	      }
	      return res;
	   }

}
