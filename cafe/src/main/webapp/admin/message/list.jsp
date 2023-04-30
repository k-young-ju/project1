<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/admin/include/header2.jsp" %>

<%
	String sql ="select * from message order by uid desc";

	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery(sql);


%>
<table width=1100 border=1>
	<tr>
		<td>보낸사람</td>
		<td>받은사람</td>
		<td>내용</td>
		<td>보낸날짜</td>
		<td>읽은날짜</td>
		<td>보낸사람 삭제여부</td>
		<td>받은사람 삭제여부</td>
	</tr>
	<%
	while(rs.next()){
		String uid = rs.getString("uid");
		String s_id =rs.getString("s_id");
		String d_id = rs.getString("d_id");
		String comment= rs.getString("comment");
		String s_date = rs.getString("s_date");
		String d_date = rs.getString("d_date");
		String my_delete = rs.getString("my_delete");
		String other_delete = rs.getString("other_delete");
	
		if(comment.length() > 20){
			comment = comment.substring(0,20)+"...";
		}
	%>
		<tr>
			<td><%=s_id %></td>
			<td><%=d_id %></td>
			<td><a href = "view.jsp?uid=<%=uid%>"><%=comment %></a></td>
			<td><%=s_date %></td>
			<%if(d_date.equals("")){ %>
			<td>읽지않음</td>
			<%}else{ %>
			<td><%=d_date %></td>
			<%} %>
			<%if(my_delete.equals("2")){ %>
			<td>여</td>
			<%}else{ %>
			<td>부</td>
			<%} %>
			<%if(other_delete.equals("2")){ %>
			<td>여</td>
			<%}else{ %>
			<td>부</td>
			<%} %>
		</tr>
	<%} %>	
</table>