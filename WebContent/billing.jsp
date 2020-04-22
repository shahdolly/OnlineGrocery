<%@page import="java.text.SimpleDateFormat" %>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.util.*" %>

<%@page import="java.util.Date.*,java.text.*,com.mysql.jdbc.Driver,java.sql.*" %>

<%
     String bs=""; int Ri=0;
     String oldDate="",order_id="",Cid="",address="",cname="",PT="",amt="";
     ArrayList ScID=null;
     ArrayList ScQ=null;
     try
     {
    	 
    	 Cid=(String)session.getAttribute("UserID");
    	 if(Cid==null)
    	 {
    		 response.sendRedirect("MemberLogin.jsp?back=1");
    	 }
    	
    	 ScID=(ArrayList)session.getAttribute("SessionCartItemID");
         ScQ=(ArrayList)session.getAttribute("SessionCartItemQ");
         
         for(int i=0;i<ScID.size();i++)
         {
             for(int j=i+1;j<ScID.size();j++)
             {
                if(ScID.get(i).equals(ScID.get(j)))
                {
                    ScID.remove(j);
                    ScQ.remove(j);
                    
                    j--;
                }
            }
         }
     }
     catch(Exception ex)
     {
    	 
     }
    
     
    if(request.getParameter("DID")!=null)
    {
		Ri=Integer.parseInt(request.getParameter("DID"));
                for(int i=0;i<ScID.size();i++)
                {
                    out.print(ScID.get(i));
                       if(Integer.parseInt(String.valueOf(ScID.get(i)))==Ri)
                       {
                          
                           ScID.remove(i);
                           ScQ.remove(i);
                          
                       }
                   
                }
                
                response.sendRedirect("ViewCart.jsp");
    }
    
    if(request.getParameter("Bill")!=null)
	{
		bs=request.getParameter("Bill");
	}

	if(bs.equals("FinalOrder"))
	{
                  try
                  {

                           
                        
                        Cid=(String)session.getAttribute("UserID");
                      
                        DateFormat df = new SimpleDateFormat("ddMMyyhhmmss");
                        String formattedDate = df.format(new java.util.Date());
                        order_id=formattedDate;
                        session.setAttribute("OrderID",order_id);
                        
                         address=request.getParameter("address");
                         cname=request.getParameter("Pincode");
                         PT=request.getParameter("Payment");
                         amt=request.getParameter("FinalTotal");
                         String PTx=request.getParameter("CalTax");
                         String Disamt=request.getParameter("CoupenDiscount");
                         
                         

                      Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                      Statement stmt=Conn.createStatement();
                      stmt.executeUpdate("insert into orders(OrderID,customerid,Address,Pincode,Paymenttype,OrderTotal,CalculateTax,DiscountCoupen,OrderStatus) values('"+order_id+"','"+ Cid +"','"+ address+"','"+ cname+"','"+ PT+"','"+ amt+"','"+ PTx+"','"+ Disamt+"','P')");
                      
                      stmt.close();
                      
                      int P=0;
                      
                      for(int i=0;i<ScID.size();i++)
                      {
                          
                                        String sql1="select * from products where ID="+ScID.get(i);   
                                        Statement stm1=Conn.createStatement();
                                        ResultSet rs1=stm1.executeQuery(sql1);
                                        while(rs1.next())
                                        {
                                            P=Integer.parseInt(rs1.getString(7));
                                        }
                                        stm1.close();
                                        rs1.close();
                                
                                        Statement stmt2=Conn.createStatement();
                                        stmt2.executeUpdate("insert into order_detail(orderid,productid,quantity,price) values ('"+order_id+"','"+ ScID.get(i) +"','"+ ScQ.get(i)+"','"+ P+"')");
                                        stmt2.close();    
                               
                      }
                      Conn.close(); 
                      
                      response.sendRedirect("finalorder.jsp");
                     
                    }
                    catch(Exception ee)
                    {
                        out.println(ee);
                    }
    
        }
    
    
   
    
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
		 
   <div class="container">
   <div style="margin-top:130px"></div>
     <form Id="FinalBilling" method="post">           
                     
                 
                 
                 			<h2 align="center">Shopping Bill Details </h2>
                                        <div class="row">
                                            <div class="row">

			<div class="col-md-6">
			<div class="form-group col-md-12">
          		<label>Fullname</label>
                <input type="text" id="name" name="name" class="form-control" placeholder="Name" value="<% out.print((String)session.getAttribute("UserFullname")); %>">
            </div>
            
            
            <div class="form-group col-md-12">
          		<label>Address</label>
                <input type="text" id="address" name="address" class="form-control" placeholder="Address" value="<% out.print((String)session.getAttribute("UserAddress")); %>">
            </div>
            
            <div class="form-group col-md-12">
          		<label>Postal Code</label>
                <input type="text" id="Pincode" name="Pincode" class="form-control" placeholder="Pincode" value="">
            </div>

           

</div>

<div class="col-md-6">
		<div class="form-group col-md-12">
          		<label>Email</label>
                <input type="text" id="Email" name="Email" class="form-control" placeholder="Email" value="<% out.print((String)session.getAttribute("UserEmail")); %>">
            </div>

            <div class="form-group col-md-12">
          		<label>Contact no</label>
                <input type="text" id="Contactno" name="Contactno" class="form-control" placeholder="Contactno" value="<% out.print((String)session.getAttribute("UserContact")); %>" >
            </div>

            <div class="form-group col-md-12">
          		<label>Payment Through</label>
                <select name="Payment" id="Payment"  class="form-control">
                <option value="">Transaction type</option>
                 <option value="CashonDelivery">Cash on Delivery</option>
                 <option value="PayOnline">Pay Online</option>
               
            </select>
            </div>
            
            <input name="Bill" type="submit" value="FinalOrder" class="btn btn-danger">
 

