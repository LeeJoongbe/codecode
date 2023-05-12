package org.zerock.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j2
public class JDBCTests {
	@Setter(onMethod_ = {@Autowired})
	private DataSource dataSource;
	
	
	
	
//	static {
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			
//			
//		}catch (Exception e) {
//			// TODO: handle exception
//			e.printStackTrace();
//		}
//		
//	}
	
	@Test
	public void testConnection() {
		try (Connection con=
				dataSource.getConnection()
				){
			log.info("연결완료 : " + con);
		}catch (Exception e) {
			// TODO: handle exception
			fail(e.getMessage());
		}
		
	}
	
}
