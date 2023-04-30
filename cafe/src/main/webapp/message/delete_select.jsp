<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@include file = "/include/db.jsp" %>  
  
<%

String ids = request.getParameter("uids");

String send_option = request.getParameter("send_option");
//out.print(ids);
String[] uid_ch = ids.split(",");

String sql="";
if(send_option.equals("2")){
	for(int i=0;i<uid_ch.length;i++){
		sql = "update message set my_delete='2' where uid = '"+uid_ch[i]+"'";
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
	}
}else{
	for(int i=0;i<uid_ch.length;i++){
		
		sql = "update message set other_delete='2' where uid = '"+uid_ch[i]+"'";
		Connection con = DriverManager.getConnection(url, user, password);
		Statement stmt = con.createStatement();
		stmt.executeUpdate(sql);
	}	
}
	
out.print(sql);

%>

<script>
	location.href="list.jsp?send_option=<%=send_option%>";
</script>