<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header2.jsp" %>

<%
String code =request.getParameter("code");

String id = request.getParameter("id");

String sql = "update member set password='',name='',birth1='',birth2='',birth3='',email1='',email2='',level='',zipcode='',zipcode1='',zipcode2='',zipcode3='',zipcode4='',phone1='',phone2='',phone3='',signdate='',delete_id='y' where id ='"+id+"'";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
//stmt.executeUpdate(sql);
out.print(sql);


%>

<script>
	//location.href="list.jsp?code=<%=code%>";
</script>

