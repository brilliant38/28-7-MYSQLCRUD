<!-- 2018.07.09 김준영-->
<!-- Teacher AddrList Action -->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">

		<title>Teacher Address List</title>		
	</head>
	<body>
			<%
					// TeacherAddrDao 객체 생성
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					// teacherList.jsp로 부터 전달 받은 teacherNo 값을 변수에 대입
					int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
					
					// teacherNo 변수 안의 값을 테스트
					System.out.println("teacherNo, teacherList.jsp => teacherAddrList.jsp : " + teacherNo);
						
					// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
					ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacherNo);		
				%>
				<h1>Teacher Address</h1>
				<br><br><br>
				<table id="entityListTable" border="1" >
					<thead>
						<tr>
							<th style="width:70px">주소 번호</th>
							<th>교사 번호</th>
							<th>교사 주소</th>
							<th>수정</th>
							<th>삭제</th>
						</tr>
					</thead>
						<%
							System.out.println(arrayListTeacherAddr.size() + "<== size");
							for(int i = 0; i < arrayListTeacherAddr.size(); i++){
						%>
							<tr>
								<td><%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %></td>
							<td><%= arrayListTeacherAddr.get(i).getTeacherNo() %></td>
							<td><%= arrayListTeacherAddr.get(i).getTeacherAddrContent() %></td>
							<td><a class="buttonToUpdateEntity" href="<%= request.getContextPath() %>/UpdateTeacherAddrForm.jsp?teacherAddressNo=<%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %>">수정</a></td>
							<td><a class="buttonToDeleteEntity" href="<%= request.getContextPath() %>/DeleteTeacherAddrAction.jsp?teacherAddressNo=<%= arrayListTeacherAddr.get(i).getTeacherAddrNo() %>">삭제</a></td>
						</tr>
					<%
						}
					%>
				</table>
				<br>
				
					<a id="buttonToList" href="<%= request.getContextPath() %>/TeacherList.jsp">목록으로</a>
		
	</body>
</html>