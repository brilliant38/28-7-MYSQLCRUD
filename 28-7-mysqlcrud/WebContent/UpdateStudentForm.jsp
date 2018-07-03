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
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<---send_id");
StudentDao dao = new StudentDao();
Student Stu = dao.StudentUpdate(send_id);
System.out.println(Stu+"<--s");

int dbno = Stu.getS_no();
String dbname = Stu.getS_name();
int dbage = Stu.getS_age();
%>
<form action="<%= request.getContextPath() %>/mupdate/m_update_pro.jsp" method="post">
<table border="1">
<tr>
	<td>번호(no)</td>
	<td><input type="text" name="m_id" size="20" value="<%= dbno %>" readonly></td>
<tr>
<tr>
	<td>이름(name)</td>
	<td><input type="text" name="m_pw" size="20" value="<%= dbname %>"></td>
<tr>
<tr>
	<td>나이(age)</td>
	<td><input type="text" name="m_level" size="20" value="<%= dbage %>"></td>
<tr>
<tr>
	<td colspan="4"><input type="submit" value="학생수정버튼"></td>
</tr>
</table>
</form>
</body>
</html>