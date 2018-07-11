<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMemberForm</title>
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
		<h3>회원 가입</h3>
		<form action="./InsertMemberAction.jsp" method="post">
			<table class="zui-table">
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size="17"></td>
				</tr>
				<tr>
					<th>나이</th>
					<td><input type="text" name="age" size="17"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원가입버튼"></td>
				</tr>
			</table>
		</form>
	</body>
</html>