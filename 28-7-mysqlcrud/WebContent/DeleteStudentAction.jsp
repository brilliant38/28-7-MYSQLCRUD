<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "service.StudentDao"%>
<%
String send_id = request.getParameter("send_id");
System.out.println(send_id + "<--send_id");
StudentDao dao = new StudentDao();
dao.StudentDelete(send_id);
response.sendRedirect(request.getContextPath() + "/StudentList.jsp");
%>