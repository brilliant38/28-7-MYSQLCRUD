/*2018-06-26 이광재*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp
	//DAO는 멤버변수를 만들면 안된다. 필요한 변수는 모두 메소드내의 지역변수로 만들어야한다.
	//Model1에서는 DAO안에서 예외를 처리하는 방식을 메소드 내의 try...catch...finally로 하자. throws 사용금지.
	
	public int insertMember(Member member) {
		System.out.println("insertMember 메소드 실행 완료");
		
		String memberName = member.getMember_name(); //Member객체의 getMember_name 메소드 호출 후 변수에 저장
		int memberAge = member.getMember_age(); //Member객체의 getMember_age 메소드 호출 후 변수에 저장
		System.out.println(memberName + " : memberName 저장 완료");
		System.out.println(memberAge + " : memberAge 저장 완료");
		
		//mysql 드라이버 로딩
		try {			
			//com.mysql.jdbc.Driver 클래스의 로딩 - JDBC드라이버의 등록 
			Class.forName("com.mysql.jdbc.Driver");

			//Database 연결(Connection 객체 생성)
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // getConnection메소드의 호출 및 Connection객체의 생성
			System.out.println(conn + " : Connection 객체 생성 완료");
			
			//prepareStatement메소드 호출하여 쿼리문 실행 준비
			PreparedStatement pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)"); //쿼리문 입력
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberAge);
			System.out.println(pstmt + " : PreparedStatement 객체 생성 완료");
			
			
			pstmt.executeUpdate(); // executeUpdate메소드를 호출하여 쿼리문 실행
			
			pstmt.close();	//PreparedStatement 객체 종료
			
			conn.close();	//Database 연결 종료
			
			
			
		} catch (ClassNotFoundException e) { //클래스 예외처리 작성
			// TODO Auto-generated catch block
			System.out.println("컴파일된 자바 클래스 파일을 찾을 수 없는 문제");
			e.printStackTrace();
		} catch (SQLException e) {//쿼리문 예외처리 작성
			System.out.println("SQL 쿼리문 작성문제");
			e.printStackTrace();
		}
				
		return 0;
		
	}
}
