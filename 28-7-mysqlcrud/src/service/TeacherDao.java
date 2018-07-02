//*2018-07-01 김준영*//

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
import java.sql.SQLException;

//java.sql.* (앞의 java.sql 부분을 생략하여 쓰기 위해서 import 시켜줍니다.) 클
public class TeacherDao {
	
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