<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.mysql.jdbc.Driver"%>
<%

try
{
	  ArrayList SessionCartID = new ArrayList();
      session.setAttribute("SessionCartItemID", SessionCartID);
  
      ArrayList SessionCartQ=new ArrayList();
      session.setAttribute("SessionCartItemQ", SessionCartQ);
      
      response.sendRedirect("index.jsp");
}
catch(Exception ex)
{
	
}
                          

%>
