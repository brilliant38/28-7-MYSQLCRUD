// 28-07 ���ؼ�
package GHS;

import GHS.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDao {       
	
	public void insertStudent(Student student ) { //Student Ŭ�������� insertStudent �� �޼ҵ���� student ������ �����޴�.
		System.out.println("StudentDao 01");
		String st = student.getStudent_name(); // �ּҰ� ������ִ�student �ּҷ�  
		System.out.println(st + "<- 02 st");
		int ag = student.getStudent_age();	//
		
			try {
				Class.forName("com.mysql.jdbc.Driver");		//DB ���� ����̹� �ε�
		
				String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
				String dbUser = "root";
				String dbPass = "java0000";
				Connection conn  = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
				
	 			PreparedStatement pstmt = conn.prepareStatement("insert into student (student_name, student_age) values (?, ? )");
				pstmt.setString(1,st);
				pstmt.setInt(2, ag);
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
			
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				System.out.println("????");
				e.printStackTrace();
				
			}catch(SQLException e) {
				System.out.println("!!!!");
				e.printStackTrace();
			}
			
	}
}
