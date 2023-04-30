<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String code = request.getParameter("code");
String uid = request.getParameter("uid");
String c_uid = request.getParameter("c_uid");

String sql = "delete from comment where uid="+c_uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);

String sql_com_count = "update "+code+" set com_count = com_count-1 where uid ="+uid+"";
Connection con_com_count = DriverManager.getConnection(url, user, password);
Statement stmt_com_count = con_com_count.createStatement();
stmt_com_count.executeUpdate(sql_com_count);


%>

<script>
	location.href = "view.jsp?code=<%=code%>&uid=<%=uid%>";
</script>