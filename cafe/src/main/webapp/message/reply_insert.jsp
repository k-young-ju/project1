<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file = "/include/db.jsp" %>   
<% 

	String session_id = (String)session.getAttribute("id");
	String session_name = (String)session.getAttribute("name");
	String session_level = (String)session.getAttribute("level");

	request.setCharacterEncoding("utf-8");
	String d_id= request.getParameter("d_id");
	String comment = request.getParameter("comment");

	Date today = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String signdate = sd.format(today);
	
	
String sql = "insert into message (s_id,d_id,comment,s_date) values ('"+session_id+"','"+d_id+"','"+comment+"','"+signdate+"')";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
//out.print(sql);
%>

<script>
	location.href = "list.jsp?send_option=2"
</script>
