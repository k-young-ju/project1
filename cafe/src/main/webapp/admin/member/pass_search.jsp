<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ include file = "/include/db.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>

<style type="text/css">

  body{
   
    background-image: url(/img/FAQ.jpg);
    background-repeat: no-repeat;
    background-position: top center;
 	background-size:cover;
    background-color: rgba(255,255,255,0.3);
    font-size: 30px;
    font-weight:bold;
  }
  input, select{
  width:100px;
  }
  
</style> 

</head>
<body>
<div>
<center>

<%
String id ="";

	if(request.getParameter("m_id") == null){
		id = "";
	}else{
		id = request.getParameter("m_id");
	}

String b1 ="";

	if(request.getParameter("b1") == null){
		b1 = "";
	}else{
		b1 = request.getParameter("b1");
	}
	
String b2 ="";

	if(request.getParameter("b2") == null){
		b2 = "";
	}else{
		b2 = request.getParameter("b2");
	}
	
String b3 ="";

	if(request.getParameter("b3") == null){
		b3 = "";
	}else{
		b3 = request.getParameter("b3");
	}

String e1 ="";

	if(request.getParameter("e1") == null){
		e1 = "";
	}else{
		e1 = request.getParameter("e1");
	}
	
String e2 ="";

	if(request.getParameter("e2") == null){
		e2 = "";
	}else{
		e2 = request.getParameter("e2");
	}

String p1 ="";

	if(request.getParameter("p1") == null){
		p1 = "";
	}else{
		p1 = request.getParameter("p1");
	}

String p2 ="";

	if(request.getParameter("p2") == null){
		p2 = "";
	}else{
		p2 = request.getParameter("p2");
	}

String p3 ="";

	if(request.getParameter("p3") == null){
		p3 = "";
	}else{
		p3 = request.getParameter("p3");
	}


String sql = "select * from member where id='"+id+"' and birth1='"+b1+"' and birth2 = '"+b2+"' and birth3 ='"+b3+"' and email1 ='"+e1+"' and email2 = '"+e2+"' and phone1 ='"+p1+"' and phone2='"+p2+"' and phone3='"+p3+"'";

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);


String pass = "";
while(rs.next()){
	pass = rs.getString("password");
}
%>

<form method="post">
	
	<table height=150>
	
		<tr>
			<td></td>
		</tr>
	</table>
	
	<table>
		<tr>
			<td><b>아이디</b></td>
		</tr>
		<tr>	
			<td>
				<input id="id" name="m_id" value="<%=id %>">
			</td>
		</tr>
		<tr>
			<td><b>연락처</b></td>
		</tr>
		<tr>	
			<td>
				<input id="p1" name="p1" value="<%=p1 %>">
				<input id="p2" name="p2" value="<%=p2 %>">
				<input id="p3" name="p3" value="<%=p3 %>">
			</td>
		</tr>
		<tr>
			<td><b>메일주소</b></td>
		</tr>
		<tr>	
			<td>
				<input id="e1" name="e1" value="<%=e1 %>">@
				<select id="e2" name="e2" onchange="e2.value=this.value">
					<option value-"">==선택==</option>
					<option value = "naver.com">naver.com</option>
					<option value = "gmail.com">gmail.com</option>
					<option value = "nate.com">nate.com</option>
				</select>
			</td>
		</tr>
		<tr>
			<td><b>생년월일</b></td>
		</tr>
		<tr>	
			<td>
				<input id="b1" name="b1" value="<%=b1 %>">
				<select id="b2" name="b2" onchange="b2.value=this.value">
					<option value ="">선택</option>
					<option value ="1">1월</option>
					<option value ="2">2월</option>
					<option value ="3">3월</option>
					<option value ="4">4월</option>
					<option value ="5">5월</option>
					<option value ="6">6월</option>
					<option value ="7">7월</option>
					<option value ="8">8월</option>
					<option value ="9">9월</option>
					<option value ="10">10월</option>
					<option value ="11">11월</option>
					<option value ="12">12월</option>
				</select>
				<input id="b3" name="b3" value="<%=b3 %>">
			</td>
		</tr>
		<tr>
			<td height=50></td>
		</tr>
		<tr>
			<td align="center"><button style = "width:300px;height:50px">비밀번호 찾기</button></td>
		</tr>	
	</table>
	<table >
		<tr>
			<td></td>
		</tr>
	</table>
	

</form>
Result PASSWORD :<br>
<%if(pass.equals("")){%>
	입력하신 정보와 일치하는 비밀번호는 <br> 존재하지 않습니다.
<%}else{ %>
	<%=pass %>
<%}%>
</center>
</div>
</body>
</html>