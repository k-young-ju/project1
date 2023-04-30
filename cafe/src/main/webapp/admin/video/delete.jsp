<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header2.jsp" %>

<%
String code =request.getParameter("code");

String uid = request.getParameter("uid");

String sql = "delete from "+code+" where uid = "+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);

stmt.close();
con.close();

%>

<script>
	location.href="list.jsp?code=<%=code%>";
</script>

