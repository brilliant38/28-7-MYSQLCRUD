package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberAddrDao {
	
	public int insertMemberAddr(Member member) throws ClassNotFoundException, SQLException {
		
		MemberAddr ma = new MemberAddr();
		int memberNo = ma.getMember_no();
		String memberAddrContent = ma.getMember_addr_content();
		
		//mysql ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver");
		
		//Database ����(Connection ��ü ����)
		String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//prepareStatement�޼ҵ� ȣ���Ͽ� ������ ���� �غ�
		PreparedStatement pstmt = conn.prepareStatement("insert into member_addr (member_no,member_addr_content) values (?,?)");
		pstmt.setInt(1, memberNo);
		pstmt.setString(2, memberAddrContent);
		
		pstmt.executeUpdate();
		
		return 0;
	}


}
