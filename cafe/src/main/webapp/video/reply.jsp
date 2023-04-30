<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp" %>
<%
 String code = request.getParameter("code");
 String uid = request.getParameter("uid");
 
 
 
String sql = "select * from "+code+" where uid = "+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>

<style>
	body{
	background-color: white;
	}
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
<%	
	
	String subject = "";
	String comment_health =  "";
	String file1 = "";
	int fid = 0;
	String thread = "";	

   if(rs.next()){
	
	subject = rs.getString("subject");
	comment_health =  rs.getString("comment_health");
	file1 = rs.getString("file");
	fid = rs.getInt("fid");
	thread = rs.getString("thread");
	
	
%>

<form action="reply_insert.jsp" method="post" onsubmit="return write_go()" enctype="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<input type="hidden" name="uid" value="<%=code%>">
<input type="hidden" name ="fid" value="<%=fid %>">
<input type="hidden" name ="thread" value="<%=thread %>">
<table width=1100 align=center border=1>
	
	<tr>
		<td>제목</td>
		<td>
			<input id= "subject" name = "subject" style="width:99%" value="RE:<%=subject%>">
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td>
			<textarea id="comment" name="comment" style="width:99%;height:120px;">RE :<%=comment_health %> 
			</textarea>
			
			
		</td>
	</tr>
	<tr>	
		<td>첨부</td>
		<%if(file1.equals("")){ %>
		<td>
			<input type="file" id="file1" name="file1" style="width:99%" >
			
		</td>
		<%}else{ %>
		<td>
			<input type="file" id="file1" name="file1" style="width:99%" >
			<img src = "/upload/<%=file1%>">
		</td>
		<%} %>
	</tr>
</table>
<p></p>
<table width=1100 >	
	<tr>
		<td align="left" ><b><a href = "list.jsp">[목록]</a></b></td>
		<td align="right"><button style="width:100px;height:30px">답변쓰기</button></td>
	</tr>				
</table>
</form>
<p></p>
<%}
rs.close();
stmt.close();
con.close();
%>	
