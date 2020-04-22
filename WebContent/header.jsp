<header id="site-header">
			       
                    <div class="navbar" role="navigation">
				<div class="container">
					<div class="row">
						<h1 class="sr-only">Food Lover</h1>
						<a href="index.jsp" title="FoodLover">
							<img src="assets/img/new.png" alt="" style="width:230px;height:85px;">
						</a>
						<button data-target=".navbar-collapse" data-toggle="collapse" type="button" class="menu-mobile visible-xs">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</button>
						<ul class="nav navbar-nav navbar-collapse collapse">
						
							  <%
                                                                        
                 try
                 {
                       String UserID="",Username="";
                       UserID=(String)session.getAttribute("UserID");
                       Username=(String)session.getAttribute("UserFullname");
                       
                       if(UserID==null)
                       {
                            %>
                            <li><a href="index.jsp">Home</a></li>
							<li><a href="Products.jsp">Products</a></li>
							<li><a href="contact_us.jsp">Contactus</a></li>
                            <li><a href="about_us.jsp">About us</a></li>
                            <li><a href="MemberRegister.jsp">Register</a></li>
                            <li><a href="MemberLogin.jsp">Member LogIn</a></li>
                            <% 
                       }
                       else
                       {
                       %>
                       <li> <b><a href="logout.jsp" style="color:yellow">Welcome <% out.print(Username); %></a></b></li>
                      <li><a href="index.jsp">Home</a></li>
					  <li><a href="Products.jsp">Products</a></li>
					  <!-- 
					  <li><a href="contact_us.jsp">Contactus</a></li>
                      <li><a href="about_us.jsp">About us</a></li> -->
                      <li> <a href="ViewCart.jsp"><i class="fa fa-shopping-cart" aria-hidden="true"></i>Shop Cart</a></li>
                      <li> <a href="Profile.jsp"><i class="fa fa-left"></i>Profile</a></li>
                      <li> <a href="LastOrders.jsp"><i class="fa fa-left"></i>Your Orders</a></li>
                      <li> <a href="logout.jsp">Logout</a></li>
                       <%
                       }
                       
                 }
                 catch(Exception ex)
                 {
                    
                     
                 }
             
       %>
							
                           
                                                        
                                                        
						</ul>
					</div>
				</div>
			</div>
		</header>