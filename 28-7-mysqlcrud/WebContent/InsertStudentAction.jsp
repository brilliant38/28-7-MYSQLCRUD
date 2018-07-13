<!--  2018-06-26 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Student" %>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.StudentAddrDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
				
			String name = request.getParameter("studentName");
			int age = Integer.parseInt(request.getParameter("studentAge"));
			System.out.println(name + "<-name ");
			System.out.println(age + "<-age ");
			
			Student student = new Student();
			student.setStudent_name(name);
			student.setStudent_age(age);
			
			StudentAddrDao dao = new StudentAddrDao();
			dao.insertStudent(student);
			
			response.sendRedirect("./StudentList.jsp");
			%>	
	</body>
</html>
