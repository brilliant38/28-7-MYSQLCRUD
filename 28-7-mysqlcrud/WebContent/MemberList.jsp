<!-- 2018-07-02 이광재 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.MemberDao"%>
<%@ page import = "service.Member" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
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
		<table id="customers">
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>주소입력</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
 
			int pagePerRow = 5;
			
			Member member = new Member();
			
			MemberDao memberDao = new MemberDao();
			ArrayList<Member> list = memberDao.selectMemberByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			member = list.get(0);
			
			for(int i=0; i<list.size(); i++) {
				member = list.get(i);
		%>
				<tr>
					<td><%=member.getMemberNo()%></td>
					<td><a href="./MemberAddrList.jsp?no=<%=member.getMemberNo()%>"><%=member.getMemberName()%></a></td>
					<td><%=member.getMemberAge()%></td>
					<td><a href="./InsertMemberAddrForm.jsp">주소입력</a></td>
					<td><a href="./DeleteMemberAction.jsp?no=<%=member.getMemberNo()%>">삭제</a></td>
					<td><a href="./UpdateMemberForm.jsp?no=<%=member.getMemberNo()%>">수정</a></td>
					<!-- ./updateMemberForm.jsp -> updateMemberAction으로 전송-->
				</tr>
		<%
			}
		%>
		</table>
		<form action="./MemberAndScore.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="searchWord">
				<button type="submit">회원검색</button>
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./MemberList.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (member.getRowNumber()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((member.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./MemberList.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		<br><br>
		<a href = "./index.jsp">메인화면으로..</a>
	</body>
</html>