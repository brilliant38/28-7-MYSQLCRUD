<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "service.Student" %>
<%@ page import = "service.StudentDao"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
	int student_no = Integer.parseInt(request.getParameter("student_no"));
	System.out.println(student_no + "<---student");
	
	int Student_no = Integer.parseInt(request.getParameter("no"));
	
	StudentDao dao = new StudentDao();
	ArrayList<Student> stu = dao.updateForSelectMember(student_no);
	System.out.println(stu+"<--s");
	
%>
<form action="./UpdateStudentAction.jsp" method="post">
<table border="1">
<tr>
	<td>번호(no)</td>
	<td><input type="text" name="s_id" size="20" value="<%= stu.get(0).getStudent_no() %>" readonly></td>
<tr>
<tr>
	<td>이름(name)</td>
	<td><input type="text" name="s_name" size="20" value="<%= stu.get(0).getStudent_name() %>"></td>
<tr>
<tr>
	<td>나이(age)</td>
	<td><input type="text" name="s_age" size="20" value="<%= stu.get(0).getStudent_age() %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="학생수정버튼"></td>
</tr>
</table>
</form>
</body>
</html>