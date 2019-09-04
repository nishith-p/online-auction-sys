<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.onlineauction.service.CustomerService"%>
<%@page import="com.onlineauction.service.AuctionService"%>
<%@page import="com.onlineauction.service.OrderService"%>
<%@page import="com.onlineauction.model.Customer"%>
<%@page import="com.onlineauction.model.Auction"%>
<%@page import="com.onlineauction.model.Order"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      
    <link rel="stylesheet" href="css/test_style.css">
      
    <link rel="stylesheet" href="css/user_account_settings.css">
      
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
      
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <title>Auction || User Account</title>
      
  </head>
    
 <body>
 
 	<jsp:include page="header.jsp"/>
 	
 	<% CustomerService cus = new CustomerService(); 
 	   AuctionService auc = new AuctionService();
	
	   int cusId = (int) session.getAttribute("cus_id");
	   Customer customer = cus.getCustomerById(cusId);
	   
	   OrderService ordService = new OrderService();
	   List<Order> orders = ordService.getOrderByCusId(cusId);
	   
	  
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
    
    <div class="wrapper">
      
        <div class="container-fluid" style="background: #F5F5F5;">
          
            <div class="row">
            
                <div id="sidebar" class="col-lg-2 px-0 d-none d-lg-block" style="background: #202729;">
                
                    <div class="user-profile-details text-center my-4">
                    
                        <div class="user-quickview-l text-center">
                    		<!--USER AVATAR-->
                            <a href="#" class="text-center">
                                <div class="outer-ring-l">
                                    <div class="inner-ring-l"></div>
                                    <figure class="user-avatar-l">
                                        <img src="http://localhost:8080/Online_Auction/uploads/<%=customer.getImage() %>" alt="avatar">
                                    </figure>
                                </div>
                            </a>
                            <!--/USER AVATAR-->

                            <!--/DROPDOWN-->
                        </div>
                        <h5><%=customer.getFirstName() %> <%=customer.getLastName() %></h5>
                    
                    </div>
                    
                    <div class="side-menu-title">
                    
                        <p class="py-2 ml-3">Your Account</p>
                    
                    </div>
                    
                    <div class="sidebar-tabs mt-n3 py-3">
                    
                        <a href="user_account_settings.jsp" class="sidebar-text ml-3">
                            
                            <span class="d-inline mr-2"><i class="fas fa-cogs"></i></span>
                            <h6 class="d-inline">Account Settings</h6>

                        </a>
                    
                    </div>
                    
                    <div class="sidebar-tabs py-3">
                    
                        <a href="user_account_favourite.jsp" class="sidebar-text ml-4">
                            
                            <span class="d-inline mr-2"><i class="fas fa-heart"></i></span>
                            <h6 class="d-inline">My Favourites</h6>

                        </a>
                    
                    </div>
                    
                    <div class="sidebar-tabs py-3">
                    
                        <a href="user_account_purchases.jsp" class="sidebar-text ml-4">
                            
                            <span class="d-inline mr-2"><i class="fas fa-tags"></i></span>
                            <h6 class="d-inline">My Purchases</h6>

                        </a>
                    
                    </div>
                    
                    <div class="side-menu-title">
                    
                        <p class="py-2 ml-3">Authors Tools</p>
                    
                    </div>
                    
                    <div class="sidebar-tabs mt-n3 py-3">
                    
                        <a href="user_account_upload.jsp" class="sidebar-text ml-4">
                            
                            <span class="d-inline mr-2"><i class="fas fa-arrow-circle-up"></i></span>
                            <h6 class="d-inline">Upload Items</h6>

                        </a>
                    
                    </div>
                    
                    <div class="sidebar-tabs py-3">
                    
                        <a href="user_account_manage.jsp" class="sidebar-text ml-4">
                            
                            <span class="d-inline mr-2"><i class="fas fa-tasks"></i></span>
                            <h6 class="d-inline">Manage Items</h6>

                        </a>
                    
                    </div>
                    
                    <div class="sidebar-tabs-active py-3">
                    
                        <a href="user_account_order.jsp" class="sidebar-text-active ml-4">
                            
                            <span class="d-inline mr-2"><i class="fas fa-money-check"></i></span>
                            <h6 class="d-inline">My Orders</h6>

                        </a>
                    
                    </div>
                   
                </div>
                
                <div class="col-lg-10" style="background: ;">
                
                    <div class="row">
                    
                        <div class="side-menu-header ml-lg-5 mx-3 mt-4 border-top border-right border-bottom">
                        
                            <h5 class="py-3 ml-3">My Orders</h5>
                        
                        </div>
                    
                    </div>
                    
                    <div class="row">
                    	 
                    	 <div class="col-lg-12">
                    	 
                    	 	<div class="profile-wrapper border mt-4 mb-lg-5 mb-4" style="background: none;">
                    	 	
                    	 		<table class="table table-dark table-borderless" style="margin-bottom: 0;">
		                      <thead>
		                        <tr>
		                          <th scope="col">ID</th>
		                          <th scope="col">Auction Name</th>
		                          <th scope="col">Bid ID</th>
		                          <th scope="col">Buyer</th>
		                          <th scope="col">Price</th>
		                          <th scope="col">Date</th>
		                        </tr>
		                      </thead>
		                      <tbody>
		                      
		                      <% for (Order element: orders) { 
		                      		Auction auction = auc.getAuctionById(element.getAuctionId());
		                      		Customer buyer = cus.getCustomerById(element.getCusId());
		                      %>
		                        <tr>
		                          <th scope="row"><%=element.getOrderId() %></th>
		                          <td><%=auction.getItemName() %></td>
		                          <td><%=element.getBidId() %></td>
		                          <td><%=buyer.getFirstName() %> <%=buyer.getLastName() %></td>
								  <td><%=element.getPrice() %></td>
								  <td><%=element.getDate() %></td>
		                        </tr>
		                        
		                      <% } %>
		                      </tbody>
		                    </table>
                    	 	
                    	 	</div>
                    	 	
                    	 
                    	 </div>
                    	
                        
                    </div>
                
                </div>
            
            </div>  
          
        </div>
      
      </div>
      
      <footer id="footer" class="">
      
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