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
	@font-face {
	    font-family: 'bazzi';
	    src: url('/font/Bazzi.ttf') format('truetype');
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
    	text-align: right;
    	
    }
    a{
    color:black;
    text-decoration: none;
    }
    h2{
    font-family: 'bazzi';
    text-align: center;
    }
    h2:hover{
    transform:scale(1.5);
    transition:1s
    }
	
	body{
	background-color:#BBD398;
	}
    
    
    
</style>

</head>
<body>
<center>
<form method="post">
<table width =1100 border=0>
	<tr>
 			<td style="text-align: left" width=150><a href = "/"><b>첫화면으로 이동</b></a></td>
 			<td width=200><a href = "/admin/index.jsp"><b>관리자 메인으로 이동</b></a>
			<td style="text-align: right">
	 			<a href="/member/logout.jsp" style="cursor: pointer;">로그아웃</a>|
	 			<a href = "/member/join_up.jsp" style="cursor: pointer;">회원수정</a>
	 		</td>
	 
	 
 	</tr>
 </table>
 <table width=1100 border=0> 
 	<tr>
 		<td width=175><a href = "/admin/member/list.jsp?code=notice"><h2>회원관리</h2></a></td>
 		<td width=10></td>
 		<td width=175><a href = "/admin/notice/list.jsp?code=notice"><h2>게시판</h2></a></td>
 		<td width=10></td>
 		<td width=175><a href="/admin/gallery/list.jsp?code=gallery" ><h2>갤러리</h2></a></td>
 		<td width=10></td>
 		<td width=175><a href ="/admin/video/list.jsp?code=video"><h2>운동영상</h2></a></td>
 		<td width=10></td>
 		<td width=175><a href ="/admin/qna/list_gongji.jsp?code=qna"><h2>자주 묻는 질문</h2></a></td>
 		<td width=10></td>
 		<td width=175><a href ="/admin/qna/list_normal.jsp?code=qna"><h2>질의응답게시판</h2></a></td>
 	</tr>	
 </table>
 

</form>
</html>
