<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
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
			<div>
				<span class="section-suptitle text-center">Grocery Online Store</span>
				<h1 class="section-title white-font text-center">About us</h1>
				<ul>
					<li><a href="index.jsp">Home</a></li>
                                        <li><a href="about_us.jsp">About us</a></li>
				</ul>
			</div>
		</section>
		<!-- End Section Main -->

		<!-- Section Story -->
		<section id="our-story">
			<div class="container">
				<div class="row">
					<div class="col-lg-12">
						<div class="story-description">
							<span class="section-suptitle">Our Story</span>
							<h2 class="section-title">Who We are & history</h2>
							
    <p style="font-size:20px;line-height:40px;text-align:justify">
    GroceryOnlineStore.com (Innovative Retail Concepts Private Limited) is India’s largest online food and grocery store. With over 18,000 products and over a 1000 brands in our catalogue you will find everything you are looking for. Right from fresh Fruits and Vegetables, Rice and Dals, Spices and Seasonings to Packaged products, Beverages, Personal care products, Meats – we have it all. Choose from a wide range of options in every category, exclusively hand picked to help you find the best quality available at the lowest prices. Select a time slot for delivery and your order will be delivered right to your doorstep, anywhere in Canada. You can pay online using your debit / credit card or by cash on delivery. We guarantee on time delivery, and the best quality!.
    </p>
						</div>
					</div>
					
				</div>
			</div>
		</section>
		<!-- End Section Story -->


 <jsp:include page="footer.jsp"></jsp:include>

	
	
</body>

</html>