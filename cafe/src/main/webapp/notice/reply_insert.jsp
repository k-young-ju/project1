<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header2.jsp" %>

<%

	request.setCharacterEncoding("utf-8");
	
	String uploadPath = "C:\\jsp\\cafe\\WebContent\\upload";
	
	int size = 10*1024*1024;
	
	String file1 = "";
	String file1_name ="";
	String file1_rename = "";
	
	
	MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
	
	
	String code = multi.getParameter("code");
	String gongji = multi.getParameter("gongji");
	String subject = multi.getParameter("subject");
	String comment = multi.getParameter("comment");
	String thread = multi.getParameter("thread");
	String fid = multi.getParameter("fid");
	if(multi.getParameter("gongji").equals("공지글답변")){
		gongji = "1";
	}else if(multi.getParameter("gongji").equals("비밀글답변")){
		gongji = "3";
	}else{
		gongji = "2";
	}
	
	Enumeration files=multi.getFileNames();
	
	file1 = (String)files.nextElement();
	file1_name = multi.getOriginalFileName(file1);
	file1_rename = multi.getFilesystemName(file1);
	
	if(file1_name != null){
		
	}else{
		file1_name ="";
		file1_rename = "";
	}
		

	
	String sql_fid = "select thread,right(thread,1) as thread_right from "+code+" where fid = "+fid+" and length(thread) = length('"+thread+"')+1 and locate('"+thread+"',thread)=1 order by thread desc limit 1";
	
	Connection con_count = DriverManager.getConnection(url, user, password);
	Statement stmt_count  = con_count.createStatement();
	ResultSet rs_count = stmt_count.executeQuery(sql_fid);
	
	//out.print(sql_fid);
	
		
	String o_thread = "";
	String r_thread = "";
	String thread_head = "";
	String new_thread = "";
	char thread_foot = 'a';
	
	if(rs_count.next()){
		o_thread  = rs_count.getString("thread");
		//끝자리 +1 처리
		r_thread = rs_count.getString("thread_right");
		thread_foot = (char)(r_thread.charAt(0)+1);
			
	}
	
	if(o_thread != null && o_thread != ""){
		thread_head = o_thread.substring(0,o_thread.length()-1);
		new_thread = thread_head + thread_foot;
	}else{
		
		new_thread = thread + "A";
	}
		
	rs_count.close();
	stmt_count.close();
	con_count.close();
	
	Date today = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String signdate = sd.format(today);
	
	String sql = "insert into "+code+" (id,name,subject,comment,gongji,signdate,file,file_o,fid,thread) values ('"+session_id+"','"+session_name+"','"+subject+"','"+comment+"','"+gongji+"','"+signdate+"','"+file1_rename+"','"+file1_name+"',"+fid+",'"+new_thread+"')";
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	out.print(sql);
	

%>

<script>
	location.href = "list.jsp?code=<%=code%>";
</script>