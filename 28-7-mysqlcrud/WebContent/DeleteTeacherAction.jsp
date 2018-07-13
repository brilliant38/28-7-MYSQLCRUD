<!-- *2018-07-12 김준영* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>DeleteTeacherAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
			
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo")); //List 페이지에서 넘어온 회원 번호 저장
			
			TeacherDao teacherdao = new TeacherDao();
			teacherdao.deleteTeacher(teacherNo); // 회원번호 입력하여 회원 정보 행 1줄 삭제 메소드 호출
			
			response.sendRedirect("./teacher/TeacherList.jsp"); // List 페이지로 복귀
		%>
	</body>
</html>