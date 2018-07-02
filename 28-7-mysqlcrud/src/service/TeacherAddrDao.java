//*2018-07-01 김준영*//
//*teacherAddrDao*//
/*데이터베이스 테이블
	CREATE TABLE `teacher` (
	`teacher_no` INT(10) NOT NULL AUTO_INCREMENT,
	`teacher_name` VARCHAR(50) NOT NULL,
	`teacher_age` INT(10) NOT NULL,
	PRIMARY KEY (`teacher_no`)
)
COLLATE='euckr_korean_ci'
ENGINE=InnoDB*/
//*2018-07-01 김준영*//

package service;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class TeacherAddrDao {
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public void insertTeacherAddr(TeacherAddr teacherAddr) {
		System.out.println("insertTeacherAddr TeacherAddrDAO.java");

		try {
			//드라이버 로딩
			Class.forName("com.mysql.jdbc.Driver");
			String Driveraddr = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";

			// 주소와 아이디, 비밀번호를 conn 객체참조변수에 넣어준다.
			Connection conn = DriverManager.getConnection(Driveraddr, dbUser, dbPass);
			System.out.println(conn + "<= conn");

			// 
			pstmt = conn.prepareStatement("INSERT INTO teacher(teacher_no,teacher_addr_content) VALUES(?,?)");
			// teacherAddr 객체의 주소에 있는 TeacherNo, TeacherAddrContent를 가져온다.
			pstmt.setInt(1, teacherAddr.getTeacherNo());
			pstmt.setString(2, teacherAddr.getTeacherAddrContent());
			pstmt.executeUpdate();

			// try ... catch 예외처리 후 PreparedStatement와 Connection 종료
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
		}
	}
}
