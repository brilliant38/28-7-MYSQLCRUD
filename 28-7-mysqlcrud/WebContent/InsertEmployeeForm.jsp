<!-- 2018-07-03 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertEmployeeForm</title>
		<style>
			table {
				width: 200px;
				border: 1px solid #444444;
				border-collapse: collapse;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<h3>ȸ�� ����</h3>
		<form action="./InsertEmployeeAction.jsp" method="post">
			<table>
				<tr>
					<th>�̸�</th>
					<td><input type="text" name="name" size="17"></td>
				</tr>
				<tr>
					<th>����</th>
					<td><input type="text" name="age" size="17"></td>
				</tr>
				<tr>
					<th>�ּ�</th>
					<td><input type="text" name="address" size="17"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="ȸ�����Թ�ư"></td>
				</tr>
			</table>
		</form>
	</body>
</html>