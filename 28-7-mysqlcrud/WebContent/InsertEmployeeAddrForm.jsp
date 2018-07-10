<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertEmployeeAddrForm</title>
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
	<h3>�ּ� �Է�</h3>
		<form action="./InsertEmployeeAddrAction.jsp" method="post">
			<table class="zui-table">
				<tr>
					<th>������ȣ</th>
					<td><input type="text" name="no" size="17" value="<%=request.getParameter("no")%>" readonly></td>
				</tr>
				<tr>
					<th>�ּ�</th>
					<td><input type="text" name="address" size="17"></td>
				</tr>
				<tr>
					<td><input type="submit" value="�������Թ�ư">
				</tr>
			</table>
		</form>
	</body>
</html>