<!--2018-07-12 이광재 -->
<!--MemberList.jsp페이지에서 점수입력 링크를 클릭하면, 접수임력 양식이 출력되면서 값을 Action페이지로 넘기는 폼 -->

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
					<th>회원 번호</th>
					<td><input type="text" name="no" value="<%=member.getMemberNo() %>" readonly></td>
				</tr>
				<tr>
					<th>회원 점수</th>
					<td><input type="text" name="score"></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="회원점수입력"></td>
				</tr>
			</table>
		</form>
	</body>
</html>