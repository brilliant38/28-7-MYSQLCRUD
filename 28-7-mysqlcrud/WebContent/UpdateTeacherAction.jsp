<!-- *2018-07-03 ±èÁØ¿µ* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"   pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.sql.DriverManager" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.PreparedStatement" %>
<%@ page import = "java.sql.SQLException" %>

<%
request.setCharacterEncoding("euc-kr");
Connection conn = null;
PreparedStatement pstmt = null;

String teacher_no = request.getParameter("teacher_no");
String teacher_name = request.getParameter("teacher_name");
String teacher_age = request.getParameter("teacher_age");

System.out.println(teacher_no + "<--teahcer_no");
System.out.println(teacher_name+ "<-- teacher_name");
System.out.println(teacher_age + "<-- teacher_age");



System.out.println(conn + "<-- conn");

pstmt = conn.prepareStatement("UPDATE teacher SET teacher_name, teahcer_age=?,WHERE teacher_no=?");
System.out.println(pstmt + "<-- pstmt 1");


pstmt.setString(1, teacher_no);
pstmt.setString(2, teacher_name);
pstmt.setString(3, teacher_age);
pstmt.executeUpdate();

pstmt.close();
conn.close();

response.sendRedirect(request.getContextPath() + "./TeacherList.jsp");
%>