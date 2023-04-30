<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header2.jsp" %>
<%
String uid = request.getParameter("uid");
String sql = "select * from message where uid='"+uid+"'";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);

%>
<center>
<table width = 800>
<%while(rs.next()){
	String s_id = rs.getString("s_id");
	String d_id = rs.getString("d_id");
	String s_date = rs.getString("s_date");
	String d_date = rs.getString("d_date");
	String comment = rs.getString("comment");
	%>
	<tr>
		<td height=40><b>보낸사람</b> :&nbsp;<%=s_id %> </td>
		<td><b>보낸날짜</b> :&nbsp;<%=s_date %></td>
	</tr>
	<tr>
		<td height=40><b>받은사람</b> :&nbsp;<%=d_id %></td>
		<%if(d_date.equals("")){ %>
		<td><b>읽은날짜</b> :&nbsp;읽지않음</td>
		<%}else{ %>
		<td><b>읽은날짜</b> :&nbsp;<%=d_date %></td>
		<%} %>
	</tr>
	<tr>
		<td height=40></td>
	</tr>
	<tr>
		<td colspan=2 style="border-bottom: 1px solid black"><b>내용</b></td>
	</tr>
	<tr>
		<td height=20></td>
	</tr>
	<tr>
		<td colspan=2><%=comment %></td>
	</tr>
<%}%>
</table>
</center>
