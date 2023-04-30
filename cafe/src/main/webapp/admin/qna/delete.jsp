<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header2.jsp" %>

<%
String code =request.getParameter("code");
String gongji = request.getParameter("gongji");
String uid = request.getParameter("uid");

String sql = "delete from "+code+" where uid = "+uid+"";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
//out.print(sql);
stmt.close();
con.close();

if(gongji.equals("1")){
%>
<script>
	location.href="list_gongji.jsp?code=<%=code%>";
</script>
<%}else{ %>
<script>
	location.href="list_normal.jsp?code=<%=code%>";
</script>
<%}%>