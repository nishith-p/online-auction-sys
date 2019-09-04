<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
      
    <link rel="stylesheet" href="css/test_style.css">
      
    <link rel="stylesheet" href="css/contact.css">
      
    <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
      
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">

    <title>Auction || Contact Us</title>
      
  </head>
    
<body>

	<% String userName = String.valueOf(session.getAttribute("username"));
	
		if (userName.equalsIgnoreCase("admin")) { %>
	
		<jsp:include page="header2.jsp"/>
		
	<% } else { %>
  	
  			<jsp:include page="header.jsp"/>
  			
  	<% } %>
  	
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
                        <a href="auction_page.jsp" >Auctions</a>
                    </li>
                    <li class="menu-item">
                        <a href="contact_us.jsp" id="active-page">Contact Us</a>
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
    
    <section id="contact-info">

            <div class="container">
                
                <div class="row">

                    <div class="col-md-8 px-0" style="">

                        <div class="form-wrapper border" style="background: #FFF;">
                            
                            <div class="register-form-top">
                        
                                <h3 class="pt-4 ml-3">Contact Form</h3>
                                <p class="pb-3 ml-3">Register now and start making money from home!</p>

                            </div>
                        
                            <form method="post" action="MessageServlet">
                            
                                <div class="form-group mx-3">
                                   
                                    <span class="ml-1"><i class="fa fa-user"></i></span>
                                    <label for="name" class="ml-1">Your Name<span style="color: #00d7b3;">*</span></label>
                                    <input type="text" class="form-control" name="name" placeholder="Your Name" required>

                                </div>
                                
                                <div class="form-group mx-3">
                                   
                                    <span class="ml-1"><i class="fa fa-envelope"></i></span>
                                    <label for="email" class="ml-1">Email Address<span style="color: #00d7b3;">*</span></label>
                                    <input type="email" class="form-control" name="email" placeholder="Email Address" required>

                                </div>
                                
                                <div class="form-group mx-3">
                                   
                                    <span class="ml-1"><i class="fa fa-phone"></i></span>
                                    <label for="phone" class="ml-1">Phone Number</label>
                                    <input type="number" class="form-control" name="phone" placeholder="Phone Number" required>

                                </div>
                                
                                <div class="form-group mx-3">
                                   
                                    <span class="ml-1"><i class="fa fa-comment-dots"></i></span>
                                    <label for="message" class="ml-1">Your Message</label>
                                    <textarea class="form-control" name="message" rows="4" placeholder="Your Message..." required></textarea>

                                </div>
                
                                <div class="mx-3 mb-3">
                                    
                                    <button style="" type="submit" class="btn btn-dark">Send Message<span class="ml-2"><i class="fa fa-paper-plane" style="color:#4DD9B6;"></i></span></button>

                                </div>
                    
                           </form>
                        
                        </div>

                    </div>

                    <div class="col-md-4">

                        <div class="contact-info">

                            <div class="element my-3">
                                <h4 class="font-weight-bold">Phone</h4>
                                <p>+947894611544</p>
                            </div>

                            <div class="element my-3">
                                <h4 class="font-weight-bold">Fax</h4>
                                <p>+3512345678</p>
                            </div>

                            <div class="element my-3">
                                <h4 class="font-weight-bold">Email</h4>
                                <p>onlineauction@gmail.com</p>
                            </div>

                            <div class="element my-3">
                                <h4 class="font-weight-bold">Address</h4>
                                <p>Queens, New York</p>
                            </div>

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
                      
                      	<div class="sub-wrapper text-center my-3 pt-3 pt-lg-0 my-lg-2">
                          
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