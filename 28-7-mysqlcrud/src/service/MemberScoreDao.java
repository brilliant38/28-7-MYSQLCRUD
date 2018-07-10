/*2018-07-09 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberScoreDao {
	
	/*	1.집합함수(avg) 사용하여 Score평균값 출력하기 ex) count()
	 *	sum(),avg(),max(),min(),count()
	 *
	 *	2.subquery()사용하여 score가 평균 점수 이상의 값을 출력할 수 있다.
	 *	SELECT * FROM member_score
	 *	WHERE score>=(SELECT AVG(score) FROM member_score);
	 *		
	 *	3.
	*/
	
	public int selectScoreAverage() {
		int average = 0;
		// SELECT LEFT(AVG(score),2) Average FROM member_score
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String databaseUser = "root";
		String password = "java0000";
		String selectScoreAverageSql = "SELECT LEFT(AVG(score),2) Average FROM member_score";
		
		try {
			Class.forName(driver);
			connection = DriverManager.getConnection(url, databaseUser, password);
			preparedStatement = connection.prepareStatement(selectScoreAverageSql);
			
			resultSet = preparedStatement.executeQuery();
			
			if(resultSet.next()) {
				average = resultSet.getInt(1);
			}
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			
			try {
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
		}
		System.out.println(average + " : average called");
		
		return average;
	}
	
	public ArrayList<MemberAndScore> selectMemberListAboveAverage(int currentPage, int pagePerRow) {
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>(); //JSP 페이지에서 JAVA 표준 API의 배열로 리턴하기 위해서 사용
		
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		PreparedStatement preparedstatementRowNumber = null;
		ResultSet resultSet = null;
		ResultSet resultsetRowNumber = null;
		String driver = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String databaseUser = "root";
		String password = "java0000";
		String selectMemberListAboveAverageSql = "SELECT m.member_no,ms.score,m.member_name FROM member_score ms INNER JOIN member m ON m.member_no = ms.member_no WHERE ms.score>=(SELECT AVG(score) FROM member_score) ORDER BY ms.score DESC LIMIT ?,?";
		
		try {
			/*
				SELECT ms.score,m.member_name
				FROM member_score ms INNER JOIN member m
				ON m.member_no = ms.member_no 양 컬럼의 값이 같은 것만
				WHERE ms.score>=(
								SELECT AVG(score) FROM member_score
							)
				ORDER BY ms.score DESC 높은 점수부터 내림차순으로 정렬
				LIMIT ?,?
			 */
			
			//데이터 베이스 연결
			Class.forName(driver);
			
			connection = DriverManager.getConnection(url, databaseUser, password);
			
			//전체 행 갯수 구하기
			preparedstatementRowNumber = connection.prepareStatement("SELECT COUNT(*)FROM member m INNER JOIN member_score ms ON m.member_no = ms.member_no WHERE score>=(SELECT AVG(score) FROM member_score)");
			System.out.println(preparedstatementRowNumber + " : 02 preparedstatementRowNumber");
			
			resultsetRowNumber = preparedstatementRowNumber.executeQuery();//쿼리문 실행
			System.out.println(resultsetRowNumber + " : 03 resultsetRowNumber");
			
			if(resultsetRowNumber.next()) {
				resultsetRowNumber.getInt(1); //총 행의 갯수 출력
			}
			//총 행의 갯수 저장
			int rowNumber = resultsetRowNumber.getInt(1);
			System.out.println(rowNumber + " : 04 rowNumber");
			
			//각 페이지 시작행의 번호(~번 행부터)
			int startRow = (currentPage - 1) * pagePerRow;
			System.out.println(startRow + " : 05 startRow");
			
			int end = startRow + (pagePerRow - 1); // end값이 전체 페이지 갯수를 초과하면 페이지를 표시할 수 없으므로 예외가 출력된다.
			if (end > pagePerRow-1) { //end의 값이 총 행의 갯수 -1 보다 크면 
				end = pagePerRow; // end의 값을 총 행의 갯수와 같게 만든다. = 배열 초과 금지.
			}
			System.out.println(end + " : 06 end");
			
			preparedStatement = connection.prepareStatement(selectMemberListAboveAverageSql);
			
			preparedStatement.setInt(1, startRow);
			preparedStatement.setInt(2, pagePerRow);
			System.out.println(preparedStatement + " : 07 preparedStatement 객체 생성 완료");
			
			resultSet = preparedStatement.executeQuery();
			
			while(resultSet.next()) {
				Member member = new Member();
				member.setMemberNo(resultSet.getInt(1));
				member.setMemberName(resultSet.getString(3));
				member.setRowNumber(rowNumber);
				
				MemberScore memberScore = new MemberScore();
				memberScore.setScore(resultSet.getInt(2));
				
				MemberAndScore memberAndScore = new MemberAndScore();
				memberAndScore.setMember(member);
				memberAndScore.setMemberScore(memberScore);
				
				list.add(memberAndScore);
			}
			
		} catch (Exception e){
			e.printStackTrace();
			
		} finally {
			
			try {
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
			
		}
		
		return list;
	}
	
	
	public ArrayList<MemberAndScore> selectMemberAndScored(int currentPage, int pagePerRow, String searchWord) {
		ArrayList<MemberAndScore> list = new ArrayList<MemberAndScore>(); 
		
		Connection connection = null;
		PreparedStatement preparedStatementScore = null;
		PreparedStatement preparedstatementRowNumber = null;
		ResultSet resultsetScore = null;
		ResultSet resultsetRowNumber = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			connection = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			System.out.println(connection + " : Connection 객체 생성 완료");
			
			preparedstatementRowNumber = connection.prepareStatement("SELECT count(*) FROM member"); //변수에 저장된 쿼리문 입력
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
			
			if(searchWord.equals("")) {//searchWord 변수에 공백이 넘어왔을때 동작하는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement("SELECT ms.member_score_no, ms.member_no, m.member_name, m.member_age, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no ORDER BY ms.member_score_no ASC LIMIT ?,?");
				preparedStatementScore.setInt(1, startRow);
				preparedStatementScore.setInt(2, pagePerRow);
				System.out.println(resultsetScore + " : 07 preparedStatementScore 객체 생성 완료");
				
				resultsetScore = preparedStatementScore.executeQuery();
			
			} else {//searchWord 변수에 값이 입력되었을때 동작되는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement("SELECT ms.member_score_no, ms.member_no, m.member_name, m.member_age, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no WHERE member_name LIKE ? ORDER BY ms.member_score_no ASC LIMIT ?,?");
				preparedStatementScore.setString(1, "%"+searchWord+"%");
				preparedStatementScore.setInt(2, startRow);
				preparedStatementScore.setInt(3, pagePerRow);
				System.out.println(resultsetScore + " : 07 preparedStatementScore 객체 생성 완료");
				
				resultsetScore = preparedStatementScore.executeQuery();
			}
			
			System.out.println(resultsetScore + " : 08 resultsetScore 객체 생성 완료");
			
			while(resultsetScore.next()) {
				Member member = new Member();
				
				member.setMemberName(resultsetScore.getString(3));
				member.setMemberAge(resultsetScore.getInt(4));
				member.setRowNumber(rowNumber);
				
				MemberScore memberScore = new MemberScore();
				memberScore.setMemberNo(resultsetScore.getInt(2));
				memberScore.setMemberScoreNo(resultsetScore.getInt(1));
				memberScore.setScore(resultsetScore.getInt(5));
				
				MemberAndScore memberAndScore = new MemberAndScore();
				memberAndScore.setMember(member);
				memberAndScore.setMemberScore(memberScore);
				
				list.add(memberAndScore);
			}
			
			System.out.println(list + " : 09 list 객체 생성 완료");
			
		} catch (ClassNotFoundException e) {	//클래스 예외처리 작성
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {	//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
			
		} catch (IndexOutOfBoundsException e) {
			System.out.println("DB에 주소값이 없습니다.");
			e.printStackTrace();
		} finally {
			try {
				resultsetScore.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				preparedStatementScore.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			try {
				connection.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
		
		return list;
	}
	
	public void insertMemeberAndScored() {
		
	}
}

