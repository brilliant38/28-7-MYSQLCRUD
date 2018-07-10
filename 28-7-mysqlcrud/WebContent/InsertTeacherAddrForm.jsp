<!-- 2018-07-01 김준영 -->
<!-- TeacherAddr insert Form -->


<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
		<title>insertTeacherForm</title>
		<style>
			* {
				margin:0;  /* 여백을 0으로 합니다. */
				padding:0;
			}
			
			ul {
				list-style-type:none; /* ul태그의 목록을 쓰지 않습니다. */
			}
			
			h3 { /* h3태그의 여백을 설정합니다. */
				margin:20px 0 0 50px;
			}
			
			#mem_form { /* id : mem_form 에 크기 여백 글자체 글자크기 글자색 등을 설정합니다.  */
				width:500px;
				margin:10px 0 0 50px;
				font-family:"돋움";
				font-size:12px;
				color:#444444;
				padding-top:5px;
				padding-bottom:10px;
				border-top:solid 1px #cccccc;
				border-bottom:solid 1px #cccccc;
			}
			
			.cols li { /* cols 클래스에 li태그의 라인블록 표시 윗여백을 줍니다.  */
				display:inline-block;
				margin-top:5px;
			}
			
			.cols li.col1 { /* cols 클래스에 li.col1 태그의 크기를 100px 글자정렬을 오른쪽으로합니다.  */
				width:100px;
				text-align:right;
			}
			
			.cols li.col2 { /* cols 클래스에 li.col2 태그의 크기를 350px로 합니다. */
				width:350px;
			}
			
			.cols li.col2 input.hp { /* cols 클래스에 li.col2중 input 클래스 hp의 크기를 35px로 합니다. */
				width:35px;
			}
			
			#intro {
				vertical-align:top; 
			}
			
		</style>
	</head>
	<body>
		<h3>주소 등록</h3>
			<form action="<%= request.getContextPath()%>/InsertTeacherAddrAction.jsp?no=<%=request.getParameter("no")%>" method="post">
				<ul id="mem_form">
					<li>
						<ul class="cols">
							<li class="col1">주소 :</li>
							<li class="col2"><input type="text" name="teacherAddressContent"></li>
						</ul>
					</li>
					<li>
						<ul class="cols">
							<li class="col1"></li>
							<li class="col2">
								<input type="submit" value="등록">	
							</li>
						</ul>
					</li>
				</ul>
			</form>
	</body>
</html>