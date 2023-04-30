<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/admin/include/header2.jsp" %>

<%


request.setCharacterEncoding("utf-8");
String code = request.getParameter("code");

	
String sql_count = "select count(*) from "+code+" where gongji != '1'";

Connection con_count = DriverManager.getConnection(url, user, password);
Statement stmt_count = con_count.createStatement();
ResultSet rs_count = stmt_count.executeQuery(sql_count);
//out.print(sql_count);

String sql_count_gongji = "select count(*) from "+code+" where gongji = '1'";

Connection con_count_gongji = DriverManager.getConnection(url, user, password);
Statement stmt_count_gongji = con_count_gongji.createStatement();
ResultSet rs_count_gongji = stmt_count_gongji.executeQuery(sql_count_gongji);

int total_record = 0;
int total_record_gongji = 0;
if(rs_count.next()){
	
total_record = rs_count.getInt("count(*)");

}

if(rs_count_gongji.next()){
	total_record_gongji = rs_count_gongji.getInt("count(*)");
}

String sql = "select * from "+code+" where gongji !='1' order by fid desc, thread asc limit 0,4"; 

Connection con = DriverManager.getConnection(url, user, password);
Statement stmt = con.createStatement();
ResultSet rs = stmt.executeQuery(sql);
//out.print(sql);

String sql_gongji = "select * from "+code+" where gongji ='1' order by fid desc, thread asc limit 0,4";


Connection con_gongji = DriverManager.getConnection(url, user, password);
Statement stmt_gongji = con_gongji.createStatement();
ResultSet rs_gongji = stmt_gongji.executeQuery(sql_gongji);
//out.print(sql_gongji);

%>

<style>
	
	.td_title{
		background-color:gray;
		color:white;
		font-weight: bold;
		text-align: center;
		height:45px;
	}
	
	td{
		text-align: center;
	}
	
	.td_comment{
		border-bottom: 1px solid black;
		height:45px;
	}
	.font_title{
		font-size: 30px;
		font-weight: bold;
	}
</style>

