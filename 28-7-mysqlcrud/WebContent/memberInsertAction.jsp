<!-- 2018-06-26 �̱��� -->
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.Member" %>
<%@ page import = "service.MemberDao" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>memberInsertAction</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("euc-kr"); //�޴� ���� ������ euc-kr�� ���ڵ�
			
			String name = request.getParameter("name");
			int age = Integer.parseInt(request.getParameter("age"));
			System.out.println(name + " : name check");
			System.out.println(age + " : age check");
			//���۵Ǵ� �� üũ
			
			Member member = new Member(); // Member ��ü ����
			member.setMember_name(name);
			member.setMember_age(age);
			
			MemberDao memberdao = new MemberDao(); //Memberdao ��ü ����
			int result = memberdao.insertMember(member);
			System.out.println("DB�� ȸ�� �Ѹ��� �߰��Ǿ����ϴ�.");
			
			response.sendRedirect("./memberInsert.jsp"); //memberInsert.jsp �������� �����̷�Ʈ
		%>
	</body>
</html>