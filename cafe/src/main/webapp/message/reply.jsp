<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/include/db.jsp" %>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

String uid = request.getParameter("uid");

String sql = "select * from message where uid="+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

String sql_view = "select count(*) from message where d_date='' and d_id='"+session_id+"'";

Connection con_view = DriverManager.getConnection(url, user, password);
Statement stmt_view = con_view.createStatement();
ResultSet rs_view = stmt_view.executeQuery(sql_view);

String sql_recieve_count = "select count(*) from message where d_id='"+session_id+"' and other_delete='1'";
Connection con_recieve_count = DriverManager.getConnection(url, user, password);
Statement stmt_recieve_count = con_recieve_count.createStatement();
ResultSet rs_recieve_count = stmt_recieve_count.executeQuery(sql_recieve_count);

String sql_send_count= "select count(*) from message where s_id='"+session_id+"' and my_delete='1'";

Connection con_send_count = DriverManager.getConnection(url, user, password);
Statement stmt_send_count = con_send_count.createStatement();
ResultSet rs_send_count = stmt_send_count.executeQuery(sql_send_count);

String send_count = "";
while(rs_send_count.next()){
	send_count = rs_send_count.getString("count(*)");
	
}
String recieve_count = "";
while(rs_recieve_count.next()){
	recieve_count = rs_recieve_count.getString("count(*)");
	
}

String nonview = "";
while(rs_view.next()){
	nonview = rs_view.getString("count(*)");
}
%>
<style>
@font-face {
	    font-family: 'dalla';
	    src: url('/font/dalla_Light.ttf') format('truetype');
	  }
 body{
 background-color: black;
 color: white;
 }
 a{
 color: white;
  text-decoration: none;
  }
   .header_font{
    color:white;
    font-family: 'dalla';
    }
    .send_img{
    background-image: url('/img/send.png');
    background-repeat: no-repeat;
    background-size: cover;
    }
</style>
<script>
	function write_go(){
		location.href = "write.jsp";
	}
	function selfClose(){
		self.close();
	}
	function send_go(){
		if(d_id.value==<%=session_id%>){
			alert("자기한테 쪽지를 보낼 수 없습니다.");
			d_id.focus();
			return false;
		}
		document.submit();
	}
</script>
<% 
while(rs.next()){
	String s_id = rs.getString("s_id");
	String comment = rs.getString("comment");

%>
<center>
<table>
	<tr>
		<td height=30></td>
	</tr>
</table>
<table border=0>
	<tr>
		<td style="vertical-align: top">
			<table width=200 border=0 >
				
				<tr>
					<td style="vertical-align: top"><input type="button" onclick="write_go()" value="쪽지쓰기" style="width:80%;height:40px" ></td>
				</tr>
				<tr>
					<td height=50></td>
				</tr>
				
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=1">받은 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;받은 쪽지 수[<%=recieve_count %>]</td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;안읽은 쪽지 수[<%=nonview %>]</td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=2">보낸 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;보낸 쪽지 수[<%=send_count %>]</td>
				</tr>
			</table>
		</td>
		<td width=50 ></td>
		<form action="reply_insert.jsp" method="get" onsubmit="return send_go()">
		<td style="vertical-align: top">
			<table>
				<tr>
					<td><h1>쪽지 쓰기</h1></td>
				</tr>
				<tr>
					<td><button style="width:100px;height:30px" class="send_img"></button></td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td>받는 사람 : <input id="d_id" name="d_id" value="<%=s_id%>"></td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td><textarea id="comment" name="comment" style="width:500px;height:400px">RE:<%=comment %></textarea></td>
				</tr>
						
			</table>
			<table width=800>
				<tr>
					<td style="text-align: left">
						<a href ="list.jsp?send_option=1">[목록]</a>
						
					</td>
					<td style="text-align: right"><a href ="javascript:selfClose()">[닫기]</a></td>
				</tr>
				
			</table>
		
		</td>
		</form>
	</tr>		
</table>
</center>
<%}
	rs.close();
	stmt.close();
	con.close();
%>
