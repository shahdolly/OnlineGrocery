<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
String A="",B="",C="",D="",E="",F="",G="",H="",vID="";
   		try
          {
   			 vID=request.getParameter("vID");
                  
                   if(vID.equals(""))
                   {

                   }
                   else
                   {
                	   Class.forName("com.mysql.jdbc.Driver").newInstance(); 
                        Connection Conn= DriverManager.getConnection("jdbc:mysql://localhost:3306/grocerydb","root","");
                        Statement stmt=Conn.createStatement();


                        ResultSet rs=stmt.executeQuery("select * from products where ID="+vID);
                        while(rs.next())
                        {
                          A = rs.getString(2);
                          B = rs.getString(3);
                          C = rs.getString(4);
                          D = rs.getString(5);
                          E = rs.getString(6);
                          F = rs.getString(7);
                          G = rs.getString(8);
                          
                        
                      
                        }
                   }
            }
            catch(Exception ee)
            {
                  //out.println(ee);
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
<script src="js/raphael-min.js"></script>
<script src="js/morris.js"></script>
<style type="text/css">
.form-control-feedback {
    position: absolute;
    top: 0;
    right: 13px;
    z-index: 2;
    display: block;
    width: 34px;
    height: 34px;
    line-height: 34px;
    text-align: center;
    pointer-events: none;
}
</style>
</head>
<body>
<jsp:include page="Header.jsp"></jsp:include>
<section id="main-content">
<section class="wrapper">
<form id="ProductForm" action="upupload.jsp?ID=<% out.print(vID); %>" enctype="multipart/form-data" method="post">
<h1 align="center"> Product Posting Form</h1>
<hr>
<div class="row">
 <div class="col-md-12">
   <div class="row form-group">
     <div class="col-md-4 form-group"><label>Brand name</label> 
        <input type="text"  id="Brandname" name="Brandname" class="form-control" placeholder="Brandname" value="<% out.print(A); %>">
    </div>
                   
                    <div class="col-md-4 form-group"><label>Category name</label> 
                     <input type="text" id="Categoryname" name="Categoryname" class="form-control" placeholder="Category name" value="<% out.print(A); %>">
                
                   </div>
                   
                   
                   
                    <div class="col-md-4 form-group"><label>Product name</label> 
                     <input type="text" id="Productname" name="Productname" class="form-control" placeholder="Product name" value="<% out.print(C); %>">
                
                   </div>
                   
                   
                 <div class="col-md-4 form-group"><label>Quantity</label> 
                     <input type="text" id="Quantityname" name="Quantityname" class="form-control" value="<% out.print(D); %>" placeholder="Quantity" >

          		</div>
          		
          		 <div class="col-md-4 form-group"><label>Price</label> 
                     <input type="number" id="Price" name="Price" class="form-control" value="<% out.print(F); %>" placeholder="Price">

          		</div>
          		
          		 <div class="col-md-4 form-group"><label>File Upload</label> 
                     <input type="file" id="Filename" name="Filename" class="form-control">

          		</div>
          		
          		<div class="col-md-12 form-group"><label>Product Descriptions</label>
          		<textarea id="desc" name="desc" rows="5" class="form-control"><% out.print(E); %></textarea> 
                  
          		</div>
          		
          		<div class="col-md-4"><label>Operation Here!</label> <br>     
            <input type="submit" name="Submit" value="Submit" class="btn btn-danger"> </div>
         </div>
            </div>

                        
      
            </div>
                                       </form> 
        
       

       
        
          
</section>
</section>
</div>
<jsp:include page="Footer.jsp"></jsp:include>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>
<script src="js/bootstrapValidator.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/scripts.js"></script>
<script src="js/jquery.slimscroll.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/jquery.scrollTo.js"></script>

 <script>
       


 $('#ProductForm').bootstrapValidator({
         message: 'This value is not valid',
         feedbackIcons: {
             valid: 'glyphicon glyphicon-ok',
             invalid: 'glyphicon glyphicon-remove',
             validating: 'glyphicon glyphicon-refresh'
         },
         fields: {
        	 Brandname: {
                 validators: {
                     notEmpty: {
                         message: 'Brand name is required'
                     },
                     regexp: {
                         regexp: /^[a-zA-Z \s]+$/,
                         message: 'Only Characters'
                     }
                 }
             },
             Categoryname:
             {
            	 validators: {
                     notEmpty: {
                         message: 'Category name is required'
                     },
                     regexp: {
                         regexp: /^[a-zA-Z \s]+$/,
                         message: 'Only Characters'
                     }
                 }
            	 
            },
            Productname:
            {
           	 validators: {
                    notEmpty: {
                        message: 'Category name is required'
                    },
                    regexp: {
                        regexp: /^[a-zA-Z \s]+$/,
                        message: 'Only Characters'
                    }
                }
           	 
           }, 
           Quantityname:
           {
          	 validators: {
                   notEmpty: {
                       message: 'Quantity name is required'
                   }
               }
          	 
          },
          Price: {
                 validators: {
                     notEmpty: {
                         message: 'The Price is required'
                     },
                     regexp: {
                         regexp: /^[0-9]+$/,
                         message: 'Only Number Having 10 Digits'
                     }
                 }
             },
             Filename2: {
                 validators: {
                     notEmpty: {
                         message: 'File is required'
                     }
                 }
             },
             
             
             desc: {
                 validators: {
                     notEmpty: {
                         message: 'The desc is required'
                     }
                 }
             }
         }
     });


       
     </script>
         
 
</body>
</html>
