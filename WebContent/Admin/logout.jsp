<%-- 
    Document   : logout
    Created on : Apr 10, 2018, 1:25:03 PM
    Author     : saini2018
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 session.invalidate(); 
 response.sendRedirect("../index.jsp");
%>