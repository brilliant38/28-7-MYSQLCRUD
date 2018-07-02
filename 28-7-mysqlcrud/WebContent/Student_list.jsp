<!-- 28기 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.SQLException" %>


학생 리스트 <br>
<table width="100%" border="1">
<tr>
	<td>번호(no)</td><td>이름(name)</td><td>나이(age)</td>
</tr>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");  //드라이버 로딩
		
		String jdbcDriver = "jdbc:mysql://localhost:3306/engineer?" +
				"useUnicode=true&characterEncoding=euckr";
		String dbUser = "root"; //드라이버 id
		String dbPass = "java0000"; // 드라이버 pw
		
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		System.out.println(conn + "<--01체크");
		pstmt = conn.prepareStatement("select * from student");
		
		rs = pstmt.executeQuery();
		System.out.println(rs + "<--02체크");
		
		
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
		// 6. 사용한 Statement 종료
		if (rs != null) try { rs.close(); } catch(SQLException ex) {}
		if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
		
		// 7. 커넥션 종료
		if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	}
	
	%>

	</table>