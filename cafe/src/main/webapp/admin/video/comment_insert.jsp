<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("tb_table");

String uid = request.getParameter("tb_uid");

String tb_comment = request.getParameter("tb_comment");

Date today = new Date();
SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String signdate = sd.format(today);

String sql = "insert into comment values (null,'"+code+"',"+uid+",'"+session_id+"','"+session_name+"','"+tb_comment+"','"+signdate+"')";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);

String sql_com_count = "update "+code+" set com_count = com_count+1 where uid ="+uid+"";
Connection con_com_count = DriverManager.getConnection(url, user, password);
Statement stmt_com_count = con_com_count.createStatement();
stmt_com_count.executeUpdate(sql_com_count);

%>

<script>
	location.href = "view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>