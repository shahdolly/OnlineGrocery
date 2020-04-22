<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*,com.mysql.jdbc.Driver"%>

<%

	String bs="",Uname1="",Pass1="";
	String Uname="",Pass="";
	String msg="";
	if(request.getParameter("Submit")!=null)
	{
		bs=request.getParameter("Submit");
	}

	if(bs.equals("Submit"))
	{
	
        Uname1=request.getParameter("Username");
	 	Pass1=request.getParameter("Password");
	
	
	
	try
	{
          msg="aa";
	      Class.forName("com.mysql.jdbc.Driver").newInstance();
          Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
	      Statement stmt=Conn.createStatement();
              
	      ResultSet rs=stmt.executeQuery("select * from tbl_admin where EmailID='"+ Uname1 +"' and Password='"+ Pass1 +"'");
              
             
	      while(rs.next())
	      {
                 session.setAttribute("AdminID",rs.getString(1));
                 session.setAttribute("Adminname",rs.getString(2));
                 session.setAttribute("Adminem",rs.getString(4));
                 
                 
                 Uname=rs.getString(4);
                 Pass=rs.getString(5);
                 
                
             }
              
            
	     if((Uname.equals(Uname1)) && (Pass.equals(Pass1)))
	     {
			response.sendRedirect("Admin/");
     	     }
	     else
	     {
                 
                	Uname1=request.getParameter("Username");
					Pass1=request.getParameter("Password");
                        String Mid="";
                        String Pt="";
	
                        Statement stmt1=Conn.createStatement();
                        ResultSet rs1=stmt1.executeQuery("select * from tbl_register where EmailID='"+ Uname1 +"' and Password='"+ Pass1 +"'");
                        while(rs1.next())
                        {
                            Mid=rs1.getString(1);
                            Pt=rs1.getString(4);
                            Uname=rs1.getString(3);
                            Pass=rs1.getString(4);
                            session.setAttribute("UserID",rs1.getString(1));
                            session.setAttribute("UserFullname",rs1.getString(2));  
                            session.setAttribute("UserEmail",rs1.getString(3)); 
                            session.setAttribute("UserContact",rs1.getString(5));
                            session.setAttribute("UserAddress",rs1.getString(6));
                            
                            
                        }
		 			
                        if((Uname.equals(Uname1)) && (Pass.equals(Pass1)))
                        {
                            msg="Match!";
                            ArrayList SessionCartID = new ArrayList();
                            session.setAttribute("SessionCartItemID", SessionCartID);
                        
                            ArrayList SessionCartQ=new ArrayList();
                            session.setAttribute("SessionCartItemQ", SessionCartQ);
                            response.sendRedirect("index.jsp");
                        }
                        else
                        {
                            msg="Username/Password does not Match!";
                        }
      
		}
  	}
	catch(Exception e)
	{
		out.print(e.getMessage());
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
        <div class="col-md-6" >
                 
				<br>
				<br>
				<br>
				
             <img src="assets/img/login.jpg" alt="" class="img-responsive">
                
               </div>

                         <!-- Contact Form -->
            <div class="col-md-6">
               <h4 class="text-center">Member Login</h4>
               <br>
               <div  id="contact_form">
            <!-- Contact results -->
                  <div id="contact_results"></div>
              <!-- Form Starts -->
<form id="Login" method="post"> 
              <div class="row form-group"> 

              <div class="col-lg-4"><label>EmailID</label>  </div>
 <div class="col-lg-8">
                 
     <input type="email" name="Username" id="Username" class="form-control" value="<% out.print(Uname1); %>" placeholder="Email ID">           
                </div>

              </div>

               <div class="row form-group"> 

              <div class="col-lg-4"><label>Password</label>  </div>
 <div class="col-lg-8">
                 
 <input type="password" name="Password" id="Password" class="form-control" placeholder="">           
                </div>

              </div>
                     <input type="submit" id="Submit" name="Submit" value="Submit" class="btn btn-primary">
                     <input type="submit" id="reset" name="reset" value="Reset" class="btn btn-primary">
                  <% out.print(msg); %>
</form>
<br>
<br>
<br>
<h2 class="text-center"><a href="MemberRegister.jsp"> Welcome for Member Registration </a></h2>
<br>
<br>
                  </div>
               </div>
             
            </div>
                 

                 <jsp:include page="footer.jsp"></jsp:include>

	

        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
	
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
         <script>
        $('#Login').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            
            Username: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    }
                }
            },
            Password: {
                validators: {
                    notEmpty: {
                        message: 'The Password  is required'
                    }
                }
            }
        }
    });
    </script>
        
        
  
</body>

</html>            
