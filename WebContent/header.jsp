<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@page import="com.onlineauction.service.CustomerService"%>
<%@page import="com.onlineauction.model.Customer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css?family=Titillium+Web" rel="stylesheet">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.1/css/all.css" integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf" crossorigin="anonymous">
        <link rel="stylesheet" href="css/header-test.css">
        
        <title></title>
    </head>
<body>

	<%  try {
	
	if(session.getAttribute("username") == null) { %>
    <!--HEADER-->
    <div class="header-wrap">
        <header>
            <!--LOGO-->
            <a href="#">
                <figure class="logo">
                    <img src="images/header/logo3.png" alt="logo">
                </figure>
            </a>
            <!--/LOGO-->
            <!--MOBILE MENU HANDLER-->
            <div class="mobile-menu-handler left primary">
                <img src="images/header/pull-icon.png" alt="pull-icon">
            </div>
            <!--/MOBILE MENU HANDLER-->
            <!--LOGO MOBILE-->
            <a href="index.html">
                <figure class="logo-mobile">
                    <img src="images/header/logo_mobile.png" alt="logo-mobile">
                </figure>
            </a>
            <!--/LOGO MOBILE-->
            <!--MOBILE ACCOUNT OPTIONS HANDLER-->
            <div class="mobile-account-options-handler right secondary">
                <span class="icon-user"></span>
            </div>
            <!--/MOBILE ACCOUNT OPTIONS HANDLER-->
            <!--USER BOARD-->
            <div class="user-board">
                
                <!--ACCOUNT ACTIONS-->
                <div class="account-actions" style="margin-right: 150px;">
                    <a href="register.jsp" class="button primary">Sign Up</a>
                    <a href="login.jsp" class="button secondary">Login</a>
                </div>
                <!--/ACCOUNT ACTIONS-->
                
            </div>
            <!--/USER BOARD-->
        </header>
    </div>
    <!--/HEADER-->

    <!--SIDE MENU 1-->
            <div id="mobile-menu" class="side-menu left closed">
                <!-- SVG PLUS-->
                <div class="svg-plus">
                    X
                </div>
                <!--/SVG-->
                <!-- SIDE MENU HEADER -->
                <div class="side-menu-header">
                    <figure class="logo small">
                        <img src="images/header/logo3.png" alt="logo">
                    </figure>
                </div>
                <!-- /SIDE MENU HEADER -->
                <!-- SIDE MENU TITLE -->
                <p class="side-menu-title">Main Links</p>
                <!-- /SIDE MENU TITLE -->
                <!-- DROPDOWN -->
                <ul class="dropdown-2 dark hover-effect interactive" style="padding-left:0px">
                    <li class="dropdown-2-item">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="how_to_shop.jsp">How to Shop</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="auction_page.jsp">Auctions</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="contact_us.jsp">Contact Us</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="privacy_policy.jsp">Privacy Policy</a>
                    </li>
                </ul>
                <!-- /DROPDOWN -->
            </div>
    <!--/SIDE MENU 1-->

    <!--SIDE MENU 2-->
    <div id="account-options-menu" class="side-menu right closed">
        <!-- SVG PLUS -->
        <div class="svg-plus">
            X
        </div>
        
        <!-- SIDE MENU TITLE 2 -->
        <p class="side-menu-title">Try Out</p>
        <!-- /SIDE MENU TITLE 2-->
        
        <!-- /DROPDOWN 2 -->
        <a href="register.jsp" class="button medium primary">Sign Up</a>
        <a href="login.jsp" class="button medium secondary">Login</a>
    </div>
    
    <% } else if (session.getAttribute("username") != null) { 
    		CustomerService cus = new CustomerService();
    		int cusId = (int) session.getAttribute("cus_id");
    		Customer customer = cus.getCustomerById(cusId);
    %>
    
    <div class="header-wrap">
        <header>
            <!--LOGO-->
            <a href="#">
                <figure class="logo">
                    <img src="images/header/logo3.png" alt="logo">
                </figure>
            </a>
            <!--/LOGO-->
            <!--MOBILE MENU HANDLER-->
            <div class="mobile-menu-handler left primary">
                <img src="images/header/pull-icon.png" alt="pull-icon">
            </div>
            <!--/MOBILE MENU HANDLER-->
            <!--LOGO MOBILE-->
            <a href="index.html">
                <figure class="logo-mobile">
                    <img src="images/header/logo_mobile.png" alt="logo-mobile">
                </figure>
            </a>
            <!--/LOGO MOBILE-->
            <!--MOBILE ACCOUNT OPTIONS HANDLER-->
            <div class="mobile-account-options-handler right secondary">
                <span class="icon-user"></span>
            </div>
            <!--/MOBILE ACCOUNT OPTIONS HANDLER-->
            <!--USER BOARD-->
            <div class="user-board">
                <!--USER QUICKVIEW-->
                <div class="user-quickview">
                    <!--USER AVATAR-->
                    <a href="#">
                        <div class="outer-ring">
                            <div class="inner-ring"></div>
                            <figure class="user-avatar">
                                <img id="myimg" src="uploads/<%=customer.getImage() %>" alt="avatar">
                            </figure>
                        </div>
                    </a>
                    <!--/USER AVATAR-->
                    <!--USER INFORMATION-->
                    <p class="user-name"><%=customer.getFirstName() %> <%=customer.getLastName() %></p>
                    <p class="user-money">@<%=customer.getUserName() %></p>
                    <!--/USER INFORMATION-->
                    <!--DROPDOWN-->
                    <ul class="nav flex-column dropdown-2 small-2 hover-effect closed">
                        <li class="dropdown-2-item">
                            <a href="user_account_settings.jsp">Account Settings</a>
                        </li>
                            <div class="dropdown-triangle"></div>
                        <li class="dropdown-2-item">
                            <a href="user_account_purchases.jsp">My Purchases</a>
                        </li>
                        <li class="dropdown-2-item">
                            <a href="user_account_upload.jsp">Upload Items</a>
                        </li>
                        <li class="dropdown-2-item">
                            <a href="user_account_manage.jsp">Manage Items</a>
                        </li>
                        <li class="dropdown-2-item">
                            <a href="user_account_order.jsp">My Orders</a>
                        </li>
                    </ul>
                    <!--/DROPDOWN-->
                </div>
                <!--/USER QUICKVIEW-->


                <!--ACCOUNT INFORMATION-->
                <div class="account-information">
                    <a href="user_account_favourite.jsp">
                        <div class="account-wishlist-quickview">    
                            <span class="icon-heart"></span>
                        </div>
                    </a>
                    <a href="user_account_purchases.jsp">
                        <div class="account-cart-quickview">
                            <span class="icon-basket"></span>
                        </div>
                    </a>
                </div>
                <!--/ACCOUNT INFORMATION-->


                <!--ACCOUNT ACTIONS-->
                
                
                	<div class="account-actions">
	                	<form method="post" action="Logout" id="myform">
		                    <a href="#" class="button secondary" onclick="document.getElementById('myform').submit()" name="logout" value="lo">Logout</a>
		                </form>
	                </div>
                
                
                <!--/ACCOUNT ACTIONS-->
            </div>
            <!--/USER BOARD-->
        </header>
    </div>
    <!--/HEADER-->

    <!--SIDE MENU 1-->
            <div id="mobile-menu" class="side-menu left closed">
                <!-- SVG PLUS-->
                <div class="svg-plus">
                    X
                </div>
                <!--/SVG-->
                <!-- SIDE MENU HEADER -->
                <div class="side-menu-header">
                    <figure class="logo small">
                        <img src="images/header/logo3.png" alt="logo">
                    </figure>
                </div>
                <!-- /SIDE MENU HEADER -->
                <!-- SIDE MENU TITLE -->
                <p class="side-menu-title">Main Links</p>
                <!-- /SIDE MENU TITLE -->
                <!-- DROPDOWN -->
                <ul class="dropdown-2 dark hover-effect interactive" style="padding-left:0px">
                    
                    <li class="dropdown-2-item">
                        <a href="home.jsp">Home</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="how_to_shop.jsp">How to Shop</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="auction_page.jsp">Auctions</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="contact_us.jsp">Contact Us</a>
                    </li>
                    <li class="dropdown-2-item">
                        <a href="privacy_policy.jsp">Privacy Policy</a>
                    </li>
                
                </ul>
                <!-- /DROPDOWN -->
            </div>
    <!--/SIDE MENU 1-->

    <!--SIDE MENU 2-->
    <div id="account-options-menu" class="side-menu right closed">
        <!-- SVG PLUS -->
        <div class="svg-plus">
            X
        </div>
        <!-- /SVG PLUS -->
        <!-- SIDE MENU HEADER -->
        <div class="side-menu-header">
            <!-- USER QUICKVIEW -->
            <div class="user-quickview">
                <!-- USER AVATAR -->
                <a href="#">
                <div class="outer-ring">
                    <div class="inner-ring"></div>
                    <figure class="user-avatar">
                        <img src="uploads/<%=customer.getImage() %>" alt="avatar">
                    </figure>
                </div>
                </a>
                <!-- /USER AVATAR -->
                <!-- USER INFORMATION -->
                <p class="user-name"><%=customer.getFirstName() %> <%=customer.getLastName() %></p>
                <p class="user-money">@<%=customer.getUserName() %></p>
                <!-- /USER INFORMATION -->
            </div>
            <!-- /USER QUICKVIEW -->
        </div>
        <!-- /SIDE MENU HEADER -->
        <!-- SIDE MENU TITLE 1 -->
        <p class="side-menu-title">Your Account</p>
        <!-- /SIDE MENU TITLE 1-->
        <!-- DROPDOWN 1 -->
        <ul class="dropdown-2 dark hover-effect" style="padding-left: 0px; margin-bottom: 0px; border-bottom: 0px">
            <li class="dropdown-2-item">
                <a href="user_account_favourite.jsp">Favourites</a>
            </li>
            <li class="dropdown-2-item">
                <a href="user_account_purchases.jsp">Cart</a>
            </li>
        </ul>
        <!-- /DROPDOWN 1 -->
        <!-- SIDE MENU TITLE 2 -->
        <p class="side-menu-title">Dashboard</p>
        <!-- /SIDE MENU TITLE 2-->
        <!-- DROPDOWN 2 -->
        <ul class="dropdown-2 dark hover-effect" style="padding-left: 0px;">
            <li class="dropdown-2-item">
                <a href="user_account_settings.jsp">Account Settings</a>
            </li>
            <li class="dropdown-2-item">
                <a href="user_account_purchases.jsp">My Purchases</a>
            </li>
            <li class="dropdown-2-item">
                <a href="user_account_upload.jsp">Upload Items</a>
            </li>
            <li class="dropdown-2-item">
                <a href="user_account_manage.jsp">Manage Items</a>
            </li>
            <li class="dropdown-2-item">
                <a href="user_account_order.jsp">My Orders</a>
            </li>
        </ul>
        <!-- /DROPDOWN 2 -->
        <form method="post" action="Logout" id="myform1">
        	<a href="#" class="button medium secondary" onclick="document.getElementById('myform1').submit()">Logout</a>
        </form>
        
    </div>
    <!--/SIDE MENU 2-->
    <script type="text/javascript">

    
	
	</script>
    <% } 
	} catch (Exception e) {
    	e.printStackTrace();
    }%>
    
    <!--DARK OVERLAYER-->
    <div class="shadow-film closed"></div>
    <!--/DARK OVERLAYER-->

<!--JAVASCRIPTS-->    
<!-- jQuery -->
<script src="js/jquery-3.js"></script>
<!-- SIDE MENU HEADER -->
<script src="js/side-menu.js"></script>
<!-- UQD HEADER -->
<script src="js/user-board.js"></script>

<!--/JAVASCRIPTS-->

</body>
</html>