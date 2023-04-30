<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header2.jsp" %>

<%
//int uid = Integer.parseInt(request.getParameter("uid"));

String code = request.getParameter("code");

String uid = request.getParameter("uid");

String sql_ref = "update "+code+" set ref=ref+1 where uid="+uid+"";

Connection con_ref = DriverManager.getConnection(url, user, password);
Statement stmt_ref = con_ref.createStatement();
stmt_ref.executeUpdate(sql_ref);
//out.print(sql_ref);

stmt_ref.close();
con_ref.close();


String sql = "select * from "+code+" where uid="+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt =  con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String id = "";
if(rs.next()){
	
	String gongji = rs.getString("gongji");
	id = rs.getString("id");
	String file1 = rs.getString("file");
	String comment = rs.getString("comment");
	
	//tb_comment 개행처리

		pageContext.setAttribute("cmt2", comment);

		pageContext.setAttribute("LF", "\n");
	
	if(gongji.equals("3")){
		if(session_level != null && session_level.equals("10")){
						
		}else if(session_id != null && session_id.equals(id)){
			
			
		}else{
	%>
		<script>
			alert("제대로 된 경로가 아닙니다. 첫페이지로 이동합니다.");
			location.href = "/";
		</script>
		
	<%
			
		}
	}else{
	}


	%>
	
<table width=1100 align="center" border=0>
	<tr>
		<td align="right">
			글쓴이 : <%=rs.getString("name") %>
			조회수 : <%=rs.getInt("ref") %>
		</td>
	</tr>
</table>
<table width=1100 border=1>	
	<tr>
		<td>제목 : 
			<%=rs.getString("subject") %>
		</td>
	</tr>
	<tr>
		<td>
		<%if (!file1.equals("")){ %>
			<img src = "/upload/<%=file1 %>"><br>
		<%} %>
		${fn:replace(cmt2, LF, '<br>')}
		</td>
	</tr>
	<tr>
		<td>
			첨부파일 : <a href = "upload/<%=file1 %>" download><%=file1 %></a>
		</td>
	</tr>					
</table>
<%}
rs.close();
stmt.close();
con.close();
%>
<table>
	<tr>
		<td height=15></td>
	</tr>
</table>
<%if(session_name != null && session_name != ""){ %>
<form action = "comment_insert.jsp" method = "post">
<input type="hidden" name = "tb_table" value = "<%=code %>">
<input type = "hidden" name = "tb_uid" value = "<%=uid %>">
<table width = 1100 align="center" border=0>
	<tr>
		<td colspan=3 align="left">댓글</td>
	</tr>
	<tr>
		<td width=300><%=session_name %></td>
		<td width=700><input name = "tb_comment" style="width:98%;height:20px"></td>
		<td align=right width=100 ><button style="width:50px;height:30px">작성</button></td>
		
	</tr>
</table>
</form>
<%} %>
<% 
String sql_comment = "select * from comment where tb_table = '"+code+"' and tb_uid = "+uid+" order by uid desc";

Connection con_comment = DriverManager.getConnection(url, user, password);
Statement stmt_comment = con_comment.createStatement();
ResultSet rs_comment = stmt_comment.executeQuery(sql_comment);

%>
<table>
	<tr>
		<td height=15></td>
	</tr>
</table>

<table width= 1100 align="center" border=0>
	
	<%
		Date today = new Date();

		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String signdate = sd.format(today);
	
		while(rs_comment.next()){ 
			
		int c_uid = rs_comment.getInt("uid");
	%>
	<tr>
		<td width=300><%=rs_comment.getString("tb_name")%> | &nbsp;<%=signdate %></td>
		<td width=700><%=rs_comment.getString("tb_comment") %></td>
		<td width=100 align=right><a href = "comment_del.jsp?code=<%=code %>&uid=<%=uid%>&c_uid=<%=c_uid%>"><img src ="img/comment_del.gif" width=50%></a></td>
		
	</tr>
	<%
	
	}
	rs_comment.close();
	stmt_comment.close();
	con_comment.close();
	%>
</table>
<br>

<table width = 1100 align="center" border=0>
	<tr>
		<td><a href = "list.jsp?code=<%=code%>">[목록]</a></td>
		<td align="right">
			<a href = "reply.jsp?code=<%=code%>&uid=<%=uid %>">[답변]</a>
			<%if(session_id !=null && session_id.equals(id)){ %>
			<a href = "modify.jsp?code=<%=code%>&uid=<%=uid %>">[수정]</a>
			<a href = "delete.jsp?code=<%=code%>&uid=<%=uid %>">[삭제]</a>
			<%}else if(session_level != null && session_level.equals("10")){ %>
			<a href = "modify.jsp?code=<%=code%>&uid=<%=uid %>">[수정]</a>
			<a href = "delete.jsp?code=<%=code%>&uid=<%=uid %>">[삭제]</a>
			<%}else{
			}	%>
			
			
		</td>
	</tr>
</table>
<%@ include file = "/admin/include/footer.jsp" %>
