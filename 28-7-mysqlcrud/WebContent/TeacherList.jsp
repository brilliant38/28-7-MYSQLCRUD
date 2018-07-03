<!-- 2018-07-03 김준영 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.TeacherDao"%>
<%@ page import = "service.Teacher" %>
<%@ page import = "java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberList</title>
		<style>
			table {
				width: 200px;
				border: 1px solid #444444;
				border-collapse: collapse;
			}
			th, td {
				border: 1px solid #444444;
			}
		</style>
	</head>
	<body>
		<table>
			<tr>
				<th>no</th>
				<th>name</th>
				<th>age</th>
				<th>삭제</th>
				<th>수정</th>
			</tr>
		<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
 
			int pagePerRow = 5;
			
			Teacher teacher = new Teacher();
			
			
			TeacherDao teacherDao = new TeacherDao();
			ArrayList<Teacher> list = teacherDao.selectteacherByPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			teacher = list.get(1);
			
			for(int i=0; i<list.size(); i++) {
				teacher = list.get(i);
		%>
				<tr>
					<td><%=teacher.getTeacherNo()%></td>
					<td><a href="./TeacherAddrList.jsp?=<%=no%>"><%=teacher.getTeacherName()%></a></td>
					<td><%=teacher.getTeacherAge()%></td>
					<td><a href="<%= request.getContextPath() %>./DeleteTeacherAction.jsp?send_id=<%=teacher.getTeacherName() %>">삭제버튼</a>		
					<td><a href="<%= request.getContextPath() %>./UpdateTeacherAction.jsp?send_id=<%=teacher.getTeacherName() %>">수정버튼</a>	
					<!-- ./UpdateTeacherForm.jsp -> UpdateTeacherAction으로 전송-->
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
			<a href="./TeacherList.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (teacher.getRowNumber()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((teacher.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./TeacherList.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		
	</body>
</html>