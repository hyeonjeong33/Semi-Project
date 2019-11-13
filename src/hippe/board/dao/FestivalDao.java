package hippe.board.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import hippe.board.dto.FestivalDto;
import hippe.common.SqlMapConfig;

public class FestivalDao extends SqlMapConfig{
   
private final String NAMESPACE = "festival.mapper.";
   
   /* 축제목록 전체출력 */
   public List<FestivalDto> selectList(){
      List<FestivalDto> list = new ArrayList<FestivalDto>();
      SqlSession session = null;
      
      try {
         session = getFestivalSqlSessionFactory().openSession();
         list = session.selectList(NAMESPACE+"selectList");
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return list;
   }
   
   public FestivalDto selectOne(int festival_num) {
      FestivalDto dto = new FestivalDto();
      SqlSession session = null;
      Map<String, Integer> map = new HashMap<String, Integer>();
      map.put("festival_num", festival_num);
      try {
         session = getFestivalSqlSessionFactory().openSession();
         dto = session.selectOne(NAMESPACE+"selectOne", festival_num);
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      return dto;
   }
   
   
      /* 축제목록 (계절별, 월별) */
      public List<FestivalDto> selectFestival(String key, String value){
         List<FestivalDto> list = new ArrayList<FestivalDto>();
         SqlSession session = null;
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("key", key);
         if(key.equals("season")) {
            map.put("season", value);
         } 
         try {
            session = getFestivalSqlSessionFactory().openSession();
            list = session.selectList(NAMESPACE+"selectFestival", map);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         return list;
      }
      
      public List<FestivalDto> selectMonthly(String key, String value){
         List<FestivalDto> list = new ArrayList<FestivalDto>();
         SqlSession session = null;
         Map<String, Object> map = new HashMap<String, Object>();
         map.put("key", key);
         if(key.equals("monthly")) {
            map.put("monthly", value);
         }
         
         try {
            session = getFestivalSqlSessionFactory().openSession();
            list = session.selectList(NAMESPACE+"selectMonthly", map);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
         
         return list;
      }
   
   /* 축제목록 (지역별) */
   public List<FestivalDto> selectRegional(String region){
       SqlSession session = null;
         List<FestivalDto> list = new ArrayList<FestivalDto>();
         Map<String, String> map = new HashMap<String, String>();
         
         map.put("region", region);
         
         
         try {
            session = getFestivalSqlSessionFactory().openSession();
         list = session.selectList(NAMESPACE+"selectCity", map);
      } catch (Exception e) {
         e.printStackTrace();
      }         
   
      return list;
   
   }
   
   public List<FestivalDto> selectRecommend(){
      SqlSession session = null;
      List<FestivalDto> list_recommend = new ArrayList<FestivalDto>();
      
      try {
         session = getFestivalSqlSessionFactory().openSession();
         list_recommend = session.selectList(NAMESPACE+"selectRecommend");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return list_recommend;
   }
   
}