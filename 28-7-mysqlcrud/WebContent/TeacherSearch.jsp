<!-- 2018.07.09 ���ؿ�-->
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
					<option>��ȣ</option>
					<option value="teacher_name">�̸�</option>
					<option value="teacher_age">����</option>
				</select>
				<input type="text" name="searchWord">
				<button type="submit">�˻�</button>
			</div>
		</form>
	</body>
</html>