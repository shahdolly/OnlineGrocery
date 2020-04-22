<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<section id="container">

<header class="header fixed-top clearfix">
<!--logo start-->
<div class="brand">
    <a href="index.php" class="logo">
        Grocery Store
    </a>
    <div class="sidebar-toggle-box">
        <div class="fa fa-bars"></div>
    </div>
</div>
</header>

<aside>
    <div id="sidebar" class="nav-collapse">
        <div class="leftside-navigation">
            <ul class="sidebar-menu" id="nav-accordion">
               
                <li><a href="index.jsp">Home</a></li>
             
                <li><a href="Products.jsp">Products</a></li>
                 <li><a href="AllOrder.jsp">All Orders</a></li>
                        <li><a href="CurrentOrders.jsp">Current Orders</a></li>
                        <li><a href="SentOrders.jsp">Sent Orders</a></li>
               
                 <li><a href="AdminPass.jsp">Admin Password</a></li>
                      <li><a href="Register.jsp">Customers</a></li>
               
                  
                      
                <li><a href="logout.jsp">Logout</a></li>
            </ul> 
                        </div>
       
    </div>
</aside>