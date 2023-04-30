<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp" %>

<%

int uid = Integer.parseInt(request.getParameter("uid"));

String code = request.getParameter("code");

String sql ="select * from "+code+" where uid="+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt =  con.createStatement();
ResultSet rs = stmt.executeQuery(sql);


String id = "";
String tb_video = "";
String subject = "";
String comment_health = "";
String file1 = "";

if(rs.next()){
	id = rs.getString("id");
	tb_video =rs.getString("tb_video");
	subject = rs.getString("subject");
	comment_health = rs.getString("comment_health");
	
	
}
rs.close();
stmt.close();
con.close();

%>

<script>
	function update_go(){
				
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
<table height=100 width=1100 border=0>
	<tr>
		<td></td>
	</tr>
</table>

<form action="update.jsp" method="get" onsubmit="return update_go()" enctype="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<input type="hidden" name ="uid" value=<%=uid %>>
<table width=1100 align=center border=1>
	
	<tr>
		<td>영상</td>
		<td>
			<input id ="tb_video" name="tb_video" value="<%=tb_video %>" style="width:500px"> 
		</td>
		
	</tr>
	<tr>
		<td>제목</td>
		<td>
			<input id= "subject" name = "subject" style="width:99%" value="<%=subject%>">
		</td>
	</tr>
	
	<tr>
		<td>내용</td>
		<td>
			<textarea id="comment" name="comment_health" style="width:99%;height:120px"><%=comment_health%></textarea>
		</td>
	</tr>
	
	
</table>
<p></p>
<table width=1100 >	
	<tr>
		<td align="left" ><input type="button" onclick = "list.jsp?code=<%=code%>" value="목록" style="width:100px;height:30px"></td>
		<td align="right"><button style="width:100px;height:30px">글수정</button></td>
		
	</tr>				
</table>
</form>
<p></p>
