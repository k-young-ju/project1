<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>

<%

	request.setCharacterEncoding("utf-8");
				
	String uid = request.getParameter("uid");
	String code = request.getParameter("code");
	String tb_video = request.getParameter("tb_video");
	String subject = request.getParameter("subject");
	String comment_health = request.getParameter("comment_health");
	
	out.print(tb_video);			
	String sql = "update "+code+" set tb_video='"+tb_video+"',subject = '"+subject+"',comment_health='"+comment_health+"' where uid="+uid+"";
	
		
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	//out.print(sql);
		

%>

<script>
	location.href = "list.jsp?code=<%=code%>";
</script>