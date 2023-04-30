<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
    
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
 	body{
 	background-image: url(/img/crossfit-scheme.png);
 	background-repeat: no-repeat;
 	background-position: top center;
 	background-size:cover;
 	}
 </style>
<form name=login action="login_ok.jsp" method="post" onsubmit="return login_ok()">
<center>
<table>
	<tr>
		<td height=350></td>
	</tr>
</table>
    <table >		
		<tr>
	 		<td><b>아이디</b></td>
	 		<td><input id="m_id" name="m_id" ></td>
	 		
	 	</tr>
	 	<tr>
	 		<td><b>비밀번호</b></td>
	 		<td><input id="m_pass" name="m_pass" ></td>
	 	</tr>
	 	<tr>
	 		<td></td>
	 		<td><button>로그인</button></td>
	 	</tr>
    </table>
 </center>	
</form>