<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentAddr" %>
<%@ page import = "service.StudentAddrDao" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>InsertStudnetAddrAction</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
	
		int no = Integer.parseInt(request.getParameter("no"));
		String address = request.getParameter("address");
		
		StudentAddr studentAddr = new StudentAddr();
		studentAddr.setStudent_no(no);
		studentAddr.setStudent_addr_content(address);
		
		StudentAddrDao studentAddrDao = new StudentAddrDao();
		studentAddrDao.insertStudentAddr(studentaddr);
		
		
		response.sendRedirect("./StudentList.jsp");
		
		
		


	%>	


</body>
</html>