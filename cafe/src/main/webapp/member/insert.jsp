<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
       <%@ include file = "/admin/include/db.jsp" %>

    <% 
    request.setCharacterEncoding("utf-8");
    
    String id = request.getParameter("m_id");
    String pass = request.getParameter("pass1");
    String name = request.getParameter("name1");
    
    String b1 = request.getParameter("birthday1");
    String b2 = request.getParameter("birthday2");
    String b3 = request.getParameter("birthday3");
    
    String gender = request.getParameter("gender");
    
    String e1 = request.getParameter("email1");
    String e2 = request.getParameter("email2");
    
    String p1 = request.getParameter("phone1");
    String p2 = request.getParameter("phone2");
    String p3 = request.getParameter("phone3");
    
    String z = request.getParameter("zipcode");
    String z1 = request.getParameter("zipcode1");
    String z2 = request.getParameter("zipcode2");
    String z3 = request.getParameter("zipcode3");
    String z4 = request.getParameter("zipcode4");
    
    String signdate = request.getParameter("signdate");
        
    
    String sql = "insert into member values ('"+id+"','"+pass+"','"+name+"','"+b1+"','"+b2+"','"+b3+"','"+gender+"','"+e1+"','"+e2+"','1','"+z+"','"+z1+"','"+z2+"','"+z3+"','"+z4+"','"+p1+"','"+p2+"','"+p3+"','"+signdate+"','n')";
    
    Connection con = DriverManager.getConnection(url, user, password);
    Statement stmt = con.createStatement();
    stmt.executeUpdate(sql);
    //out.print(sql);
           
    %>
    <script>
    	location.href = "/";
    </script>
    