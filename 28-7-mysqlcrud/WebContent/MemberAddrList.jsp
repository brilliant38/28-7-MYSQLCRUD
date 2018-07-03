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
			table {
				width: 300px;
				border: 1px solid #444444;
				border-collapse: collapse;
				text-align:center;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<table>
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
			
			memberaddr = list.get(1);
			
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