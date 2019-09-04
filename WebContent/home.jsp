<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineauction.service.AuctionService"%>
<%@page import="com.onlineauction.service.CustomerService"%>
<%@page import="com.onlineauction.model.Auction"%>
<%@page import="com.onlineauction.model.Customer"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

        <link rel="stylesheet" href="css/test_style.css">
        
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">

        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        
        <title>Auction || Home</title>
    </head>
<body>

	<% String userName = String.valueOf(session.getAttribute("username"));
	
		if (userName.equalsIgnoreCase("admin")) { %>
	
		<jsp:include page="header2.jsp"/>
		
	<% } else { %>
  	
  			<jsp:include page="header.jsp"/>
  			
  	<% } %>
  	
  	<% AuctionService auc = new AuctionService();
	   CustomerService cus = new CustomerService();
	   Customer customer = new Customer();
	   List<Auction> auctions = auc.getAllAuctions(4);%>
  	
  	<!--MAIN MENU-->
    <div class="main-menu-wrap">
        <div class="menu-bar">
            <nav>
                <ul class="main-menu">
                    <li class="menu-item">
                        <a href="home.jsp" style="" id="active-page">Home</a>
                    </li>
                    <li class="menu-item">
                        <a href="how_to_shop.jsp">How to shop</a>
                    </li>
                    <li class="menu-item">
                        <a href="auction_page.jsp">Auctions</a>
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

    <section id="banner">
      
        <div class="container-fluid">
          
          <div class="row">
            
            <div id="overlay-b">
                    
                <div class="h3-tag text-center">

                    <h4>REGISTER NOW AND START</h4>
                    <h1>BUYING AND SELLING</h1>

                </div>
                
                <div class="col-md-12">
                    
                    <form method="get" action="AuctionServlet">
                    
                    	<div class="search-wrapper pt-5">

	                        <input class="form-control form-control-lg d-inline" type="text" name="home-search" placeholder="Search product here..." required>
	                        
	                        <select id="inputState" name="home-category" class="form-control form-control-lg d-inline" style="width: 10%;">
	
	                            <option value="0">Choose...</option>
                                <option value="electronic">Electronic</option>
                                <option value="fashion">Fashion</option>
                                <option value="jewellery">Jewellery</option>
                                <option value="vehicle">Vehicle</option>
                                <option value="toy">Toy</option>
	                        
	                        </select>
	                        
	                        <button id="desktop-btn" type="submit" class="btn btn-primary btn-lg" name="btn-value" value="home.search">Search</button>
	                        
	                        <button id="mobile-btn" type="submit" class="btn btn-primary btn-lg" name="btn-value" value="home.search">Search</button>
	
	                    </div>
                    
                    </form>
                    
                </div>
              
            </div>
            
          </div>   
          
        </div>
      
      </section>
      
    <section id="trends">
      
          <div style="background: #FFF;">
          
            <div class="container">
          
                <div class="row">

                    <div class="col-md-3 py-3 d-none d-md-block">

                        <a href="auction_page.jsp">
                        
                        	<button type="button" id="sidebarCollapse" class="btn btn-info">
	                          <i class="fas fa-angle-double-left"></i>
	                        </button>
                        
                        </a>

                    </div>

                    <div class="col-md-6 py-3">
                        
                        <div class="text-center">
                        
                            <h5 style="font-weight: 700; padding-right: ;" class="trends-head d-inline">Trending Auctions</h5>
                        
                        </div>

                    </div>

                    <div class="col-md-3 py-3" style="text-align: right">

						<a href="auction_page.jsp">
	                        <button type="button" id="sidebarCollapse" class="btn btn-info d-none d-md-block" style="float: right">
	                          <i class="fas fa-angle-double-right"></i>
	                        </button>
	                    </a>

                    </div>

                </div> 
          
            </div>
              
          </div>
              
          <div style="background: #F5F5F5">
              
            <div class="container">
              
                <div class="row">

                    <!--<div id="trends-auctions">-->
                    
                    <% for(Auction element: auctions) { 
                   			int cus_id = element.getCus_id();
                   			customer = cus.getCustomerById(cus_id);
                   	%>

                        <div class="col-lg-3">

                            <div id="test-card" class="card my-3">

                                <img src="uploads/<%=element.getImage1() %>" class="card-img-top" alt="...">
                                
                                <div class="card-overlay">
                                    <div class="text">
                                        
                                        <form method="get" action="AuctionServlet">
                                        
                                        	<button type="submit" class="btn btn-outline-info" name="btn-value" value=<%="view." + element.getAuctionId() %>><i class="fas fa-tag" style="margin-right: 5px;"></i>Go To...</button> 
                                        
                                        </form> 
                                        
                                        <% if(session.getAttribute("username") != null) { 
                                        	  int cusId = (int) session.getAttribute("cus_id");
                                        	  String part1 = String.valueOf(element.getAuctionId());
                                  			  String part2 = String.valueOf(cusId);
                                  			  String all = "add." + part1 + "." + part2;
                                        %> 
                                        
                                        	<form method="get" action="FavouriteServlet">
                                        
	                                        	<button style="margin-top: 10px;" type="submit" class="btn btn-outline-info" name="btn-value" value=<%=all%>><i class="fas fa-heart" style="margin-right: 5px;"></i>Add To...</button> 
	                                        
	                                        </form> 
	                                        
	                                    <% } %>
	                                    
                                    </div>
                                </div>

                                <div class="card-body">

                                  <h5 class="card-title"><%=element.getItemName() %></h5>
                                  <p class="card-text"><%=element.getbDescription() %></p>
                                  <h6 style="font-weight: 600;" class="card-text">Price<span style="font-size: 25px;font-weight: 600; float: right;">$<%=element.getCurrentPrice() %></span></h6>
                                  
                                  <hr/>
                                    
                                  <img src="uploads/<%=customer.getImage() %>" alt="..." class="rounded-circle">
                                    
                                  <i class="fas fa-star"></i>
                                  <i class="fas fa-star"></i>
                                  <i class="fas fa-star"></i>
                                  <i class="fas fa-star"></i>
                                  <i class="fas fa-star"></i>
                                    
                                  <h6 style="font-weight: 600; padding-top: 10px;" class="card-text"><%=customer.getFirstName() %> <%=customer.getLastName() %></h6>

                                </div>

                            </div>

                        </div>
                       
						<% } %>
                    </div>
                
                    <div class="row">
                
                        <div class="col-md-12 text-center">
                        
                        	<a href="auction_page.jsp">
                            	<button style="width: auto;font-weight: 700;"type="button" class="btn btn-dark btn-lg my-5">Load More Products</button>
                        	</a>
                        </div>
                
                    </div>

                </div>    
              
            </div>   
          
      </section>
      
    <section id="services">
      
        <div class="container">
        
            <div class="row">
            
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-gift rounded-circle"></i></span>
                        <h5>Buy & Sell Easily</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
                
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-lock rounded-circle"></i></span>
                        <h5>Secure Transaction</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
                
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-thumbs-up rounded-circle"></i></span>
                        <h5>Products Control</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
            
            </div> 
            
            <div class="row">
            
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-gem rounded-circle"></i></span>
                        <h5>Quality Platform</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
                
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-headset rounded-circle"></i></span>
                        <h5>Assistance 24/7</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
                
                <div class="col-md-4">
                
                    <div class="icon text-center my-5">
                    
                        <span class="icon-span"><i class="fas fa-comment rounded-circle"></i></span>
                        <h5>Support Forums</h5>
                        <p>Lorem ipsum dolor sit amet, consectetur sicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
                    
                    </div>    
                    
                </div>
            
            </div>
          
        </div>
      
      </section>
      
    <section id="subscribe">
      
        <div class="container-fluid">
          
            <div class="row overlay-s">
            
                <div class="col-md-12 mb-4">
                
                    <form method="post" action="SubscriberServlet">
                    
                    	<div class="sub-wrapper text-center my-5">
                    
	                        <span class="sub-icon d-inline"><i class="far fa-envelope rounded-circle"></i></span>
	                    
	                        <h4 class="sub-text d-inline">Subscribe to our Newsletter</h4>
	                    
	                        <input id="sub-input" name="sub-input" class="form-control d-inline" type="email" placeholder="Enter your email here...">
	                        
	                        <button id="sub-desktop-btn" type="submit" class="btn btn-primary d-inline">Subscribe!</button>
	                        
	                        <button id="sub-mobile-btn" type="submit" class="btn btn-primary d-inline">Subscribe!</button>
	                    
	                    </div>
                    
                    </form>
                
                </div>
            
            </div>  
          
        </div>
      
      </section>
      
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
    <!--/CONTENT-->
    
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>