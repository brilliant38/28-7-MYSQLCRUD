<!-- *2018-07-12 김준영* -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Delete Teacher Action</title>
	</head>
	<body>
		<%
			// teacherList.jsp로 부터 넘겨받은 teacherNo 값을 변수에 대입 후 테스트
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			System.out.println("teacherNo from teacherList.jsp : " + teacherNo);
			
			TeacherDao teacherDao = new TeacherDao();
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			
			// teacher_address 테이블이 teacher 테이블을 참조하는 구조이기 때문에 taecher_address 테이블 안의 관련된 정보를 먼저 삭제해야한다.
			teacherAddrDao.deleteTeacherAddress(teacherNo);
			teacherDao.deleteTeacher(teacherNo);
			
			response.sendRedirect(request.getContextPath() + "/TeacherList.jsp");
		%>
	</body>
</html>