<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import ="service.StudentDao" %>
<%@ page import ="service.Student" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
		<%
		
		int studentNo = Integer.parseInt(request.getParameter("no")); 
		System.out.println(studentNo +" 05<-student no");
		StudentDao Studentdao = new StudentDao();
		Studentdao.StudentDelete(studentNo); 
		
		response.sendRedirect("./StudentList.jsp"); 
		
		%>
</body>
</html>