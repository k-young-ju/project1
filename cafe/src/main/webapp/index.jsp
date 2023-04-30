<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>


<style>
	@font-face {
	    font-family: 'bazzi';
	    src: url('/font/Bazzi.ttf') format('truetype');
	    
	}
	.container{
		position:relative;
	}
	.image1{
		display:block;
	
	}
	.image1:hover{
		opacity:0.3;
		transition:1s;
	}
	.textbox{
		position:absolute;
		left:0;
		top:0;
		opacity: 0;
		transition: 1s;
		transform: scale(0);
		
		
	} 
	h1{
		font-size: 20px;
		font-family: 'bazzi';
		transform:translate(40%,50%);
		color:black;
		
		
	}
	
	
	.container:hover .textbox{
		opacity:1; 
		transform:scale(3);
			
	}
	
</style>
<center>
<table border=0 width=1100>
	<tr>
		<td colspan=7><input type="image" src="/img/crossfit_header.png" style="width:100%; height:400px" onclick = "/"></td>
	</tr>
	<tr>
		<td colspan=7 height=50></td>
	</tr>	
	<tr>
		
		<td >
			<div class="container" >
				<a href = "/notice/list.jsp?code=notice"><img src ="img/health1.jpg" style="width:100%"  class="image1"></a> <!-- 게시판 -->
					<div class="textbox">
						<a href = "/notice/list.jsp?code=notice"><h1>게시판</h1></a>			
					</div>
			</div>
		</td>
			
		<td width=10></td>
		<td>
			<div class="container" >
				<a href="/gallery/list.jsp?code=gallery" ><img src = "/img/health_write.jpg" style="width:100%" class="image1"></a>
					<div class="textbox">
							<a href="/gallery/list.jsp?code=gallery" ><h1>갤러리</h1></a>		<!-- 갤러리 -->
					</div>
			</div>		
		</td> 	
		<td width=10></td>
		<td>
			<div class="container" >
				<a href ="/video/list.jsp?code=video"><img src = "/img/health2.jpg" style="width:100%" class="image1"></a>
					<div class="textbox">
							<a href ="/video/list.jsp?code=video"><h1>운동영상</h1></a>		 <!-- 동영상 -->
					</div>
			</div>		
		</td> 
		<td width=10></td>
		<td >
			<div class="container" >
				<a href = "/qna/list.jsp?code=qna" ><img src = "/img/health3.jpg" style="width:100%" class="image1">
					<div class="textbox">
							<a href ="/qna/list.jsp?code=qna"><h1>Q&A</h1></a>		 <!-- Q&A -->
					</div>
			</div>		
		</td>		
		
	</tr>	
</table>
</center>

<%@ include file = "/include/footer.jsp" %>
