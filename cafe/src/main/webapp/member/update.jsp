<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file ="/include/header.jsp" %>

<%
request.setCharacterEncoding("utf-8");

String id = request.getParameter("m_id");
String pass = request.getParameter("pass1");
String name = request.getParameter("name1");

String email1 = request.getParameter("email1");
String email2 = request.getParameter("email2");

String z = request.getParameter("zipcode");
String z1 = request.getParameter("zipcode1");
String z2 = request.getParameter("zipcode2");
String z3 = request.getParameter("zipcode3");
String z4 = request.getParameter("zipcode4");

String p1 = request.getParameter("phone1");
String p2 = request.getParameter("phone2");
String p3 = request.getParameter("phone3");

String sql_up = "update member set password='"+pass+"',name='"+name+"',email1='"+email1+"',email2='"+email2+"',zipcode='"+z+"',zipcode1='"+z1+"',zipcode2='"+z2+"',zipcode3='"+z3+"',zipcode4='"+z4+"',phone1='"+p1+"',phone2='"+p2+"',phone3='"+p3+"' where id='"+id+"'" ;

Connection con_up = DriverManager.getConnection(url, user, password);
Statement stmt_up = con_up.createStatement();
stmt_up.executeUpdate(sql_up);
%>
<script>
	alert("수정되었습니다");
	location.href = "/member/join_up.jsp";
</script>