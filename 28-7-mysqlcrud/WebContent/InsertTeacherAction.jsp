<!-- 2018-07-01 ���ؿ� -->
<!-- teacherAction insert -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*"%>
<%@ page import="service.TeacherDao"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert Teacher Action</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
			// Teacher Ŭ������ ���� ������ ���ο� ��ü�� �ּҸ� teacher�� ����ش�.
			service.Teacher teacher = new service.Teacher();
			teacher.setTeacherName(request.getParameter("teacherName"));
			service.TeacherAddr teacheraddr = new service.TeacherAddr(); 
			/* 
			teacher ��ü���������� �ּҰ��� ã�ư� int�� TeacherAge��
			request�� ��û�� �� �� String Ÿ������ �ۿ� �� �����´�.
			�׷��� integer.parseInt�� String -> int�� �ٲ��ش�.
			*/
			teacher.setTeacherAge(Integer.parseInt(request.getParameter("teacherAge")));
			
			
			//TeacherDAO Ŭ������ ���� ������ ���ο� ��ü�� �ּҸ� dao�� ����ش�.
			service.TeacherDao dao = new service.TeacherDao();
			dao.insertTeacher(teacher); // dao ��ü���������� insertTeacher�޼��� ȣ��
			
			
			response.sendRedirect(request.getContextPath() + "/InsertTeacherForm.jsp");
	%>

</body>
</html>