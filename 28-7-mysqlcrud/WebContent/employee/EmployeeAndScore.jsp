<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.EmployeeScoreDao" %>
<%@ page import = "service.EmployeeScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>EmployeeAndScore</title>
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
		<%
			int employeeNo = Integer.parseInt(request.getParameter("employeeNo"));
			
			EmployeeScoreDao employeeScoreDao = new EmployeeScoreDao();
			ArrayList<EmployeeScore> list = employeeScoreDao.personalScore(employeeNo);
		%>
		<table class="zui-table">
			<tr>
				<th>점수</th>
				
			</tr>
			<%
				for(int i=0; i<list.size(); i++){
			%>
					<tr>
						<td><%=list.get(i).getScore() %></td>
					</tr>
			<%
				}
			%>
		</table>
	</body>
</html>