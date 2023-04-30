<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/include/header2.jsp" %>

<%
String code =request.getParameter("code");
out.print(code);

String ids = request.getParameter("ch_ids");
out.print(ids);
String[] id_ch = ids.split(",");

for(int i=0;i<id_ch.length;i++){
	//out.print(id_ch[i]);
	String sql = "update member set password='',name='',birth1='',birth2='',birth3='',email1='',email2='',level='',zipcode='',zipcode1='',zipcode2='',zipcode3='',zipcode4='',phone1='',phone2='',phone3='',signdate='',delete_id='y' where id ='"+id_ch[i]+"'";
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	//out.print(sql);out.print("<br>");
}
//out.print(ids);

%>

<script>
	location.href="list.jsp";
</script>

