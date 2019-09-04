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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      
    <link rel="stylesheet" href="css/test_style.css">
      
    <link rel="stylesheet" href="css/product_page.css">
      
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
      
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <title>Auction || Auction</title>
      
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
	   List<Auction> auctions = auc.getAllAuctions();%>
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
                            
                                <h2 style="font-size: 32px">Auction</h2>
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
    
      <section id="products">
      
        <div class="container">
          
            <div class="row">
            
                <div class="col-lg-3">
                
                    <form method="get" action="AuctionServlet">
                    
                    	<div class="list-group my-5" id="myList" role="tablist">
                        
	                      <button type="submit" class="list-group-item list-group-item-action" name="btn-value" value="search.electronic">Electronics</button>
	                      <button type="submit" class="list-group-item list-group-item-action" name="btn-value" value="search.fashion">Fashion</button>
	                      <button type="submit" class="list-group-item list-group-item-action" name="btn-value" value="search.vehicle">Vehicles</button>
	                      <button type="submit" class="list-group-item list-group-item-action" name="btn-value" value="search.jewellery">Jewellery</button>
	                      <button type="submit" class="list-group-item list-group-item-action" name="btn-value" value="search.toy">Toys</button>
	                        
	                    </div>
                    
                    </form>
                    
                    <div class="profile-wrapper border mb-5" style="">
                            
                        <div class="profile-info mt-3">

                            <h5 class="ml-4">Upload Guidelines</h5><hr class="text-center" style="width: 90%;">

                        </div>

                        <form class="profile-info-form my-4" method="get" action="AuctionServlet">

                            <div class="form-group mx-4">
                                        
                                <label for="sPrice">Start Price</label>
                                <input type="number" class="form-control" name="sPrice" placeholder="Start Price" required>

                            </div>
                            
                            <div class="form-group mx-4">
                                        
                                <label for="ePrice">End Price</label>
                                <input type="number" class="form-control" name="ePrice" placeholder="End Price" required>

                            </div>

                            <div class="text-center">
                                    
                                <button style="width: 90%;" type="submit" name="btn-value" value="price.result" class="btn btn-dark">Update your Search</button>

                            </div>

                        </form>

                    </div>
                
                </div>   
                
                <div class="col-lg-9">
                
                    <div class="side-menu-header mt-lg-5 mb-4 border-top border-right border-bottom">
                        
                        <h5 class="py-3 ml-3">All Auctions</h5>

                    </div>
                    
                    <div class="row">
                    
                    	<% for(Auction element: auctions) { 
                    			int cus_id = element.getCus_id();
                    			customer = cus.getCustomerById(cus_id);
                    	%>
                    		
                        <div class="col-lg-4">
                        
                            <div id="test-card" class="card mb-4">

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
                                  <p class="card-text" id="des"><%=element.getbDescription() %></p>
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
  </body>
</html>