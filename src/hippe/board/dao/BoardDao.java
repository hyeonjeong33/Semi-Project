package hippe.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import hippe.board.dto.BoardDto;
import hippe.common.SqlMapConfig;

public class BoardDao extends SqlMapConfig{

	private String NAMESPACE = "board.mapper.";
	
	public List<BoardDto> selectList(int board_category){
		SqlSession session = null;
		
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			session = getBoardSqlSessionFactory().openSession();
			list = session.selectList(NAMESPACE+"selectlist",board_category);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	/********************* 자유게시판 검색기능 ***********************/	
	public List<BoardDto> searchlist1(String field, String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);
		System.out.println("다오 keyword: " + keyword);
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			session = getBoardSqlSessionFactory().openSession();
			
			list = session.selectList(NAMESPACE + "searchlist1", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	/********************* 후기게시판 검색기능 ***********************/	
	public List<BoardDto> searchlist2(String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("keyword", keyword);
		System.out.println("다오 keyword: " + keyword);
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			session = getBoardSqlSessionFactory().openSession();
			
			list = session.selectList(NAMESPACE + "searchlist2", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
	/********************* 이벤트게시판 검색기능 ***********************/	
	public List<BoardDto> searchlist(String field, String keyword){
		Map<String, String> map = new HashMap<String, String>();
		map.put("field", field);
		map.put("keyword", keyword);
		System.out.println("다오 keyword: " + keyword);
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		try {
			session = getBoardSqlSessionFactory().openSession();
			
			list = session.selectList(NAMESPACE + "searchlist", map);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	
	public List<BoardDto> selectListWithPaging(int board_category, int from, int to){
		SqlSession session = null;
		List<BoardDto> list = new ArrayList<BoardDto>();
		Map<String, Integer> map = new HashMap<String,Integer>();
		map.put("board_category", board_category);
		map.put("from",from);
		map.put("to",to);
		
		try {
			session = getBoardSqlSessionFactory().openSession();
			list = session.selectList(NAMESPACE+"selectlistPaging", map);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public BoardDto selectone(int board_postnum) {

		BoardDto dto = new BoardDto();
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("board_postnum",board_postnum);
		
		SqlSession session = null;
		
		session = getBoardSqlSessionFactory().openSession();
		dto = session.selectOne(NAMESPACE+"selectOne", map);
		
		return dto;
		
	}
	
	public int insert(BoardDto dto) {
		
		SqlSession session = null;
		
		int res = 0;
		try {
			session = getBoardSqlSessionFactory().openSession();
			res = session.insert(NAMESPACE+"insert", dto);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int delete(int board_postnum) {
		
		SqlSession session = null;
		int res = 0;
		
		try {
			session = getBoardSqlSessionFactory().openSession();
			res = session.delete(NAMESPACE+"deleteNum", board_postnum);
			if(res>0) {
				session.commit();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int multiDelete(String[] board_postnum) {
		int count = 0;
		
		Map<String,String[]> map = new HashMap<String, String[]>();
		map.put("board_postnums",board_postnum);
		
		SqlSession session = null;
		
		try {
			session = getBoardSqlSessionFactory().openSession(false);
			count = session.delete(NAMESPACE+"delete",map);
			
			if(count == board_postnum.length) {
				session.commit();
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return count;
	}
	
	public int update(BoardDto dto) {
		
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getBoardSqlSessionFactory().openSession();
			res = session.update(NAMESPACE+"update",dto);
			if(res>0) {
				session.commit(); 	
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return res;
		
	}
	public int answer(BoardDto dto) {
		SqlSession session = null;
		
		int res = 0;
		
		try {
			session = getBoardSqlSessionFactory().openSession();
			res = session.update(NAMESPACE+"answer",dto);
			if(res>0) {
				session.commit(); 	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	public int getTotal(int board_category) {
  
        int res = 0;
        SqlSession session = null;
//        Connection con = null;
//        PreparedStatement pstm = null;
//        ResultSet rs = null;
       
        try {
           session = getBoardSqlSessionFactory().openSession();
           res = session.selectOne(NAMESPACE+"getTotal", board_category);
           
           System.out.println("총게시물수 : " + res);
                    
        } catch (Exception e) {
            e.printStackTrace();
        }
        return res;
    }
	

}
