//2018-07-10 김준영// 
package service;

import java.sql.*;


public class TeacherAddrDao {
	/*
	 * 	teacher_address 테이블
	 * 
	   CREATE TABLE `teacher_address` (
			`teacher_address_no` INT(11) NOT NULL AUTO_INCREMENT,
			`teacher_no` INT(11) NOT NULL,
			`teacher_address_content` VARCHAR(50) NOT NULL,
			PRIMARY KEY (`teacher_address_no`),
			INDEX `FK_teacher_address_teacher` (`teacher_no`),
			CONSTRAINT `FK_teacher_address_teacher` FOREIGN KEY (`teacher_no`) REFERENCES `teacher` (`teacher_no`)
		)*/
	
	// teacher_address 테이블의 특정 레코드를 수정하는 메서드
	// 매개변수는 teacherAddr 객체를 입력 받음. updateForm 으로 부터 넘겨받은 값들이 담긴 VO
	// 리턴 데이터 타입 void
	public void updateTeacherAddress(TeacherAddr teacherAddr) {
		Connection conn = null;
		PreparedStatement pstmtUpdateTeacherAddress = null;
		
		// teacherList.jsp로 부터 teacher 객체를 잘 전달 받았는지 테스트
		System.out.println("teacherAddressNo, updateTeacherAddress => " + teacherAddr.getTeacherAddrNo());
		System.out.println("teacherNo, updateTeacherAddress => " + teacherAddr.getTeacherNo());
		System.out.println("teacherAddrContent, updateTeacherAddress => " + teacherAddr.getTeacherAddrContent());
		
		
		// teacher_address 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateTeacherAddress = "UPDATE teacher_address SET teacher_address_content = ? WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtUpdateTeacherAddress = conn.prepareStatement(sqlUpdateTeacherAddress);
			
			// ?에 값 대입
			pstmtUpdateTeacherAddress.setString(1, teacherAddr.getTeacherAddrContent());
			pstmtUpdateTeacherAddress.setInt(2, teacherAddr.getTeacherNo());
			
			// 쿼리 실행 및 수정된 레코드 수 출력
			System.out.println("수정된 레코드 수 : " + pstmtUpdateTeacherAddress.executeUpdate());
			
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateTeacherAddress != null) {
				try {
					pstmtUpdateTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
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

	// teacher_address 테이블의 특정 레코드를 조회하여 VO에 담아 리턴하는 메서드
	// 매개변수로는 교사 번호. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 TeacherAddr 클래스 데이터 타입. VO 담아 리턴하기 위함
	public TeacherAddr selectForUpdateTeacherAddress(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectForUpdateTeacherAddress = null;
		ResultSet rsSelectForUpdateTeacherAddress = null;
		TeacherAddr teacherAddr = null;
		
		// teacherList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherAddrDao.java " + teacherNo);
		
		// teacher 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectForUpdateTeacherAddress = "SELECT teacher_address_no,teacher_no,teacher_address_content FROM teacher_address WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectForUpdateTeacherAddress = conn.prepareStatement(sqlSelectForUpdateTeacherAddress);
			
			// ?에 값 대입
			pstmtSelectForUpdateTeacherAddress.setInt(1, teacherNo);
			
			// 쿼리 실행
			rsSelectForUpdateTeacherAddress = pstmtSelectForUpdateTeacherAddress.executeQuery();
			
			// 조회된 결과가 있다면
			if(rsSelectForUpdateTeacherAddress.next()) {
				teacherAddr = new TeacherAddr();
				
				// teacherAddr 객체 내부에 조회된 각각의 데이터를 대입
				teacherAddr.setTeacherAddrNo(rsSelectForUpdateTeacherAddress.getInt("teacher_address_no"));
				teacherAddr.setTeacherNo(rsSelectForUpdateTeacherAddress.getInt("teacher_no"));
				teacherAddr.setTeacherAddrContent(rsSelectForUpdateTeacherAddress.getString("teacher_address_content"));
			} else {
				System.out.println("해당 데이터가 더 이상 존재하지 않습니다.");
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectForUpdateTeacherAddress != null) {
				try {
					rsSelectForUpdateTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectForUpdateTeacherAddress != null) {
				try {
					pstmtSelectForUpdateTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
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
		return teacherAddr;
	}
	
	// teacher_address 테이블의 특정 레코드를 삭제하는 메서드
	// 매개변수로 교사 번호를 입력받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 void.
	public void deleteTeacherAddress(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtDeleteTeacherAddress = null;
		
		// teacherList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherAddrDao.java " + teacherNo);
		
		// teacher_address 테이블의 특정 레코드를 삭제하는 쿼리
		String sqlDeleteTeacherAddress = "DELETE FROM teacher_address WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtDeleteTeacherAddress = conn.prepareStatement(sqlDeleteTeacherAddress);
			
			// ?에 값 대입
			pstmtDeleteTeacherAddress.setInt(1, teacherNo);
			
			// 위의 쿼리 실행 및 삭제된 레코드의 수 출력
			System.out.println("삭제된 레코드의 수 : " + pstmtDeleteTeacherAddress.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtDeleteTeacherAddress != null) {
				try {
					pstmtDeleteTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
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
	// teacher_address 테이블의 특정 레코드를 조회하는 메서드
	// 매개변수로 교사 번호를 입력 받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터는 TeacherAddr 객체의 참조값. 조회한 결과를 VO에 담아 보내는 형태
	public TeacherAddr selectTeacherAddress(int teacherNo){
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherAddress = null;
		ResultSet rsSelectTeacherAddress = null;
		TeacherAddr teacherAddr = null;
		
		// teacherList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherAddrDao.java " + teacherNo);
		
		// teacher_address 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectTeacherAddress = "SELECT teacher_address_no, teacher_no,teacher_address_content FROM teacher_address WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectTeacherAddress = conn.prepareStatement(sqlSelectTeacherAddress);
			
			// ?에 값 대입
			pstmtSelectTeacherAddress.setInt(1, teacherNo);
			
			// 위의 쿼리 실행
			rsSelectTeacherAddress = pstmtSelectTeacherAddress.executeQuery();
			
			if(rsSelectTeacherAddress.next()) {
				// teacherAddr 객체 생성
				teacherAddr = new TeacherAddr();
				
				// teacherAddr 객체 내부 멤버변수에 조회된 데이터들을 각각 대입
				teacherAddr.setTeacherAddrNo(rsSelectTeacherAddress.getInt("teacher_address_no"));
				teacherAddr.setTeacherNo(rsSelectTeacherAddress.getInt("teacher_no"));
				teacherAddr.setTeacherAddrContent(rsSelectTeacherAddress.getString("teacher_address_content"));
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherAddress != null) {
				try {
					rsSelectTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherAddress != null) {
				try {
					pstmtSelectTeacherAddress.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
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
		// teacherAddr 객체 참조값 반환
		return teacherAddr;
	}
	
public TeacherAddr selectTeacherAddr(int teacherNo) {
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		TeacherAddr teacherAddr = new TeacherAddr();
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/284db?useCode=true&characterEncoding=euckr";
			String dbUser = "java";
			String dbPass = "java0000";
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			statement = connection.prepareStatement("SELECT * FROM teacheraddr WHERE teacher_no=?");
			statement.setInt(1, teacherNo);
			
			resultSet = statement.executeQuery();
			
			if(resultSet.next()) {
				teacherAddr.setTeacherNo(resultSet.getInt("teacher_no"));
				teacherAddr.setTeacherAddrContent(resultSet.getString("teacher_addr_content"));
			}
			
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}catch(SQLException e) {
			e.printStackTrace();
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
		return teacherAddr;
		
	}
	
	// teacher_address 테이블에 레코드를 추가하는 메서드
	// 매개변수로 TeacherAddr 객체의 참조값을 전달 받는다. (폼으로 넘겨받은 값을 담은 객체이다.)
	// 리턴 데이터 타입은 void
	public void insertTeacherAddress(TeacherAddr teacherAddr) {
		Connection conn = null;
		PreparedStatement pstmtInsertTeacherAddress = null;
		
		// insertTeacherAddrAction.jsp로 부터 teacherAddr 객체의 참조 값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, insertTeacherAddrAction => TeacherAddrDao.java " + teacherAddr.getTeacherNo());
		System.out.println("teacherAddrContent, insertTeacherAddrAction => TeacherAddrDao.java " + teacherAddr.getTeacherAddrContent());
		
		// teacher_address 테이블에 레코드를 추가하는 쿼리
		String sqlInsertTeacherAddress = "INSERT INTO teacher_address(teacher_no,teacher_address_content) VALUES(?, ?)";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 위의 쿼리 실행 준비
			pstmtInsertTeacherAddress = conn.prepareStatement(sqlInsertTeacherAddress);
			
			// ? 에 값 대입
			pstmtInsertTeacherAddress.setInt(1, teacherAddr.getTeacherNo());
			pstmtInsertTeacherAddress.setString(2, teacherAddr.getTeacherAddrContent());
			
			// 해당 쿼리 실행 및 해당 쿼리로 인해 삽입 된 레코드 수 출력
			System.out.println("삽입된 레코드 수 : " + pstmtInsertTeacherAddress.executeUpdate());
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 있는지 확인하세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtInsertTeacherAddress != null) {
				try {
					pstmtInsertTeacherAddress.close();
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
}