package service;

import java.sql.*;
import service.*;
import java.util.ArrayList;
public class TeacherScoreDao {
	

public int selectScoreAvg() {
		
		// SELECT AVG(score) FROM teahcer_score;
		Connection connection = null; 
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		int scoreAvg = 0;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			String URL = "jdbc:mysql://localhost:3306/engineer?useCode=true&characterEncoding=euckr";
			String dbUser = "java";
			String dbPass = "java0000";
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			statement = connection.prepareStatement("SELECT AVG(score) FROM teacher_score");
			
			resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				scoreAvg = resultSet.getInt("AVG(score)");
			}
			
		}catch(ClassNotFoundException ex) {
			ex.printStackTrace();
		}catch(SQLException ex){
			ex.printStackTrace();
		}finally{
			if(statement != null)try{
				statement.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
			if(connection != null)try{
				connection.close(); 
			}catch(SQLException ex){
				ex.printStackTrace();
			}
		}
			
		return scoreAvg;
	}

public ArrayList<TeacherAndScore> selectTeacherListAboveAvg(){
	
	Connection connection = null; 
	PreparedStatement statement = null;
	ResultSet resultSet = null;
	
	ArrayList<TeacherAndScore> arrayList = new ArrayList<TeacherAndScore>();
	String sql = "SELECT ts.score, t.teacher_name, t.teacher_no FROM teacher_score ts INNER JOIN teacher t ON ts.teacher_no = t.teacher_no WHERE ts.score>=(select avg(score) from teacher_score) Order by ts.score DESC";
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		String URL = "jdbc:mysql://localhost:3306/284db?useCode=true&characterEncoding=euckr";
		String dbUser = "java";
		String dbPass = "java0000";
		
		connection = DriverManager.getConnection(URL, dbUser, dbPass);
		
		statement = connection.prepareStatement(sql);
		resultSet = statement.executeQuery();
		
		while(resultSet.next()) {
			
			Teacher teacher = new Teacher();
			teacher.setTeacherName(resultSet.getString("t.teacher_name"));
			teacher.setTeacherNo(resultSet.getInt("t.teacher_no"));
			
			TeacherScore teacherScore = new TeacherScore();
			teacherScore.setScore(resultSet.getInt("ts.score"));
			
			TeacherAndScore teacherAndScore = new TeacherAndScore();
			teacherAndScore.setTeacher(teacher);
			teacherAndScore.setTeacherScore(teacherScore);
			
			arrayList.add(teacherAndScore);
			
		}
		
	}catch(ClassNotFoundException ex) {
		ex.printStackTrace();
	}catch(SQLException ex){
		ex.printStackTrace();
	}finally{
		if(statement != null)try{
			statement.close(); 
		}catch(SQLException ex){
			ex.printStackTrace();
		}
		if(connection != null)try{
			connection.close(); 
		}catch(SQLException ex){
			ex.printStackTrace();
		}
	}
	return arrayList;
}
public ArrayList<TeacherAndScore> selectTeacherAndScored(int teacherNo) { //score list // 
		
		Connection connection = null; 
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		ArrayList<TeacherAndScore> arraylist = new ArrayList<TeacherAndScore>();
		String sql = "SELECT ts.teacher_score_no,ts.teacher_no,t.teacher_name,t.teacher_age,ts.score FROM teacher_score ts INNER JOIN teacher t ON t.teacher_no = ts.teacher_no WHERE t.teacher_no=?";
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			String URL = "jdbc:mysql://localhost:3306/engineer?useCode=true&characterEncoding=euckr";
			String dbUser = "java";
			String dbPass = "java0000";
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);

			statement = connection.prepareStatement(sql);
			statement.setInt(1, teacherNo);
			
			resultSet = statement.executeQuery();
			
			while(resultSet.next()){
				
				Teacher teacher = new Teacher();
				teacher.setTeacherName(resultSet.getString("t.teacher_name"));
				teacher.setTeacherAge(resultSet.getInt("t.teacher_age"));
				
				TeacherScore teacherScore = new TeacherScore();
				teacherScore.setTeacherNo(resultSet.getInt("ts.teacher_no"));
				teacherScore.setScore(resultSet.getInt("ts.score"));
				
				TeacherAndScore teacherAndScore = new TeacherAndScore();
				teacherAndScore.setTeacher(teacher);
				teacherAndScore.setTeacherScore(teacherScore);
				
				arraylist.add(teacherAndScore);
				
			}
			// Class 클래스 객체에 forName 메서드를 호출하여 드라이버 로딩시 나올수 있는 프로그램 실행중 발생하는 문제적 상황을 예외처리합니다.
			}catch(ClassNotFoundException ex) {
				ex.printStackTrace();
			/* DriverManager클래스객체에 getConnection 메서드를 호출
			Connection 클래스 타입의 connection객체참조변수에 대입하고 DB연결 및 Connection클래스 객체의 prepareStatement 메서드에 쿼리문을 대입하고 호출하여
			statement(PreparedStatement클래스객체)에 executeUpdate 메서드로 쿼리문 실행시 나올수 있는 프로그램 실행중 발생하는 문제적 상황을 예외처리합니다.
			 */ 
			}catch(SQLException ex){
				ex.printStackTrace();
			// 드라이버로딩, DB연결, 쿼리문 작성 및 실행이 끝나거나 혹은 작동이 안되었을때 종료해주기 위해 finally를 쓰고 if조건문으로 객체참조변수의 값이 null 이 아닐시 close 메서드로 종료시킵니다.
			// 이때도 마찬가지로 예외처리를 해줍니다.
			}finally{
				if(statement != null)try{
					statement.close(); 
				}catch(SQLException ex){
					ex.printStackTrace();
				}
				if(connection != null)try{
					connection.close(); 
				}catch(SQLException ex){
					ex.printStackTrace();
				}
			}
			return arraylist;
	}
	public TeacherAndScore selectTeacherAndTeacherScore(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherAndTeacherScore = null;
		ResultSet rsSelectTeacherAndTeacherScore = null;
		TeacherAndScore teacherAndTeacherScore = null;
		
		// teacherScoreList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherScoreList.jsp => TeacherScoreDao.java " + teacherNo);
		
		// teacher와 teacher_score 테이블에서  WHERE 조건에 해당하는 레코드를 내부 조인하여 조회하는 쿼리 
		String sqlSelectTeacherAndTeacherScore = "SELECT t.teacher_no,t.teacher_name,t.teacher_age,ts.score_no,ts.score FROM teacher t INNER JOIN teacher_score ts WHERE t.teacher_no = ?";
		
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
				teacher.setTeacherAge(rsSelectTeacherAndTeacherScore.getInt("teacher_age"));
				
				TeacherScore teacherScore = new TeacherScore();
				
				teacherScore.setTeacherscoreNo(rsSelectTeacherAndTeacherScore.getInt("score_no"));
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