<p></p>
<table width =1100 border=0 >
	<tr>
		<td style="vertical-align: top">
			<table width=500 align="center">
				<tr>
					<td class="font_title">자주 묻는 질문</td>
				</tr>
			</table>
			<table width=500>
				<tr>
					<td colspan = 5 style="text-align: right"><a href = "list_gongji.jsp?code=<%=code%>">더보기=></a></td>
				</tr>
			</table>
			<table width=500 border=1 align="center">
				
				<tr>
					<td width =80 class="td_title">자주 묻는 질문</td>
					<td width = 200 class="td_title">제목</td>
					<td width = 70 class="td_title">글쓴이</td>
					<td width = 100 class="td_title">날짜</td>
					<td width = 50 class="td_title">조회수</td>
				</tr>
			</table>
			<table width=500 border=0 >	
				<%
				
				
				
					while(rs_gongji.next()){
						
						int uid = rs_gongji.getInt("uid");
						String subject = rs_gongji.getString("subject");
						String comment = rs_gongji.getString("comment");
						String gongji = rs_gongji.getString("gongji");
						int com_count = rs_gongji.getInt("com_count");
						String name = rs_gongji.getString("name");
						String id = rs_gongji.getString("id");
						String signdate = rs_gongji.getString("signdate").substring(0,10);
						int ref = rs_gongji.getInt("ref");
						
						if(subject.length() >60){
							subject = subject.substring(0,20)+"...";
						}else{
							
						}
				%>
				<tr>
					<td width =80 style="color:red" class="td_comment"><b><%=total_record_gongji %></b></td>
					<td width = 200 class="td_comment"><b>
						<table border=0>
							<tr>
								<td width = 10 ></td>
								<td style="text-align: left" >
									<a href="view.jsp?code=<%=code%>&uid=<%=uid%>" style="color:red"><%=subject %><span style="color: blue">[<%=com_count %>]</span></a></b>
								</td>
							</tr>
						</table>			
					</td>
					<td width = 70 class="td_comment"><%=name %></td>
					<td width = 100 class="td_comment"><%=signdate %></td>
					<td width = 50 class="td_comment"><%=ref %></td>
				</tr>
				
				<%	
					total_record_gongji--;
					}
					rs_gongji.close();
					stmt_gongji.close();
					con_gongji.close();
				//}
				%>
			</table>	
						
		</td>
		<td width=100></td>
		<td style="vertical-align: top">	
			<table width=500 align="center">
				<tr>
					<td class="font_title">Q&A</td>
				</tr>
			</table>
			<table width=500>
				<tr>
					<td colspan = 5 style="text-align: right"><a href = "list_normal.jsp?code=<%=code%>">더보기=></a></td>
				</tr>
			</table>
			<table width=500 border=1 align="center" style="vertical-align: top">
				<tr>
					<td width =80 class="td_title">No</td>
					<td width = 200 class="td_title">제목</td>
					<td width = 70 class="td_title">글쓴이</td>
					<td width = 100 class="td_title">날짜</td>
					<td width = 60 class="td_title">조회수</td>
				</tr>
			</table>
				
			<%
			
			
				while(rs.next()){
					
					int uid = rs.getInt("uid");
					String subject = rs.getString("subject");
					String gongji = rs.getString("gongji");
					String name = rs.getString("name");
					String id = rs.getString("id");
					int com_count = rs.getInt("com_count");
					String signdate = rs.getString("signdate").substring(0,10);
					int ref = rs.getInt("ref");
					String file1 = rs.getString("file");
					String thread = rs.getString("thread");
					int len_thread =thread.length();
					
					
					if(subject.length() >20){
						subject = subject.substring(0,20)+"...";
						
					}
			%>
			<table width=500 border=0 >
				<tr>
					<td width =80 class="td_comment"><%=total_record%></td>
					<td width = 200 class="td_comment">
						<table>
							<tr>
								<td width = 10 ></td>
								<td style="text-align: left" >
									<%
									if(len_thread >= 2){
										for(int i=2; i<=len_thread; i++){
											out.print("&nbsp;&nbsp");
										}
									%>
										<img src="img/thread_new.gif">
									<%}%>
									
									<% 
									
									if(gongji.equals("3")){
											if(session_level !=null && session_level.equals("10")){
									%>
												<a href="view.jsp?code=<%=code%>&uid=<%=uid%>"><%=subject %><span style="color: blue">[<%=com_count %>]</span></a>	
											<%}else if(session_id != null && session_id.equals(id)){%>
									
												<a href="view.jsp?code=<%=code%>&uid=<%=uid%>""><%=subject %><span style="color: blue">[<%=com_count %>]</span></a>	
												
											<%}else{ %>
												<%=subject %>
											<%
											  } 
									}else{
										
									%>	
									<a href="view.jsp?code=<%=code%>&uid=<%=uid%>"><%=subject %><span style="color: blue">[<%=com_count %>]</span></a>
									<%} %>
									
									<%if(gongji.equals("3")){%><img src ="img/icon_secret.gif"><%}%>
									<%if(!file1.equals("")){%><img src ="/img/file1.png" width=12><%}%>
								</td>
							</tr>
						</table>		
					</td>
					<td width = 70 class="td_comment"><%=name%></td>
					<td width = 100 class="td_comment"><%=signdate%></td>
					<td width = 60 class="td_comment"><%=ref%></td>
				</tr>
				
					<%
					total_record--;
					}
					rs.close();
					stmt.close();
					con.close();
					
					if(total_record == 0){
						out.print("<tr><td colspan=5 align=center height=100>작성하신 글이 없습니다. </td></tr>");
						
					}
					%>	
			</table>
						
			
		</td>
	</tr>
</table>
<p></p>			
<table width=1100 align="center" border=0>
	<tr>
		<td style="text-align: left"><a href="list.jsp?code=<%=code%>">[새로고침]</a></td>
		<td style="text-align: right">
			<%if(session_id != null && session_id != ""){ %>
			<a href="write.jsp?code=<%=code%>" style="cursor: pointer">[글쓰기]</a>
			<%}else{ %>
			<a onclick="alert('로그인 후 사용 가능합니다.')" style="cursor: pointer">[글쓰기]</a>
			<%} %>
		</td>
	</tr>
</table>
<table>
	<tr>
		<td height=300></td>
	</tr>
</table>

<%@ include file = "/admin/include/footer.jsp" %>

