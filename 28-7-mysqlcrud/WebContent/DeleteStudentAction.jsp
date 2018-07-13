<!-- 28기 구해성 2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import ="service.StudentDao" %>
<%@ page import ="service.Student" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr");
		
			int studentNo = Integer.parseInt(request.getParameter("no")); 
		
			System.out.println(studentNo +" 05<-student no");
			StudentDao Studentdao = new StudentDao();
			Studentdao.StudentDelete(studentNo); 
		
			response.sendRedirect("./StudentList.jsp"); 
		
		%>
	</body>
</html>