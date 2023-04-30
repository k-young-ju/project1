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
	
	String uid = multi.getParameter("uid");
	String code = multi.getParameter("code");
	String gongji = multi.getParameter("gongji");
	String subject = multi.getParameter("subject");
	String comment = multi.getParameter("comment");
	
	Enumeration files=multi.getFileNames();
	
	file1 = (String)files.nextElement();
	file1_name = multi.getOriginalFileName(file1);
	file1_rename = multi.getFilesystemName(file1);
					
	String sql;
	
	if(file1_name != null){
		sql = "update "+code+" set gongji='"+gongji+"',subject = '"+subject+"',comment='"+comment+"',file='"+file1_rename+"',file_o='"+file1_name+"' where uid="+uid+"";
	}else{
		
		sql = "update "+code+" set gongji='"+gongji+"',subject = '"+subject+"',comment='"+comment+"' where uid="+uid+"";
		file1_rename= "";
		file1_name="";
	}
	
	
	Connection con = DriverManager.getConnection(url, user, password);
	Statement stmt = con.createStatement();
	stmt.executeUpdate(sql);
		

%>

<script>
	location.href = "list.jsp?code=<%=code%>";
</script>