<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@include file = "/include/db.jsp"  %>
 <%
 String sql="select * from member";
 
 Connection con = DriverManager.getConnection(url, user, password);
 Statement stmt = con.createStatement();
 ResultSet rs = stmt.executeQuery(sql);
 %>  
    
<script>
 	function login_ok(){
 		if(m_id.value==""){
 			alert("아이디를 입력하세요");
 			m_id.focus();
 			return false;
 		}
 		if(m_pass.value==""){
 			alert("비밀번호를 입력하세요");
 			m_pass.focus();
 			return false;
 		}
 		
 		
 	  document.login.submit();	
 	}
 </script>

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
<table style="background-color: #5997E1;width:100%;height:60px;">
	<tr>
		<td></td>
	</tr>
</table>
<form name=login action="login_ok.jsp" method="post" onsubmit="return login_ok()">
<center>
<table>
	<tr>
		<td height=50></td>
	</tr>
</table>
    <table >		
		<tr>
	 		<td class="session">아이디</td>
	 		<td><input id="m_id" name="m_id" style="height:40px;" maxlength="12"></td>
	 		
	 	</tr>
	 	<tr>
	 		<td height=30></td>
	 	</tr>	
	 	<tr>
	 		<td class="session">비밀번호</td>
	 		<td><input id="m_pass" name="m_pass" style="height:40px" maxlength="13"></td>
	 	</tr>
	 	<tr>
	 		<td height=30></td>
	 	</tr>	
	 	<tr>
	 		<td></td>
	 		<td><button class="session" style="color: black">로그인</button></td>
	 	</tr>
    </table>
 </center>	
</form>