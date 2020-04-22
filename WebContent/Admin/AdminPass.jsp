<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,com.mysql.jdbc.Driver" %>
<% 
String Cid=(String)session.getAttribute("Adminem");
if(Cid==null)
{
	response.sendRedirect(request.getContextPath() + "/MemberLogin.jsp");
} 
else{
	
}
%>

<%
   
    
        String UserID=(String)session.getAttribute("Adminem");
        String bs="",Pass="",Uname="",msg="",Uem="",Op="",Np="",Nrp="";
	
	if(request.getParameter("Login")!=null)
	{
		bs=request.getParameter("Login");
               
	}

	if(bs.equals("Login"))
	{
            
	Connection conn1=null;
	
	try
	{
				Uem=request.getParameter("Username");
                Op=request.getParameter("Password");
                Np=request.getParameter("NPassword");
                Nrp=request.getParameter("RNPassword");
              
                Class.forName("com.mysql.jdbc.Driver");
        		Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");

                Statement stmt=Conn.createStatement();
                Statement stmt1=Conn.createStatement();
                
                ResultSet rs=stmt.executeQuery("select * from tbl_admin where EmailID='"+ Uem +"' and Password='"+ Op +"'");
                int x=0;
                while(rs.next())
                {
                       x=1;
                }
                
                if(x==1)
                {
                    stmt1.executeUpdate("update tbl_admin set Password='"+ Np +"'  where EmailID='"+ Uem +"'");
                    msg="Password Updated!";
                }
                else
                {
                    msg="Old Password does not Match!";
                }
		
		
	}
	catch(Exception e)
	{
                    out.print(e.getMessage());
	}
	}
 
    
 %>


<!DOCTYPE html>
<head>
<title>Food Lover | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css">


<link href="css/font-awesome.css" rel="stylesheet"> 
<script src="js/jquery2.0.3.min.js"></script>

</head>
<body>

	 <jsp:include page="Header.jsp"></jsp:include>

  <section id="main-content">
  <section class="wrapper">
  
    <div class="container">
      <div class="row">
        <div class="col-md-6">
			<br>
        
        <br>
        
        <br>
          <img src="master.png">
          
        </div>
        
        <div class="col-md-6">
            <br>
            <h2>Change User Password</h2>
            <br>         
      <form id="PasswordChange" method="post">
        <div class="form-group">
        <label>Username</label>
          <input type="text" name="Username" id="Username" class="form-control" value="<% out.print(UserID); %>" placeholder="Username">
        </div>
        <div class="form-group">
        <label>Old Password</label>
          <input type="password" name="Password" id="Password"  class="form-control"  placeholder="Password">
          
        </div>

        <div class="form-group">
        <label>New Password</label>
          <input type="password" name="NPassword" id="NPassword"  class="form-control"  placeholder="New Password">
          
        </div>

        <div class="form-group">
        <label>Retype New Password</label>
          <input type="password" name="RNPassword" id="RNPassword"  class="form-control"  placeholder="Retype New Password">
          
        </div>
        <div class="form-group">
         <?php echo $msg; ?>
        </div>
        
        <div class="form-group">
                
            <input type="submit" name="Login" id="Login" value="Login" class="btn btn-primary col-md-4">
        <br>
       <% out.print(msg); %>
        </div>
      </form>
      </div>
  
      
    </div>
       
        
          
</section>
</section>

<jsp:include page="Footer.jsp"></jsp:include>
</div>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>

  <script>
       

$('#PasswordChange').bootstrapValidator({
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
                    },
                    emailAddress: {
                        message: 'The input is not a valid email address'
                    }
                }
            },
            Password: {
            validators: {
                notEmpty: {
                        message: 'Password is required'
                    },
                    regexp: 
                    {
                   regexp: /^[a-zA-Z0-9 \.]+$/,
                    message: 'The username can only consist of alphabetical, number, dot and underscore'
                }
            }
        },
        NPassword:
        {
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
                    field: 'RNPassword',
                    message: 'The password and its confirm are not the same'
                }
            }
        },
        	
        RNPassword: {
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
                    field: 'NPassword',
                    message: 'The password and its confirm are not the same'
                }
            }
        }
        }
    });


      
    </script>
 
</body>
</html>
