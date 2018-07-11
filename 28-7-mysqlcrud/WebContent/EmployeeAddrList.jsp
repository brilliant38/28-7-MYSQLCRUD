<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.EmployeeAddr" %>
<%@ page import="service.EmployeeAddrDao" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeAddrList</title>
		<style>
			.zui-table {
			    border: solid 1px #DDEEEE;
			    border-collapse: collapse;
			    border-spacing: 0;
			    font: normal 13px Arial, sans-serif;
			}
			.zui-table thead th {
			    background-color: #DDEFEF;
			    border: solid 1px #DDEEEE;
			    color: #336B6B;
			    padding: 10px;
			    text-align: left;
			    text-shadow: 1px 1px 1px #fff;
			}
			.zui-table tbody td {
			    border: solid 1px #DDEEEE;
			    color: #333;
			    padding: 10px;
			    text-shadow: 1px 1px 1px #fff;
			}
		</style>
	</head>
	<body>
		<h3>직원 주소</h3>
		<table class="zui-table">
			<tr>
				<th>주소</th>
			</tr>
		<%
	        request.setCharacterEncoding("euc-kr");
			
			int employeeNo = Integer.parseInt(request.getParameter("no"));
						
			EmployeeAddr employeeAddr = new EmployeeAddr();
			
			EmployeeAddrDao employeeAddrDao = new EmployeeAddrDao();
			ArrayList<EmployeeAddr> list = employeeAddrDao.selectEmployeeAddrByPage(employeeNo);
			System.out.println(list + " : 01 list check");
			
			
			for(int i=0; i<list.size(); i++) {
				employeeAddr = list.get(i);
		%>
				<tr>
					<td><%=employeeAddr.getEmployeeAddrContent()%></td>
				</tr>
		<%
			}
		%>
		</table>
	</body>
</html>