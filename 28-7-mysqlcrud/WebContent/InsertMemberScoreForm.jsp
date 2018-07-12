<!--2018-07-12 �̱��� -->
<!--MemberList.jsp���������� �����Է� ��ũ�� Ŭ���ϸ�, �����ӷ� ����� ��µǸ鼭 ���� Action�������� �ѱ�� �� -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Member Score</title>
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
		<%
			Member member = new Member();
			member.setMemberNo(Integer.parseInt(request.getParameter("no")));
			
		%>
		<form action="./InsertMemberScoreAction.jsp" method="post">
			<table id="customers">
				<tr>
					<th>ȸ�� ��ȣ</th>
					<td><input type="text" name="no" value="<%=member.getMemberNo() %>" readonly></td>
				</tr>
				<tr>
					<th>ȸ�� ����</th>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="ȸ�������Է�"></td>
				</tr>
			</table>
		</form>
	</body>
</html>