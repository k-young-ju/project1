<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header2.jsp" %>

<%
request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");

String field = "";
String search = "";

if(request.getParameter("search") != null){
	field = request.getParameter("field");
	search = request.getParameter("search");
	
}
	
String sql_count = "select count(*) from "+code+"";

if(request.getParameter("search") != null){
	sql_count = "select count(*) from "+code+" where "+field+" like '%"+search+"%'";
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
int num_per_page = 3;
int page_per_block = 5;
int total_page = 0;
int first = 0;

total_page = (int)Math.ceil(total_record / (double)num_per_page); 
first = num_per_page * (page_now - 1); 

String sql = "select * from "+code+" order by uid desc limit "+first+","+num_per_page+""; 

if(request.getParameter("search") != null){
	sql = "select * from "+code+" where "+field+" like '%"+search+"%' order by uid desc limit "+first+","+num_per_page+""; 
}

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
//out.print(sql);


%>

<style>
	h3{
	color: red;
	font-weight: bold;
	
	}
	
	.td_title{
		background-color:gray;
		color:white;
		font-weight: bold;
		text-align: center;
	}
	
	td{
		text-align: center;
	}
	iframe{
	display:block;
	padding:0;
	margin:0;
	}
	.title_font{
		text-align:center;
		font-family: 'aggro';
		font-size: 35px;
		font-weight: bold;
	}
	.count_font{
		font-family: 'choice';
		font-size:20px;
	}
</style>
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
	
	location.href="delete_select.jsp?code=<%=code%>&uids="+check_hide;
	
}
</script>
<table border=0 height=1000 width=100%  >
	<tr>
		<td height=20></td>
	</tr>
	<tr>
		<td style="vertical-align: top">
			<center>
			<table width=1100 border=0>
				<tr>
					<td colspan=2 class="title_font">영상 게시판 </td>
				</tr>
				<tr>
					<td style="text-align: left" class = "count_font">총 게시글 수 : <%=total_record %></td>
					
					<td width=350>
						<form method="get">
							<input type="hidden" name = "code" value ="<%=code%>">
							<select name = "field">
								<option value = "subject" <%if(field.equals("subject")){%>selected<%} %>>운동명</option>
								<option value = "comment_health" <%if(field.equals("comment_health")){%>selected<%} %>>운동설명</option>
								<option value = "name" <%if(field.equals("name")){%>selected<%} %>>작성자</option>
							</select>
							<input name ="search" value = <%=search %>>
							<button>검색</button>
						</form>
					</td>
				</tr>
			</table>
			<p></p>
			<form name ="Form1" id = "Form1">
			<table width=1100 border=1 align="center">
				<tr>
					<td><input type = "checkbox" name = "all" value="checkbox" onclick = "checkall()"></td>
					<td width =80 class="td_title">No</td>
					<td width = 560 class="td_title">영상</td>
					<td width = 100 class="td_title">운동명</td>
					<td width = 260 class="td_title">운동설명</td>
					<td width = 60 class="td_title">조회수</td>
				</tr>
			</table>
				
				
			<%
			int numbering = total_record - (page_now -1) * num_per_page;
			int num = 0;
			
				while(rs.next()){
					int uid = rs.getInt("uid");
					String subject = rs.getString("subject");
					String tb_video = rs.getString("tb_video");
					String comment_health = rs.getString("comment_health");
					String name = rs.getString("name");
					String id = rs.getString("id");
					int com_count = rs.getInt("com_count");
					String signdate = rs.getString("signdate").substring(0,10);
					int ref = rs.getInt("ref");
					
					if(comment_health.length() >60){
						comment_health = comment_health.substring(0,60)+"...";
						
					}
			%>
				<table width=1100 border=0 style="border-bottom:1px solid black;padding:10px" >
					<tr>
						<td width=20><input type="checkbox" name = "ap_check" value='<%=uid %>' ></td>
						<td width = 80 align=center style="text-align: center">
							<b><%=numbering %></b></td>
							<td width = 560><iframe width="560" height="315" src="https://www.youtube.com/embed/<%=tb_video %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></td>
							<td width = 100><a href = "view.jsp?code=<%=code%>&uid=<%=uid%>"><h2><%=subject %><div style="color: blue">[<%=com_count %>]</div></h2></a></td>
							<td width = 260><%=comment_health %></td>
							<td width = 60><%=ref %></td>
							
							
						</td>	
				
					</tr>
				</table>	
				<%	numbering --;
					}
					rs.close();
					stmt.close();
					con.close();
					
					if(total_record == 0){
						out.print("<tr><td colspan=5 align=center height=100>작성하신 글이 없습니다. </td></tr>");
						
					}
					%>	
			
							
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
					<img src="img/btn_left.gif">&nbsp;&nbsp;
					<%
					}else{
						my_page = first_page;
					%>
						<a href ="list.jsp?code=<%=code%>&page_now=<%=my_page %>"><img src ="img/btn_left.gif"></a>&nbsp;&nbsp;
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
						&nbsp;<a href="list.jsp?code=<%=code%>&page_now=<%=my_page%>"><img src="img/btn_right.gif"></a>
					
					<%
					}else{
					
					%>
						&nbsp;<img src="img/btn_right.gif">
					<%
					}
					%>	
					</td>
				</tr>
			</table>
			<table width=1100 align="center" border=0>
				<tr>
					<td style="text-align: left"><input type = "button" value="새로고침" onclick="location.href='list.jsp?code=<%=code%>'"></td>
					<td style="text-align: right">
						<input type="button" value="글쓰기" onclick="location.href='write.jsp?code=<%=code%>'" style="cursor: pointer">
					</td>
					<td width=100><input type="button" onClick="check_select();return false;" value="선택삭제"></td>
				</tr>
			</table>
			</center>
		</td>
	</tr>
</table>			

<%@ include file="/admin/include/footer.jsp" %>
