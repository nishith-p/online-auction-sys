package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineauction.model.Order;
import com.onlineauction.service.BidService;
import com.onlineauction.service.OrderService;

/**
 * Servlet implementation class OrderServlet
 */
@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private OrderService orderService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderServlet() {
        super();
        orderService = new OrderService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnValue = request.getParameter("btn-value");
		PrintWriter out = response.getWriter();
    	
    	String parts[] = btnValue.split("-");
    	String auctionId = parts[0];
    	String cusId = parts[1];
    	String bidId = parts[2];
    	String price = parts[3];
    	
    	request.setAttribute("auctionId", auctionId);
    	request.setAttribute("cusId", cusId);
    	request.setAttribute("bidId", bidId);
    	request.setAttribute("price", price);
    	
    	RequestDispatcher view = request.getRequestDispatcher("checkout.jsp");
        view.forward(request, response);
 	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Order o = new Order();
		String btnValue = request.getParameter("btn-value");
		PrintWriter out = response.getWriter();
    	
    	String parts[] = btnValue.split("-");
    	String auctionId = parts[0];
    	String cusId = parts[1];
    	String bidId = parts[2];
    	String price = parts[3];
    	
    	LocalDate date = java.time.LocalDate.now();
		String checkDate = String.valueOf(date);
		
		o.setAuctionId(Integer.parseInt(auctionId));
		o.setCusId(Integer.parseInt(cusId));
		o.setBidId(Integer.parseInt(bidId));
		o.setPrice(Double.parseDouble(price));
		o.setDate(checkDate);
		
		orderService.addOrder(o);
		
		BidService bid = new BidService();
		bid.deleteBid(Integer.parseInt(bidId));
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Payment was Successfull!');");
	    out.println("location='user_account_purchases.jsp';");
	    out.println("</script>");
		
	}

}
