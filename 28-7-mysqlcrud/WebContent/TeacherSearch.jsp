<!-- 2018.07.09 김준영-->
<!-- TeacherSearch -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>

<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert title here</title>
	</head>
	<body>
		<form method="post" action="<%=request.getContextPath()%>./TeacherSearchList.jsp">
			<div>
				<select name="searchSelect">
					<option>번호</option>
					<option value="teacher_name">이름</option>
					<option value="teacher_age">나이</option>
				</select>
				<input type="text" name="searchWord">
				<button type="submit">검색</button>
			</div>
		</form>
	</body>
</html>