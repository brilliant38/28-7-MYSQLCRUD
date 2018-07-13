<!-- 2018.07.10 김준영-->


<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		
		<title>Teacher List</title>
	</head>
	<body>
		
				<%
					// 한글을 입력받기 위함
					request.setCharacterEncoding("euc-kr");
					
					// 검색어를 전달받는 과정
					String searchValue = "";
					if(request.getParameter("searchValue") != null){
						searchValue = request.getParameter("searchValue");
					}
					
					System.out.println(searchValue);
					
					// 페이징 알고리즘
					int rowPerPage = 5;
					int currentPage = 1;
					if(request.getParameter("currentPage") != null){
						currentPage = Integer.parseInt(request.getParameter("currentPage"));
					}
				
					// TeacherDao 객체 생성
					TeacherDao teacherDao = new TeacherDao();
					
					// teacherAddrDao 객체 생성
					TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
					
					
					// teacherScoreDao 객체 생성
					TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
					
					
					
					// selectTeacherByPage 메서드를 통해 리턴되는 참조 값(arrayListTeacher객체의 참조값)을 대입
					ArrayList<Teacher> arrayListTeacher = teacherDao.selectTeacherByPage(currentPage, rowPerPage, searchValue);
					
					// 마지막 페이지
					int lastPage = teacherDao.countTotalRecordsBySearchValue(searchValue) / rowPerPage;
					if ((teacherDao.countTotalRecordsBySearchValue(searchValue) % rowPerPage) != 0){
						lastPage++;
					}
				%>
				<h1>Teacher List</h1><br>
				<div id="buttonForSearch">
					<form action="<%= request.getContextPath() %>./teacher/TeacherList.jsp" method="post">
						<label>이름 :  
							<input type="text" name="searchValue">
						</label>
						<button>검색</button>
					</form>
				</div>
				<br><br>
				<table id="entityListTable" border="1">
					<thead>
						<tr>
							<th style="width:70px">교사 번호</th>
							<th>교사 이름</th>
							<th>교사 나이</th>
							<th>주소 입력</th>							
							<th>점수 입력</th>
							<th>점수 보기</th>
							<th>수 정</th>
							<th>삭 제</th>
						</tr>
					</thead>
					<% 
						// size() 메서드는 마지막 인덱스 까지의 요소 갯수를 리턴해준다.
						// ex) arrayListTeacher[17] 까지 데이터를 저장 했을 경우 18을 리턴
						for(int i = 0; i < arrayListTeacher.size(); i++){
							// get메서드를 통해 각각의 요소에 저장된 Teacher 객체를 불러온다.
							Teacher teacher = arrayListTeacher.get(i);
							
							// selectTeacherAddress 메서드를 호출하고 리턴받은 TeacherAddr객체의 참조 값을 teacherAddr 객체 참조변수에 대입 
							ArrayList<TeacherAddr> arrayListTeacherAddr = teacherAddrDao.selectTeacherAddress(teacher.getTeacherNo());
					%>
							<tr>
								<td><%= teacher.getTeacherNo() %></td>
								<%
									// 해당 교사의 주소 정보가 존재한다면
									if(arrayListTeacherAddr.size() != 0){
								%>
										<td><a title="주소 보기" class="buttonToShowAddress" href="<%= request.getContextPath() %>./teacher/TeacherAddrList.jsp?teacherNo=<%= teacher.getTeacherNo() %>"><%= teacher.getTeacherName() %></a></td>
								<%	
									// 그 외
									} else {
								%>
										<td><%= teacher.getTeacherName() %></td>
								<%
									}
								%>
								<td><%= teacher.getTeacherAge() %></td>
								<td><a title="주소 추가" class="buttonToInsertAddress" href="<%= request.getContextPath() %>./teacher/InsertTeacherAddrForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">주소 추가</a></td>
								<%
									// 해당하는 교사의 점수가 존재하지 않는다면 점수 입력 버튼을 보여줌
									TeacherAndScore teacherAndTeacherScore = teacherScoreDao.selectTeacherAndTeacherScore(teacher.getTeacherNo());
									if(teacherAndTeacherScore == null){
								%>
										<td><a title="점수 입력" class="buttonToInsertScore" href="<%= request.getContextPath() %>./teacher/InsertTeacherScoreForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>"> 점수입력</a></td>
										<td></td>
								<%
							
									} else {
								%>
										<td></td>
										<td><a title="점수 확인" class="buttonToShowScore" href="<%= request.getContextPath() %>./teacher/TeacherScoreList.jsp?teacherNo=<%= teacher.getTeacherNo() %>">점수보기</a></td>
								<%
									}
								%>
								<td><a title="교사 정보 수정" class="buttonToUpdateEntity" href="<%= request.getContextPath() %>./teacher/UpdateTeacherForm.jsp?teacherNo=<%= teacher.getTeacherNo() %>">수정</a></td>
								<td><a title="교사 정보 삭제" class="buttonToDeleteEntity" href="<%= request.getContextPath() %>./teacher/DeleteTeacherAction.jsp?teacherNo=<%= teacher.getTeacherNo() %>">삭제</a></td>
							</tr>
					<% 
						}
					%>
				</table>
				<br>
				<div id="addEntity">
					<a id="buttonToAddEntity" href="<%= request.getContextPath() %>./teacher/InsertTeacherForm.jsp">TeaCher 정보 입력</a>
				</div>
				<br><br>
				<div id="page">
					<span><%= currentPage %> / <%= lastPage %></span>
				</div>
				<br>
				<div id="buttonForAnotherPage">
					<%
						if(currentPage > 1){
					%>
							<a id="buttonToPrevPage" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp?currentPage=<%= currentPage - 1 %>&searchValue=<%= searchValue %>">&lt; 이전</a>
					<%
						} else {
					%>
						
					<%
						}
						if(currentPage < lastPage){
					%>
							<a id="buttonToNextPage" href="<%= request.getContextPath() %>./teacher/TeacherList.jsp?currentPage=<%= currentPage + 1 %>&searchValue=<%= searchValue %>">다음 &gt;</a>
					<%
						} else {
					%>
							
					<%
						}
					%>
				
				</div>
				<a href="./index.jsp">메인화면으로</a>
	
	</body>
</html>