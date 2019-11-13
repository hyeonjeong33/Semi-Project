package hippe.common;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	
	private SqlSessionFactory sqlSessionFactory;
	
	/********************* 멤버용 ***********************/
	public SqlSessionFactory getMemberSqlSessionFactory() {
		String resource = "hippe/member/db/member-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	/********************* 게시판용 ***********************/
	public SqlSessionFactory getBoardSqlSessionFactory() {
		String resource = "hippe/board/db/board-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getFestivalSqlSessionFactory() {
		String resource = "hippe/board/db/festival-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getReservationSqlSessionFactory() {
		String resource = "hippe/ticket/db/reservation_config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}
	
	public SqlSessionFactory getInterestSqlSessionFactory() {
		String resource = "hippe/member/db/interest-config.xml";
		
		try {
			Reader reader = Resources.getResourceAsReader(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return sqlSessionFactory;
	}

}
