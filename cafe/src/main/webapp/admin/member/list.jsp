<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header2.jsp" %>

<%


request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");
String id = request.getParameter("id");


String field = "";
String search = "";

if(request.getParameter("search") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
	
}
	
String sql_count = "select count(*) from member";

if(request.getParameter("search") != null){
	sql_count = "select count(*) from member where "+field+" like '%"+search+"%'";
}

Connection con_count = DriverManager.getConnection(url, user, password);
Statement stmt_count = con_count.createStatement();
ResultSet rs_count = stmt_count.executeQuery(sql_count);
//out.print(sql_count);

int total_record = 0;
if(rs_count.next()){
	
total_record = rs_count.getInt("count(*)");
}


int page_now = 1;
if(request.getParameter("page_now") !=null){
	page_now = Integer.parseInt(request.getParameter("page_now"));
}else{
	page_now = 1;
}
int num_per_page = 8;
int page_per_block = 5;
int total_page = 0;
int first = 0;

total_page = (int)Math.ceil(total_record / (double)num_per_page); 
first = num_per_page * (page_now - 1); 

String sql = "select * from member"; 

if(request.getParameter("search") != null){
	sql = "select * from member wher and "+field+" like '%"+search+"%'"; 
}

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
//out.print(sql);

%>

<style>
	
	.td_title{
		background-color:gray;
		color:white;
		font-weight: bold;
		text-align: center;
	}
	
	td{
		text-align: center;
	}
	
</style>
<table width=1100 border=0>
	<tr>
		<td class="title_font" style = "text-align: left"><b>회원관리 Total : <%=total_record %></b></td>
		<td width=350>
			<form method="get">
				<input type="hidden" name = "code" value ="<%=code%>">
				<select name = "field">
					<option value = "id" <%if(field.equals("id")){%>selected<%} %>>아이디</option>
					<option value = "name" <%if(field.equals("name")){%>selected<%} %>>이름</option>
				</select>
				<input name ="search" value = <%=search %>>
				<button>검색</button>
			</form>
		</td>
	</tr>
</table>
<p></p>

<script>

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
	if(confirm('회원정보를 삭제하시겠습니까?')){
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
		
		location.href="delete_select.jsp?ch_ids="+check_hide;
		
	
	
}


</script>
<form action ="" name ="Form1" id = "Form1" >
<table width=1100 border=1 align="center">
	<tr>
		<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
		<td width =80 class="td_title">No</td>
		<td width = 120 class="td_title">아이디</td>
		<td width = 120 class="td_title">이름</td>
		<td width = 130 class="td_title">회원등급</td>
		<td width = 150 class="td_title">생년월일</td>
		<td width =80 class="td_title">성별</td>
		<td width = 200 class="td_title">전화번호</td>
		<td width = 220 class="td_title"><b>상세정보</b></td>
		
	</tr>
</table>
<%	

int numbering = total_record - (page_now -1) * num_per_page;
int count = 0;
	while(rs.next()){
		id = rs.getString("id");
		String name = rs.getString("name");
		
		String level = rs.getString("level");
		
		String b1 = rs.getString("birth1");
		String b2 =	rs.getString("birth2");
		String b3 = rs.getString("birth3");
		
		String gender = "";
			if(rs.getString("gender").equals("M")){
				 gender = "남자";
			}else{
				gender = "여자";
			}
			
		String p1 = rs.getString("phone1");
		String p2 = rs.getString("phone2");
		String p3 = rs.getString("phone3");
		
		String signdate = rs.getString("signdate");
		
				
		
%>
<table width=1100 border=0>
	<tr>
		<td><input type="checkbox" name = "ap_check" value="<%=id %>" ></td> 
		<td width =80><%=numbering %></td>
		<td width = 120><%=id %></td>
		<td width = 120><%=name%></td>
		<td width = 130><%=level %></td>
		<td width = 150><%=b1 %>.<%=b2 %>.<%=b3 %></td>
		<td width =80><%=gender %></td>
		<td width = 200><%=p1 %>-<%=p2 %>-<%=p3 %></td>
		<td width = 220><a href = "view.jsp?code=<%=code %>&id=<%=id %>">상세정보확인</a></td>
		
		
	</tr>
	
		<%
		
		numbering --;
		}
		rs.close();
		stmt.close();
		con.close();
		
		if(total_record == 0){
			out.print("<tr><td colspan=5 align=center height=100>가입한 회원이 없습니다. </td></tr>");
			
		}
		%>	
</table>
				
<table width=1100 align="center">
	<tr>
		<td align="center">
		<% 
		int total_block =0;
		int block = 0;
		int first_page = 0;
		int last_page = 0;
		int direct_page = 0;
		int my_page = 0;
		total_block = (int)Math.ceil(total_page / (double)page_per_block);
		block = (int)Math.ceil(page_now / (double)page_per_block);
		first_page = (block-1) * page_per_block;
		last_page = block * page_per_block;
		
		if(total_block <= block){
			last_page = total_page;
		}
		
		if(block ==1){%>
		<img src="/admin/img/btn_left.gif">&nbsp;&nbsp;
		<%
		}else{
			my_page = first_page;
		%>
			<a href ="list.jsp?code=<%=code%>&page_now=<%=my_page %>"><img src ="/admin/img/btn_left.gif"></a>&nbsp;&nbsp;
		<%
		}
		for(direct_page=first_page+1;direct_page<=last_page;direct_page++){
			if(page_now==direct_page){
		%>
				<font color=red><b><%=direct_page %></b></font>&nbsp;
		<%
			}else{
		%>		
			<b><a href="list.jsp?code=<%=code%>&page_now=<%=direct_page%>"><%=direct_page %></a></b>&nbsp;
		<%
		
			}	
		}
		
		if(block < total_block){
			my_page = last_page +1;
			
		%>	
			&nbsp;<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>"><img src="/admin/img/btn_right.gif"></a>
		
		<%
		}else{
		
		%>
			&nbsp;<img src="/admin/img/btn_right.gif">
		<%
		}
		%>	
		</td>
	</tr>
</table>
<table width=1100 align="center" border=0>
	<tr>
		<td style="text-align: left"><input type="button" onclick="location.href='/admin/member/list.jsp?code=<%=code%>'" value ="새로고침"></td>
		<td></td>
		<td style="text-align: right">
			<input type="button" onclick = "location.href = 'level_up.jsp?'" value ="등급변경">
			<input type="button" onclick="location.href='join.jsp?code=<%=code %>'" value ="회원가입">
			<button onClick="check_select();return false;" style="cursor:pointer;">선택삭제</button>
		</td>
		
	</tr>
</table>
</form>

<%@ include file = "/admin/include/footer.jsp" %>
