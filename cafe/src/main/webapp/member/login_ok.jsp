<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/include/db.jsp" %>


<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("m_id");
	String pass = request.getParameter("m_pass");
	
	
	
	//id 존재 여부
	String sql_count = "select count(*) from member where id='"+id+"'";
	Connection con_count = DriverManager.getConnection(url, user, password);
    Statement stmt_count = con_count.createStatement();
    ResultSet rs_count = stmt_count.executeQuery(sql_count);
	
    int id_count = 0;
    if(rs_count.next()){
    	id_count = rs_count.getInt(1);
    }
	
    if(id_count > 0){ //id 존재한다면
	    String sql = "select * from member where id='"+id+"'";
	    out.print(sql);
	    Connection con = DriverManager.getConnection(url, user, password);
	    Statement stmt = con.createStatement();
	    ResultSet rs = stmt.executeQuery(sql);
	    	    
	    String mem_id = "";
	    String mem_pass = "";
	    String mem_name = "";
	    String mem_level = "";
	    String delete_id = "";
	    
	    if(rs.next()){
	    	mem_id = rs.getString("id");
	    	mem_pass = rs.getString("password");
	    	mem_name = rs.getString("name");
	    	mem_level = rs.getString("level");
	    	delete_id = rs.getString("delete_id");
	    }
	    if(delete_id.equals("y")){%>
	     <script>
    	 	alert("탈퇴한 회원입니다. \n로그인페이지로 이동합니다.");
    	 	location.href="login.jsp";
    	 </script> 
	    	
	   <% }else{
			    if(id.equals(mem_id) && pass.equals(mem_pass)){ //매칭된 회원이 있다면
			    	
			    	session.setAttribute("id", id);
			    	session.setAttribute("name", mem_name);
			    	session.setAttribute("level", mem_level);
			    	
			   }else{
			    	%>
			    	 <script>
			    	 	alert("비밀번호가 틀립니다. \n로그인 페이지로 다시 이동합니다.");
			    	 	location.href="login.jsp";
			    	 </script> 
			    	<%    	    	
			    }
	  	 }	    
    }else{//존재 안한다면
%>
			 <script>
			 	alert("입력하신 아이디는 존재하지 않습니다. \n로그인 페이지로 다시 이동합니다.");
			 	location.href="login.jsp";
			 </script> 
<%    	
    }
   
 %>
 
 <script>
 	opener.document.location.reload();
 	self.close();
 </script> 
    
