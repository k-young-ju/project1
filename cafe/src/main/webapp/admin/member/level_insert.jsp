<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp" %>

<%

String levels = request.getParameter("levels");
String ids = request.getParameter("ids");

//out.print(levels);
//out.print(ids);
String[] level_one = levels.split(",");
String[] id_one = ids.split(",");

for(int i=0;i<level_one.length;i++){
	
	String sql = "update member set level='"+level_one[i]+"' where id='"+id_one[i]+"'";
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	//out.print(sql);out.print("<br>");
}


%>

<script>
	location.href="list.jsp";
</script>
