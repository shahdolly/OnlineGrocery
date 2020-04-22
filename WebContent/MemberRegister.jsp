<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, com.mysql.jdbc.Driver"%>

<%

    String bs="";
    String msg="";
    if(request.getParameter("RegisterMe")!=null)
	{
		bs=request.getParameter("RegisterMe");
	}

	if(bs.equals("RegisterMe"))
	{
        String A=null;
        String B=null;
        String C=null;
        String D=null;
        String E=null;
        try
        {

           A = request.getParameter("Name");
           B = request.getParameter("EmailID");
           C = request.getParameter("password");
           D = request.getParameter("Contactno");
           E = request.getParameter("Address");
           out.print(A);
 
          Class.forName("com.mysql.jdbc.Driver").newInstance(); 
          Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
	  	  Statement stmt=Conn.createStatement();
	  	  
	      stmt.executeUpdate("insert into tbl_register(Fullname,EmailID,Password,Contactno,Address) values('"+ A +"','"+ B +"','"+ C +"','"+ D +"','"+ E +"')");
          
	      response.sendRedirect("RegisterSuccess.jsp");
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
                      <h1 class="text-center">Member Register</h1>
                      
                <form id="RegisterForm" method="post">
                      
        <div class="row">  
		<div class="col-md-6" >
              <div class="form-group">
          <label>Full name</label>
           <input type="text" id="Name" name="Name" class="form-control" placeholder="Name">
            </div>
            
            <div class="form-group">
             <label>Contact no</label>
           <input type="text" id="Contactno" name="Contactno" class="form-control" placeholder="Contactno">
                </div>
                
                <div class="form-group">
             <label>Type Your Address: </label>
           <input type="text" id="Address" name="Address" class="form-control" placeholder="Full Address">
                </div>
                
                
                
     
               </div>
            
            <div class="col-md-6">
            <div class="form-group">
          <label>EmailID</label>
           <input type="text" id="EmailID" name="EmailID" class="form-control" placeholder="EmailID">
         </div>
           <div class="form-group  "> <label>Password</label>
                                        <input type="password" class="form-control" placeholder="Password" name="password" id="password">
                </div>
       <div class="form-group">
                       <label>Retype Password</label>
                    <input type="password" class="form-control" placeholder=" Repeat Password" name="Rpassword" id="Rpassword">
                </div>
        
          <p class="terms">You agree to with our <a href="#">Terms &amp; Conditions</a></p>
                  <input type="submit" id="RegisterMe" name="RegisterMe" value="RegisterMe" class="btn btn-primary">
                     <input type="submit" id="Reset" name="Reset" value="Reset" class="btn btn-primary">
                    
                  </div>
               </div>
                </form>
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
