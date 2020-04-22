<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.mysql.jdbc.Driver"%>

<%

        String bs="";
        String msg="",delID="";
        
        String A="";
        String B="";
        String C="";
        String D="";
        String E="";
        String F="";
        String G="";
        String ID="";
        A = String.valueOf(request.getParameter("ID"));
      
         
        if(request.getParameter("Submit")!=null)
	{
		bs=request.getParameter("Submit");
	}

	if(bs.equals("Submit"))
	{
      
        try
        {
                
            B = request.getParameter("Coname");
            C = request.getParameter("Coawbnum");
        
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
           
            Statement stmt1=Conn.createStatement();
           
                    
           
            stmt1.executeUpdate("insert into delivery_sent(Couriername,Awbno,OrderID) values('"+ B +"','"+ C +"','"+ A +"')");
            stmt1.executeUpdate("update orders set OrderStatus='S' where OrderID='"+ A +"'");
            
            Conn.close();
         
	 
          response.sendRedirect("SentCourier.jsp");

        }
        catch(Exception ee)
        {
            out.println(ee);
        }

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
  
       <br>
  <h2 align="center">Update Courier Details</h2>
  <hr>
  
    <!-- contact form & map -->
    <div class="row">
     
      <div class="col-md-4">
        <img src="images/c.jpg" class='img-responsive'>
      </div>
      
        <div class="col-md-8">

        <form id="FeedbackForm" class="contact-form" method="POST" action="">
        
          <div class="col-md-12">

          <div class="form-group">
          <label>Order ID</label>

          <input type="text" id="OrderID" name="OrderID" value="<% out.print(A); %>" class="form-control" placeholder="Name">
          </div>
          </div>


          <label class="Couriername col-md-12">
          <label>Courier Company name</label>
        <div class="form-group">
         <input type="text" id="Coname" name="Coname" class="form-control" placeholder="Courier Company name" required>
         </div>

          </label>
          <label class="Cnumber col-md-12">
            <label>Airway Bill No</label>
            <div class="form-group">
              <input type="text" id="Coawbnum" name="Coawbnum" value="" class="form-control" placeholder="Awb no" required>
            </div>

          </label>
           

          <label class="col-md-3">
            <input type="submit" id="Sumbit" name="Submit" class="btn btn-info" value="Submit">
         
          </label>

          
        </form>
      </div>
    </div>

     
                       
 
        
          
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
