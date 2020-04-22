<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver"%>
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
                 <div class="container">
                     <h2><u>Grocery Products:</u></h2><hr>
                     
                 <%
                 
                            try
                            {

                                Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                 Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                                 String sql="select * from products";   

                                 Statement stmt=Conn.createStatement();
                                 ResultSet rs=stmt.executeQuery(sql);
                                 int x=1;
                                while(rs.next())
                                {
                                    
                                    if(x==1)
                                    {
                                    %>    
                                        <div class='row form-group'>
                                        <div class='col-md-3'>
                                     <%           
                                    }
                                    else
                                    {
                                        %>
                                         <div class='col-md-3'>
                                        <%
                                    }
                                   %>
          <a href="ShowItems.jsp?ID=<% out.print(rs.getString(1)); %>">
              
                  <div class="product-box">
                    <div class="product-img">
                      <img src="assets/products/<%  out.print(rs.getString(8)); %>" style="width:250px;height:250px">
                    
                    </div>
                    <div class="product-detail">
                      <h5 style="font-size:10px"><a href="#"><% out.print(rs.getString(2)+" -> " +rs.getString(3)+" -> " +rs.getString(4)); %></a></h5>
                      <div class="rating-nd-price">
                        <strong>MRP:<i class="fa fa-dollar" aria-hidden="true"></i><% out.print(rs.getString(7)+" /pr " +rs.getString(5)); %></strong>
                        
                      </div>
                      <div class="aurthor-detail">
                        <span>View Items Details</span>
                       
                      </div>
                    </div>
                  </div>
               </a>
             </div>
        <%
            
        if(x>=4)
        {
                  x=0;
                  out.print("</div>");
        }
        x++;

                                    
                                    
                                    
                                    
                                    
                                }
                                    
                                stmt.close();
                                rs.close();
                                Conn.close();
                                 
                            }   
                            catch(Exception exp)
                            {
                                        out.println(exp);
                            }

                 
                 %>
                     
                     
                     
                 
                 
                 
                 
                 
        </div>
                 <jsp:include page="footer.jsp"></jsp:include>
	</div>
	<!-- End Site Wrapper -->

	<!-- Contribute JS Files -->
	<!--<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> -->
	<script type="text/javascript" src="assets/js/egprojets.lib.js"></script>
	<!-- End Contribute JS Files -->

	<!-- Custom JS Files -->
	<script type="text/javascript" src="assets/js/egprojets.custom.js"></script>
    <!-- Custom JS Files -->
</body>

</html>            
