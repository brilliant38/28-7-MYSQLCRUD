<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ page import = "service.TeacherDao" %>
<%@ page import = "service.Teacher" %>
<%@ page import = "java.util.ArrayList" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("EUC-KR");
			String searchSelect = request.getParameter("searchSelect");
			String searchWord = request.getParameter("searchWord");
			System.out.println(searchSelect);
			System.out.println(searchWord);
			
			TeacherDao teacherDao = new TeacherDao();
			ArrayList<Teacher> arrayListTeacher = new ArrayList<Teacher>();
			arrayListTeacher = teacherDao.searchTeacher(searchSelect, searchWord);
		%>
			<h2>교사 목록</h2>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>나이</th>
					<th>주소입력</th>
					<th>삭제</th>
					<th>수정</th>
				</tr>
		<%	
			for(int i=0;i<arrayListTeacher.size(); i++){
				Teacher teacher = arrayListTeacher.get(i);
		%>
				<tr>
					<td><%=teacher.getTeacherNo()%></td> <!-- teacher 객체에서  getTeacherNo()메서드를 호출하여 데이터를 가져옵니다. -->
					<td><a href ="<%= request.getContextPath() %>/TeacherAddrList.jsp?no=<%=teacher.getTeacherNo()%>"><%=teacher.getTeacherName()%></a></td> <!-- teacher 객체에서  getTeacherName()메서드를 호출하여 데이터를 가져옵니다. -->
					<td><%=teacher.getTeacherAge()%></td> <!-- teacher 객체에서  getTeacherAge()메서드를 호출하여 데이터를 가져옵니다. -->
					<td><a href ="<%= request.getContextPath() %>//InsertTeacherAddrForm.jsp?no=<%=teacher.getTeacherNo()%>">주소입력</a></td>
					<td><a href ="<%= request.getContextPath() %>/DeleteTeacherAction.jsp?no=<%=teacher.getTeacherNo()%>">삭제</a></td>
					<td><a href ="<%= request.getContextPath() %>/UpdateTeacherForm.jsp?no=<%=teacher.getTeacherNo()%>">수정</a></td>
					<!-- updateTeacherForm.jsp -> updateTeacherAction.jsp -->
				</tr>
		<%
			}
		%>
			</table>
	</body>
</html>