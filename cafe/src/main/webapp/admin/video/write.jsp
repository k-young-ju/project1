<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header2.jsp" %>
<%
 String code = request.getParameter("code");
%>



<script>
	function write_go(){
				
		if(!subject.value){
			alert("제목을 입력하세요")
			subject.focus();
			return false;
		}
		if(!comment_health.value){
			alert("내용을 입력하세요")
			comment.focus();
			return false;
		}
	  document.submit();		
	}
</script>
<table height=100>
	<tr>
		<td></td>
	</tr>
</table>

<form action="insert.jsp" method="get" onsubmit="return write_go()" enctype="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<table width=1100 align=center border=1>
	
	<tr>
		<th>영상 주소를 입력해주세요<br><b style="color: red">유투브 영상만 가능하며 https://www.youtube.com부터 전부 입력하셔야 합니다.</b></th>
	</tr>
	<tr>
		<td>
			<input id="tb_video" name="tb_video" style="width:99%;height:120px">
		</td>
	</tr>
	<tr>	
		<th>운동명</th>
	</tr>
	<tr>	
		<td>
			<input id="subject" name="subject" style="width:99%;height:120px">
		</td>
	</tr>
	<tr>
		<th>운동설명</th>
	</tr>
	<tr>	
		<td><textarea id = "comment_health" name = "comment_health" style="width:99%;height:120px"></textarea></td>
	</tr>
</table>
<p></p>
<table width=1100 >	
	<tr>
		<td align="left" ><input type="button" onclick = "list.jsp?code="<%=code %>" value="목록" style="width:100px;height:30px"></a></b></td>
		<td align="right"><button style="width:100px;height:30px">글쓰기</button></td>
	</tr>				
</table>
</form>
<p></p>
	
