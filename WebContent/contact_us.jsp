<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%@ page import = "java.io.*,java.util.*,javax.mail.*"%>
<%@ page import = "javax.mail.internet.*,javax.activation.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%
    String bs="";
    String msg="";
    if(request.getParameter("RegisterMe")!=null)
	{
		bs=request.getParameter("RegisterMe");
	}

	if(bs.equals("Submit_Contact_Form"))
	{
		
        String A=null;
        String B=null;
        String C=null;
        String D=null;
       
       
           A = request.getParameter("Name");
           B = request.getParameter("EmailID");
           C = request.getParameter("Subject");
           D = request.getParameter("Reason");
           
          
           Properties props = new Properties();
           props.put("mail.smtp.host", "smtp.gmail.com");
           props.put("mail.smtp.port", "587");		
           props.put("mail.smtp.auth", "true");
           props.put("mail.smtp.starttls.enable", "true");
           


			Session sessionN = Session.getInstance(props,new javax.mail.Authenticator()
			{
			    protected PasswordAuthentication getPasswordAuthentication()
			    {
				         return new PasswordAuthentication("grocerycanada@gmail.com","Pass@123456"); 
			    }
			});

           try {
        	   
        	   	MimeMessage message = new MimeMessage(sessionN);
        	    message.setFrom(new InternetAddress("grocerycanada@gmail.com"));
        	    message.addRecipient(Message.RecipientType.TO,new InternetAddress(B));
        	    message.addRecipient(Message.RecipientType.TO,new InternetAddress("grocerycanada@gmail.com"));
          	  
        	    message.setSubject(C);
        	   
        	    message.setContent(message, "text/html");
        	    
        	    String data = "<i>Greetings! From GroceryCanada.Com</i>\n\n\n Dear "+A;
        	    data += "\n\n\nEmailID -"+B;
        	    data += "\n\n\nSubject -"+C;
        	    data += "\n\n\n"+D+"\n\n\n";
        	    message.setText(data);
		  	    Transport.send(message);
        	   
        	    response.sendRedirect("mailsuccess.jsp");

           } catch (MessagingException e) {
        	   e.printStackTrace();
        	   out.print(e);
               
           }
          
           
      
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<title>About us: Grocery Online Store </title>
	
	<link rel="stylesheet" href="assets/css/bootstrap.min.css" />
	<link rel="stylesheet" href="assets/css/font-awesome.min.css" />
	<link rel="stylesheet" href="assets/css/flaticon.css" />
    <link href="assets/css/new.css" rel="stylesheet">
	<link rel="stylesheet" href="assets/css/style.css" />
	<link rel="stylesheet" href="assets/css/responsive.css" />
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
		<section id="breadcrumb">
		<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2466.979522266276!2d-79.72469778499169!3d43.71522165643681!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x882b3de423425cf1%3A0x78ed4319f3c32f8a!2sBramalea%20City%20Centre!5e1!3m2!1sen!2sca!4v1587366543128!5m2!1sen!2sca" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
			<div>
			
				<span class="section-suptitle text-center">Grocery Online Store</span>
				<h1 class="section-title white-font text-center">Contact us</h1>
				<ul>
					<li><a href="index.jsp">Home</a></li>
                                        <li><a href="contact_us.jsp">Contact us</a></li>
				</ul>
			</div>
		</section>
		
		
                
                <div class="container">
                    
                    <div class="row">
      
      <div class="col-md-6">
          <br>
       
          <br>
          <br>
        
         <img src="assets/img/Contact.jpg">
 <h1>Our Address: </h1>
        <br>
        <h3>
           <ul>
                  <li><i class="fa fa-home"></i>29 Pennywood Road<br><br></li>
                  <li><i class="fa fa-phone"></i>9747051109<br><br></li>
                  <li><i class="fa fa-envelope"></i>contact@grocerystore.com<br><br></li>
          </ul>
       </h3>
       

      </div>
      
        <div class="col-md-6">
        <h1>Contact Form: </h1>
         <form id="RegisterForm" method="post">
             <div class="form-group">
          <label>Full name</label>
           <input type="text" id="Name" name="Name" class="form-control" placeholder="Name">
            </div>
             <div class="form-group">
             <label>EmailID</label>
           <input type="text" id="EmailID" name="EmailID" class="form-control" placeholder="EmailID">
                </div>
                
            <div class="form-group">
             <label>Subject:</label>
           <input type="text" id="Subject" name="Subject" class="form-control" placeholder="Subject">
                </div>
                
               
                
                <div class="form-group">
             <label>Reason for Contact: </label>
           <textarea id="Reason" name="Reason" rows="5" class="form-control" placeholder="Reason for Contact"></textarea>
                </div>
                 <p class="terms">You agree to with our <a href="#">Terms &amp; Conditions</a></p>
                  <input type="submit" id="RegisterMe" name="RegisterMe" value="Submit_Contact_Form" class="btn btn-primary">
                     <input type="submit" id="Reset" name="Reset" value="Reset" class="btn btn-primary">
                    
             
              
          
         </form>
       
      </div>
    </div>
                    
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
            Subject: {
                validators: {
                    notEmpty: {
                        message: 'The Subject is required'
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
            
            
        Reason: {
                validators: {
                    notEmpty: {
                        message: 'The Reason is required'
                    }
                }
            }
        }
    });


      
    </script>
        

</body>

</html>