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
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, password);
			preparedStatement = connection.prepareStatement("SELECT LEFT(AVG(score),2) Average FROM student_score");
			System.out.println(preparedStatement + "<-1 pstmt");
			resultSet= preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				avg = resultSet.getInt(1);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			
		}try {
			resultSet.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			preparedStatement.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
			connection.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
		System.out.println(avg + " : average called");

			
		
		return avg;
	
	}
	
		
	
	public ArrayList<StudentAndScore> selectStudentListAboveAvg(int currentPage, int pagePerRow) {
		ArrayList<StudentAndScore> list = new ArrayList<StudentAndScore>();
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedstatementRowNumber = null;
		ResultSet resultsetRowNumber = null;
		ResultSet resultSet = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String user = "root";
		String password = "java0000";
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, user, password);
			
			preparedstatementRowNumber = connection.prepareStatement("SELECT count(*)FROM student_score ss INNER JOIN student s ON s.student_no = ss.student_no WHERE ss.score>=(SELECT AVG(score) FROM student_score) ORDER BY ss.score DESC"); //변수에 저장된 쿼리문 입력
			System.out.println(preparedstatementRowNumber + " : 02 preparedstatementRowNumber");
			
			resultsetRowNumber = preparedstatementRowNumber.executeQuery();//쿼리문 실행
			System.out.println(resultsetRowNumber + " : 03 resultsetRowNumber");
			
			if(resultsetRowNumber.next()) {
				resultsetRowNumber.getInt(1); //총 행의 갯수 출력
			}
			
			int rowNumber = resultsetRowNumber.getInt(1);
			System.out.println(rowNumber + " : 04 rowNumber");
			
			int startRow = (currentPage -1) * pagePerRow; // currentPage, pagePerRow를 이용하여 구한다.
			System.out.println(startRow + " : 05 startRow");
			
			int end = startRow + (pagePerRow - 1); // end값이 전체 페이지 갯수를 초과하면 페이지를 표시할 수 없으므로 예외가 출력된다.
			if (end > pagePerRow-1) { //end의 값이 총 행의 갯수 -1 보다 크면 
				end = pagePerRow; // end의 값을 총 행의 갯수와 같게 만든다. = 배열 초과 금지.
			}
			System.out.println(end + " : 06 end");

			preparedStatement = connection.prepareStatement("SELECT ss.score, s.student_name, ss.student_score_no, s.student_no FROM student_score ss INNER JOIN student s ON s.student_no = ss.student_no WHERE ss.score>=(SELECT AVG(score) FROM student_score) ORDER BY ss.score DESC LIMIT ?,?");
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
			System.out.println(preparedStatement + "1st<-pstmt문장");
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Student student = new Student();
				student.setStudent_no(resultSet.getInt(4));
				student.setStudent_name(resultSet.getString(2));
				student.setRowNumber(rowNumber);
				
				StudentScore studentScore = new StudentScore();
				studentScore.setScore(resultSet.getInt(1));
				studentScore.setStudent_score_no(resultSet.getInt(3));
				
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
