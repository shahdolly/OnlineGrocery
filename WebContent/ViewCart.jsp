<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.mysql.jdbc.Driver"  %>

<%
    
     String bs=""; int Ri=0;
     ArrayList ScID=(ArrayList)session.getAttribute("SessionCartItemID");
     ArrayList ScQ=(ArrayList)session.getAttribute("SessionCartItemQ");
     if(ScID.size()<1)
     {
    	 response.sendRedirect("index.jsp");
     }
     
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
    
    if(request.getParameter("UpdateCart")!=null)
	{
		bs=request.getParameter("UpdateCart");
	}

	if(bs.equals("UpdateCart"))
	{
            
            for(int i=0;i<ScID.size();i++)
            {
                   
                    for(int x=0;x<ScID.size();x++)
                    {
                           Ri=Integer.parseInt(request.getParameter("product"+String.valueOf(ScID.get(i))));
                           ScQ.set(x,Ri);
                    }
                    
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
                 
                 <div id="row">
	<div class="col-md-12"> 


	  <div class="title">
			<h2 align="center">Your Shopping Cart Details </h2>
			<br>
<br>


			</div>
	</div>
	<div class="col-md-12"> 
	<form name="form1" method="post">
                    <input type="hidden" name="pid" />
                    <input type="hidden" name="command" />
  
	
	  <table class="table table-hover">
          <thead>
          <tr>
            <th>ID</th>
            <th>Product name</th>
            <th>Price</th>
            <th>Quantity</th>
            <th>Gross Amount</th>
            <th>Option</th>
          </tr>
          </thead>
        <tbody>  
              
          <%
              String Pid="",Productname="",ProductPic="";
              int Q=0,Price=0,Total=0,GTotal=0;
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


                                }
                                catch(Exception exp)
                                {
                                         System.out.print(exp);
                                }
                                 Total=Price*Q;
                                 
                                 GTotal=GTotal+Total;
                                 session.setAttribute("GTotal",GTotal);   
					
			%>
                        <tr>
                          <td width="200">  <img src="assets/products/<%  out.print(ProductPic); %>" style="width:70px;height:70px">
                 </td>
                          <td><% out.print(Productname); %></td>
                          <td><i class="fa fa-dollar" aria-hidden="true"> <% out.print(Price); %></td>
                          <td><input type="number" name="product<% out.print(Pid); %>" value="<% out.print(Q); %>" maxlength="3" size="2" /></td>
                          <td><i class="fa fa-dollar" aria-hidden="true"> <% out.print(Total); %></td>
                          <td><a href="ViewCart.jsp?DID=<% out.print(Pid); %>">Remove</a></td>
                        </tr>
                        <%
                            }
                            %>
                        <tr>
                          <td>Order Total:<i class="fa fa-dollar" aria-hidden="true">  <% out.print(GTotal); %></b></td>
                          <td colspan="5" align="right"><input name="UpdateCart" type="submit" value="UpdateCart" class="btn btn-danger">
                              <input name="button" type="button" onClick="window.location='ClearCart.jsp'" value="Clear Cart" class="btn btn-danger">
                            <input name="button" type="button" onClick="window.location='billing.jsp'" value="Place Order" class="btn btn-danger"></td>
                        </tr>
                       
                      </table>
                    </div>
                </form>
                
              
	  </div>
		
	</div>
	

	        <jsp:include page="footer.jsp"></jsp:include>
                
                
                
	</div>
	
</body>

</html>