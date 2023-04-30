<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

%>
<style>
	@font-face {
	    font-family: 'dalla';
	    src: url('/font/dalla_Light.ttf') format('truetype');
	  }
	body{
	background-color: black;
	padding: 0;
	margin: 0;
	
	}
	.session{
	font-size: 40px;
	color: white;
	font-family: 'dalla';
	}
	table{
	border-collapse: collapse;
	
	}
</style>
<script>
	function selfclose(){
		self.close();
	}
	
</script>

<table style="background-color: #5997E1;width:100%;height:60px;">
	<tr>
		<td></td>
	</tr>
</table>
<center>
<table style="border:1px solid black">
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">아이디 : <%=session_id %></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">이름: <%=session_name %></td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td class="session">
			<%if(session_level.equals("1")){ %>
			회원등급 : 헬린이
			<%}else if(session_level.equals("2") || session_level.equals("3")){ %>
			회원등급 : 3대 200
			<%}else if(session_level.equals("4") || session_level.equals("5")){ %>
			회원등급 : 3대 300
			<%}else if(session_level.equals("5") || session_level.equals("6")){ %>
			회원등급 : 3대 500
			<%}else if(session_level.equals("7") || session_level.equals("8")){ %>
			회원등급 : 헬창
			<%}else{ %>
			회원등급: 규격외
			<%} %>
		</td>
	</tr>
	<tr>
		<td height=30></td>
	</tr>
	<tr>
		<td style="text-align: center"><a href ="javascript:selfclose()" class="session">[닫기]</a></td>
	</tr>	
</table>
</center>