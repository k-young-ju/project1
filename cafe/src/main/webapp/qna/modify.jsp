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
String gongji = "";
String subject = "";
String comment = "";
String file1 = "";

if(rs.next()){
	id = rs.getString("id");
	gongji = rs.getString("gongji");
	subject = rs.getString("subject");
	comment = rs.getString("comment");
	file1 = rs.getString("file");
	
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

<form action="update.jsp" method="post" onsubmit="return update_go()" enctype="multipart/form-data">
<input type="hidden" name="code" value="<%=code%>">
<input type="hidden" name ="uid" value=<%=uid %>>
<table width=1100 align=center border=1>
	<tr>
		<td>옵션</td>
		<td>
		<%if(session_level != null && session_level.equals("10")){ %>
			<%if(gongji.equals("1")){ %>
			<input type ="radio" id = "gongji" name = "gongji" value="1" checked>공지
			<input type ="radio" id = "gongji" name = "gongji" value="2" >일반
			<input type ="radio" id = "gongji" name = "gongji" value="3">비밀
			<%}else if(gongji.equals("3")){ %>	
			<input type ="radio" id = "gongji" name = "gongji" value="1" >공지
			<input type ="radio" id = "gongji" name = "gongji" value="2" >일반
			<input type ="radio" id = "gongji" name = "gongji" value="3" checked>비밀
			<%}else{ %>
			<input type ="radio" id = "gongji" name = "gongji" value="1" >공지
			<input type ="radio" id = "gongji" name = "gongji" value="2" checked>일반
			<input type ="radio" id = "gongji" name = "gongji" value="3" >비밀
		<%}
		}else{%>
			<%if(gongji.equals("3")){ %>
				
				<input type ="radio" id = "gongji" name = "gongji" value="2" >일반
				<input type ="radio" id = "gongji" name = "gongji" value="3" checked>비밀
				<%}else{ %>	
				
				<input type ="radio" id = "gongji" name = "gongji" value="2" checked>일반
				<input type ="radio" id = "gongji" name = "gongji" value="3" >비밀
			<%} 
				
		} %>
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
			<textarea id="comment" name="comment" style="width:99%;height:120px"><%=comment%></textarea>
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
		<td align="right"><button style="width:100px;height:30px">글수정</button></td>
		
	</tr>				
</table>
</form>
<p></p>