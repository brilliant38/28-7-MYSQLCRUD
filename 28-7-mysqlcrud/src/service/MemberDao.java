package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp 
	public int insertMember(Member member) throws ClassNotFoundException, SQLException {
		
		Member m = new Member(); // Member ��ü ����
		String memberName = m.getMember_name(); //Member��ü�� getname �޼ҵ� ȣ�� �� ������ ����
		int memberAge = m.getMember_age(); //Member��ü�� getage �޼ҵ� ȣ�� �� ������ ����
		
		//mysql ����̹� �ε�
		Class.forName("com.mysql.jdbc.Driver");
		
		//Database ����(Connection ��ü ����)
		String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
		String dbUser = "root";
		String dbPass = "java0000";
		Connection conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		
		//prepareStatement�޼ҵ� ȣ���Ͽ� ������ ���� �غ�
		PreparedStatement pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)");
		pstmt.setString(1, memberName);
		pstmt.setInt(2, memberAge);
		
		pstmt.executeUpdate();
		
		return 0;
	}
	
}
