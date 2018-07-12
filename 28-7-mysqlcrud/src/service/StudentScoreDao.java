package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class StudentScoreDao {
	

	public int selectScoreAvg() {
		int avg = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";
		
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT LEFT(AVG(score),2) Average FROM student_score");
			System.out.println(pstmt + "<-1 pstmt");
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				avg = rs.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}try {
			rs.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println(avg + " : average called");

			
		
		return avg;
	
	}
	
		
	
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(int currentPage, int pagePerRow) {
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT ss.score, s.student_name, ss.student_score_no, s.student_no FROM student_score ss INNER JOIN student s ON s.student_no = ss.student_no WHERE ss.score>=(SELECT AVG(score) FROM student_score) ORDER BY ss.score ASC");
			System.out.println(pstmt + "1st<-pstmt문장");
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Student student = new Student();
				student.setStudent_no(rs.getInt(4));
				student.setStudent_name(rs.getString(2));
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(rs.getInt(1));
				studentScore.setStudent_score_no(rs.getInt(3));
				
				
				
				StudentAndScore studentAndScore = new StudentAndScore();
				studentAndScore.setStudent(student);
				studentAndScore.setStudentScore(studentScore);
				list.add(studentAndScore);
			}
			
	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
