<!-- 2012-07-12 �̱���
MemberList.jsp���� ȸ�� ��ȣ�� �޾� ���� ������ ����ϴ� ������. -->
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
				<th>ȸ����ȣ</th>
				<th>ȸ������</th>
			</tr>
			<tr>
				<td><%=no %>�� ȸ������ ������ </td>
				<td>
		<%
			for(int i=0; i<list.size(); i++) {
		%>
				(<%=list.get(i).getScore() %>��)
		<%
			}
		%>
		<%
			if(list.size() != 0) {
		%>
				�Դϴ�.</td>
		<%
			} else {
		%>
				����.</td>
		<%
			}
		%>
			</tr>
		</table>
	</body>
</html>