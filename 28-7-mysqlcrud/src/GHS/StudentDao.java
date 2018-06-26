// 28-07 구해성
package GHS;

import GHS.Student;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class StudentDao {        //현제 이 페이지의 class 를 얄려주고있다.
	
	public void insertStudent(Student student ) { //Student 클래스에서 insertStudent 인 메소드명에서 student 변수를 생성햇다.
		System.out.println("StudentDao 01");
		int no = student.getNo();
		String st = student.getName(); // 주소가 담겨져있는student 주소로  
		System.out.println(st + "<- 02 st");
		int ag = student.getAge();	//
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");		//DB 연결 드라이버 로딩
			
		
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
