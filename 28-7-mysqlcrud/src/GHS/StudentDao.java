// 28-07 ���ؼ�
package GHS;

import GHS.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDao {        //���� �� �������� class �� ����ְ��ִ�.
	
	public void insertStudent(Student student ) { //Student Ŭ�������� insertStudent �� �޼ҵ���� student ������ �����޴�.
		System.out.println("StudentDao 01");
		int no = student.getNo();
		String st = student.getName(); // �ּҰ� ������ִ�student �ּҷ�  
		System.out.println(st + "<- 02 st");
		int ag = student.getAge();	//
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");		//DB ���� ����̹� �ε�
			
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/jjdev?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			Connection conn  = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
 			PreparedStatement pstmt = conn.prepareStatement("insert into student values (?, ?, ?)");
			pstmt.setInt(1, no);
			pstmt.setString(2,st);
			pstmt.setInt(3, ag);
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
