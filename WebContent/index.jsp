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
	
	<link rel="stylesheet" type="text/css" href="assets/engine1/style1.css" />
	<script type="text/javascript" src="assets/engine1/jquery.js"></script>
</head>

<body>
	
	
	
		 <jsp:include page="header.jsp"></jsp:include>
		 
		<div id="wowslider-container1" style="margin-top:85px">
	<div class="ws_images"><ul>
<li><img src="assets/data1/images/1.jpg" alt="1" title="1" id="wows1_0"/></li>
<li><img src="assets/data1/images/2.jpg" alt="2" title="2" id="wows1_1"/></li>
<li><img src="assets/data1/images/3.jpg" alt="3" title="3" id="wows1_2"/></li>
</ul></div>


	</div>

		
    <div class="container" style="margin-top:50px">
    <div class='row form-group'>
    <div class="col-lg-12">
    <h1>Introduction to Our Website:</h1>
    <p style="font-size:20px;line-height:40px;text-align:justify">
    GroceryOnlineStore.com (Innovative Retail Concepts Private Limited) is Canada’s largest online grocery store. With over 18,000 products and over a 1000 brands in our catalogue you will find everything you are looking for. Right from fresh Fruits and Vegetables, Rice and Dals, Spices and Seasonings to Packaged products, Beverages, Personal care products, Meats – we have it all. Choose from a wide range of options in every category, exclusively hand picked to help you find the best quality available at the lowest prices. Select a time slot for delivery and your order will be delivered right to your doorstep, anywhere in Canada. You can pay online using your debit / credit card or by cash on delivery. We guarantee on time delivery, and the best quality!.
    </p>
    
    </div>  
    </div>
    
    
                <div class='row form-group'>  
                     
                 <%
              
                            try
                            {

                            	 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                 Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                               

                                 String sql="SELECT * FROM `products` order by ID desc limit 4";   

                                 Statement stmt=Conn.createStatement();
                                 ResultSet rs=stmt.executeQuery(sql);
                                 
                                while(rs.next())
                                {
                                    
                                   
                                        %>
                                        
                  <%-- <div class='col-md-3'>
                  <a href="ShowItems.jsp?ID=<% out.print(rs.getString(1)); %>">
                      <div class="product-box">
                    <div class="product-img">
                    
                   <img src="assets/products/<%  out.print(rs.getString(8)); %>" style="width:250px;height:250px">
                       
                      <span class="sale-bacth">sale</span>
                    </div>
                 <div class="product-detail">
                      <h5 style="font-size:10px"><% out.print(rs.getString(2)+" -> " +rs.getString(3)+" -> " +rs.getString(4)); %></h5>
                      <div class="rating-nd-price">
                        <strong>MRP:<i class="fa fa-dollar" aria-hidden="true"></i><% out.print(rs.getString(7)+" /Per " +rs.getString(5)); %></strong>
                        
                      </div> --%>
                      <!-- <div class="aurthor-detail">
                        <span>View Items Details</span>
                       
                      </div> -->
                    </div>
                  </div>
               </a>
             </div>
             <%
             
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
        
        

                    


		</div>
		
		
                <jsp:include page="footer.jsp"></jsp:include>
                         <script type="text/javascript" src="assets/engine1/wowslider.js"></script>
<script type="text/javascript" src="assets/engine1/script.js"></script> 
             <script type="text/javascript" src="assets/js/jquery.min.js"></script>
	
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>  
         

                
	
	
</body>

</html>