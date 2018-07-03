<!-- *2018-07-03 ���ؿ�* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"  pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.SQLException" %>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id ");

String dbno =null;
String dbname = null;
String dbage = null;

try{
	
	
	System.out.println(conn + "<-- conn");
	pstmt = conn.prepareStatement("select * from teacher WHERE tehacer_no=?");
	pstmt.setString(1, send_id);
	rs = pstmt.executeQuery();
	System.out.println(rs + "<-- rs");
	if(rs.next()){
		System.out.println("���������� �ִ� rs.next() ���ǹ� true");
		dbno = rs.getString("teacher.no");
		dbname = rs.getString("teacher_name");
		dbage = rs.getString("teahcer_age");
	
		System.out.println(dbno + "<-- dbno");	
		System.out.println(dbname + "<-- dbname");
		System.out.println(dbage + "<-- dbage");
		
	}
} catch(SQLException ex) {
	out.println(ex.getMessage());
	ex.printStackTrace();
} finally {
	if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	if (conn != null) try { conn.close(); } catch(SQLException ex) {}
}
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
						
</head>
<body>

		
<form action="<%= request.getContextPath() %>./UpdateTeacherAction.jsp" method="post">
<table border="1">
<tr>
	<td>��ȣ</td>
		<td><input type="text" name="teacher_no" size="20" value="<%= dbno %>"readonly></td>
<tr>
<tr>
	<td>�̸�</td>
	<td><input type="text" name="teacher_name" size="20" value="<%= dbname %>"> </td>
<tr>
<tr>
	<td>����</td>
	<td><input type="text" name="teacher_age" size="20" value="<%= dbage %>"></td>
<tr>

<tr>
	<td colspan="4"><input type="submit" value="����������ư"></td>
</tr>
</table>
</form>

	
	
</body>
</html>



