<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<%@ page import = "service.StudentDao"%>
<%
	int no = Integer.parseInt(request.getParameter("no")) ;
	System.out.println(no + "<--no");
	StudentDao dao = new StudentDao();
	dao.StudentDelete(no);
	response.sendRedirect(request.getContextPath() + "/StudentList.jsp");
%>