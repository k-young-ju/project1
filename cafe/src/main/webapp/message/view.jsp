<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
String send_option = request.getParameter("send_option");

String sql_receive ="select * from message where d_id='"+session_id+"' and uid="+uid+"";

Connection con_receive = DriverManager.getConnection(url, user, password);
Statement stmt_receive = con_receive.createStatement();
ResultSet rs_receive = stmt_receive.executeQuery(sql_receive);

String sql_send ="select * from message where s_id='"+session_id+"' and uid="+uid+"";

Connection con_send= DriverManager.getConnection(url, user, password);
Statement stmt_send = con_send.createStatement();
ResultSet rs_send = stmt_send.executeQuery(sql_send);

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
</style>
<script>
	if(self.name != 'reload'){
		self.name = 'reload';
		self.location.reload(true);
	}else{
		self.name = '';
	}
	opener.document.location.reload();
	
	function write_go(){
		location.href = "write.jsp";
	}
	function selfClose(){
		self.close();
	}
	
</script>
<table>
	<tr>
		<td height=30></td>
	</tr>
</table>
<center>

<table border=0>
	<tr>
		<td style="vertical-align: top">
			<table width=200 border=0>
				<tr>
					<td><input type="button" onclick="write_go()" value="쪽지쓰기" style="width:80%;height:40px" ></td>
				</tr>
				<tr>
					<td height=50></td>
				</tr>
				
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=1">받은 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href="list.jsp?send_option=1">받은 쪽지 수[<%=recieve_count %>]</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href="list.jsp?send_option=3">안읽은 쪽지 수[<%=nonview %>]</a></td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=2">보낸 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href ="list.jsp?send_option=2">보낸 쪽지 수[<%=send_count %>]</a></td>
				</tr>
			</table>
		</td>
		<td width=50 ></td>
		
		<td style="vertical-align: top">
			<table width=800>
		<%
			
			String s_id = "";
			String d_id = "";
			String comment ="";
			String s_date="";
			String d_date="";
			
				
			if(rs_receive.next()){
			 
			 s_id =rs_receive.getString("s_id");
			 d_id = rs_receive.getString("d_id");
			 comment =rs_receive.getString("comment");
			 s_date = rs_receive.getString("s_date");
			 d_date = rs_receive.getString("d_date");
			
				if(d_date.equals("")){
					Date today = new Date();
					SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String signdate = sd.format(today);
					
					String sql_date = "update message set d_date='"+signdate+"' where uid="+uid+"";
					
					Connection con_date = DriverManager.getConnection(url, user, password);
					Statement stmt_date = con_date.createStatement();
					stmt_date.executeUpdate(sql_date);
				}
			
				%>
			
				<tr>
					<td>보낸사람 : <%=s_id %></td>
					<td style="text-align: right"><a href ="reply.jsp?uid=<%=uid%>">답장하기</a></td>
							
				</tr>
				<tr>
					<td colspan=2 height=30></td>
				</tr>
				<tr>
					<td colspan=2>보낸 시간  :<%=s_date %></td>
				</tr>
				<tr>
					<td colspan=2>받은 시간  :<%=d_date %></td>
				</tr>
				<tr>
					<td height=30 colspan=2></td>
				</tr>
				<tr>
					<td colspan=2><textarea style="width:500px;height:400px"><%=comment %></textarea></td>
				</tr>
			<%}
			rs_receive.close();
			stmt_receive.close();
			con_receive.close();	
			
						
			if(rs_send.next()){
				 d_id = rs_send.getString("d_id");
				 comment =rs_send.getString("comment");
				 s_date = rs_send.getString("s_date");
				 d_date=rs_send.getString("d_date");
				 
				 %>
				 
				 <tr>
					<td>받는사람 : <%=d_id %></td>
					<td style="text-align: right"></td>		
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td>보낸 시간  :<%=s_date %></td>
				</tr>
				<tr>
					<td>읽은 시간  :<%=d_date %></td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td><textarea style="width:100%;height:400px"><%=comment %></textarea></td>
				</tr>
				 
			<%}
			rs_send.close();
			stmt_send.close();
			con_send.close();
			%>
			
			</table>
			<table width=800>
				<tr>
					<td style="text-align: left">
					<%if(send_option.equals("1")){ %>
						<a href ="list.jsp?send_option=1">[목록]</a>
						<a href= "delete.jsp?send_option=1&uid=<%=uid%>">[삭제]</a>
					<%}else{ %>
						<a href ="list.jsp?send_option=2">[목록]</a>
						<a href= "delete.jsp?send_option=2&uid=<%=uid%>">[삭제]</a>	
					<%} %>	
						
					</td>
					<td style="text-align: right"><a href ="javascript:selfClose()">[닫기]</a></td>
				</tr>
				
			</table>
			
			