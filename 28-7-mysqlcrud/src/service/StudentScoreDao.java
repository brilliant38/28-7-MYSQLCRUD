package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StudentScoreDao {
	public int selectScoreAvg() {
		return 0;
		// SELECT AVG(score
	}
	public ArrayList<StudentAndScore> selectMemberListAboveAvg() {
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
			pstmt = conn.prepareStatement("select avg(?) from student_score");
			rs = pstmt.executeQuery();
			
			
			/*
			 SELECT m.member_name, ms.score
			 FROm member_score ms INNER JOIN member m 
			 ON ms.member_no = m.member_no
			 WHERE ms.score >= (
			 					SELECT AVG(score) FROM member_score;)
			 					ORDER bu ms.
			  */
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
