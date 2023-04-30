<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/admin/include/header.jsp" %>


<style>
	@font-face {
	    font-family: 'bazzi';
	    src: url('/font/Bazzi.ttf') format('truetype');
	    
	}
		
	
	h1{
		font-size: 20px;
		font-family: 'bazzi';
		transform:translate(40%,50%);
		color:black;
			
	}
	a{
	color: black;
	}

</style>
<center>
<table border=0 width=1100>
	<tr>
		<td colspan=7>관리자 페이지</td>
	</tr>
	<tr>
		<td colspan=7 height=50></td>
	</tr>	
	<tr>
		<td><a href = "/">[사용자페이지로 이동]</a></td>
		<td><a href = "/admin/message/list.jsp">[전체 쪽지 보기]</a></td>
		<td></td>
	</tr>
	<tr>
		<td colspan="3" height = 20></td>
	</tr>
	<tr>	
		<td><a href = "/admin/member/list.jsp?code=member">[회원관리]</a></td>
		<td><a href = "/admin/notice/list.jsp?code=notice">[일반게시판 관리]</a></td> 
 		<td><a href ="/admin/gallery/list.jsp?code=gallery">[갤러리 관리]</a></td>
 	</tr>
 	<tr>
		<td colspan="3" height = 20></td>
	</tr>
 	<tr>	 
 		<td><a href ="/admin/video/list.jsp?code=video">[돟영상 게시판 관리]</a></td>
 		<td><a href ="/admin/qna/list_gongji.jsp?code=qna">[자주묻는질문 게시판 관리]</a></td>
		<td><a href ="/admin/qna/list_normal.jsp?code=qna">[질의응답 게시판 관리]</a></td>
	</tr>
</table>
</center>

<%@ include file = "/admin/include/footer.jsp" %>
