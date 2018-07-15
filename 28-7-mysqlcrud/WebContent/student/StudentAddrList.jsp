<!-- 28기 구해성 2018-07-13 -->
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
		<%
			request.setCharacterEncoding("euc-kr");
			
			int studentNo = Integer.parseInt(request.getParameter("no"));
			
			StudentAddr studentAddr = new StudentAddr();
			
			StudentAddrDao studentAddrDao = new StudentAddrDao();
			ArrayList<StudentAddr> List = studentAddrDao.studentAddrlist(studentNo);
		
		
			for(int i=0; i<List.size(); i++) {
				studentAddr = List.get(i);
		%>
		<h1>Student Address</h1>
		<br><br><br>
		<table border="1">
			<thead>
				<tr>
					<th style="width:70px">주소 번호</th>
					<th>학생 번호</th>
					<th>학생 주소</th>
				<tr>
			</thead>
			
				<tr>
				<td><%=studentAddr.getStudentr_addr_no()%></td>
				<td><%=studentAddr.getStudent_no()%></td>
				<td><%=studentAddr.getStudent_addr_content()%></td>
				</tr>
			<%
				}
			%>
		</table>
		<br>
		
			<a id="buttonToList" href="<%= request.getContextPath() %>/StudentList.jsp">목록으로</a>
	</body>
</html>