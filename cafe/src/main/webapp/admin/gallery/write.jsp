<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header2.jsp" %>
<%
 String code = request.getParameter("code");
%>

<style>
	
</style>

<script>
	function write_go(){
				
		if(!subject.value){
			alert("제목을 입력하세요")
			subject.focus();
			return false;
		}
		if(!comment.value){
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

<form action="insert.jsp" method="post" onsubmit="return write_go()" enctype="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<table width=1100 align=center border=1>
	<tr>
		<td>옵션</td>
		<td>
		<%if(session_level != null && session_level.equals("10")){ %>
			<input type ="radio" id = "gongji" name = "gongji" value="1" checked>공지
			<input type ="radio" id = "gongji" name = "gongji" value="2">일반
			<input type ="radio" id = "gongji" name = "gongji" value="3">비밀
		<%}else{ %>	
			<input type ="radio" id = "gongji" name = "gongji" value="2" checked>일반
			<input type ="radio" id = "gongji" name = "gongji" value="3">비밀
		<%} %>	
		</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input id= "subject" name = "subject" style="width:99%" maxlength="30">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea id="comment" name="comment" style="width:99%;height:120px"></textarea>
		</td>
	</tr>
	<tr>	
		<td>첨부</td>
		<td>
			<input type="file" id="file1" name="file1" style="width:99%">
		</td>
	</tr>
</table>
<p></p>
<table width=1100 >	
	<tr>
		<td align="left" ><b><a href = "list.jsp?code="<%=code %>">[목록]</a></b></td>
		<td align="right"><button style="width:100px;height:30px">글쓰기</button></td>
	</tr>				
</table>
</form>
<p></p>
	
<%@ include file = "/admin/include/footer.jsp" %>