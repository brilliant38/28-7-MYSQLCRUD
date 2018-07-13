<!-- 28기 구해성 2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "service.Student" %>
<%@ page import = "service.StudentDao"%>
<%@page import="java.util.ArrayList"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
	<%
		request.setCharacterEncoding("euc-kr");
		int student_no = Integer.parseInt(request.getParameter("no"));
		
		StudentDao dao = new StudentDao();
		ArrayList<Student> stu = dao.updateForSelectMember(student_no);
		System.out.println(stu+"<--s");
	
	%>
		<h1>Update Student</h1>
		<br><br><br>
		<form action="./UpdateStudentAction.jsp" method="post">
			<table border="1">
				<tr>
					<td>학생 번호 :</td>
					<td><input type="text" name="no" size="20" value="<%= stu.get(0).getStudent_no() %>" readonly></td>
				</tr>
				<tr>
					<td>학생 이름 :</td>
					<td><input type="text" name="name" size="20" value="<%= stu.get(0).getStudent_name() %>"></td>
				</tr>
				<tr>
					<td>학생 나이 :</td>
					<td><input type="text" name="age" size="20" value="<%= stu.get(0).getStudent_age() %>"></td>
				<tr>
				<tr>
					<td colspan="2"><button>수정</button></td>
				</tr>
			</table>
		</form>
		<br>
		<a href="<%= request.getContextPath() %>/StudentList.jsp">StudentList로 이동</a>
	</body>
</html>