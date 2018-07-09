// 28-07 구해성
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import service.Student;
import service.StudentAddr;
public class StudentDao {        
	
	
	public ArrayList<Student> selectStudent(int currentPage, int pagePerRow) {
		
		ArrayList<Student> List = new ArrayList<>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		PreparedStatement pstmt2 = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt = conn.prepareStatement( "SELECT count(*) FROM student");
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rs.getInt(1);
			}
			
			int rowNumber = rs.getInt(1);
			
			int startRow = (currentPage -1) * pagePerRow;
			
			int end = startRow + (pagePerRow -1);
			if (end > pagePerRow-1) {
				end = pagePerRow;
			}
			pstmt2 = conn.prepareStatement( "SELECT student_no, studnet_name, studnet_age FROM student ORDER BY student_no LIMIT ?,?");
			pstmt2.setInt(1, startRow);
			pstmt2.setInt(2, pagePerRow);
			
			rs2= pstmt2.executeQuery();
			
			while(rs2.next()) {
				Student student = new Student();
				student.setStudent_no(rs2.getInt(1));
				student.setStudent_name(rs2.getString(2));
				student.setStudent_age(rs2.getInt(3));
			}
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		return List;

		
	// TODO: handle exception
}
	
	
	public void updateStudent(Student student) {
		System.out.println(01 + "<-update 확인");
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");

			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			
			pstmt= conn.prepareStatement("UPDATE student SET student_name = ?, student_age = ? where student_no = ?");
			pstmt.setString(1, student.getStudent_name());
			pstmt.setInt(2,student.getStudent_age());
			pstmt.setInt(3,student.getStudent_no());
			
			pstmt.executeUpdate();
		}catch (Exception e) {

		}
	}

	
	
	public void StudentDelete(String Sid) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println("!!DELETE확인");
		try{
			Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("DELETE FROM student WHERE Student_no=?");
			System.out.println(pstmt + "<-- pstmt 1");
			pstmt.setString(1, Sid);
			pstmt.executeUpdate();
			pstmt.close();
			conn.close();
		}catch (Exception e) {
			
		}finally {
			if (rs != null) try { rs.close(); } catch(SQLException ex) {}
			if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
			
			// 7. 커넥션 종료
			if (conn != null) try { conn.close(); } catch(SQLException ex) {}
		}
		}
	
	}
	

		
		
			