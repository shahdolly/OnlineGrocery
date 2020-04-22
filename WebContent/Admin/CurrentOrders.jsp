<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<head>
<title>Food Lover | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<link href="css/font-awesome.css" rel="stylesheet"> 
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
</head>
<body>
<!-- Wrapper -->
<!-- Header -->
	 <jsp:include page="Header.jsp"></jsp:include>

  <section id="main-content">
  <section class="wrapper">
    <!-- //market-->
   
    <!-- //market-->
    <div class="row">
      <div class="panel-body">
        <div class="col-md-12 w3ls-graph">
         <div class="row">
           <br>
        <h1>Current Orders Information From Customers!</h1>
                <hr>
          <div class="col-md-12">
              
              
       <table id="example" class="table table-striped" cellspacing="0" width="100%">
      <thead>
        <tr style="text-align: right!important">
          <th>OrderID</th>
          <th>Customer Id</th>
          <th>Address</th>
          <th>PinCode</th>
          <th>Paymenttype</th>
          <th>Total</th>
          <th>Tax</th>
          <th>Discount</th>
          
          <th style="background-image: none;">View Items</th>
       
        </tr>
      </thead>
	
	<%
	
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
        Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
        Statement stmt=Conn.createStatement();
		ResultSet rs=stmt.executeQuery("select * from orders where OrderStatus='P'");
		while(rs.next())
		{
					 out.print("<tr>");
                     out.print("<td>"+rs.getString(2)+"</td>");
					 out.print("<td>"+rs.getString(3)+"</td>");
					 out.print("<td>"+rs.getString(4)+"</td>");
					 out.print("<td>"+rs.getString(5)+"</td>");
					 out.print("<td>"+rs.getString(6)+"</td>");
					 out.print("<td>"+rs.getString(7)+"</td>");
                     out.print("<td>"+rs.getString(8)+"</td>");
                     out.print("<td>"+rs.getString(9)+"</td>");
                     
                     
                     out.print("<td><a href=ViewItem.jsp?vID="+rs.getString(2)+"><b>View</b></a> &nbsp;&nbsp; <a href=SentCourier.jsp?ID="+rs.getString(2)+"><b>Send Now</b></a></td>");
					 out.print("</tr>");
					
				     
					 
		}
  	}
	catch(Exception e)
	{
		out.print(e.getMessage());
	}
	%>
</table>
              
          </div>
        
 
      </div>
  

        </div>
      </div>
    </div>
      <br>
        <br>
        <br>
        <br>  <br>
        <br>
       
        
          
</section>
</section>

<jsp:include page="Footer.jsp"></jsp:include>
</div>
<script src="js/bootstrap.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>
 
</body>
</html>
