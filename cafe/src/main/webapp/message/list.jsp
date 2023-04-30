<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.net.ConnectException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "/include/db.jsp" %>
<%
String session_id = (String)session.getAttribute("id");
String session_name = (String)session.getAttribute("name");
String session_level = (String)session.getAttribute("level");

String send_option = request.getParameter("send_option");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<style>
@font-face {
	    font-family: 'dalla';
	    src: url('/font/dalla_Light.ttf') format('truetype');
	  }
 body{
 background-color: black;
 color: white;
 }
 a{
 color: white;
  text-decoration: none;
  }
   .header_font{
    color:white;
    font-family: 'dalla';
    }
</style>
</head>
<%
request.setCharacterEncoding("utf-8");

String field = "";
String search = "";
if(request.getParameter("search") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
}
String sql_receive="select * from message where d_id='"+session_id+"' and other_delete='1' order by uid desc";

if(request.getParameter("search") != null){
	sql_receive = "select * from message where d_id='"+session_id+"' and other_delete='1' and "+field+" like '%"+search+"%' order by uid desc";
}

Connection con_receive = DriverManager.getConnection(url, user, password);
Statement stmt_receive = con_receive.createStatement();
ResultSet rs_receive = stmt_receive.executeQuery(sql_receive);

String sql_send="select * from message where s_id='"+session_id+"' and my_delete='1' order by uid desc";

if(request.getParameter("search") != null){
	
	sql_send = "select * from message where s_id ='"+session_id+"' and my_delete='1' and "+field+" like '%"+search+"%' order by uid desc";
}


Connection con_send = DriverManager.getConnection(url, user, password);
Statement stmt_send = con_send.createStatement();
ResultSet rs_send = stmt_send.executeQuery(sql_send);


String sql_count_receive = "select count(*) from message where d_id='"+session_id+"' and other_delete='1' order by uid desc";

Connection con_count_receive = DriverManager.getConnection(url, user, password);
Statement stmt_count_receive = con_count_receive.createStatement();
ResultSet rs_count_receive = stmt_count_receive.executeQuery(sql_count_receive);

String sql_count_send = "select count(*) from message where s_id='"+session_id+"' and my_delete='1' order by uid desc";

Connection con_count_send = DriverManager.getConnection(url, user, password);
Statement stmt_count_send = con_count_send.createStatement();
ResultSet rs_count_send = stmt_count_send.executeQuery(sql_count_send);

String sql_count_nonview = "select count(*) from message where d_id='"+session_id+"' and other_delete='1' and d_date='' order by uid desc";

Connection con_count_nonview = DriverManager.getConnection(url, user, password);
Statement stmt_count_nonview = con_count_nonview.createStatement();
ResultSet rs_count_nonview = stmt_count_nonview.executeQuery(sql_count_nonview);

int total_record_recieve = 0;
if(rs_count_receive.next()){
	total_record_recieve = rs_count_receive.getInt("count(*)");
}
int total_record_send = 0;
if(rs_count_send.next()){
	total_record_send = rs_count_send.getInt("count(*)");
}

int total_record_nonview = 0;
if(rs_count_nonview.next()){
	total_record_nonview = rs_count_nonview.getInt("count(*)");
}

int page_now = 1;
if(request.getParameter("page_now") !=null){
	page_now = Integer.parseInt(request.getParameter("page_now"));
}else{
	page_now = 1;
}
int num_per_page = 8;
int page_per_block = 5;
int total_page_accept = 0;
int total_page_send = 0;
int first = 0;

total_page_accept = (int)Math.ceil(total_record_recieve / (double)num_per_page); 
total_page_send = (int)Math.ceil(total_record_send / (double)num_per_page); 
first = num_per_page * (page_now - 1); 

String sql_view = "select count(*) from message where d_date='' and d_id='"+session_id+"'";

Connection con_view = DriverManager.getConnection(url, user, password);
Statement stmt_view = con_view.createStatement();
ResultSet rs_view = stmt_view.executeQuery(sql_view);

String sql_recieve_count = "select count(*) from message where d_id='"+session_id+"' and other_delete='1'";
Connection con_recieve_count = DriverManager.getConnection(url, user, password);
Statement stmt_recieve_count = con_recieve_count.createStatement();
ResultSet rs_recieve_count = stmt_recieve_count.executeQuery(sql_recieve_count);

String sql_send_count= "select count(*) from message where s_id='"+session_id+"' and my_delete='1'";

Connection con_send_count = DriverManager.getConnection(url, user, password);
Statement stmt_send_count = con_send_count.createStatement();
ResultSet rs_send_count = stmt_send_count.executeQuery(sql_send_count);

String sql_nonview ="select * from message where d_id='"+session_id+"' and d_date='' and other_delete='1'";

Connection con_nonview = DriverManager.getConnection(url, user, password);
Statement stmt_nonview = con_nonview.createStatement();
ResultSet rs_nonview = stmt_nonview.executeQuery(sql_nonview);

