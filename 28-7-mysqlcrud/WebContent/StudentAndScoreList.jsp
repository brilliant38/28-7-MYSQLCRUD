<%@page import="service.StudentAndScore"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import = "service.StudentScore" %>
<%@ page import = "service.StudentScoreDao" %>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<table width="100%" border="1">
<tr>
	<td>점수번호</td><td>학생번호</td><td>점수</td>
</tr>
<%
	StudentScoreDao dao = new StudentScoreDao();
	ArrayList<StudentAndScore> get_alm=dao.selectMemberListAboveAvg();
	for(int i=0;i<get_alm.size();i++){
		StudentScore s = get_alm.get(i);
	%>
	<tr>
		<td><%= s.getStudent_score_no() %></td>
		<td><%= s.getStudent_no() %></td>
		<td><%= s.getScore() %></td>
		<td>
	<a href="./UpdateStudentForm.jsp?send_id=<%=s.getStudent_no()%>">수정버튼</a>		
		</td>
		<td>
	<a href="./DeleteStudentForm.jsp?send_id=<%=s.getStudent_no()%>">수정버튼</a>		
		</td>
		</tr>
		<%
		}
		%>
		</table>
		