</div>

</div>
                                            
                                            
                                            
                                        </div>
                 
                 
                 
                 <div id="row">
	<div class="col-md-12"> 


	  <div class="title">
			<h2 align="center">Your Shopping Cart Details </h2>
			<br>
<br>


			</div>
	</div>
	<div class="col-md-12"> 
					
   </div>
	
	  <table class="table table-hover">
          <thead>
          <tr>
            <th>ID</th>
            <th>Product name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Gross Amount</th>
       
          </tr>
          </thead>
        <tbody>  
              
          <%
              String Pid="",Productname="",ProductPic="";;
              int Q=0,Price=0,Total=0,GTotal=0,Tax=0,CoupenDiscount=0;
              int LastAmtOrder=0;
              
              
              try
              {
              	  	 Class.forName("com.mysql.jdbc.Driver").newInstance(); 
              	  	 
                     Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                     Statement stm1=Conn.createStatement();
                     ResultSet rs2=stm1.executeQuery("select * from orders where customerid='"+ Cid +"'");
		              while(rs2.next())
		              {
		           	   LastAmtOrder=Integer.parseInt(String.valueOf(rs2.getString(7)));
		              }
		              stm1.close();
		              rs2.close();
		              Conn.close();
              }
              catch(Exception exp)
              {
                       System.out.print(exp);
              }
              
              
              
            for (int counter = 0; counter < ScID.size(); counter++) 
            { 
						Pid=String.valueOf(ScID.get(counter));
                       
						Q=Integer.parseInt(String.valueOf(ScQ.get(counter)));
                        
                                try
                                {
                                	   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                                       Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                                       String sql1="select * from products where ID="+Pid;   
                                       Statement stm1=Conn.createStatement();
                                       ResultSet rs1=stm1.executeQuery(sql1);
                                       while(rs1.next())
                                       {
                                        	ProductPic=rs1.getString(8);
                                            Productname=rs1.getString(4); 
                                            Price=Integer.parseInt(rs1.getString(7));
                                           
                                       }
                                       stm1.close();
                                       rs1.close();
                                       Conn.close();
                                       
                                      
                                      
                                }
                                catch(Exception exp)
                                {
                                         System.out.print(exp);
                                }
                                
                                
                                
                                
                                
                                
                                Total=Price*Q;
                               
                                GTotal=GTotal+Total;
                               
					
			%>
                        <tr>
                          <td width="200"><img src="assets/products/<%  out.print(ProductPic); %>" style="width:70px;height:70px"></td>
                          <td><% out.print(Productname); %></td>
                          <td><i class="fa fa-dollar" aria-hidden="true"></i> <% out.print(Price); %></td>
                          <td><% out.print(Q); %></td>
                          <td><i class="fa fa-dollar" aria-hidden="true"></i> <% out.print(Total); %></td>
                         
                        </tr>
                        
                        
                        
                        
                        
                        
                        <%
                            }
                  Tax=GTotal*13/100;
                  
                  if(LastAmtOrder>100)
                  {
                  	CoupenDiscount=GTotal*3/100;
                      	
                  }
                  else
                  {
                  	CoupenDiscount=0;
                  }
                  GTotal=GTotal+Tax;
                  
                  
                            %>
                            <tr>
                          <td colspan="4">13% Tax on Purchase : </td>
                          <td width="200"><input type="text" name="CalTax" value="<% out.print(Tax); %>" class="form-control" /></td>
                         
                        </tr>
                        
                        <tr>
                          <td colspan="4">Discount Automatically Applied For Last Purchase of Above Amout of $100 : </td>
                          <td width="200"><input type="text" name="CoupenDiscount" value="<% out.print(CoupenDiscount); %>" class="form-control" /></td>
                         
                        </tr>
                        
                        <tr>
                          <td colspan="4">Order Total : </td>
                          <td width="200"><input type="text" name="FinalTotal" value="<% out.print(GTotal); %>" class="form-control" /></td>
                         
                        </tr>
                            
                        <tr>
                          <td colspan="4">Order Total:<i class="fa fa-dollar" aria-hidden="true"></i>  <% out.print(GTotal); %></td>
        <td>
                            </td>
                        </tr>
                       
                      </table>
                    </div>
                </form>
	
</div>
    
                          
	        <jsp:include page="footer.jsp"></jsp:include>
		<script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
   <script>

$('#FinalBilling').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            name: {
                validators: {
                    notEmpty: {
                        message: 'Name is required'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z \s]+$/,
                        message: 'Only Characters'
                    }
                }
            },
            Contactno: {
                validators: {
                    notEmpty: {
                        message: 'The Contactno is required'
                    },
                    stringLength: {
                        min: 10,
                        max: 10,
                        message: 'Length up to 10 Digits'
                    },
                    regexp: {
                        regexp: /^[0-9]+$/,
                        message: 'Only Number Having 10 Digits'
                    }
                }
            },
            Pincode:{
            	validators: {
                    notEmpty: {
                        message: 'The Postal Code is required'
                    },
                    stringLength: {
                        min: 6,
                        max: 6,
                        message: 'Invalid Postal Code'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z0-9\s]+$/,
                        message: 'Postal Code must be 6 Digits'
                    }
                }
            }
            ,
            Email: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            address: {
                validators: {
                    notEmpty: {
                        message: 'The address type is required'
                    }
                }
            },
        
         Payment: {
                validators: {
                    notEmpty: {
                        message: 'Payment is required'
                    }
                }
            }
        }

    });

				</script>

</body>

</html>