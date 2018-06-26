/*2018-06-26 �̱���*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberDao {
	//insertMemberForm,inserMemberAction.jsp
	//DAO�� ��������� ����� �ȵȴ�. �ʿ��� ������ ��� �޼ҵ峻�� ���������� �������Ѵ�.
	//Model1������ DAO�ȿ��� ���ܸ� ó���ϴ� ����� �޼ҵ� ���� try...catch...finally�� ����. throws ������.
	
	public int insertMember(Member member) {
		System.out.println("insertMember �޼ҵ� ���� �Ϸ�");
		
		String memberName = member.getMember_name(); //Member��ü�� getMember_name �޼ҵ� ȣ�� �� ������ ����
		int memberAge = member.getMember_age(); //Member��ü�� getMember_age �޼ҵ� ȣ�� �� ������ ����
		System.out.println(memberName + " : memberName ���� �Ϸ�");
		System.out.println(memberAge + " : memberAge ���� �Ϸ�");
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		//mysql ����̹� �ε�
		try {			
			//com.mysql.jdbc.Driver Ŭ������ �ε� - JDBC����̹��� ��� 
			Class.forName("com.mysql.jdbc.Driver");

			//Database ����(Connection ��ü ����)
			String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?useUnicode=true&characterEncoding=euckr";
			String dbUser = "root";
			String dbPass = "java0000";
			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass); // getConnection�޼ҵ��� ȣ�� �� Connection��ü�� ����
			System.out.println(conn + " : Connection ��ü ���� �Ϸ�");
			
			//prepareStatement�޼ҵ� ȣ���Ͽ� ������ ���� �غ�
			pstmt = conn.prepareStatement("insert into member (member_name, member_age) values (?,?)"); //������ �Է�
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberAge);
			System.out.println(pstmt + " : PreparedStatement ��ü ���� �Ϸ�");
			
			result = pstmt.executeUpdate();	//executeUpdate�޼ҵ带 ȣ���Ͽ� ������ ����
			
			pstmt.close();	//PreparedStatement ��ü ����
			
			conn.close();	//Database ���� ����
			
		} catch (ClassNotFoundException e) { //Ŭ���� ����ó�� �ۼ�
			// TODO Auto-generated catch block
			System.out.println("�����ϵ� �ڹ� Ŭ���� ������ ã�� �� ���� ����");
			e.printStackTrace();
		} catch (SQLException e) {//������ ����ó�� �ۼ�
			System.out.println("SQL ������ �ۼ�����");
			e.printStackTrace();
		
		} finally {	// �۾� �Ϸ�� ���� 
			if(pstmt != null) {	//PreparedStatement ��ü ����
				try {
					pstmt.close();
				} catch (SQLException e) {
					System.out.println("SQL ������ �ۼ�����");
					e.printStackTrace();
				}
			}
			
			if(conn != null) {	//Database ���� ����
				try {
					conn.close();
				} catch (SQLException e) {
					System.out.println("SQL ������ �ۼ�����");
					e.printStackTrace();
				}
			}
		}
		return result;
	}
}
