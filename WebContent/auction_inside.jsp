<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineauction.service.AuctionService"%>
<%@page import="com.onlineauction.service.CustomerService"%>
<%@page import="com.onlineauction.service.ReviewService"%>
<%@page import="com.onlineauction.model.Auction"%>
<%@page import="com.onlineauction.model.Customer"%>
<%@page import="com.onlineauction.model.Review"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      
    <link rel="stylesheet" href="css/test_style.css">
      
    <link rel="stylesheet" href="css/product_inside.css">
      
    <link rel="stylesheet" href="css/circle.css">
      
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
      
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
      
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>Auction || Auction Inside</title>
      
  </head>
    
<body>
  	
  	<% String userName = String.valueOf(session.getAttribute("username"));
	
		if (userName.equalsIgnoreCase("admin")) { %>
	
			<jsp:include page="header2.jsp"/>
		
	<% } else { %>
  	
  			<jsp:include page="header.jsp"/>
  			
  	<% } %>
  
	<% String name = (String)request.getAttribute("auctionId"); 
	
	   AuctionService auc = new AuctionService();
	   Auction auction = auc.getAuctionById(Integer.parseInt(name));
	   
	   CustomerService cus = new CustomerService();
	   Customer customer = cus.getCustomerById(auction.getCus_id());

	   ReviewService rev = new ReviewService();
	   List<Review> review = rev.getAllReviews(Integer.parseInt(name));
	%>
	
	<!--MAIN MENU-->
    <div class="main-menu-wrap">
        <div class="menu-bar">
            <nav>
                 <ul class="main-menu">
                    <li class="menu-item">
                        <a href="home.jsp" style="">Home</a>
                    </li>
                    <li class="menu-item">
                        <a href="how_to_shop.jsp">How to shop</a>
                    </li>
                    <li class="menu-item">
                        <a href="auction_page.jsp" id="active-page">Auctions</a>
                    </li>
                    <li class="menu-item">
                        <a href="contact_us.jsp">Contact Us</a>
                    </li>
                    <li class="menu-item">
                        <a href="privacy_policy.jsp">Privacy Policy</a>
                    </li>
                </ul>
            </nav>
            <form class="search-form" method="get" action="AuctionServlet">
                <input type="text" class="rounded-2" name="navSearch" id="search_products" placeholder="Search products here..." required>
                
                <div class="text-center my-2 text-xl-right">
                
                	<button type="submit" id="search-btn" class="btn btn-info" name="btn-value" value="nav.search">Search</button>
                
                </div>
            </form>
        </div>
    </div>
    <!--/MAIN MENU-->
    
    <!--CONTENT-->
    
    <section id="top-bar">
      
        <div class="container-fluid">
          
            <div class="row">
                
                <div class="col-lg-12 px-0">
                    
                    <div class="section-header-wrap">
                        
                        <div class="section-headline">
                            
                                <h2 style="font-size: 32px"><%=auction.getItemName() %></h2>
                            <p>
                                Home
                                <span class="separator">/</span>
                                <span class="current-section">Auctions</span>
                            </p>
                            
                        </div>
                        
                    </div>
                    
                </div>
                
            </div>  
          
        </div>
      
      </section>
      
      <section id="product-inside" style="background: #F5F5F5;">
      
        <div class="container">
          
            <div class="row">
            
                <div class="col-lg-9">
                
                    <div class="product-top border my-5">
                    
                        <div id="carouselExampleControls" class="carousel slide mx-3 mt-3" data-ride="carousel" style="">
                            
                          <div class="carousel-inner">
                              
                            <div class="carousel-item active">
                                
                              <img src="uploads/<%=auction.getImage1() %>" class="d-block w-100 img-fluid" alt="Product Image">
                                
                            </div>
                              
                            <!--<div class="carousel-item">
                                
                              <img src="images/product2.jpg" class="d-block w-100 img-fluid" alt="Product Image">
                                
                            </div>
                              
                            <div class="carousel-item">
                                
                              <img src="images/product3.jpg" class="d-block w-100 img-fluid" alt="Product Image">
                                
                            </div>-->
                              
                          </div>
                            
                        </div>
                        
                        <div class="product-description my-5 mx-5">
                        
                            <h3><%=auction.getItemName() %></h3>
                            <p class="mt-4"><%=auction.getDescription() %></p>
                            
                        </div>
                    
                    </div>
                    
                    <div class="product-bottom border mb-5">
                    
                        <div id="left" class="left-pannel d-inline-block w-50 text-center border-bottom border-right">
                        
                            
                            <h6 class="my-3" onclick="change('left')"><a>Buyers Corner</a></h6>
    
                        
                        </div>
                        
                        <div id="right" class="right-pannel d-inline-block w-50 text-center border-bottom" style="float: right;">
                        
                            
                            <h6 class="my-3" onclick="change('right')"><a>Item FAQs</a></h6>
                        
                        
                        </div>
                        
                        <div id="feedback">
                        
                            <div class="container-fluid">
                            
                            <% for (Review element: review) { 
                            		Customer cust = new Customer();
                            		cust = cus.getCustomerById(element.getCusId()); 
                            %>
                            
                                <div class="row">
                        
                                    <div class="col-sm-2 pl-md-5 mt-4 text-sm-center" style="">

                                        <img src="uploads/<%=cust.getImage() %>" class="rounded-circle" alt="Profile image" style="width: 75px; height: 75px;">

                                    </div>
                                    
                                    <div class="comments col-sm-10 mt-4">

                                        <h5 class=""><%=cust.getFirstName() %> <%=cust.getLastName() %><span class="badge badge-secondary ml-2">Purchased</span></h5>
                                        <p class="mt-n2 first-p"><%=element.getDate() %></p>
                                        <p class="mt-n2"><%=element.getReview() %></p>

                                    </div>

                                </div>
                                
                                <hr class="text-center" style="width: 99%">
                                
                           <% } 
                           		if (session.getAttribute("cus_id") != null) {
                           			Customer cust2 = cus.getCustomerById((int) session.getAttribute("cus_id"));
                           	%>
                                <div class="row">
                        
                                    <div class="col-sm-2 pl-md-5 mt-4 text-sm-center" style="">

                                        <img src="uploads/<%=cust2.getImage() %>" class="rounded-circle" alt="Profile image" style="width: 75px; height: 75px;">

                                    </div>
                                    
                                    <div class="comments col-sm-10 mt-4">

                                        <form method="post" action="ReviewServlet">
                                        
                                            <div class="form-group mr-md-3">
                                        
                                                <label for="description">Leave a Comment</label>
                                                <textarea class="form-control my-2" name="description" rows="3" placeholder="Write a Review......"></textarea>

                                            </div>
                                            
                                            <div class="text-md-right mr-md-3 mb-4">
                                    
                                                <button style="" type="submit" class="btn btn-dark post-comment" name="btn-value" value=<%=name%>>Post Comment</button>

                                            </div>
                                        
                                        </form>

                                    </div>

                                </div>
                                
                              <% } %>
                            
                            </div>
                        
                        </div>
                        
                        <div id="item-faq" class="mt-2" style="display: none!important;">
                        
                            <div class="container">
                            
                                <div class="row">
                                
                                    <div class="col-sm-12">
                                    
                                        <div class="list-group my-5 mx-md-3" id="myList" role="tablist">
                        
                                          <button type="button" class="list-group-item list-group-item-action" data-toggle="collapse" data-target="#return-policy" aria-expanded="false" aria-controls="return-policy">Our Return Policy</button>
                                            
                                          <button type="button" class="list-group-item list-group-item-action border-bottom" data-toggle="collapse" data-target="#shipping" aria-expanded="false" aria-controls="shipping">Shipping and Delivery</button>
                                           
                                        </div>
                                        
                                        <div class="collapse" id="return-policy">
                                            
                                          <div class="card card-body"><%=auction.getReturnPolicy() %></div>
                                            
                                        </div>
                                        
                                        <div class="collapse" id="shipping">
                                            
                                          <div class="card card-body"><%=auction.getShippingAndDelivery() %></div>
                                            
                                        </div>
                                    
                                    </div>
                                
                                </div>
                            
                            </div>
                        
                        </div>
                    
                    </div>
                
                </div>
                
                <div class="col-lg-3">
                
                    <div class="buy-btn-wrapper mt-lg-5 mb-4">
                    
                        <button type="button" class="btn btn-dark btn-lg py-2 w-100"><span style="font-size: 33px;"><%=auction.getCurrentPrice() %></span> Current Bid!</button>
                       
                       <% if(session.getAttribute("username") != null) { 
                       		int cusId = (int) session.getAttribute("cus_id");
                       	%>
                       		
	                        <form class="profile-info-form my-3" method="post" action="BidServlet">
	                                
	                            <div class="form-group">
	
	                                <label for="password">Place a Bid <span style="color: #00d7b3;"> *</span></label>
	                                <input type="number" class="form-control" name="bid" placeholder="Place a Bid.....">
	                                <button type="submit" class="btn btn-danger btn-lg mt-3 py-3 w-100" name="btn-value" 
	                                value=<%=auction.getAuctionId() + "-" + auction.getCurrentPrice() + "-" + session.getAttribute("cus_id")%>><span class="mr-2"><i class="fas fa-shopping-cart"></i></span>Place Bid</button>
	                            </div>
	                            
	                        </form>
                        
                        <%    String part1 = String.valueOf(auction.getAuctionId());
                  			  String part2 = String.valueOf(cusId);
                  			  String all = "add." + part1 + "." + part2;
                         %> 
                         
                         		<form method="get" action="FavouriteServlet">
                                        
                                	<button type="submit" class="btn btn-info btn-lg py-3 w-100" name="btn-value" value=<%=all%>><span class="mr-2"><i class="fas fa-heart"></i></span>Add to Favourites</button> 
                                
                                </form>
                        
                        <% } %>
                    
                    </div>
                    
                    <div class="side-bar-info">
                        
                        <img class="user-avatar rounded-circle text-center" src="uploads/<%=customer.getImage() %>" style="width: 130px; height: 130px;">
                        <p class="profile-name"><%=customer.getFirstName() + " " + customer.getLastName() %></p>
                        <p class="profile-bio">World's Best Auctioner<br>Colombo, Sri Lanka</p>

                        <div style="text-align: center">

                            <ul class="list-inline" style="display: inline-block;">
                                <li class="list-inline-item"><a href="#" class="fa fa-facebook"></a></li>
                                <li class="list-inline-item"><a href="#" class="fa fa-skype"></a></li>
                                <li class="list-inline-item"><a href="#" class="fa fa-dribbble"></a></li>
                            </ul>

                        </div>
                        
                        <div class="text-center">
                        
                            <button type="button" class="btn btn-dark text-center w-100" style="font-weight: 800;">Go to Profile Page</button>
                        
                        </div>
                        
                    </div>
                    
                    <div class="side-bar-info-under mb-5">
                        <h5 style="padding: 5px 0 5px 0; font-weight: 800;">Reputation</h5>
                        <hr class="line-sep" style="margin-bottom: 20px;">

                        <div style="text-align:center">
                        <div class="c100 p90 blue" style="display:inline-block; margin-right:0px">
                            <span>90%</span>
                            <div class="slice">
                                <div class="bar"></div>
                                <div class="fill"></div>
                            </div>
                        </div>
                        </div>

                        <button type="button" class="btn btn-dark w-100 mb-2" style="font-size: 14px; font-weight: 800;">Read all the Customer Reviews</button>

                    </div>
                
                </div>
            
            </div>  
          
        </div>
      
      </section>
      
      <!-- CONTENT -->
      
      <footer id="footer">
      
        <div class="footer-overlay" style="background: #2B373A">
          
            <div class="container">
            
                <div class="row">
                
                    <div class="col-md-4 mb-md-5">
                    
                        <div class="mt-5">
                        
                            <img style="width: 60px;height: 60px;" class="d-inline" src="images/logo.PNG" alt="logo">
                            
                            <div class="d-inline-block align-middle">

                                <h3 class="footer-logo-text">Online <span style="color: #FFF;">Auction</span></h3>
                                <p style="color: #FFF;padding-top: 0px; margin-top: -10px;font-weight: 700;font-size: 12px;">Your Online Store</p>

                            </div>
                        
                        </div>
                        
                        <div class="footer-text">
                        
                            <p style="color: #9D9F9F;">Lorem ipsum dolor sit amet, consectetur isicing elit, sed do eiusmod tempor incididunt ut labo dolore magna ua. consectetur isicing elit, sed do eiusmod tempor incididunt ut labo dolore magna ua.</p>
                        
                        </div>
                        
                        <div class="footer-icon1">
                        
                            <span id="footer-icon" class="d-inline"><i class="fas fa-gift"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 800;font-size: 15px;margin-left: 5px;" class="d-inline">850296 <span style="color: #9D9F9F;">Products</span></p>
                        
                        </div>
                        
                        <div class="footer-icon2 my-2">
                        
                            <span id="footer-icon" class="d-inline"><i class="fas fa-bolt"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 800;font-size: 15px;margin-left: 5px;" class="d-inline">1207300 <span style="color: #9D9F9F;">Members</span></p>
                        
                        </div>
                        
                        <div class="footer-icon3">
                        
                            <span id="footer-icon" class="d-inline"><i class="fas fa-user"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 800;font-size: 15px;margin-left: 5px;" class="d-inline">74059 <span style="color: #9D9F9F;">Sellers</span></p>
                        
                        </div>
                    
                    </div>
                    
                    <div class="col-md-4 mb-md-5">
                    
                        <div class="featured-links mt-5">
                        
                            <h5 style="color: #FFF;font-weight: 700;padding-top: 10px;">Featured Links</h5>
                        
                        </div>
                        
                        <div class="featured-links-list mt-3">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-circle"></i></span>
                            
                            <p style="color: #9D9F9F;font-weight: 700;font-size: 15px;margin-left: 5px;" class="d-inline">Privacy Policy</p>
                        
                        </div>
                        
                        <div class="featured-links-list my-1">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-circle"></i></span>
                            
                            <p style="color: #9D9F9F;font-weight: 700;font-size: 15px;margin-left: 5px;" class="d-inline">Terms & Conditions</p>
                        
                        </div>
                        
                        <div class="featured-links-list my-1">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-circle"></i></span>
                            
                            <p style="color: #9D9F9F;font-weight: 700;font-size: 15px;margin-left: 5px;" class="d-inline">How To Shop</p>
                        
                        </div>
                        
                        <div class="featured-links-list">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-circle"></i></span>
                            
                            <p style="color: #9D9F9F;font-weight: 700;font-size: 15px;margin-left: 5px;" class="d-inline">Contact Us</p>
                        
                        </div>
                    
                    </div>
                    
                    <div class="col-md-4 mb-md-5 mb-5">
                    
                        <div class="contact-us mt-5">
                        
                            <h5 style="color: #FFF;font-weight: 700;padding-top: 10px;">Contact Us</h5>
                        
                        </div>   
                        
                        <div class="contact-us-icon mt-3">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-phone"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 800;font-size: 15px;margin-left: 5px;" class="d-inline">+947894611544</p>
                        
                        </div>
                        
                        <div class="contact-us-icon my-3">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-map-marker-alt"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 800;font-size: 15px;margin-left: 5px;" class="d-inline">Queens, New York</p>
                        
                        </div>
                        
                        <div class="contact-us-icon">
                        
                            <span id="featured-icon" class="d-inline"><i class="fas fa-envelope-open"></i></span>
                            
                            <p id="res1" style="color: #16FFD8;font-weight: 800;margin-left: 5px;" class="d-inline">onlineauction@gmail.com</p>
                        
                        </div>
                        
                        <div class="contact-us-icon mt-4">
                        
                            <span id="featured-icon" class="d-inline"><i class="fab fa-facebook-f"></i></span>
                            <span id="featured-icon" class="d-inline ml-3"><i class="fab fa-twitter"></i></span>
                            <span id="featured-icon" class="d-inline ml-3"><i class="fab fa-instagram"></i></span>
                            <span id="featured-icon" class="d-inline ml-3"><i class="fab fa-linkedin-in"></i></span>
                            
                        </div>
                    
                    </div>
                
                </div>
            
            </div>  
          
        </div>
          
        <div class="footer-lower" style="background: #21282A;">
        
            <div class="container">
            
                <div class="row">
                
                    <div class="col-md-12">
                    
                        <div class="copyright my-3">
                        
                            <span id="featured-icon" class="d-inline" style="color: #9D9F9F;"><i class="far fa-copyright"></i></span>
                            
                            <p style="color: #16FFD8;font-weight: 700;font-size: 15px;margin-left: 0px;" class="d-inline">Online Auction 
                            <span style="color: #9D9F9F;">- All Rights Reserved 2019</span></p>
                        
                        </div>
                    
                    </div>
                
                </div>
            
            </div>  
          
        </div>
      
      </footer>
      
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <script>
      
        function change(e) {
            if (e == 'left') {
                document.getElementById("left").style.borderTop = "5px solid #E61852";
                document.getElementById("right").style.borderTop = "none";
                document.getElementById("feedback").style.display = "block";
                document.getElementById("item-faq").style.display = "none";
            } else {
                document.getElementById("right").style.borderTop = "5px solid #E61852";
                document.getElementById("left").style.borderTop = "none";
                document.getElementById("feedback").style.display = "none";
                document.getElementById("item-faq").style.display = "block";
            }
        }
      
    </script>
  </body>
</html>