String send_count = "";
while(rs_send_count.next()){
	send_count = rs_send_count.getString("count(*)");
	
}
String recieve_count = "";
while(rs_recieve_count.next()){
	recieve_count = rs_recieve_count.getString("count(*)");
	
}

String nonview = "";
while(rs_view.next()){
	nonview = rs_view.getString("count(*)");
}



%>

<script>
	function write_go(){
		location.href = "write.jsp";
	}
	function selfClose(){
		self.close();
	}
	
	function checkall() {//체크박스 전체 선택 , 해제
		if(Form1.all.checked) {
			for(i=1; i < (document.Form1.length); i++){
				document.Form1.elements[i].checked = true;
			}
		}else{
			for(i=1; i < (document.Form1.length); i++){
				document.Form1.elements[i].checked = false;
			}
		}
	}

	function check_select(){//체크박스 부분 선택
		myForm = document.getElementsByName("ap_check");
		myFormLen = myForm.length; //체크박스 전체수
		if(myFormLen==1){//체크박스 전체 리스트 수가 1개 일때
			document.Form1.ap_check.checked = true;
			check_one=document.Form1.ap_check.value;
			alert(check_one);//체크된 값 확인
			return; 
		} 
		for(var i = 0;  i < document.Form1.ap_check.length; i++) {
			 if(document.Form1.ap_check[i].checked == true) break;
		}
		if(i == document.Form1.ap_check.length) {
			alert("선택된 항목이 없습니다.");         
			return;
		}
		if(confirm('삭제하시겠습니까?')){
			check_select2();
			return;
		} 
	}
	function check_select2(){//체크박스 전체 리스트 수가 2개 이상일 때
		var check_hide = new Array();

		for(var i = 0;  i < document.Form1.ap_check.length; i++) {
			if(document.Form1.ap_check[i].checked == true) {
				check_hide[i] = document.Form1.ap_check[i].value;
			}
		}
		
		location.href="delete_select.jsp?send_option=<%=send_option%>&uids="+check_hide;
		
	}
</script>
<body>
<table>
	<tr>
		<td height=30></td>
	</tr>
</table>
<center>

