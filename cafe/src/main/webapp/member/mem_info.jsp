
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "/include/db.jsp" %>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

String id = request.getParameter("id");
String name = "";
String level="";


String sql = "select * from member where id = '"+id+"'";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

while(rs.next()){
	name =rs.getString("name");
	level =rs.getString("level");
	
}
%>
<style>
	@font-face {
	    font-family: 'dalla';
	    src: url('/font/dalla_Light.ttf') format('truetype');
	  }
	body{
	background-color: black;
	padding: 0;
	margin: 0;
	
	}
	.session{
	font-size: 40px;
	color: white;
	font-family: 'dalla';
	}
	table{
	border-collapse: collapse;
	
	}
</style>
<script>
	function selfclose(){
		self.close();
	}
	
</script>

<table style="background-color: #5997E1;width:100%;height:60px;">
	<tr>
		<td></td>
	</tr>
</table>
<center>
<table style="border:1px solid black">
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">아이디 : <%=id %></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">이름: <%=name %></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">회원등급: <%=level %></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td style="text-align: center"><a href ="javascript:selfclose()" class="session">[닫기]</a></td>
	</tr>	
</table>
</center>