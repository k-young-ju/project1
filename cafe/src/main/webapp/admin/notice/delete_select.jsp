<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header2.jsp" %>

<%
String code =request.getParameter("code");

out.print(code);
String ids = request.getParameter("uids");
//out.print(ids);
String[] uid_ch = ids.split(",");

for(int i=0;i<uid_ch.length;i++){
	//out.print(uid_ch[i]);
	String sql = "delete from "+code+" where uid = '"+uid_ch[i]+"'";
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	out.print(sql);out.print("<br>");
}
//out.print(ids);

%>

<script>
	location.href="list.jsp?code=<%=code%>";
</script>

