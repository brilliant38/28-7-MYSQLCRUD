//*2018-07-03 김준영*//

/*데이터베이스 테이블
	CREATE TABLE `teacher` (
	`teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
	`teacher_name` VARCHAR(50) NOT NULL,
	`teacher_age` INT(10) NOT NULL,
	PRIMARY KEY (`teacher_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB*/

package service; //패키지명

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TeacherDao {
//java.sql.* (앞의 java.sql 부분을 생략하여 쓰기 위해서 import 시켜줍니다.) 클
public ArrayList<Teacher> selectteacherByPage(int currentPage, int pagePerRow) {	//현재 페이지 숫자, 페이지당 행의 갯수를 입력받아 정해진 행의 갯수만큼을 조회하는 메소드
	/*
	 * List :  갯수가 동적, list.size 입력된 값
	 * 배열 : 갯수가 정적, [].length 만들어진 배열이 모두 존재.
	 * 배열의 사용을 편하게 -> List, Set, Map
	 * JDBC API SELECT의 결과물은 ResultSet이므로 JDBC API를 JSP 페이지에서 사용하지 않기 위해 배열(ArrayList<teacher>)로 타입을 전환시킨다.
	 * 
	 */
	ArrayList<Teacher> List = new ArrayList<>();
	Connection connection = null;
	PreparedStatement preparedstatementRowNumber = null;
	PreparedStatement preparedstatementPagePerRow = null;
	ResultSet resultsetRowNumber = null;
	ResultSet resultsetPagePerRow = null;
	String sqlRowNumber = "SELECT count(*) FROM teacher";
	String sqlPage = "SELECT teacher_no, teacher_name, teacher_age FROM teacher ORDER BY teacher_no LIMIT ?,?";
	
	try {
		Class.forName("com.mysql.jdbc.Driver");	//Database 연결
		
		String dataBaseAddress = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String dataBaseID = "root";
		String DataBasePW = "java0000";
		System.out.println(dataBaseAddress + " : dataBaseAddress");
		
		connection = DriverManager.getConnection(dataBaseAddress, dataBaseID, DataBasePW);
		System.out.println(connection + " : 01 connection");
		
		
		preparedstatementRowNumber = connection.prepareStatement(sqlRowNumber); //변수에 저장된 쿼리문 입력
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
		
		preparedstatementPagePerRow = connection.prepareStatement(sqlPage);	// 
		preparedstatementPagePerRow.setInt(1, startRow);
		preparedstatementPagePerRow.setInt(2, pagePerRow);
		System.out.println(preparedstatementPagePerRow + " : 06 preparedstatementPagePerRow");
		
		resultsetPagePerRow = preparedstatementPagePerRow.executeQuery(); // 쿼리문을 실행하여 결과 테이블을 resultsetPagePerRow 객체에 담는다.
		System.out.println(resultsetPagePerRow + " : 08 resultsetPagePerRow");
		
		while(resultsetPagePerRow.next()) {
			Teacher teacher = new Teacher(); 
			teacher.setTeacherNo(resultsetPagePerRow.getInt(1));
			teacher.setTeacherName(resultsetPagePerRow.getString(2));;
			teacher.setTeacherAge(resultsetPagePerRow.getInt(3));;
			teacher.setRowNumber(rowNumber);
			List.add(teacher);
		}
		
	} catch (ClassNotFoundException e) {
		System.out.println("클래스 파일을 찾을 수 없습니다.");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("쿼리문장이 잘못 되었습니다.");
		e.printStackTrace();
	} finally {
		try {
			resultsetPagePerRow.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			resultsetRowNumber.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			preparedstatementPagePerRow.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			preparedstatementRowNumber.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		try {
			connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}
	
	return List; // list 최대 pagePerRow~1
}

	
	public int insertTeacher(Teacher teacher) { //데이터베이스에 있는 teacher 테이블에 한 행의 데이터를 입력하기 위한 메서드
		Connection conn = null; //드라이버 로딩을 하기 위하여 만들어준 객체참조변수
		PreparedStatement pstmt = null; //PreparedStatement 쿼리문을 작성하기 위하여 만들어준 객체참조변수
		int k = 0; //int data type으로 리턴을 하기 위하여 만들어준 변수
		
		try {
			Class.forName("com.mysql.jdbc.Driver"); //드라이버 로딩을 할 드라이버명
			
			String URL = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr"; //URL 주소
			String dbUser = "root"; //DB 아이디
			String dbPass = "java0000"; //DB 비밀번호
			
			conn = DriverManager.getConnection(URL, dbUser, dbPass);
			System.out.println(conn+ "<-- conn");
			
			pstmt = conn.prepareStatement("insert into teacher(teacher_name, teacher_age) values(?, ?)"); //teacher 테이블에 insert 쿼리문 작성
			pstmt.setString(1, teacher.getTeacherName()); //teacher 테이블의 teacher_name에 들어갈 값
			pstmt.setInt(2, teacher.getTeacherAge()); //teacher 테이블의 teacher_age에 들어갈 값

			k = pstmt.executeUpdate(); //쿼리 실행값을 int r 변수에 대입합니다. (실행되면 1이 담기고 아니면 0이 담깁니다.)
			System.out.println(k+"<--r");
			
		} catch (ClassNotFoundException | SQLException e) { //Class 파일을 찾지 못하거나 SQL에서 예외가 발생하였을 때
			e.printStackTrace(); //에러 메세지의 발생 근원지를 찾아서 단계별로 에러를 출력
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch(SQLException e) {} //pstmt의 값이 null이 아닐 경우 pstmt를 종료시켜줍니다.
			if (conn != null) try { conn.close(); } catch(SQLException e) {} //conn의 값이 null이 아닐 경우 conn를 종료시켜줍니다.
		}
		return k; //메서드 호출한 곳으로 r 변수가 반환됩니다.
	}
} 