<!-- 2012-07-12 이광재
MemberList.jsp에서 회원 번호를 받아 개인 점수를 출력하는 페이지. -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member And Personal Score</title>
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
			int no = Integer.parseInt(request.getParameter("no"));
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberScore> list = memberScoreDao.selectMemberAndScored(no);
		%>
		
		<table id="customers">
			<tr>
				<th>회원번호</th>
				<th>회원점수</th>
			</tr>
			<tr>
				<td><%=no %>번 회원님의 점수는 </td>
				<td>
		<%
			for(int i=0; i<list.size(); i++) {
		%>
				(<%=list.get(i).getScore() %>점)
		<%
			}
		%>
		<%
			if(list.size() != 0) {
		%>
				입니다.</td>
		<%
			} else {
		%>
				없음.</td>
		<%
			}
		%>
			</tr>
		</table>
	</body>
</html>