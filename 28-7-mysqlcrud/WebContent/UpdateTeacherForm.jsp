<!-- 2018.07.10 김준영-->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Form</title>
	</head>
	<body>
		<%
		// teacherList.jsp로 부터 넘겨받은 teacherNo 값을 변수에 대입 후 테스트
		int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
		System.out.println("teacherNo from teacherList.jsp : " + teacherNo);
		
		TeacherDao teacherDao = new TeacherDao();
		TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
		
		// selectForUpdateTeacher 메서드를 호출하고 teacher 객체의 참조값을 리턴 받아 변수에 대입.
		Teacher teacher = teacherDao.selectForUpdateTeacher(teacherNo);
		%>
		<h1>Update Teacher</h1>
		<form action="<%= request.getContextPath() %>/UpdateTeacherAction.jsp" method="post"> 
			<table border="1">
				<tr>
					<td>교사 번호 : </td>
					<td><input type="text" name="teacherNo" value="<%= teacher.getTeacherNo() %>" readonly>
				</tr>
				<tr>
					<td>교사 이름 : </td>
					<td><input type="text" name="teacherName" value="<%= teacher.getTeacherName() %>">
				</tr>
				<tr>
					<td>교사 번호 : </td>
					<td><input type="text" name="teacherAge" value="<%= teacher.getTeacherAge() %>">
				</tr>
				<tr>
					<td colspan="2"><button>수정</button></td>
				</tr>
			</table>
		</form>
	</body>
</html>