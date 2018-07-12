package service;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
public class StudentAddrDao {
	
	

	public void insertStudentAddr(StudentAddr studentaddr) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(conn + " : Connection 객체 생성 완료");
			
			pstmt = conn.prepareStatement("INSERT INTO student_addr (student_no,student_addr_content) VALUES (?,?))");
			pstmt.setInt(1, studentaddr.getStudent_no());
			pstmt.setString(2, studentaddr.getStudent_addr_content());
			
			//번호를 참조하여 주소 테이블에 행 추가.
			pstmt.executeUpdate();
		
		
			
		}catch (Exception e) {
		}finally {
			
		}return;
	}
		// TODO: handle exception
	
	public ArrayList<StudentAddr> studentAddrlist(int addr) {
		System.out.println("StudentAddrlist 01");
		ArrayList<StudentAddr> List = new ArrayList<StudentAddr>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement("SELECT student_addr_content,student_addr_no,student_no FROM student_addr WHERE student_no=?");
			pstmt.setInt(1,addr);
			
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				StudentAddr studentaddr = new StudentAddr();
				studentaddr.setStudent_addr_content(rs.getString(1));
				List.add(studentaddr);
				rs.close();
				pstmt.close();
				conn.close();
				
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



