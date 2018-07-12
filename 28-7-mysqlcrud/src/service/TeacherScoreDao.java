package service;

import java.sql.*;
import service.*;

public class TeacherScoreDao {
	
	// 해당 교사의 점수를 삭제하는 메서드
	// 교사를 특정하기 위해 teacherNo 변수 안의 값을 매개변수로 입력 받는다.
	// 리턴 데이터는 없다.
	public void deleteTeacherScore (int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtDeleteTeacherScore = null;
		
		// teacherList.jsp로 부터 teacherNo 값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherScoreDao.java " + teacherNo);
		
		// teacher_score 테이블의 특정 레코드를 삭제하는 쿼리
		String sqlDeleteTeacherScore = "DELETE FROM teacher_score WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtDeleteTeacherScore = conn.prepareStatement(sqlDeleteTeacherScore);
			
			// ? 에 값 대입
			pstmtDeleteTeacherScore.setInt(1, teacherNo);
			
			// 쿼리 실행 및 수정된 레코드 갯수 출력
			System.out.println("teacher_score 테이블에서 삭제된 레코드 수 : " + pstmtDeleteTeacherScore.executeUpdate());
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtDeleteTeacherScore != null) {
				try {
					pstmtDeleteTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}
	}
	
	// teacher_score 테이블의 특정 레코드를 수정하는 메서드
	// 특정 레코드를 가리키고 수정내용을 입력하기위해 매개변수로 teacherScore 객체의 참조값을 입력 받음
	// 아무것도 리턴하지 않겠다
	public void updateTeacherScore (TeacherScore teacherScore) {
		Connection conn = null;
		PreparedStatement pstmtUpdateTeacherScore = null;
		
		// updateTeacherScore.jsp로 부터 teacherScore 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("teacherScore, updateTeacherScore.jsp => TeacherScoreDao.java " + teacherScore);
		
		// teacher_score 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateTeacherScore = "UPDATE teacher_score SET score = ? WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtUpdateTeacherScore = conn.prepareStatement(sqlUpdateTeacherScore);
			
			// ? 에 값 대입
			pstmtUpdateTeacherScore.setInt(1,teacherScore.getScore());
			pstmtUpdateTeacherScore.setInt(2,teacherScore.getTeacherNo());
			
			// 쿼리 실행 및 수정된 레코드 갯수 출력
			System.out.println("teacher_score 테이블에서 수정된 레코드 수 : " + pstmtUpdateTeacherScore.executeUpdate());
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateTeacherScore != null) {
				try {
					pstmtUpdateTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}
	}
	
	// 특정 교사의 teacher 테이블과 teacher_score 테이블을 조인하여 조회하는 메서드
	// 교사를 특정하기 위해 매개변수로 교사 번호를 입력받음
	// VO를 통해 teacherScoreList.jsp로 전달하기 위해 teacherAndTeacherScore VO를 리턴
	public TeacherAndScore selectTeacherAndTeacherScore(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherAndTeacherScore = null;
		ResultSet rsSelectTeacherAndTeacherScore = null;
		TeacherAndScore teacherAndTeacherScore = null;
		
		// teacherScoreList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherScoreList.jsp => TeacherScoreDao.java " + teacherNo);
		
		// teacher와 teacher_score 테이블에서  WHERE 조건에 해당하는 레코드를 내부 조인하여 조회하는 쿼리 
		String sqlSelectTeacherAndTeacherScore = "SELECT t.teacher_no,t.teacher_name,ts.score FROM teacher t INNER JOIN teacher_score ts on t.teacher_no = ts.teacher_no WHERE t.teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtSelectTeacherAndTeacherScore = conn.prepareStatement(sqlSelectTeacherAndTeacherScore);
			
			// ? 에 값 대입
			pstmtSelectTeacherAndTeacherScore.setInt(1,teacherNo);
			
			// 쿼리 실행
			rsSelectTeacherAndTeacherScore = pstmtSelectTeacherAndTeacherScore.executeQuery();
			
			while(rsSelectTeacherAndTeacherScore.next()) {
				Teacher teacher = new Teacher();
				teacher.setTeacherNo(rsSelectTeacherAndTeacherScore.getInt("teacher_no"));
				teacher.setTeacherName(rsSelectTeacherAndTeacherScore.getString("teacher_name"));
				
				TeacherScore teacherScore = new TeacherScore();
				
				teacherScore.setScore(rsSelectTeacherAndTeacherScore.getInt("score"));
				
				teacherAndTeacherScore = new TeacherAndScore();
				
				teacherAndTeacherScore.setTeacher(teacher);
				teacherAndTeacherScore.setTeacherScore(teacherScore);
			}
	
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherAndTeacherScore != null) {
				try {
					rsSelectTeacherAndTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherAndTeacherScore != null) {
				try {
					pstmtSelectTeacherAndTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}
		return teacherAndTeacherScore;
	}
	
	// teacher_score 테이블에 레코드를 추가하는 메서드
	// 매개변수로 TeacherScore 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴되는 데이터는 해당 쿼리로 인해 삽입된 레코드의 수 이다. 
	public int insertTeacherScore(TeacherScore teacherScore) {
		Connection conn = null;
		PreparedStatement pstmtInsertTeacherScore = null;
		
		// insertTeacherScoreAction.jsp로 부터 teacherScore 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, insertTeacherScoreAction => TeacherScoreDao.java " + teacherScore.getTeacherNo());
		System.out.println("teacherAddrContent, insertTeacherScoreAction => TeacherScoreDao.java " + teacherScore.getScore());
		
		// teacher_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertTeacherScore = "INSERT INTO teacher_score(teacher_no,score) VALUES(?, ?)";
		
		int result = 0; 
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertTeacherScore = conn.prepareStatement(sqlInsertTeacherScore);
			
			// ? 에 값 대입
			pstmtInsertTeacherScore.setInt(1, teacherScore.getTeacherNo());
			pstmtInsertTeacherScore.setInt(2, teacherScore.getScore());
			
			result = pstmtInsertTeacherScore.executeUpdate();
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + result);
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertTeacherScore != null) {
				try {
					pstmtInsertTeacherScore.close();
				} catch (SQLException sqlException){
					System.out.println("pstmtInsertTeacherAddress 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(conn != null) {
				try {
					conn.close();
				} catch (SQLException sqlException){
					System.out.println("conn 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
		}
		return result;
	}
}