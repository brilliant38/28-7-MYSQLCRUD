package GHS;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class StudentAddrDao {
	//01드라이버로딩과02DB연결후 Connection객체 주소값 리턴
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01드라이버로딩및DB연결");
		Class.forName("com.mysql.jdbc.Driver");

		String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		
		Connection reconn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(reconn + "<-- reconn");

		return reconn;
	}
}

