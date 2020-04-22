
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver"%>

<%
        String A="",B="",C="",D="",E="";
        String bs="";
        String msg="";
    
        int Total=0;
    if(request.getParameter("Submit")!=null)
	{
		bs=request.getParameter("Submit");
	}

	if(bs.equals("Submit"))
	{
                 A = String.valueOf(request.getParameter("Orderno"));

            
        
        			try
                    {

                      String UserID=(String)session.getAttribute("UserID");

                      Class.forName("com.mysql.jdbc.Driver").newInstance();
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
            	        Statement stmt1=Conn.createStatement();
                      
                      ResultSet rs1=stmt1.executeQuery("select * from delivery_sent where OrderID="+A);
                      int c=1;
                      while(rs1.next())
                      {            
                              c=0;           
                              msg="Couriername: "+rs1.getString(2)+"<br>Courier AWB no: "+rs1.getString(3)+"<br>Sent Date:"+rs1.getString(4);  
                      }
                          if(c==1)
                          {
                              msg="<a href=CancelOrder.jsp?ID="+ A +" class='btn btn-danger'>Do You wnat to Cancel this Order Now</a>";
                          }

                

                    }
                    catch(Exception ee)
                    {
                        //out.println(ee);
                    }

                              
	}

%>


<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>Member Register: Grocery Online Store </title>
	
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




            <form method="post" name="CheckOr">
                <table align="center" style="width:800px" >
                    <tr>
                        <td class="style2">
                            Select an Order No</td>
                        <td>
                            <select class="form-control" id="Orderno" name="Orderno" > 
                            <option>Select a Order From List</option>
                    <%      
                        
                    try
                    {

                      String UserID=(String)session.getAttribute("UserID");

                      Class.forName("com.mysql.jdbc.Driver").newInstance();
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
            	       Statement stmt=Conn.createStatement();
                      
                      ResultSet rs=stmt.executeQuery("select * from orders where customerid="+UserID);
                      while(rs.next())
                      {            
                                            String or=rs.getString(2);
                                           
                                            if(or.equals(A))
                                            {
                                                 out.print("<option value="+rs.getString(2)+" selected=''>"+rs.getString(2)+"</option>");
                                                  B=rs.getString(11);
                                                  C=rs.getString(4)+" , "+rs.getString(5);
                                                  D=rs.getString(10);
                                                  E=rs.getString(8);
                                                 
                                                 
                                            }
                                            else
                                            {
                                                 out.print("<option value="+rs.getString(2)+">"+rs.getString(2)+"</option>");
                                            }

                          
                            
                          
                          
                      }
                      

                

                    }
                    catch(Exception ee)
                    {
                        //out.println(ee);
                    }
                    
                    %>
                                                      </select>  
                        </td>
                        <td>
                            <input name="Submit" type="submit" value="Submit" class="btn btn-danger form-control">
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="style2">
                            </td>
                        <td>
                          
                        </td>
                    </tr>
                    <tr>
                        <td class="style2">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                </form>
<%

if(bs.equals("Submit"))
{
%>
       
        
        <table clas="table table-bordered">
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
            <td style="width: 705px; height: 34px">
            <b>
                <% out.print((String)session.getAttribute("UserFullname")); %>
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
                 <% out.print(C); %>
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
        <tr bgcolor="grey" height=40>
            <td>
                <b>Sr. No.</b></td>
            <td>
                <b>Particulars</b></td>
            <td width="150">
                <b>Price</b></td>
            <td width="150">
                <b>Quantity</b></td>
            
            <td>
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
        
        <tr>
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
        
        
       
        
        
      
    </table>
<%
    
    	
}
%>
    
   

            </div>
        </div>
        </div>



   </div>
      
                    </div>
              
                 <br>
                 <br>
                 <br>
                 
                 <jsp:include page="footer.jsp"></jsp:include>
	</div>
	  <script type="text/javascript" src="assets/js/jquery.min.js"></script>

        
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
         <script>
       

$('#CheckOr').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
                      
            Orderno: {
                validators: {
                    notEmpty: {
                        message: 'The Orderno is required'
                    }
                }
            }
        }
    });


      
    </script>
        
        
    <!-- Custom JS Files -->
</body>

</html>            