<table border=0>
	<tr>
		<td style="vertical-align: top">
			<table width=200 border=0>
				<tr>
					<td><input type="button" onclick="write_go()" value="쪽지쓰기" style="width:80%;height:40px" ></td>
				</tr>
				<tr>
					<td height=50></td>
				</tr>
				
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=1">받은 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href="list.jsp?send_option=1">받은 쪽지 수[<%=recieve_count %>]</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href="list.jsp?send_option=3">안읽은 쪽지 수[<%=nonview %>]</a></td>
				</tr>
				<tr>
					<td height=30></td>
				</tr>
				<tr>
					<td class="header_font"><a href = "list.jsp?send_option=2">보낸 쪽지함</a></td>
				</tr>
				<tr>
					<td class="header_font">&nbsp;&nbsp;<a href ="list.jsp?send_option=2">보낸 쪽지 수[<%=send_count %>]</a></td>
				</tr>
			</table>
		</td>
		<td width=50 ></td>
		
		<td style="vertical-align: top">
			<table width=800 style="text-align: right">
				<tr>
					<td>
						<form method="get">
						<input type="hidden" name = "send_option" value="<%=send_option%>">
							<select name = "field">
								<%if(send_option.equals("2")){ %>
								<option value = "d_id" <%if(field.equals("d_id")){%>selected<%} %>>받는 아이디</option>
								<%}else{ %>
								<option value = "s_id" <%if(field.equals("s_id")){%>selected<%} %>>보낸 아이디</option>
								<%} %>
								<option value = "comment" <%if(field.equals("comment")){%>selected<%} %>>내용</option>
							</select>
							<input name ="search" value = <%=search %>>
							<button>검색</button>
						</form>
					</td>	
				</tr>
			</table>
			<form action ="" name ="Form1" id = "Form1" >
			<%if(send_option.equals("1")){ %>
			<table width=800 border=1 style="background-color: gray;">
				<tr>
					<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
					<td width=50 class="header_font">No</td>
					<td width=100 class="header_font">보낸사람 </td>
					<td width=250 class="header_font">내용 </td>
					<td width=200 class="header_font">보낸시간</td>
					<td width=200 class="header_font">읽은시간</td>
					
				</tr>
				
			</table>
			<table width=800>
			<%
			
			int numbering_recieve = total_record_recieve - (page_now -1) * num_per_page;
			
			while(rs_receive.next()){
				String uid = rs_receive.getString("uid");
				String s_id = rs_receive.getString("s_id");
				String s_date = rs_receive.getString("s_date");
				String comment =rs_receive.getString("comment");
				String d_date = rs_receive.getString("d_date");
				String other_delete = rs_receive.getString("other_delete");
				
				if(comment.length() >=10){
					comment = comment.substring(0,10)+"....";
				}
				if(other_delete.equals("1")){	
				%>
				<tr>
					<td><input type="checkbox" name = "ap_check" value="<%=uid %>" ></td>
					<td width=50><%=numbering_recieve %></td>
					<td width=150><%=s_id %></td>
					<td width=200><a href ="view.jsp?uid=<%=uid%>&send_option=1"><%=comment %></a></td>
					<td width=200><%=s_date %></td>
					<td width=200><%=d_date %></td>
					
				</tr>
				<%}else{%>
				<tr>
					<td></td>
				</tr>	
				<%} %>
			<%	
			numbering_recieve--;
						
			}
			rs_receive.close();
			stmt_receive.close();
			con_receive.close();
			}else if(send_option.equals("2")){ %>
			
		<table width=800 border=1 style="background-color: gray;">
			<tr>
				<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
				<td width=50 class="header_font">No</td>
				<td width=100 class="header_font">받는사람 </td>
				<td width=250 class="header_font">내용 </td>
				<td width=200 class="header_font">보낸시간</td>
				<td width=200 class="header_font">읽은시간</td>
			</tr>
		</table>
		<table width=800>	
						
			<%	
			int numbering_send = total_record_send - (page_now -1) * num_per_page;
			
			while(rs_send.next()){
				String uid = rs_send.getString("uid");
				String d_id = rs_send.getString("d_id");
				String s_date = rs_send.getString("s_date");
				String comment =rs_send.getString("comment");
				String d_date =rs_send.getString("d_date");
				String my_delete = rs_send.getString("my_delete");
				if(comment.length() >=10){
					comment = comment.substring(0,10)+"....";
				}
				
				if(my_delete.equals("1")){
				%>
				
				<tr>
					<td><input type="checkbox" name = "ap_check" value="<%=uid %>" ></td>
					<td width=50><%=numbering_send %></td>
					<td width=100><%=d_id %></td>
					<td width=250><a href ="view.jsp?uid=<%=uid%>&send_option=2"><%=comment %></a></td>
					<td width=200><%=s_date %></td>
					<td width=200><%=d_date %></td>
				</tr>
			<%}else{ %>	
				<tr>
					<td></td>
				</tr>
				
			<%}	
			numbering_send--;
			}
						
			rs_send.close();
			stmt_send.close();
			con_send.close();
			}else{ %>
			<table width=800 border=1 style="background-color: gray;">
				<tr>
					<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
					<td width=50 class="header_font">No</td>
					<td width=100 class="header_font">보낸사람 </td>
					<td width=250 class="header_font">내용 </td>
					<td width=200 class="header_font">보낸시간</td>
					<td width=200 class="header_font">읽은시간</td>
					
				</tr>
		
			</table>
			<table width=800>
			<%
			
			int numbering_nonview = total_record_nonview - (page_now -1) * num_per_page;
			
			while(rs_nonview.next()){
				String uid = rs_nonview.getString("uid");
				String s_id = rs_nonview.getString("s_id");
				String s_date = rs_nonview.getString("s_date");
				String comment =rs_nonview.getString("comment");
				String d_date = rs_nonview.getString("d_date");
				String other_delete = rs_nonview.getString("other_delete");
				
				if(comment.length() >=10){
					comment = comment.substring(0,10)+"....";
				}
				if(other_delete.equals("1")){	
				%>
				<tr>
					<td><input type="checkbox" name = "ap_check" value="<%=uid %>" ></td>
					<td width=50><%=numbering_nonview %></td>
					<td width=150><%=s_id %></td>
					<td width=200><a href ="view.jsp?uid=<%=uid%>&send_option=1"><%=comment %></a></td>
					<td width=200><%=s_date %></td>
					<td width=200><%=d_date %></td>
					
				</tr>
				<%}else{%>
				<tr>
					<td></td>
				</tr>	
				<%} %>
			<%	
			numbering_nonview--;
						
			}
			rs_nonview.close();
			stmt_nonview.close();
			con_nonview.close();
						
					}
			
			if(send_option.equals("1")){
				if(total_record_recieve == 0){
					out.print("<tr><td colspan=5 align=center height=100> 받은 메시지가 없습니다. </td></tr>");
					
				}
			}else if(send_option.equals("2")){	
				if(total_record_send == 0){
					out.print("<tr><td colspan=5 align=center height=100> 보낸 메시지가 없습니다. </td></tr>");
				}
			}else{
				if(total_record_nonview == 0){
					out.print("<tr><td colspan=5 align=center height=100> 읽지 않은 메시지가 없습니다. </td></tr>");
					
				}
				
			}
			%>	
			
			</table>
			<p></p>
			<table width=800>
				<tr>
					<td style="text-align: left" width=600>
						<a href ="list.jsp?send_option=1">[새로고침]</a>
						
					</td>
					<td width=100><a href ="javascript:selfClose()">[닫기]</a></td>
					<td style="text-align: right" width=100>
						<a onClick="check_select();return false;" style="cursor:pointer;">[선택삭제]</a>
					</td>
				</tr>
				
			</table>
		
		</td>
	</tr>		
</table>
</center>
</body>
</html>