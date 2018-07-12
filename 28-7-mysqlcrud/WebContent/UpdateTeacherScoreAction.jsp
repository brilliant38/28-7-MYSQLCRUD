<!-- *2018-07-12 김준영* -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Score Action</title>
	</head>
	<body>
		<%
			// 한글 입력받기 위함
			request.setCharacterEncoding("euc-kr");
			
			// TeacherScore 객체 생성
			TeacherScore teacherScore = new TeacherScore();
			
			// TeacherScoreDao 객체 생성
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			
			// updateTeacherScoreForm으로 부터 받은 값들을 각각의 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherName = request.getParameter("teacherName");
			int score = Integer.parseInt(request.getParameter("teacherScore"));
			
			// 값 테스트
			System.out.println("teacherNo, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherNo);
			System.out.println("teacherName, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherName);
			System.out.println("teacherScore, updateTeacherScoreForm.jsp => updateTeacherScoreAction.jsp" + teacherScore);
			
			// teacherScore 객체의 멤버변수에 각각의 값을 대입
			teacherScore.setTeacherNo(teacherNo);
			teacherScore.setScore(score);
			
			// updateTeacherScore 메서드를 호출하여 업데이트
			teacherScoreDao.updateTeacherScore(teacherScore);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/TeacherScoreList.jsp?teacherNo=" + teacherNo);
		%>
	</body>
</html>