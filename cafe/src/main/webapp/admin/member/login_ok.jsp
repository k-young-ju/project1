<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/db.jsp" %>


<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("m_id");
	String pass = request.getParameter("m_pass");
	
		
    String sql = "select * from member where id='"+id+"' and password = '"+pass+"'";
    out.print(sql);
    Connection con = DriverManager.getConnection(url, user, password);
    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery(sql);
    //out.print(sql);
    
    String mem_id = "";
    String mem_pass = "";
    String mem_name = "";
    String mem_level = "";
    
    if(rs.next()){
    	mem_id = rs.getString("id");
    	mem_pass = rs.getString("password");
    	mem_name = rs.getString("name");
    	mem_level = rs.getString("level");
    }
    
    if(id.equals(mem_id) && pass.equals(mem_pass)){
    	
    	session.setAttribute("id", id);
    	session.setAttribute("name", mem_name);
    	session.setAttribute("level", mem_level);
    	
    }else{
    	
    }
   
   //out.print(session.getAttribute("id"));
 %>
 
 <script>
 	opener.document.location.reload();
 	self.close();
 </script> 
    
