/*2018-06-26 �̱���*/
package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MemberAddrDao {
	//DAO�� ��������� ����� �ȵȴ�. �ʿ��� ������ ��� �޼ҵ峻�� ���������� �������Ѵ�.
	@SuppressWarnings("finally")
	
	public int insertMemberAddr(Member member) {
		
		MemberAddr ma = new MemberAddr();	//MemberAddr ��ü ����
		int memberNo = ma.getMember_no();	//MemberAddr��ü�� getMember_no �޼ҵ� ȣ�� �� ������ ����
		String memberAddrContent = ma.getMember_addr_content();	//MemberAddr��ü�� getMember_addr_content �޼ҵ� ȣ�� �� ������ ����
		
		//mysql ����̹� �ε�
		try {
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
			
			pstmt.executeUpdate();	//executeUpdate�޼ҵ带 ȣ���Ͽ� ������ ����
			
			pstmt.close();	//PreparedStatement ��ü ����
			
			conn.close();	//Database ���� ����
			
		} catch (ClassNotFoundException e) { //Ŭ���� ����ó�� �ۼ�
			// TODO Auto-generated catch block
			System.out.println("�����ϵ� �ڹ� Ŭ���� ������ ã�� �� ���� ����");
			e.printStackTrace();
		} catch (SQLException e) {//������ ����ó�� �ۼ�
			System.out.println("SQL ������ �ۼ�����");
			e.printStackTrace();
		} finally {// �۾� �Ϸ�� ���� 
			return 0;
		}
	}
}