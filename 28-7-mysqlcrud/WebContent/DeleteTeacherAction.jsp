<!-- *2018-07-03 ±èÁØ¿µ* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<!DOCTYPE html >
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>
<%@ page import = "service.*" %>


<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<-- send_id");
Connection conn = null;
PreparedStatement pstmt = null;


System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement(
		"DELETE FROM teacher WHERE teacher_no=?");
System.out.println(pstmt + "<-- pstmt 1");
pstmt.setString(1, send_id);
pstmt.executeUpdate();
pstmt.close();
conn.close();


response.sendRedirect(request.getContextPath() + "./TeacherList.jsp");

%>









