<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.*" %>
<%@ page import = "java.util.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>MemberListAboveAverage</title>
	</head>
	<body>
		<h3>Member List Above Average</h3>
		<%
			
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
			
			int pagePerRow = 5;//페이지당 표시할 행의 수를 정한다.
			
			MemberScoreDao memberScoreDao = new MemberScoreDao();
			int scoreAverage = memberScoreDao.selectScoreAverage();
			
			ArrayList<MemberAndScore> list =  memberScoreDao.selectMemberListAboveAverage(currentPage, pagePerRow);
			
		%>
		<div>
			평균 : <%=scoreAverage %>
		</div>
		<table border="1">
			<thead>
				<tr>
					<th>Member_No</th>
					<th>Member_Name</th>
					<th>Member_Score</th>
				</tr>
			</thead>
			<tbody>
			<%
				for(int i=0; i<list.size(); i++) {
			%>
					<tr>
						<td><%=list.get(i).getMember().getMemberNo() %></td>
						<td><%=list.get(i).getMember().getMemberName() %></td>
						<td><%=list.get(i).getMemberScore().getScore() %></td>
					</tr>
			<%
				}
			%>
			</tbody>
		</table>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./MemberListAboveAverage.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (list.get(0).getMember().getRowNumber()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((list.get(0).getMember().getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./MemberListAboveAverage.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		<br>
		<div>
			<a href = "./index.jsp">메인화면</a>
		</div>
	</body>
</html>