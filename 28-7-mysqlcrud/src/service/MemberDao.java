package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp 
	public int insertMember(Member member) throws ClassNotFoundException, SQLException {
		
		Member m = new Member(); // Member 객체 생성
		String memberName = m.getMember_name(); //Member객체의 getname 메소드 호출 후 변수에 저장
		int memberAge = m.getMember_age(); //Member객체의 getage 메소드 호출 후 변수에 저장
		
		//mysql 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
		
		//Database 연결(Connection 객체 생성)
		String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//prepareStatement메소드 호출하여 쿼리문 실행 준비
		PreparedStatement pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)");
		pstmt.setString(1, memberName);
		pstmt.setInt(2, memberAge);
		
		pstmt.executeUpdate();
		
		return 0;
	}
	
}
