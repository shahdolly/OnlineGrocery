<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>


<%



        String A="",B="",C="",D="",E="";
        String bs="";
        String msg="";
        String Name="",Address="";
        int Total=0;
       
                    A = String.valueOf(request.getParameter("vID"));
         
                    try
                    {
                      String UserID=(String)session.getAttribute("UserID");
                      Class.forName("com.mysql.jdbc.Driver");
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                      Statement stmt1=Conn.createStatement();
                      
                      ResultSet rs1=stmt1.executeQuery("select * from orders where OrderID="+A);
                      int c=1;
                      while(rs1.next())
                      {
                          Name=rs1.getString(3);
                          Address=rs1.getString(4)+" , "+rs1.getString(5);
                          B=rs1.getString(11);
                          C=rs1.getString(11);
                          D=rs1.getString(10);
                          
                          
                      }
                   
                      Statement stmt2=Conn.createStatement();
                      ResultSet rs2=stmt2.executeQuery("select * from tbl_register where ID="+Name);
                     
                      while(rs2.next())
                      {
                          Name=rs2.getString(2);
                      }
                      
                      
                      

                    }
                    catch(Exception ee)
                    {
                        out.println(ee);
                    }

	
        
                   

                              


%>

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
         <div class="container">
                    <div class="main-heading-holder">
					<div class="main-heading style-1">
						<h1 align="center">Previous <span class="theme-color">Placed Order</span> Information</h1>
					</div>
				</div>

<div class="container">
    <br />

  
    <br />

    <div class="row">

        <div class="col-md-12"> 




          

       
        
        <table style="width: 1000px; height: 85px; padding: 0px; background-image:url(etec.jpg) ">
        <tr>
            <td colspan="5" class="style19">

            </td>
        </tr>
        <tr>
            <td class="style3">
                Order No.</td>
            <td style="width: 305px; height: 32px">
                <% out.print(A); %>
            </td>
            <td class="style14">
                Date:</td>
            <td class="style9">
               <% out.print(B); %>
            </td>
            <td style="height: 32px">
            </td>
        </tr>
        <tr>
            <td style="text-align: left;width:100px " class="style4">
                Name</td>
            <td style="width: 605px; height: 34px">
            <b>
                <% out.print(Name); %>
                </b>
            </td>
            <td class="style15">
            </td>
            <td class="style10">
            </td>
            <td style="height: 34px">
            </td>
        </tr>
        <tr>
            <td style="text-align: left; " class="style5">
                Address<br style="border-style: solid; border-width: 4" />
               
            </td>
            <td style="width: 305px; height: 40px">
                 <% out.print(Address); %>
            </td>
          
        </tr>
           <tr>
            <td style="text-align: left; " class="style5">
                Order Status<br style="border-style: solid; border-width: 4" />
               
            </td>
            <td style="width: 305px; height: 40px">
                <% out.print(D); %> &nbsp;&nbsp;&nbsp;&nbsp;<b>(P-Process , C-Cancel, S-Sent)</b>
            </td>
          
        </tr>
 <hr>
        <tr>
            <td colspan="5" style="height: 47px; background-color: #FFFFFF">
                <h4 align="center">Particulars Details</h4> <hr /></td>
        </tr>
        <tr>
            <td style="text-align: left;width:100px">
                <b>Sr. No.</b></td>
            <td style="width: 305px; height: 33px" class="style8">
                <b>Particulars</b></td>
            <td width="150">
                <b>Price</b></td>
            <td width="150">
                <b>Quantity</b></td>
            
            <td style="height: 33px" class="style8">
                <b>Total</b></td>
        </tr>
       <tr>
            <%
            
            int x=1,GTotal=0,Tax=0,LastAmtOrder=0,CoupenDiscount=0;
            String orderid="";
             try
                    {

                      String UserID=(String)session.getAttribute("UserID");

                      Class.forName("com.mysql.jdbc.Driver").newInstance();
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
            	      Statement stmt=Conn.createStatement();
            	      
                      ResultSet rs=stmt.executeQuery("select order_detail.quantity,order_detail.price,products.Itemname,order_detail.orderid from order_detail,products where (order_detail.productid=products.ID and order_detail.orderid="+A+")");
                      
                      while(rs.next())
                      {            
                                            out.print("<tr height=40>");
                                            out.print("<td>"+ x +"</td>");
                                            out.print("<td>"+rs.getString(3)+"</td>");
                                            out.print("<td>"+rs.getString(2)+"</td>");
                                            out.print("<td>"+rs.getString(1)+"</td>");
                                            out.print("<td>"+rs.getInt(1)*rs.getInt(2)+"</td>");
                                            out.print("<tr>");
                                            x++;

                                        Total=Total+(rs.getInt(1)*rs.getInt(2));
                                        orderid=rs.getString(4);
                          
                          
                      }
                      
                      ResultSet rs2=stmt.executeQuery("select * from orders where orderid<>'"+ orderid +"' and customerid='"+ UserID +"'");
		              while(rs2.next())
		              { 
		           	   LastAmtOrder=Integer.parseInt(String.valueOf(rs2.getString(7)));
		              }
                      
                      
                      Tax=Total*13/100;
                      
                      if(LastAmtOrder>100)
                      {
                      	CoupenDiscount=Total*3/100;
                          	
                      }
                      else
                      {
                      	CoupenDiscount=0;
                      }
                      GTotal=Total+Tax-CoupenDiscount;
                      
                      
                

                    }
                    catch(Exception ee)
                    {
                        //out.println(ee);
                    }
            
             %>
            
        
       


        
        <tr>
            <td colspan="5">
               <hr />


               </td>
            
        </tr>
        
        <tr >
            <td colspan=2>
               </td>
          
            <td colspan="2">
                <h4>Tax 13%</h4></td>
            <td>
                <h4>
                <%  out.print(Tax); %>
                              </h4>
            </td>
        </tr>
        
          <tr>
            <td colspan="5">
               <hr />


               </td>
            
        </tr>
        
        <tr>
            <td colspan=2> <h4>Discount Automatically Applied For Last Purchase of Above Amount of $100 :</h4>
               </td>
          
            <td colspan="2">Coupon Discount
               </td>
            <td>
                <h4>
                <%  out.print(CoupenDiscount); %>
                              </h4>
            </td>
        </tr>
        
        
        <tr>
            <td colspan="5">
               <hr />


               </td>
            
        </tr>
        
        
        
        <tr>
            <td colspan=2>
                  <% 
                        if(D=="C")
                        {
                        out.print("<a href='#' class='btn btn-danger'>Your Order has Cancelled </a>");
                       
                        }
                        else
                        {
                            out.print(msg);
                        }
                        

                 %></td>
          
            <td colspan="2">
                <h4>Grand Total</h4></td>
            <td>
                <h4>
                <%  out.print(GTotal); %>
                              </h4>
            </td>
        </tr>
        
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td style="width: 305px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
        
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td style="width: 305px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        
        
        <tr>
            <td class="style7">
                &nbsp;</td>
            <td style="width: 305px">
                &nbsp;</td>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <?php

}
?>

            </div>
        </div>
        </div>



   </div>
      
                    </div>
              
                 <br>
                 <br>
                 <br>
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
