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
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(int currentPage, int pagePerRow) {
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";
		try {
			Class.forName(driver);
			conn = DriverManager.getConnection(url, user, password);
			pstmt = conn.prepareStatement("SELECT ss.score,s.student_nameFROM student_score ss INNER JOIN student sON s.student_no = s.student_no WHERE ss.score>=(SELECT AVG(score) FROM student_score)ORDER BY ss.score ASC");
			System.out.println(pstmt + "1st<-pstmt문장");
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				rs.getInt(1);
			}
			
			int page = rs.getInt(1);
			System.out.println(page + "2nd<-page ");
	
		}catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
