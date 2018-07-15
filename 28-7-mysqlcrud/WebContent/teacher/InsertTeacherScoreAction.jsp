<!-- 2018.07.10 김준영-->

<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Insert Teacher Score Action</title>
	</head>
	<body>
		<%
			// 인코딩 방식 설정
			request.setCharacterEncoding("euc-kr");
		
			//TeacherScore, TeacherScoreDao 객체 생성 
			TeacherScore teacherScore = new TeacherScore();
			TeacherScoreDao teacherScoreDao = new TeacherScoreDao();
			
			// insertTeacherScoreForm.jsp로 부터 받아온 teacherNo, score 값을 각각의 변수에 대입
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			int score = Integer.parseInt(request.getParameter("score"));
			
			// teacherNo 변수 안의 값을 테스트
			System.out.println("teacherNo, insertTeacherAddrForm.jsp = > insertTeacherAddrAction.jsp : " + teacherNo);
			System.out.println("score, insertTeacherScoreForm.jsp = > insertTeacherScoreAction.jsp : " + score);
			
			// TeacherScore 객체 내부의 멤버 변수에 각각의 값을 셋팅
			teacherScore.setTeacherNo(teacherNo);
			teacherScore.setScore(score);
			
			// insertTeacherScore 메서드를 통해 레코드 삽입
			teacherScoreDao.insertTeacherScore(teacherScore);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "./teacher/TeacherList.jsp");
		%>
	</body>
</html>