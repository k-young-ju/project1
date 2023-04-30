<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.*"%>
<%@page import="com.oreilly.servlet.multipart.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/header.jsp" %>

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
	
	Enumeration files=multi.getFileNames();
	
	file1 = (String)files.nextElement();
	file1_name = multi.getOriginalFileName(file1);
	file1_rename = multi.getFilesystemName(file1);
	
	if(file1_name != null){
		
	}else{
		file1_name ="";
		file1_rename = "";
	}
	
	
	String sql_fid = "select max(fid) as fid_max from "+code+"";
	
	Connection con_count = DriverManager.getConnection(url, user, password);
	Statement stmt_count  = con_count.createStatement();
	ResultSet rs_count = stmt_count.executeQuery(sql_fid);
	
	int fid = 1;
	if(rs_count.next()){
		if(rs_count.getInt("fid_max") > 0){
			fid = rs_count.getInt("fid_max") + 1;
		}else{
			fid = 1;
		}
		
	}
	
	rs_count.close();
	stmt_count.close();
	con_count.close();
	
	Date today = new Date();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String signdate = sd.format(today);
	
	String sql = "insert into "+code+" (id,name,subject,comment,gongji,signdate,file,file_o,fid,thread) values ('"+session_id+"','"+session_name+"','"+subject+"','"+comment+"','"+gongji+"','"+signdate+"','"+file1_rename+"','"+file1_name+"',"+fid+",'A')";
	//out.print(sql);
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
	
	

%>

<script>
	location.href = "list.jsp?code=<%=code%>";
</script>