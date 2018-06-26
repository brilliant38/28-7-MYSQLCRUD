/*2018-06-26 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp
	//DAO는 멤버변수를 만들면 안된다. 필요한 변수는 모두 메소드내의 지역변수로 만들어야한다.
	//Model1에서는 DAO 클래스를 만들때 반드시 try..catch..finally를 사용한다. throws로 예외를 처리하지 않는다.
	
	public int insertMember(Member member) {
		System.out.println("insertMember 메소드 실행 완료");
		
		String memberName = member.getMember_name(); //Member_addr 테이블에 1행을 추가 하기 위한 메소드의 호출. 매개변수는 member 객체의 주소값
		int memberAge = member.getMember_age(); //MemberAddr객체의 getMember_no 메소드 호출 후 변수에 저장
		System.out.println(memberName + " : memberName 전송완료");
		System.out.println(memberAge + " : memberAge 전송완료");
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		//mysql 드라이버 로딩
		try {			
			//com.mysql.jdbc.Driver 클래스 로딩 완료 
			Class.forName("com.mysql.jdbc.Driver");

			//Database 연결(Connection 객체 생성)
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); 
			System.out.println(conn + " : Connection 객체 생성 완료");
			
			//prepareStatement메소드 호출하여 쿼리문 실행 준비
			pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)"); 
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberAge);
			System.out.println(pstmt + " : PreparedStatement 객체 생성 완료");
			
			result = pstmt.executeUpdate();	//executeUpdate메소드를 호출하여 쿼리문 실행
			
		} catch (ClassNotFoundException e) { //executeUpdate메소드를 호출하여 쿼리문 실행
			// TODO Auto-generated catch block
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
		
		} finally {	// 작업 완료시 종료 
			if(pstmt != null) {	//PreparedStatement 객체 종료
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
			
			if(conn != null) {	//Database 연결 종료
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("SQL 쿼리문 작성문제");
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
