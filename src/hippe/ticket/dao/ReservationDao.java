package hippe.ticket.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import hippe.common.SqlMapConfig;
import hippe.ticket.dto.MyOrderDto;
import hippe.ticket.dto.ReservationDto;

public class ReservationDao extends SqlMapConfig{
	
	private final String NAMESPACE = "reservation.mapper.";

	public List<MyOrderDto> selectList(String member_id){
		List<MyOrderDto> list = new ArrayList<MyOrderDto>();
		Map<String, String> map = new HashMap<String, String>();
		SqlSession session = null;
		
		map.put("member_id", member_id);
		
		try {
			session = getReservationSqlSessionFactory().openSession();
			list = session.selectList(NAMESPACE+"selectList", map);
			
			System.out.println("dao:" + list.size());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public int insertReservation(ReservationDto dto) {
		SqlSession session = null;
		int res  = 0;
		
		try {
			session = getReservationSqlSessionFactory().openSession();
			res = session.insert(NAMESPACE+"insert-reserve", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return res;
	}
	
	public int delete(int reservation_num) {
		SqlSession session = null;
		int res  = 0;
		
		try {
			session = getReservationSqlSessionFactory().openSession();
			res = session.delete(NAMESPACE, reservation_num);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
}
