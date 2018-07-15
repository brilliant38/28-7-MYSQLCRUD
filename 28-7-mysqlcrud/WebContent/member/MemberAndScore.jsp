<!-- 2018-07-09 이광재 -->
<!--MemberList.jsp에서 No값을 받아와서 MemberAndScore 객체의 두 DTO를 불러와서 회원 개인 이름과 점수를 리턴받아 보여주는 화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAndScore" %>
<%@ page import = "service.MemberScoreDao" %>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberScore" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAndScore</title>
	</head>
	<body>
		<h3>MemberAndScore</h3>
		<table>
			<tr>
				<th>점수번호</th>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>회원나이</th>
				<th>등록점수</th>
			</tr>
		<%	
			request.setCharacterEncoding("euc-kr");
			
			int no = Integer.parseInt(request.getParameter("no"));
			
			//첫 페이지 번호, 페이지당 표시할 행의 수, 검색어를 매개변수로 입력하여 회원정보와 회원의 점수를 불러올 메소드를 호출한다.
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberAndScore> memberAndScore = memberScoreDao.MemberAndScore(no);
			
			//리스트에 담겨있는 객체내에 각각의 타입에 맞는 변수에 주소값을 get 한다. 
			for(int i=0; i<memberAndScore.size(); i++) {
				MemberAndScore memberAndScoreForMethod = memberAndScore.get(i);
				
				//get메소드를 호출하여 해당하는 값을 불러낸다.
		%>
				<tr><!-- 체인을 이용해서 메소드 호출 -->
					<td><%=memberAndScore.get(i).getMemberScore().getMemberScoreNo() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberNo() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberName() %></td>
					<td><%=memberAndScore.get(i).getMember().getMemberAge() %></td>
					<td><%=memberAndScore.get(i).getMemberScore().getScore() %></td>
				</tr>
		<%
			}
		%>
		</table>
	</body>
</html>