<%@page import="java.sql.ResultSet"%>
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
	
	String sql_check ="select *,(select delete_id from member where member.id=message.d_id) as delete_id from message where d_id='"+d_id+"'";
	
	Connection con_check = DriverManager.getConnection(url, user, password);
	Statement stmt_check = con_check.createStatement();
	ResultSet rs_check = stmt_check.executeQuery(sql_check);
	

String delete_id = "";
while(rs_check.next()){
	delete_id = rs_check.getString("delete_id");
	
}
if(delete_id.equals("y")){%>
<script>
	alert("탈퇴한 회원입니다.");
	location.href="write.jsp";
</script>
<%}else if(delete_id.equals("")){ %>
<script>
	alert("존재하지않는 회원입니다.");
	location.href="write.jsp";
</script>
<%}else{ 
String sql = "insert into message (s_id,d_id,comment,s_date) values ('"+session_id+"','"+d_id+"','"+comment+"','"+signdate+"')";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
stmt.executeUpdate(sql);
%>
<script>
	location.href = "list.jsp?send_option=2"
</script>
<%} %>
