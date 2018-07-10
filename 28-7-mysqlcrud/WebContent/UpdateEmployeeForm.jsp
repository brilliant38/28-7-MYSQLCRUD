<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeDao"%>
<%@ page import = "service.Employee" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>UpdateEmployeeForm</title>
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
		<h3>ȸ����������</h3>
		<form action="./UpdateEmployeeAction.jsp" method="post">
			<table class="zui-table">
			<%
		        request.setCharacterEncoding("euc-kr");
				
				int EmployeeNo = Integer.parseInt(request.getParameter("no"));
				
				
				EmployeeDao employeeDao = new EmployeeDao();
				Employee employee = employeeDao.updateEmployeeList(EmployeeNo);
				System.out.println(employee + " : 01 employee check");
				
				
			%>
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" size="17" value="<%=employee.getEmployeeName()%>"></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="age" size="17" value="<%=employee.getEmployeeAge()%>"></td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="submit" value="ȸ����������">
						<span>
							<input type="hidden" name="no" value="<%=EmployeeNo %>">
						</span>
					</td>
				</tr>
				
			</table>
		</form>
		<!-- <form>
			<div>
				�̸� :
				<input type="text" name="searchWord">
			</div>
		</form> -->
	</body>
</html>