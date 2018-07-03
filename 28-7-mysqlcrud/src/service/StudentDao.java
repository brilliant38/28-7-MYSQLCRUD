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
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	ArrayList<Student> Stu = null;
	public void StudentUpdate(String Sid) {
		System.out.println("!!DELETE확인");
		try{
			Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
					"useUnicode=true&characterEncoding=euckr";
			String dbUser = "root"; //드라이버 id
			String dbPass = "java0000"; // 드라이버 pw
			
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			pstmt = conn.prepareStatement("UPDATE Student SET student_name=?,student_age=?, WHERE student_no=?");
			System.out.println(pstmt + "<-- pstmt 1");
			pstmt.setint(1, Sid.getstudent_no());
			pstmt.setString(2,Sid.get);
			pstmt.setString(3,Sid.get);
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
	public void StudentDelete(String Sid) {
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
	

		
		
			