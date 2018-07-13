<!-- 2018-07-01 김준영 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import = "service.TeacherDao" %>
<%@ page import = "service.Teacher" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherAction</title>
	</head>
	<body>
	<%	
		request.setCharacterEncoding("EUC-KR");
		// 생성자 메서드로 Teacher 클래스 객체 생성하고 teacher 객체참조변수에 주소값 대입합니다.
		Teacher teacher = new Teacher();
		// Teacher 클래스 객체내에 setter 메서드로 insertTeacherForm.jsp 에서 받은 값 대입합니다.
		teacher.setTeacherName(request.getParameter("teacherName"));
		teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
	
		System.out.println(teacher.getTeacherName());
		System.out.println(teacher.getTeacherAge());
		
		// 생성자 메서드로 TeacherDao 클래스 객체 생성후 teacherDao 객체참조변수에 주소값 대입합니다.
		TeacherDao teacherDao = new TeacherDao();
		// TeacherDao 클래스 객체내에 insertTeacher 메서드에 teacher 객체참조변수에 담긴 주소값을 대입해서 호출합니다.
		teacherDao.insertTeacher(teacher);
		
		response.sendRedirect(request.getContextPath()+"./teacher/TeacherList.jsp");
	 %>
	</body>
</html>