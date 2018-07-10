<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>InsertMemberForm</title>
		<style>
			#customers {
			    font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
			    border-collapse: collapse;
			    width: 500px;
			}
			
			#customers td, #customers th {
			    border: 1px solid #ddd;
			    padding: 8px;
			}
			
			#customers tr:nth-child(even){background-color: #f2f2f2;}
			
			#customers tr:hover {background-color: #ddd;}
			
			#customers th {
			    padding-top: 12px;
			    padding-bottom: 12px;
			    text-align: left;
			    background-color: #4CAF50;
			    color: white;
			}
		</style>
	</head>
	<body>
		<h3>주소 입력</h3>
		<form action="./InsertMemberAddrAction.jsp" method="post">
			<table id="customers">
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="no" size="17" value="<%=request.getParameter("no")%>" readonly></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address" size="17"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="주소입력"></td>
				</tr>
			</table>
		</form>
	</body>
</html>