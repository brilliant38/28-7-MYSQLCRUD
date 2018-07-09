/*2018-07-09 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberScoreDao {
	
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
			System.out.println(end + " : 07 end");
			
			
			if(searchWord.equals("")) {//searchWord 변수에 공백이 넘어왔을때 동작하는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement("SELECT ms.member_score_no, ms.member_no, m.member_name, m.member_age, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no ORDER BY ms.member_score_no ASC LIMIT ?,?");
				preparedStatementScore.setInt(1, startRow);
				preparedStatementScore.setInt(2, pagePerRow);
				
				resultsetScore = preparedStatementScore.executeQuery();
			
			} else {//searchWord 변수에 값이 입력되었을때 동작되는 쿼리문이다.
				preparedStatementScore = connection.prepareStatement("SELECT ms.member_score_no, ms.member_no, m.member_name, m.member_age, ms.score FROM member_score ms INNER JOIN member m ON ms.member_no = m.member_no WHERE member_name LIKE ? ORDER BY ms.member_score_no ASC LIMIT ?,?");
				preparedStatementScore.setString(1, "%"+searchWord+"%");
				preparedStatementScore.setInt(2, startRow);
				preparedStatementScore.setInt(3, pagePerRow);
				
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

