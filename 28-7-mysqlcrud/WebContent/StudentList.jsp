<!-- 28기 구해성 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"pageEncoding="EUC-KR"%>
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
학생 리스트 <br>

<table width="100%" border="1">
<tr>
	<th>번호(no)</th>
	<th>이름(name)</th>
	<th>나이(age)</th>
	<th>주소입력</th>
	<th>삭제</th>
	<th>수정</th>
	<th>점수입력</th>
	<th>점수보기</th>
</tr>

<%	
	int currentPage = 1;
	if(request.getParameter("currentPage") !=null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	}
	
	int pagePerRow = 5;
	
	Student student = new Student();
	
	StudentDao studentdao = new StudentDao();
	ArrayList<Student> list = studentdao.selectStudent(currentPage, pagePerRow);
	
	for(int i=0; i<list.size(); i++) {
		student = list.get(i);
%>
	<tr>
		<td><%=student.getStudent_no() %></td>
		<td><a href="./StudentList.jsp?no=<%=student.getStudent_no() %>"><%=student.getStudent_name() %></a></td>
		<td><%=student.getStudent_age()%></td>
		<td><a href="./InsertStudentAddrForm.jsp">주소입력</a></td>
		<td><a href="./DeleteStudentAction.jsp?no=<%=student.getStudent_no()%>">삭제</a></td>
		<td><a href="./UpdateStudentForm.jsp?no=<%=student.getStudent_no()%>">수정</a></td>
		</tr>
		<%
		}
		%>	
		</table>
		<form>
			<div>
				이름 :
				<input type="text" name="searchWord">
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./StudentList.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (student.get()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((student.getRownumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
	</body>
</html>