<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.mysql.jdbc.Driver" %>

<%
        String bs="";
        String msg="";
        if(request.getParameter("AddtoCart")!=null)
	{
		bs=request.getParameter("AddtoCart");
                
	}
//       
	if(bs.equals("AddtoCart"))
	{
                try
                {
                        String ID=request.getParameter("ID");
                        ArrayList SessionCartID=(ArrayList)session.getAttribute("SessionCartItemID");
                        SessionCartID.add(ID);
                        session.setAttribute("SessionCartItemID", SessionCartID);
                        
                        String Qua=request.getParameter("QuantityAdd");
                        ArrayList SessionCartQ=(ArrayList)session.getAttribute("SessionCartItemQ");
                        SessionCartQ.add(Qua);
                        session.setAttribute("SessionCartItemQ", SessionCartQ);
                        response.sendRedirect("ViewCart.jsp");
                        
                }
                catch(Exception ex)
                {
                     // out.print("h1"+ex);
                }   
                
        }
        else
        {
                        /*
                        ArrayList SessionCartID = new ArrayList();
                        session.setAttribute("SessionCartItemID", SessionCartID);
                        
                        ArrayList SessionCartQ=new ArrayList();
                        session.setAttribute("SessionCartItemQ", SessionCartQ);
                        */
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
                 <div style="margin-top:130px"></div>
                 
                 
                 
                 <section>

<div class="container">



   <%
        //out.print(bs);
        String ItemID="";
        String Itemdes="";
        if(request.getParameter("ID")!=null)
	{
		ItemID=request.getParameter("ID");
	}
        else
        {
            response.sendRedirect("index.jsp");
        }
     
      

     %>
     

      <h1>Want to Order this Item:</h1>
      <%
            try 
            {
                
           	Class.forName("com.mysql.jdbc.Driver").newInstance(); 
            Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                
            String sql="select * from products where ID="+ItemID+"";   
            Statement stmt=Conn.createStatement();
            ResultSet rs=stmt.executeQuery(sql);
          
            int x=0;
            
           while(rs.next())
            {
            x++;
            Itemdes=rs.getString(6);
        %>
        <div class="col-md-4"> 
   
           
              
                  <div class="product-box">
                    <div class="product-img">
                      <img src="assets/products/<%  out.print(rs.getString(8)); %>" style="width:250px;height:250px">
                 
                      <span class="sale-bacth">sale</span>
                    </div>
                     <div class="product-detail">
                      <h5 style="font-size:10px"><% out.print(rs.getString(2)+" -> " +rs.getString(3)+" -> " +rs.getString(4)); %></h5>
                      <div class="rating-nd-price">
                        <strong>MRP:<i class="fa fa-dollar" aria-hidden="true"></i><% out.print(rs.getString(7)+" /Per " +rs.getString(5)); %></strong>
                        
                      </div>
                      <div class="aurthor-detail">
                        <span>View Items Details</span>
                       
                      </div>
                    </div>
                  </div>
               <br />
          <br />

</div>
    

 <div class="col-md-8"> 
     

    
        <h3>Description :<p align='justify'> <br><br><%  out.print(Itemdes); %></p></h3>
<br>
<br>
<br>

          <div class="row">
          <form method="post" name="Cart" id="Cart">
              <div class="col-md-10"> 

           <select class="form-control" id="QuantityAdd" name="QuantityAdd">
            <option value="">Select a Quantity to Add in Cart</option>
             <%
            
                int m=0;
                  for(m=1;m<=10;m++) 
                  {
                     %>
                     <option value="<% out.print(m); %>"><% out.print(m); %></option>
                     <%
                  }
            %>
          
            </select>

              </div>
                <div class="col-md-2">
                      <input type="submit" id="AddtoCart" name="AddtoCart" value="AddtoCart" class="btn btn-primary">

                </div>
              </form>
          </div>
 </div>
               

        <%
    
   }
}
catch(Exception exp)
{
        out.print(exp);
}
      %>
 </div>
 </section>
        </div>
                 <jsp:include page="footer.jsp"></jsp:include>

	
          <script type="text/javascript" src="assets/js/jquery.min.js"></script>
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
         <script>
       

$('#Cart').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            QuantityAdd: {
                validators: {
                    notEmpty: {
                        message: 'The Quantity is required'
                    }
                }
            }
        }
    });


      
    </script>
        
	        
    <!-- Custom JS Files -->
</body>

</html>            
