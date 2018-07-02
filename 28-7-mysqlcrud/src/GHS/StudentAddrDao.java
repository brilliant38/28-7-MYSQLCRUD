package GHS;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
public class StudentAddrDao {
	//01����̹��ε���02DB������ Connection��ü �ּҰ� ����
	public Connection driverDbcon() throws ClassNotFoundException, SQLException {
		System.out.println("01����̹��ε���DB����");
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

