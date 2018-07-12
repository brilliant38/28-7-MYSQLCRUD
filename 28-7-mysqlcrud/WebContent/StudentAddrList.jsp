<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentAddr"  %>
<%@ page import = "service.StudentAddrDao"  %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<table width="100%" border="1">
	<tr>
	<th>학생주소</th>
	</tr>
	<%
		request.setCharacterEncoding("euc-kr");
		
		int studentNo = Integer.parseInt(request.getParameter("no"));
		
		StudentAddr studentAddr = new StudentAddr();
		
		StudentAddrDao studentAddrDao = new StudentAddrDao();
		ArrayList<StudentAddr> List = studentAddrDao.studentAddrlist(studentNo);
	
	
	for(int i=0; i<List.size(); i++) {
		studentAddr = List.get(i);
		%>
				<tr>
					<td><%=studentAddr.getStudent_addr_content()%></td>
				</tr>
		<%
			}
		%>
	</table>
</body>
</html>