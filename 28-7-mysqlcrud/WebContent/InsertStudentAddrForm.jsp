<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h1>林家涝仿</h1>
	
	<form action="./InsertStudentAction.jsp" method="post">

		<tr>
		<td>切积锅龋</td>
		<td><input type="text" name ="no" size="18" value<%=request.getParameter("no") %>"readonly></td>
		</tr>
		<tr>
		<td>林家</td>
		<td><input type="text" name="address" size="17"></td>
		</tr>
		<tr>
		<td colspan="2"><input type="submit" value="林家涝仿"></td>
		</tr>
	</form>
</body>
</html>