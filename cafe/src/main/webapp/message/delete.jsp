<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/include/db.jsp" %>

<%
String send_option = request.getParameter("send_option");
String uid = request.getParameter("uid");
String sql="";
if(send_option.equals("2")){
	sql = "update message set my_delete='2' where uid="+uid+"";
}else{
	sql = "update message set other_delete='2' where uid="+uid+"";	
	
}

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
//out.print(sql);
%>

<script>
	location.href="list.jsp?send_option=<%=send_option%>"
</script>