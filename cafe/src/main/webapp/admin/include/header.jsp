<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file = "/include/db.jsp" %>

<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

if(session_level != null && session_level.equals("10")){//관리자
	
}else{

 %>
 
 <script>
 	alert("잘못된 접근입니다.");
 	location.href= "/";
 </script>
<%
}
%>

   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 커뮤니티</title>

<style>
	body{
	 background-color:#BBD398;
	}
	table{
	padding:0px;
	margin:0px;
	border-spacing: 0px;
	}
		 
    }
    td{
    	border-spacing: 0px;
    	padding: 0px;
    	
    }
    a{
    text-decoration: none;
    }
	
}
    
    
    
</style>

</head>
<body>
<center>
<form method="post">
<table width =1100 border=0>
	<tr>
 		<td align=right width=150>
 			<a href="/member/logout.jsp" style="cursor: pointer;">로그아웃</a>|
 			<a href = "/member/join_up.jsp" style="cursor: pointer;">회원수정</a>
 		</td>
	</tr>
 </table>
 

</form>
</html>
