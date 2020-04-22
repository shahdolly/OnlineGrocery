<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*"%>
<%
                             ArrayList SessionCartID = new ArrayList();
                             session.setAttribute("SessionCartItemID", SessionCartID);
                        
                            ArrayList SessionCartQ=new ArrayList();
                            session.setAttribute("SessionCartItemQ", SessionCartQ);

%>



<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>Food Lover </title>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="assets/css/flaticon.css" />
    <link href="assets/css/new.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/style.css" />
	<link rel="stylesheet" href="assets/css/responsive.css" />
</head>

<body>
<jsp:include page="header.jsp"></jsp:include>

                   <div style="margin-top:130px"></div>
                 
          <div class="container">
          
		<div class="row">
		<div class="col-lg-6">
			<h4>About Grocery Online Store </h4>
                        <span class="byline"><h1>Why You order Food Products from Grocery Online Store?
                        <br> Ans: Your Taste we Know Better! </h1></span> 
           </div>
		
			<div class="col-lg-6">
		
          
                <p align="left"><h2>Thanks From Grocery Online Store Team </h2></p>
                <p align="left"><h2>Your Order Placed Successfully</h2> </p>
            
              <div align="left" class="style4"></div>
              
              <h3>User Name :<% out.print((String)session.getAttribute("UserFullname")); %></h3></span>
          
              <span class="content"> <h3>Your order is placed and order ID - <% out.print((String)session.getAttribute("OrderID")); %></h3></span>
           
           
		 
		</div>
	  </div>
  </div>
                   
                   
                    <jsp:include page="footer.jsp"></jsp:include>
	</div>
                 
                 
                    <script type="text/javascript" src="assets/js/jquery.min.js"></script>

        
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
        
        
    <!-- Custom JS Files -->
</body>

</html>            
