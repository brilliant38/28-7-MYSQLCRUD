package service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class StudentAddrDao {
	
	

	public void insertStudentAddr(StudentAddr studentaddr) {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		int staddr = studentaddr.getStudent_no();
		String staddr2 = studentaddr.getStudent_addr_content();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : conn 객체 생성 완료");
			
			preparedStatement = connection.prepareStatement("INSERT INTO student_addr (student_no,student_addr_content) VALUES (?,?))");
			preparedStatement.setInt(1, staddr);
			preparedStatement.setString(2, staddr2);
			
			//번호를 참조하여 주소 테이블에 행 추가.
			preparedStatement.executeUpdate();
			
			preparedStatement.close();
			connection.close();
			
				
				
			
		}catch (Exception e) {
		}finally {
			
		}
	}
		// TODO: handle exception
	
	public ArrayList<StudentAddr> studentAddrlist(int addr) {
		System.out.println("StudentAddrlist 01");
		ArrayList<StudentAddr> List = new ArrayList<StudentAddr>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			preparedStatement = connection.prepareStatement("SELECT student_addr_content,student_addr_no,student_no FROM student_addr WHERE student_no=?");
			preparedStatement.setInt(1,addr);
			
			
			rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				StudentAddr studentaddr = new StudentAddr();
				studentaddr.setStudent_addr_content(rs.getString(1));
				List.add(studentaddr);
				rs.close();
				preparedStatement.close();
				connection.close();
				
				return List;
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("????");
			e.printStackTrace();
			
		}catch(SQLException e) {
			System.out.println("!!!!");
			e.printStackTrace();
		}
		return List;
	}
	
	public void insertStudent(Student student ) { 
		System.out.println("StudentDao 01");
		String st = student.getStudent_name(); 
		System.out.println(st + "<- 02 st");
		int ag = student.getStudent_age();	
		
		
			try {
				Class.forName("com.mysql.jdbc.Driver");		
			
		
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			Connection connection  = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
 			PreparedStatement preparedStatement = connection.prepareStatement("insert into student (student_name, student_age) values (?, ? )");
 			preparedStatement.setString(1,st);
 			preparedStatement.setInt(2, ag);
 			preparedStatement.executeUpdate();
			
 			preparedStatement.close();
 			connection.close();
			
		
			
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



