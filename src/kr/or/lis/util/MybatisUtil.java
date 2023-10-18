package kr.or.lis.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MybatisUtil {
	private static SqlSessionFactory sqlSessionFactory;
	
	static {
		InputStream in = null;
		
		try {
			// 1-1. 환경 설정 파일을 읽어올 스트림 객체 생성
			in = Resources.getResourceAsStream("config/mybatis-config.xml");
			
			// 1-2. 환경 설정 파일을 읽어와 환경 설정을 완성한 후 SqlSessionFactory객체를 생성한다.
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(in);
		} catch (Exception e) {
			System.out.println("MyBatis 초기화 실패!!!");
			e.printStackTrace();
		} finally {
			if(in != null ) try { in.close(); } catch(IOException e) { }
		}
	} // static 초기화 블럭 끝...
	
	// SqlSession 객체를 생성하여 반환하는 메서드
	public static SqlSession getSqlSession() {
		
		SqlSession session = sqlSessionFactory.openSession();
		
		return session;
	}

}
