<!-- 2018-07-09 이광재 -->
<!--MemberList.jsp에서 No값을 받아와서 MemberAndScore 객체의 두 DTO를 불러와서 회원 개인 이름과 점수를 리턴받아 보여주는 화면 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberAndScore" %>
<%@ page import = "service.MemberScoreDao" %>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberScore" %>
<%@ page import = "java.util.ArrayList" %>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberAndScore</title>
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
		<h3>MemberAndScore</h3>
		<table id="customers">
			<tr>
				<th>점수번호</th>
				<th>회원번호</th>
				<th>회원이름</th>
				<th>회원나이</th>
				<th>등록점수</th>
			</tr>
		<%	
			request.setCharacterEncoding("euc-kr");
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}
			
			int pagePerRow = 5;//페이지당 표시할 행의 수를 정한다.
			
			int RowNumber = 0;//전체 행의 수를 저장할 변수를 만든다.
			
			String searchWord = request.getParameter("searchWord");
			
			System.out.println(searchWord + " : searchWord called");
			
			if(searchWord == null) {//searchWord 변수가 값이 null이라면 공백으로 바꿔 입력해준다.
				searchWord = "";
			}
			
			//첫 페이지 번호, 페이지당 표시할 행의 수, 검색어를 매개변수로 입력하여 회원정보와 회원의 점수를 불러올 메소드를 호출한다.
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			ArrayList<MemberAndScore> memberAndScore = memberScoreDao.selectMemberAndScored(currentPage, pagePerRow, searchWord);
			
			//리스트에 담겨있는 객체내에 각각의 타입에 맞는 변수에 주소값을 get 한다. 
			for(int i=0; i<memberAndScore.size(); i++) {
				MemberAndScore memberAndScoreForMethod = memberAndScore.get(i);
				RowNumber = memberAndScore.get(1).getMember().getRowNumber();
				
				//get메소드를 호출하여 해당하는 값을 불러낸다.
		%>
				<tr><!-- 체인을 이용해서 메소드 호출 -->
					<td><%=memberAndScore.get(1).getMemberScore().getMemberScoreNo() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberNo() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberName() %></td>
					<td><%=memberAndScore.get(1).getMember().getMemberAge() %></td>
					<td><%=memberAndScore.get(1).getMemberScore().getScore() %></td>
				</tr>
		<%
			}
		%>
		</table>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage-1%>&searchWord=<%=searchWord%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (RowNumber-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((RowNumber-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./MemberAndScore.jsp?currentPage=<%=currentPage+1%>&searchWord=<%=searchWord%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
	</body>
</html>