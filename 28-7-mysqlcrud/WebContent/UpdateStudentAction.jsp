<!--  28기 구해성  2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<% 
		request.setCharacterEncoding("euc-kr");
	
		Student student = new Student();
		
		student.setStudent_no(Integer.parseInt(request.getParameter("no")));

		student.setStudent_name(request.getParameter("name"));
		student.setStudent_age(Integer.parseInt(request.getParameter("age")));
		
		StudentDao studentdao = new StudentDao();
		studentdao.updateStudent(student);
		
		response.sendRedirect("./StudentList.jsp");
	%>
	</body>
</html>