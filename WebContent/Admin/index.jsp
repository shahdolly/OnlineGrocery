<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%

String Cid=(String)session.getAttribute("Adminem");
if(Cid==null)
{
	response.sendRedirect(request.getContextPath() + "/MemberLogin.jsp");
} 
else{
	
}
%>
<!DOCTYPE html>
<head>
<title>Online Grocery Store | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/bootstrapValidator.min.css">
<link href="css/style.css" rel='stylesheet' type='text/css' />
<link href="css/style-responsive.css" rel="stylesheet"/>
<link href="css/font-awesome.css" rel="stylesheet"> 

</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>

  <section id="main-content">
  <section class="wrapper">

    <div class="row">
      
        <div class="col-md-12 w3ls-graph">
          <div class="row">
        <article class="col-md-4">
      <br>
        <br>
        <br>
        <br>
        <br>
        
        <br>
          <img src="master.png" class="img-thumbnail">
          
        </article>
        
        <div class="col-md-8">
          <br>
        
        <br>
        <br>
        
        <br>
          <h1 style="text-align:center">Welcome<br> to <br>Administration Department</h1>
            <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        <br>
        
        <br>
      </div>


        </div>
      </div>
    </div>
 
</section>
</section>

<jsp:include page="Footer.jsp"></jsp:include>
<script src="js/jquery2.0.3.min.js"></script>
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<script src="js/bootstrap.js"></script>

 
</body>
</html>
