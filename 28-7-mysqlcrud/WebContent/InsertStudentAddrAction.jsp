<!-- 2018-07-13 구해성 -->
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
			System.out.println(no + "no확인");
			System.out.println(address + "address확인");
			
			StudentAddr studentAddr = new StudentAddr();
			studentAddr.setStudent_no(no);
			studentAddr.setStudent_addr_content(address);
			
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			studentAddrDao.insertStudentAddr(studentAddr);
			
			
			response.sendRedirect("./StudentList.jsp");
		%>	
	</body>
</html>