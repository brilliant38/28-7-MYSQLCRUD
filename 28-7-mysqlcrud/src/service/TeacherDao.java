//2018-07-10 김준영 // 
//TeacherDao.java//
package service;

import java.util.ArrayList;
import java.sql.*;



public class TeacherDao {
	
	/*CREATE TABLE `teacher` (
			`teacher_no` INT(10) NOT NULL,
			`teacher_name` VARCHAR(50) NOT NULL,
			`teacher_age` INT(10) NOT NULL,
			PRIMARY KEY (`teacher_no`)
	  )  */
	
	// teacher 테이블의 특정 레코드를 수정하는 메서드
	// 매개변수는 teacher 객체를 입력 받음. updateForm 으로 부터 넘겨받은 값들이 담긴 VO
	// 리턴 데이터 타입 void
	public void updateTeacher(Teacher teacher) {
		Connection conn = null;
		PreparedStatement pstmtUpdateTeacher = null;
		
		// teacherList.jsp로 부터 teacher 객체를 잘 전달 받았는지 테스트
		System.out.println("teacherNo, updateTeacher => " + teacher.getTeacherNo());
		System.out.println("teacherName, updateTeacher => " + teacher.getTeacherName());
		System.out.println("teacherAge, updateTeacher => " + teacher.getTeacherAge());
		
		// teacher 테이블의 특정 레코드를 수정하는 쿼리
		String sqlUpdateTeacher = "UPDATE teacher SET teacher_name = ?, teacher_age = ? WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtUpdateTeacher = conn.prepareStatement(sqlUpdateTeacher);
			
			// ?에 값 대입
			pstmtUpdateTeacher.setString(1, teacher.getTeacherName());
			pstmtUpdateTeacher.setInt(2, teacher.getTeacherAge());
			pstmtUpdateTeacher.setInt(3, teacher.getTeacherNo());
			
			// 쿼리 실행 및 수정된 레코드 수 출력
			System.out.println("수정된 레코드 수 : " + pstmtUpdateTeacher.executeUpdate());
			
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(pstmtUpdateTeacher != null) {
				try {
					pstmtUpdateTeacher.close();
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

	// teacher 테이블의 특정 레코드를 조회하여 VO에 담아 리턴하는 메서드
	// 매개변수로는 교사 번호. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 Teacher 클래스 데이터 타입. VO 담아 리턴하기 위함
	public Teacher selectForUpdateTeacher(int teacherNo) {
		Connection conn = null;
		PreparedStatement pstmtSelectForUpdateTeacher = null;
		ResultSet rsSelectForUpdateTeacher = null;
		Teacher teacher = null;
		
		// teacherList.jsp로 부터 teacherNo값을 잘 전달 받았는지 테스트
		System.out.println("teacherNo, teacherList.jsp => TeacherDao.java " + teacherNo);
		
		// teacher 테이블의 특정 레코드를 조회하는 쿼리
		String sqlSelectForUpdateTeacher = "SELECT teacher_no,teacher_name,teacher_age FROM teacher WHERE teacher_no = ?";
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 위의 쿼리 준비
			pstmtSelectForUpdateTeacher = conn.prepareStatement(sqlSelectForUpdateTeacher);
			
			// ?에 값 대입
			pstmtSelectForUpdateTeacher.setInt(1, teacherNo);
			
			// 쿼리 실행
			rsSelectForUpdateTeacher = pstmtSelectForUpdateTeacher.executeQuery();
			
			// 조회된 결과가 있다면
			if(rsSelectForUpdateTeacher.next()) {
				teacher = new Teacher();
				
				// teacher 객체 내부에 조회된 각각의 데이터를 대입
				teacher.setTeacherNo(rsSelectForUpdateTeacher.getInt("teacher_no"));
				teacher.setTeacherName(rsSelectForUpdateTeacher.getString("teacher_name"));
				teacher.setTeacherAge(rsSelectForUpdateTeacher.getInt("teacher_age"));
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
			if(rsSelectForUpdateTeacher != null) {
				try {
					rsSelectForUpdateTeacher.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt1 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectForUpdateTeacher != null) {
				try {
					pstmtSelectForUpdateTeacher.close();
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
		return teacher;
	}
	
public int lastPageTeacher(int rowPerPage , String searchWord) {
		
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;

		int totalRow=0;
		int lastPage=0;
		
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			
			String URL = "jdbc:mysql://localhost:3306/284db?useCode=true&characterEncoding=euckr";
			String dbUser = "java";
			String dbPass = "java0000";
			String sql = "SELECT COUNT(teacher_no) FROM teacher";
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			// 검색 키워드가 없으면 전체 teacher_no의 수를 조회하고 키워드가 있으면 키워드가 들어간 조회된 결과의 teacher_no 수를 조회합니다.
			if(searchWord.equals("")) {
				statement = connection.prepareStatement(sql);
			}else{
				sql = "SELECT COUNT(teacher_no) FROM teacher WHERE teacher_name like ? ORDER BY teacher_no";
				statement = connection.prepareStatement(sql);
				statement.setString(1, "%"+searchWord+"%");

			}
			
			resultSet = statement.executeQuery();
			
			if (resultSet.next()) {
				totalRow=resultSet.getInt("COUNT(teacher_no)");
			}
			lastPage = (totalRow-1) / rowPerPage;
			// if 조건문을 사용해 총 데이터갯수(COUNT(teacher_no))-1 을 rowPerPage로 나눈수가 0이 아닐때 마지막 페이지를 1씩 증가 시킵니다.
			if((totalRow-1) % rowPerPage != 0) {
				lastPage++;
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
		return lastPage;
	} 
	// Teacher 테이블의 특정 레코드를 삭제하는 메서드
	// 매개변수는 교사번호를 입력받음. 특정 레코드를 가리키기 위함
	// 리턴 데이터 타입은 없다.
public void deleteTeacher(int teacherNo) {
	
	Connection connection = null;
	PreparedStatement statement = null;
	
	try {
		
		Class.forName("com.mysql.jdbc.Driver");
		
		String URL = "jdbc:mysql://localhost:3306/engineer?useCode=true&characterEncoding=euckr";
		String dbUser = "java";
		String dbPass = "java0000";
		
		connection = DriverManager.getConnection(URL, dbUser, dbPass);
		
		statement = connection.prepareStatement("DELETE FROM teacher WHERE teacher_no=?");
		statement.setInt(1, teacherNo);
		statement.executeUpdate();
		
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
}
	// teacherList의 마지막 페이지를 구하기 위해 레코드의 총 갯수를 조회하는 메서드
	// 매개변수는 검색어에 따라 총 레코드 수가 달라지기 때문에 searchValue를 입력 받음
	// 리턴되는 데이터는 검색어에 따라 조회되는 총 레코드의 수 이다.
public void InsertTeacherAddr(TeacherAddr teacherAddr) {
		
		Connection connection = null; 
		PreparedStatement statement = null;

		// 프로그램 실행중 발생하는 문제적인 상황을 예외 처리 하기 위해 try를 사용합니다.
		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			String URL = "jdbc:mysql://localhost:3306/engineer?useCode=true&characterEncoding=euckr";
			String dbUser = "java";
			String dbPass = "java0000";
			
			connection = DriverManager.getConnection(URL, dbUser, dbPass);
			
			System.out.println("DB연결");
			System.out.println(teacherAddr.getTeacherNo());
			System.out.println(teacherAddr.getTeacherAddrContent());

			statement = connection.prepareStatement("INSERT INTO teacheraddr(teacher_no, teacher_addr_content) VALUES (?,?)");
			statement.setInt(1, teacherAddr.getTeacherNo());
			statement.setString(2, teacherAddr.getTeacherAddrContent());
			
			statement.executeUpdate();
		
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
	}
	public int countTotalRecordsBySearchValue(String searchValue) {
		Connection conn = null;
		PreparedStatement pstmtCountTotalRecordsBySearchValue = null;
		ResultSet rsCountTotalRecordsBySearchValue = null;
		int totalRecordsBySelect = 0;
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
			
			// 검색어가 존재하지 않으면 전체보기
			if(searchValue.equals("")) {
				// teacher 테이블의 전체 레코드 갯수를 조회하는 쿼리
				String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM teacher";
				
				// 위의 쿼리 준비
				pstmtCountTotalRecordsBySearchValue = conn.prepareStatement(sqlSelectForFindLastPage);
			
			// 검색어가 존재하면
			} else {
				// teacher_name 컬럼의 값에 searchValue의 값이 포함(LIKE)되어 있을 때 조회되는 레코드의 수를 구하는 쿼리
				String sqlSelectForFindLastPage = "SELECT COUNT(*) as total_records FROM teacher WHERE teacher_name LIKE ?";
				
				// 위의 쿼리 준비
				pstmtCountTotalRecordsBySearchValue = conn.prepareStatement(sqlSelectForFindLastPage);
				
				pstmtCountTotalRecordsBySearchValue.setString(1, "%" + searchValue + "%");
			}
			// 위의 쿼리 실행
			rsCountTotalRecordsBySearchValue = pstmtCountTotalRecordsBySearchValue.executeQuery();
			
			// 다음 레코드가 존재한다면
			if(rsCountTotalRecordsBySearchValue.next()) {
				totalRecordsBySelect = rsCountTotalRecordsBySearchValue.getInt("total_records");
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsCountTotalRecordsBySearchValue != null) {
				try {
					rsCountTotalRecordsBySearchValue.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtCountTotalRecordsBySearchValue != null) {
				try {
					pstmtCountTotalRecordsBySearchValue.close();
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
		return totalRecordsBySelect;
	}
	
	// teacher 테이블의 레코드를 페이징 조건에 따라 조회하여 ArrayList 데이터 타입으로 리턴하는 메서드
	// 매개변수는 페이징 조건인 startPoint와 rowPerPage를 입력받음 (쿼리문에 대입하기 위하여)
	// 리턴 데이터 타입은 ArrayList<Teacher> (Teacher 클래스 데이터 타입을 저장할 수 있는 클래스 배열)
	public ArrayList<Teacher> selectTeacherByPage(int currentPage, int rowPerPage, String searchValue){
		Connection conn = null;
		PreparedStatement pstmtSelectTeacherByPage = null;
		ResultSet rsSelectTeacherByPage = null;
		ArrayList<Teacher> arrayListTeacher = new ArrayList<Teacher>();
		
		int startPoint = (currentPage - 1) * rowPerPage;
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
		
			// 검색 내용 부분이 공백일 경우(즉, 전체보기)
			if(searchValue.equals("")) {
				// teacher 테이블의 teacher_no, teacher_name, teacher_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectTeacherByPage = "SELECT teacher_no, teacher_name, teacher_age FROM teacher ORDER BY teacher_no LIMIT ?, ?";
				
				pstmtSelectTeacherByPage = conn.prepareStatement(sqlSelectTeacherByPage);
				
				pstmtSelectTeacherByPage.setInt(1, startPoint);
				pstmtSelectTeacherByPage.setInt(2, rowPerPage);
			} else {
				// 검색한 이름에 따라 teacher 테이블의 teacher_no, teacher_name, teacher_age 컬럼의 값을 LIMIT 옵션에 따라 조회하는 쿼리 
				String sqlSelectTeacherByPage = "SELECT teacher_no, teacher_name, teacher_age FROM teacher WHERE teacher_name LIKE ? ORDER By teacher_no LIMIT ?, ?";
				
				pstmtSelectTeacherByPage = conn.prepareStatement(sqlSelectTeacherByPage);
				
				// ?에 값 대입
				pstmtSelectTeacherByPage.setString(1, "%" + searchValue + "%");
				pstmtSelectTeacherByPage.setInt(2, startPoint);
				pstmtSelectTeacherByPage.setInt(3, rowPerPage);
			}
			
			// 위의 쿼리 실행
			rsSelectTeacherByPage = pstmtSelectTeacherByPage.executeQuery();
			
			// 다음 레코드가 존재한다면
			while(rsSelectTeacherByPage.next()) {
				// teacher 객체 생성
				Teacher teacher = new Teacher();
				
				// teacher 객체 내부 멤버변수에 값을 대입
				teacher.setTeacherNo(rsSelectTeacherByPage.getInt("teacher_no"));
				teacher.setTeacherName(rsSelectTeacherByPage.getString("teacher_name"));
				teacher.setTeacherAge(rsSelectTeacherByPage.getInt("teacher_age"));
				
				arrayListTeacher.add(teacher);
			}
		} catch (ClassNotFoundException classException) {
			System.out.println("DB Driver 클래스를 찾을 수 없습니다. 커넥터가 존재하는지 확인 해주세요!");
		} catch (SQLException sqlException) {
			System.out.println("DB와 관련된 예외가 발생하였습니다!");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectTeacherByPage != null) {
				try {
					rsSelectTeacherByPage.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtSelectTeacherByPage != null) {
				try {
					pstmtSelectTeacherByPage.close();
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
		return arrayListTeacher;
	}
	
	// teacher 테이블에 한 행을 추가하는 메서드
	// 매개변수로 teacher 테이블에 추가할 한 행의 레코드를 전달
	// 리턴 데이터 타입은 void로 정했다. 
	public void insertTeacher(Teacher teacher) {
		// 객체참조변수 선언
		Connection conn = null;
		PreparedStatement pstmtInsertTeacher = null;
		ResultSet rsSelectForCount = null;
		
		try {
			// mysql 드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			
			// DB 연결 
			// 이부분을 클래스를 통해 객체로 만들어서 구현 할 수도 있지 않을까 ?
			String dbUrl = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPw = "java0000";
			conn = DriverManager.getConnection(dbUrl,dbUser,dbPw);
	
			// teacherNo 안의 값 테스트
			System.out.println("teacherNo from teacherDTO: " + teacher.getTeacherNo());
			
			// teacher 테이블에 레코드를 삽입하는 쿼리 준비
			String sqlInsertTeacher = "INSERT INTO teacher(teacher_name,teacher_age) VALUES(?,?)";
			pstmtInsertTeacher = conn.prepareStatement(sqlInsertTeacher);
			
			// ?에 값 대입
			pstmtInsertTeacher.setString(1, teacher.getTeacherName());
			pstmtInsertTeacher.setInt(2, teacher.getTeacherAge());
			
			// 레코드 삽입 쿼리 실행
			// 실행 후 반환 되는 값은 해당 쿼리로 인해 변동되는(?) 행의 갯수 (예를 들어 삽입되는 행의 갯수)
			int resultUpdate = pstmtInsertTeacher.executeUpdate();
			
			// 삽입되는 레코드의 갯수 출력
			System.out.println("teacher 테이블에 삽입된 행 갯수 : " + resultUpdate);
			
		// 예외가 발생한다면 아래의 catch 블록 내부의 명령 실행.
			
		// ClassNotFoundException 은 Class.forName() 메서드에 매개변수로 대입된 클래스를 찾을 수 없을 때
		} catch(ClassNotFoundException classException){
			System.out.println("해당 DB Driver 클래스를 찾을 수 없습니다.");
		
		// SQLException 은 데이터베이스와 관련된 오류가 있을 때
		} catch(SQLException sqlException){
			System.out.println("SQL 오류가 생겼습니다.");
			sqlException.printStackTrace();
		} finally {
			// 객체를 종료하는 부분
			if(rsSelectForCount != null) {
				try {
					rsSelectForCount.close();
				} catch (SQLException sqlException){
					System.out.println("rsSelectForCount 객체 종료 중 예외 발생");
					
					// 예외가 발생한 부분을 출력해줌.
					sqlException.printStackTrace();
				}
			}
			if(pstmtInsertTeacher != null) {
				try {
					pstmtInsertTeacher.close();
				} catch (SQLException sqlException){
					System.out.println("pstmt2 객체 종료 중 예외 발생");
					
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