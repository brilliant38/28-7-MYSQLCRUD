<!-- 28기 구해성 2018-07-13 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>studentList</title>
	</head>
	<body>
		
		<%	
			request.setCharacterEncoding("euc-kr");
			int currentPage = 1;
			if(request.getParameter("currentPage") !=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
			}
		
			int pagePerRow = 5;
		
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchWord + " : 01 searchWord check");
			
			if (request.getParameter("searchWord") == null) {
				searchWord = "";
			}
			
			Student student = new Student();
			StudentDao studentDao = new StudentDao();
			ArrayList<Student> list = studentDao.selectStudent(currentPage, pagePerRow);
			System.out.println( student + "<- student 확인");
			System.out.println( studentDao + "<- selectStudent확인");
			
			ArrayList<Student> searchList = studentDao.searchStudentList(currentPage, pagePerRow, searchWord);
			System.out.println(searchList + " : 03 searchList check");

			int RowNumber = list.get(0).getRowNumber();
			System.out.println( RowNumber + "<- RowNumber확인");
			
			int lastPage = ((RowNumber-1) / pagePerRow) +1; 
			
			if(searchList.size() > 0) {
				RowNumber = searchList.get(0).getRowNumber();
			}
		%>
		<h1>Student List</h1>
		<br>
		<form action="./StudentList.jsp" method="post">
			<div>
				이름 :
				<input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
			<br><br>
		<table  border="1">
			<tr>
				<th>학생번호</th>
				<th>학생 이름</th>
				<th>학생 나이</th>
				<th>주소 입력</th>
				<th>점수 입력</th>
				<th>점수 보기</th>
				<th>수정 </th>
				<th>삭제</th>
			</tr>
		<%
			if (searchList.size() == 0) {
				for(int i=0; i< list.size(); i++) {
				student =  list.get(i);
		%>
					
					<tr>
						<td><%=student.getStudent_no() %></td> 
						<td><a href="./StudentAddrList.jsp?no=<%=student.getStudent_no()%>"><%=student.getStudent_name()%></a></td>
						<td><%=student.getStudent_age()%></td>
						<td><a href="./InsertStudentAddrForm.jsp">주소추가</a></td>
						<td><a href="no=<%=student.getStudent_no()%>">점수 입력</a></td>
						<td><a href="./StudentAndScoreList.jsp?no=<%=student.getStudent_no()%>">점수 보기</a></td>
						<td><a href="./UpdateStudentForm.jsp?no=<%=student.getStudent_no() %>">수정</a></td>
						<td><a href="./DeleteStudentAction.jsp?no=<%=student.getStudent_no() %>">삭제</a></td>
					</tr>
		<%
				}
			} else if (searchList.size() > 0) {
				for (int p=0; p<searchList.size(); p++) {
		%>	
					<tr>
						<td><%=searchList.get(p).getStudent_no()%></td>
						<td><a href="./StudentAddrList.jsp?no=<%=searchList.get(p).getStudent_no()%>"><%=searchList.get(p).getStudent_name()%></a></td>
						<td><%=searchList.get(p).getStudent_age()%></td>
						<td><a href="./InsertStudentAddrForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">주소 입력</a></td>
						<td><a href="./InsertStudentScoreForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">점수 입력</a></td>
						<td><a href="./StudentScoreList.jsp?no=<%=searchList.get(p).getStudent_no()%>">점수 보기</a></td>
						<td><a href="./UpdateStudentForm.jsp?no=<%=searchList.get(p).getStudent_no()%>">수정</a></td>
						<td><a href="./DeleteStudentAction.jsp?no=<%=searchList.get(p).getStudent_no()%>">삭제</a></td>
					</tr>
		<%
				}
			}
		%>
			</table>
			<br>
		<div>
			<a href="./InsertStudentForm.jsp">Student 정보 입력</a>
		</div>
		<br><br>
		<span><%=currentPage%> / <%=lastPage %></span><br><br>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
				<a href="./StudentList.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
		
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
				<a href="./StudentList.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			}
		%>
		<br>
		<div>
		<a href = "./index.jsp">메인화면</a>
		</div>
		
	</body>
</html>