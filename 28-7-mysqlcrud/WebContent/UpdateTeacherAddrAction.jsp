<!-- *2018-07-03 김준영* -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="service.*" %>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>Update Teacher Address Action</title>
	</head>
	<body>
		<%
			// 한글
			request.setCharacterEncoding("euc-kr");
		
			// updateTeacherAddrForm.jsp로부터 넘겨받은 값을 각각의 변수에 대입
			int teacherAddressNo = Integer.parseInt(request.getParameter("teacherAddressNo"));
			int teacherNo = Integer.parseInt(request.getParameter("teacherNo"));
			String teacherAddressContent = request.getParameter("teacherAddressContent");
			
			// 값 테스트
			System.out.println("teacherAddressNo from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherAddressNo );
			System.out.println("teacherNo from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherNo );
			System.out.println("teacherAddressContent from updateTeacherAddrForm, updateTeacherAddrAction.jsp : " + teacherAddressContent );
			
			TeacherAddrDao teacherAddrDao = new TeacherAddrDao();
			TeacherAddr teacherAddr = new TeacherAddr();
			
			// 넘겨받은 값을 VO에 대입
			teacherAddr.setTeacherAddrNo(teacherAddressNo);
			teacherAddr.setTeacherNo(teacherNo);
			teacherAddr.setTeacherAddrContent(teacherAddressContent);
			
			// updateTeacherAddress 메서드를 호출하여 업데이트 
			teacherAddrDao.updateTeacherAddress(teacherAddr);
			
			// 페이지 이동
			response.sendRedirect(request.getContextPath() + "/TeacherAddrList.jsp?teacherNo=" + teacherNo);
		%>
	</body>
</html>