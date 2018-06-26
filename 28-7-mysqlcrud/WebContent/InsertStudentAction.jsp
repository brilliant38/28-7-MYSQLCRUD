<!--  2018-06-26 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "GHS.Student" %>
<%@ page import = "GHS.StudentDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertStudentAction</title>
	</head>
		<body>
			<%
				request.setCharacterEncoding("euc-kr");
				
				String studentName = request.getParameter("student_name");
				int age = Integer.parseInt(request.getParameter("student_age"));
					System.out.println(studentName + "<-studentName ");
					System.out.println(age + "<-age ");
			
					Student Stu = new Student();
					Stu.setStudent_name(studentName);
					Stu.setStudent_age(age);
					
					StudentDao Stud = new StudentDao();
					Stud.insertStudent(Stu);
					
					response.sendRedirect("./InsertStudentForm.jsp");
			
			
			%>	
		</body>
</html>
