<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file ="/include/db.jsp" %>
    <%
    
    String id = request.getParameter("id");
    String sql = "select count(*) from member where id='"+id+"'";
    Connection con = DriverManager.getConnection(url, user, password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    
    int total = 0;
    while(rs.next()){
    	total = rs.getInt("count(*)");
    }
    %>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
<script>
	function repeat_ok(){
		opener.join.id_check2.value = 'y';
		opener.join.m_id.value = id.value;
		self.close();
	}
</script>
</head>
<body>
<form method="get">
<center>
	<table>
		<tr>
			<td>아이디</td>
			<td><input id="id" name="id" value="<%=id%>" maxlength="12"></td>
		</tr>
		<tr>
			<td colspan="2">
			<%if(id == null || id == ""){ %>
					아이디를 입력해주세요
					<button>재검색</button>
			<%}else{ %>		
				<%if(total==0){%>
						사용가능한 아이디입니다. 
						<input type="button" onclick ="repeat_ok()" value="아이디적용">
					<%}else{ %>
						이미 존재하는 아이디 입니다.
						<button>재검색</button>
					<% }
					}%>	
			</td>
		</tr>
	</table>
</center>
</form>


</body>
</html>