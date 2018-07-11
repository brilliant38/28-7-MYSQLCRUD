<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddrDao"%>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberAddrList</title>
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
		<h3>직원 주소</h3>
		<table id="customers">
			<tr>
				<th>주소</th>
			</tr>
		<%
	        request.setCharacterEncoding("euc-kr");
			
			int memberNo = Integer.parseInt(request.getParameter("no"));
						
			MemberAddr memberaddr = new MemberAddr();
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			ArrayList<MemberAddr> list = memberAddrDao.selectMemberAddrByPage(memberNo);
			System.out.println(list + " : 01 list check");
			
			
			for(int i=0; i<list.size(); i++) {
				memberaddr = list.get(i);
		%>
				<tr>
					<td><%=memberaddr.getMemberAddrContent()%></td>
				</tr>
		<%
			}
		%>
		</table>
	</body>
</html>