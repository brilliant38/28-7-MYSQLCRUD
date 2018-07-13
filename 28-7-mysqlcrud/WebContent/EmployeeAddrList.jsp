<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAddr" %>
<%@ page import="service.EmployeeAddrDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeAddrList</title>
	</head>
	<body>
		<h1>Employee Address</h1>
		<br><br><br>
		<table border="1">
			<tr>
				<th>주소 번호</th>
				<th>회원 번호</th>
				<th>회원 주소</th>
			</tr>
		<%
	        request.setCharacterEncoding("euc-kr");
			
			int employeeNo = Integer.parseInt(request.getParameter("no"));
						
			EmployeeAddr employeeAddr = new EmployeeAddr();
			
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
			ArrayList<EmployeeAddr> arrayListEmployeeAddr = employeeAddrDao.selectEmployeeAddrByPage(employeeNo);
			System.out.println(arrayListEmployeeAddr + " : 01 arrayListEmployeeAddr check");
			
			
			for(int i=0; i<arrayListEmployeeAddr.size(); i++) {
		%>
				<tr>
					<td><%=arrayListEmployeeAddr.get(i).getEmployeeAddrNo()%></td>
					<td><%=arrayListEmployeeAddr.get(i).getEmployeeNo()%></td>
					<td><%=arrayListEmployeeAddr.get(i).getEmployeeAddrContent()%></td>
				</tr>
		<%
			}
		%>
		</table>
		<br>
		<a href="./employee/EmployeeList.jsp">목록으로</a>
	</body>
</html>