<!-- 2018-07-03 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAddrDao"%>
<%@ page import = "service.MemberAddr" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Member Address List</title>
	</head>
	<body>
		<h1>Member Address</h1>
		<br><br><br>
		<table border="1">
			<tr>
				<th>주소 번호</th>
				<th>회원 번호</th>
				<th>회원 주소</th>
			</tr>
		<%
	        request.setCharacterEncoding("euc-kr");
			
			int memberNo = Integer.parseInt(request.getParameter("no"));
			
			MemberAddr memberaddr = new MemberAddr();
			
			MemberAddrDao memberAddrDao = new MemberAddrDao();
			ArrayList<MemberAddr> arrayListMemberAddr = memberAddrDao.selectMemberAddrByPage(memberNo);
			System.out.println(arrayListMemberAddr + " : 01 arrayListMemberAddr check");
			
			for(int i=0; i<arrayListMemberAddr.size(); i++) {
		%>
				<tr>
					<td><%=arrayListMemberAddr.get(i).getMemberAddrNo()%></td>
					<td><%=arrayListMemberAddr.get(i).getMemberNo()%></td>
					<td><%=arrayListMemberAddr.get(i).getMemberAddrContent()%></td>
				</tr>
		<%
			}
		%>
		</table>
		<br>
		<a href = "./member/MemberList.jsp">목록으로</a>
	</body>
</html>