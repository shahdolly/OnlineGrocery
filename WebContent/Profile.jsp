<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver"%>

<%
        String A="";
        String B="";
        String C="";
        String D="";
        String E="";
        
        String bs="";
        String msg="";
        String UserID="";
       
          UserID=(String)session.getAttribute("UserID");
          
          
        if(request.getParameter("RegisterMe")!=null)
		{
			bs=request.getParameter("RegisterMe");
		}

		if(bs.equals("Update_Profile"))
		{
        
        try
        {

           A = request.getParameter("Name");
           B = request.getParameter("EmailID");
           C = request.getParameter("password");
           D = request.getParameter("Contactno");
           E = request.getParameter("Address");
           
           
           Class.forName("com.mysql.jdbc.Driver").newInstance(); 
           Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
		   Statement stmt=Conn.createStatement();
		   stmt.executeUpdate("update tbl_register set Fullname='"+ A +"',Password='"+ C +"',Contactno='"+ D +"',Address='"+ E +"' where ID="+UserID);
	       response.sendRedirect("RegisterSuccess.jsp");

        }
        catch(Exception ee)
        {
            out.println(ee);
        }

        }
        else
        {
                    try
                    {
                      Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                      Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                      Statement stmt=Conn.createStatement();
                      
                      ResultSet rs=stmt.executeQuery("select * from tbl_register where ID="+UserID);
                      
                      while(rs.next())
                      {
                            A = rs.getString(2);
                            B = rs.getString(3);
                            C = rs.getString(4);
                            D = rs.getString(5);
                            E = rs.getString(6);
                      }
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
      
      <div class="row">  
<div class="col-md-6" >
                 <div class="img-wrapper">
						<br>
						<br>
						<br>
						<br>
						
   <img src="assets/img/reg.jpg" alt="" class="img-responsive"  style="padding-top: 80px; padding-right:100px">
                      
                 </div>
               </div>
             <div class="col-md-6">




             </div>
            <!-- Contact Form -->
            <div class="col-md-6">
               <h1 class="text-center">Member Register</h1>


               <br>
               <div  id="contact_form">
            <!-- Contact results -->
                  <div id="contact_results"></div>
              <!-- Form Starts -->

              

                <form id="RegisterForm" method="post">

          <div class="form-group">
          <label>Full name</label>
           <input type="text" id="Name" name="Name" class="form-control" value="<% out.print(A); %>" placeholder="Name">
            </div>
     
        

          <div class="form-group">
          <label>EmailID</label>
          <input type="text" id="EmailID" name="EmailID" disabled="" class="form-control" value="<% out.print(B); %>" placeholder="EmailID">
         </div>

          

         
                 <div class="form-group  "> <label>Password</label>
                                        <input type="password" class="form-control" placeholder="Password" value="<% out.print(C); %>" name="password" id="password">
                </div>
             

          
          
                  <div class="form-group">
                       <label>Retype Password</label>
                    <input type="password" class="form-control" placeholder=" Repeat Password" value="<% out.print(C); %>" name="Rpassword" id="Rpassword">
                </div>
           
              
      <div class="form-group">
             <label>Contact no</label>
           <input type="text" id="Contactno" name="Contactno" class="form-control" value="<% out.print(D); %>" placeholder="Contactno">
                </div>
   
                     
   
                            <div class="form-group">
             <label>Address</label>
           <input type="text" id="Address" name="Address" class="form-control" value="<% out.print(E); %>" placeholder="Address">
                </div>
          
                
                 

             
          <p class="terms">You agree to with our <a href="#">Terms &amp; Conditions</a></p>
            <br>
            <br>
            

                     <input type="submit" id="RegisterMe" name="RegisterMe" value="Update_Profile" class="btn btn-danger">
                     <input type="submit" id="Reset" name="Reset" value="   Reset  " class="btn btn-success">
                     </form>
                  </div>
               </div>
               <!--/Contact form -->
            

    </div> 

            </div>
        </div>
      <br>
      <br>
      <br>
      <br>
      <br>
        </div>
                
                 
                 <jsp:include page="footer.jsp"></jsp:include>

	  <script type="text/javascript" src="assets/js/jquery.min.js"></script>
          <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
         <script type="text/javascript" src="assets/js/bootstrapValidator.min.js"></script>
        
         <script>
       

$('#RegisterForm').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
            Name: {
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
            EmailID: {
                validators: {
                    notEmpty: {
                        message: 'The email address is required'
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            password: {
            validators: {
                notEmpty: {
                        message: 'Password is required'
                    },
                    regexp: 
                    {
                   regexp: /^[a-zA-Z0-9 \.]+$/,
                    message: 'The username can only consist of alphabetical, number, dot and underscore'
                },
                identical: {
                    field: 'Rpassword',
                    message: 'The password and its confirm are not the same'
                }
            }
        },
        Rpassword: {
            validators: {
                notEmpty: {
                        message: 'Password is required'
                    },
                    regexp: 
                    {
                    regexp: /^[a-zA-Z0-9 \.]+$/,
                    message: 'The username can only consist of alphabetical, number, dot and underscore'
                },
                identical: {
                    field: 'password',
                    message: 'The password and its confirm are not the same'
                }
            }
        },
            
            Address: {
                validators: {
                    notEmpty: {
                        message: 'The Address is required'
                    }
                }
            }
        }
    });


      
    </script>
     
</body>

</html>            
