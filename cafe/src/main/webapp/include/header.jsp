<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ include file = "/include/db.jsp" %>

<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

String sql_m = "select count(*) from message where d_id='"+session_id+"' and d_date=''";
Connection con_m = DriverManager.getConnection(url, user, password);
Statement stmt_m = con_m.createStatement();
ResultSet rs_m = stmt_m.executeQuery(sql_m);

int count = 0;
while(rs_m.next()){
	count = rs_m.getInt("count(*)");
}
%>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>운동 커뮤니티</title>

<style>
	body{
	
	 background-image: url("/img/body_back2.png");
	 background-repeat: no-repeat;
	 background-size: cover;
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
    color:black;
    font-size: 20px;
    }
	
}
    
    
    
</style>
<script>
	function login_connect(){
		width = screen.width*1/2;
		height=screen.height*1/2;
		window.open("/member/login.jsp","a","width="+width+", height="+height)
	}
	function id_search(){
		width = screen.width*1/2;
		height=screen.height;
		window.open("/member/id_search.jsp","a","width="+width+", height="+height)
	}
	function pass_search(){
		width = screen.width*1/2;
		height=screen.height;
		window.open("/member/pass_search.jsp","a","width="+width+", height="+height)
	}
	function my_page_go(){
		width = screen.width*1/2;
		height=screen.height*1/2;
		window.open("/member/my_page.jsp","a","width="+width+", height="+height);
	}
	function message_go(){
		width = screen.width*3/4;
		height=screen.height*3/4;
		window.open("/message/list.jsp?send_option=1","a","width="+width+", height="+height);
	}
	function delete_go(){
		result = confirm("탈퇴시 동일한 아이디로 재가입이 불가능합니다. \n정말 탈퇴하시겠습니까?");
		if(result == true){
			location.href="/member/delete.jsp";
			
		}else{
			return false;
		}
		
	}
	
</script>

</head>
<body>
<center>
<form method="post">
<table width =1100 border=0>
	<tr>
 
		<% if(session_id !=null && session_level.equals("10")){%>
	 	 		 		
	 		<td align=right style="text-align: center;">
	 		<a href = '/admin/'>[관리자페이지로 이동]</a>
	 		</td>
		 <%} %>
		 <%if(session_id == null) { %>
		 	
		 		
		 		<td style="text-align: right">
		 			<a style="cursor: pointer;" onclick ="login_connect()">[로그인]</a>|
		 			<a href = "/member/join.jsp" style="cursor: pointer;">[회원가입]</a>|
		 			<a style="cursor: pointer;" onclick ="id_search()">[아이디 찾기]</a>
		 			<a style="cursor: pointer;" onclick ="pass_search()">[비밀번호 찾기]</a>
		 		</td>
		 	
	 	
	 	<%}else{ %>
	 		<td style="text-align: right;font-size: 20px"><b><%=session_name %>님 환영합니다.</b></td>
	 		<td style="text-align: right">
	 			<%if(session_id != null && session_level.equals("10")){%>
	 			<a href = "javascript:my_page_go()" class="header_font">[내정보보기]</a>
	 			<a href = "javascript:message_go()" class="header_font">[쪽지<span style="color:red"><%=count %></span>]</a>
	 			<a href="/member/logout.jsp" style="cursor: pointer;" class="header_font">[로그아웃]</a>
	 			<a href = "/member/join_up.jsp" style="cursor: pointer;" class="header_font">[회원수정]</a>
	 			<%}else{%>
	 			<a href = "javascript:my_page_go()" class="header_font">[내정보보기]</a>
	 			<a href = "javascript:message_go()" class="header_font">[쪽지<span style="color:red"><%=count %></span>]</a>
	 			<a href="/member/logout.jsp" style="cursor: pointer;" class="header_font">[로그아웃]</a>
	 			<a href = "/member/join_up.jsp" style="cursor: pointer;" class="header_font">[회원수정]</a>
	 			<a href ="javascript:delete_go()" style="cursor: pointer;" class="header_font">[회원탈퇴]</a>
	 			<%} %>
	 		</td>
	 
	 <%	} %>
 	</tr>
 </table>
 

</form>
</html>
