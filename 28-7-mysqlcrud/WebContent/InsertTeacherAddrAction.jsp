<!-- 2018-07-01 김준영 -->
<!-- teacherAddrAction insert -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherAddrDao" %>
<%@ page import = "service.TeacherAddr" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>insert TeacherAddr Action</title>
</head>
<body>
<% 	request.setCharacterEncoding("euc-kr");
	
	TeacherAddr teacherAddr = new TeacherAddr();
	teacherAddr.setTeacherNo(Integer.parseInt(request.getParameter("teacherNo")));
	teacherAddr.setTeacherAddrContent(request.getParameter("teacherAddrContent"));
	TeacherAddrDao dao = new TeacherAddrDao();
	dao.insertTeacherAddr(teacherAddr);
%>
</body>
</html>