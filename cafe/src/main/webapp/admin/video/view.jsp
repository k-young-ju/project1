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


stmt_ref.close();
con_ref.close();


String sql = "select * from "+code+" where uid="+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt =  con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String id = "";
if(rs.next()){
	
	id = rs.getString("id");
	String comment_health = rs.getString("comment_health");
	String tb_video = rs.getString("tb_video");
	String subject = rs.getString("subject");
	
	//tb_comment 개행처리

		pageContext.setAttribute("cmt2", comment_health);

		pageContext.setAttribute("LF", "\n");
	
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
		<th>영상</th>
		<td><iframe width="560" height="315" src="https://www.youtube.com/embed/<%=tb_video %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></td>
	</tr>
	<tr>	
		<th>운동명</th>
		<td>
			<input id="subject" name="subject" style="width:99%" value = <%=subject %>>
		</td>
	</tr>
	<tr>
		<th>운동설명</th>
		<td><textarea id = "comment_health" name = "comment_health" style="width:99%;height:120px"><%=comment_health %></textarea></td>
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
		<td width=300><%=rs_comment.getString("tb_name") %> | &nbsp;<%=signdate %></td>
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
			<a href = "modify.jsp?code=<%=code%>&uid=<%=uid %>">[수정]</a>
			<a href = "delete.jsp?code=<%=code%>&uid=<%=uid %>">[삭제]</a>
		</td>
	</tr>
</table>

