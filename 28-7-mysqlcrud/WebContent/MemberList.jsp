<!-- 2018-07-11 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao"%>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
	</head>
	<body>
		
		<%	
			request.setCharacterEncoding("euc-kr");
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
 
			int pagePerRow = 5;
			
			
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchWord + " : 01 searchWord check");
			
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, pagePerRow);
			System.out.println(list + " : 02 list check");
			
			ArrayList<Member> searchList = memberDao.searchMemberList(currentPage, pagePerRow, searchWord);
			System.out.println(searchList + " : 03 searchList check");
			
			int RowNumber = list.get(0).getRowNumber();
			
			int lastPage = ((RowNumber-1) / pagePerRow) +1 ; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if(searchList.size() > 0) {
				RowNumber = searchList.get(0).getRowNumber();
			}
		%>
		<h1>Member List</h1>
		<br>
		<form action="./member/MemberList.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
		<br><br>
		<table border="1">
			<tr>
				<th>회원 번호</th>
				<th>회원 이름</th>
				<th>회원 나이</th>
				<th>주소 입력</th>
				<th>점수 입력</th>
				<th>점수 보기</th>
				<th>수정</th>
				<th>삭제</th>
			</tr>
			
		<%
			if (searchList.size() == 0) {
				for(int i=0; i<list.size(); i++) {
		%>
					<tr>
						<td><%=list.get(i).getMemberNo()%></td>
						<td><a href="./member/MemberAddrList.jsp?no=<%=list.get(i).getMemberNo()%>"><%=list.get(i).getMemberName()%></a></td>
						<td><%=list.get(i).getMemberAge()%></td>
						<td><a href="./member/InsertMemberAddrForm.jsp?no=<%=list.get(i).getMemberNo()%>">주소 입력</a></td>
						<td><a href="./member/InsertMemberScoreForm.jsp?no=<%=list.get(i).getMemberNo()%>">점수 입력</a></td>
						<td><a href="./member/MemberScoreList.jsp?no=<%=list.get(i).getMemberNo()%>">점수 보기</a></td>
						<td><a href="./member/UpdateMemberForm.jsp?no=<%=list.get(i).getMemberNo()%>">수정</a></td>
						<td><a href="./member/DeleteMemberAction.jsp?no=<%=list.get(i).getMemberNo()%>">삭제</a></td>
					</tr>
		<%
				}
			} else if (searchList.size() > 0) {
				for (int p=0; p<searchList.size(); p++) {
		%>
					<tr>
						<td><%=searchList.get(p).getMemberNo()%></td>
						<td><a href="./member/MemberAddrList.jsp?no=<%=searchList.get(p).getMemberNo()%>"><%=searchList.get(p).getMemberName()%></a></td>
						<td><%=searchList.get(p).getMemberAge()%></td>
						<td><a href="./member/InsertMemberAddrForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">주소 입력</a></td>
						<td><a href="./member/InsertMemberScoreForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">점수 입력</a></td>
						<td><a href="./member/MemberScoreList.jsp?no=<%=searchList.get(p).getMemberNo()%>">점수 보기</a></td>
						<td><a href="./member/UpdateMemberForm.jsp?no=<%=searchList.get(p).getMemberNo()%>">수정</a></td>
						<td><a href="./member/DeleteMemberAction.jsp?no=<%=searchList.get(p).getMemberNo()%>">삭제</a></td>
					</tr>
		<%
				}
			}
		%>
		</table>
		<br>
		<div>
			<a href="./member/InsertMemberForm.jsp">Member 정보 입력</a>
		</div>
		<br><br>
		<span><%=currentPage%> / <%=lastPage %></span><br><br>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
				<a href="./member/MemberList.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
		
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
				<a href="./member/MemberList.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			}
		%>
		<br>
		<div>
		<a href = "./index.jsp">메인화면</a>
		</div>
		
	</body>
</html>