<!-- 28�� ���ؼ� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.SQLException" %>


�л� ����Ʈ <br>
<table width="100%" border="1">
<tr>
	<td>��ȣ(no)</td><td>�̸�(name)</td><td>����(age)</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  //����̹� �ε�
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root"; //����̹� id
		String dbPass = "java0000"; // ����̹� pw
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<--01üũ");
		pstmt = conn.prepareStatement("select * from student");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<--02üũ");
		
		
		while(rs.next()) {
	%>		
		<tr>
			<td><%=rs.getInt("student_no") %></td>
			<td><%=rs.getString("student_name") %></td>			
			<td><%=rs.getInt("student_age") %></td>
		</tr>	
			
		
		
	<% 
	}
	} catch(SQLException ex) {
		out.println(ex.getMessage());
		ex.printStackTrace();
	} finally {
		// 6. ����� Statement ����
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		
		// 7. Ŀ�ؼ� ����
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	
	%>

	</table>