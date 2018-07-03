<!-- 28기 구해성 -->
<%@page import="java.util.ArrayList"%>
<%@page import="org.eclipse.jdt.internal.compiler.flow.FinallyFlowContext"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>

<%@ page import = "service.StudentDao" %>
<%@ page import = "service.Student" %>
학생 리스트 <br>
<table width="100%" border="1">
<tr>
	<th>번호(no)</th><th>이름(name)</th><th>나이(age)</th><th>주소입력</th><th>삭제</th><th>수정</th>
</tr>

<%
	        
			int currentPage = 1;
			if(request.getParameter("currentPage") != null) { //다음을 클릭 했을때 참조값을 넘기지 않으면 null로 처리한다.
				currentPage = Integer.parseInt(request.getParameter("currentPage")); // String 타입으로 넘어온 "currentPage" 변수의 타입을 int로 변환하여 저장한다.
			}    
 
			int pagePerRow = 5;
			
			Student member = new Student();
			
			
			StudentDao memberDao = new StudentDao();
			ArrayList<Student> list = memberDao.SelectStudentPage(currentPage, pagePerRow);
			System.out.println(list + " : 01 list check");
			
			member = list.get(1);
			
			for(int i=0; i<list.size(); i++) {
				member = list.get(i);
		%>
		<tr>
					<td><%=Student.getStudent_no()%></td>
					<td><a href="./MemberAddrList.jsp?no=<%=no%>"><%=Student.getStudentName()%></a></td>
					<td><%=Student.getStudentAge()%></td>
					<td><a href="./DeleteMemberAction.jsp?send_id=<%=student_no%>">삭제</a></td>
					<td><a href="./UpdateMemberForm.jsp?send_id=<%=student_no%>">수정</a></td>
					<!-- ./updateMemberForm.jsp -> updateMemberAction으로 전송-->
				</tr>ss
			
		<%
		
		}
		%>
	


	</table>
	
	<form>
			<div>
				이름 :
				<input type="text" name="searchWord">
			</div>
		</form>
		<%
			if(currentPage>1) { //currentPage 값이 1보다 클때만 실행
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage-1%>">이전</a> <!-- 이전 페이지 버튼 클릭시 "currentPage"변수로 currentPage-1의 값을 전송 --> 
		<%
			}
			int lastPage = (member.getRowNumber()-1) / pagePerRow; // rowNumber-1의 값과 페이지당 행의 수와의 몫이 마지막 페이지의 넘버.
			
			if ((member.getRowNumber()-1) % pagePerRow !=0) { // rowNumber-1의 값과 페이지당 행의 수와의 나머지가 1이 아닐때
				lastPage++;
			}
			if(currentPage<lastPage) { //현재 페이지 넘버가 마지막 페이지 넘버보다 작아졌을때만 실행.
		%>
			<a href="./Member_List.jsp?currentPage=<%=currentPage+1%>">다음</a> <!-- 다음 페이지 버튼 클릭시 "currentPage"변수로 currentPage+1의 값을 전송 -->
		<%
			} 
		%>
		
