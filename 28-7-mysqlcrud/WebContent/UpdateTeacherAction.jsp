<!-- *2018-07-03 김준영* -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Action</title>
	</head>
	<body>
		<%
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// updateTeacherForm.jsp로부터 넘겨받은 값을 각각의 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherName = request.getParameter("teacherName");
			int teacherAge = Integer.parseInt(request.getParameter("teacherAge"));
			
			// 값 테스트
			System.out.println("teacherNo from updateTeacherForm, updateTeacherAction.jsp : " + teacherNo );
			System.out.println("teacherName from updateTeacherForm, updateTeacherAction.jsp : " + teacherName );
			System.out.println("teacherAge from updateTeacherForm, updateTeacherAction.jsp : " + teacherAge );
			
			TeacherDao teacherDao = new TeacherDao();
			Teacher teacher = new Teacher();
			
			// 넘겨받은 값을 VO에 대입
			teacher.setTeacherNo(teacherNo);
			teacher.setTeacherName(teacherName);
			teacher.setTeacherAge(teacherAge);
			
			// updateTeacher 메서드를 호출하여 업데이트 
			teacherDao.updateTeacher(teacher);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "./teacher/TeacherList.jsp");
		%>
		
	</body>
</html>
