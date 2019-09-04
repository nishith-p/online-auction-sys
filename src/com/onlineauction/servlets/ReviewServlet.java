package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.onlineauction.model.Review;
import com.onlineauction.service.ReviewService;

/**
 * Servlet implementation class ReviewServlet
 */
@WebServlet("/ReviewServlet")
public class ReviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReviewService revService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewServlet() {
        super();
        revService = new ReviewService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	HttpSession session = request.getSession();
    	String cusId = String.valueOf(session.getAttribute("cus_id"));
 
		Review rev = new Review();
		
		rev.setAuctionId(Integer.parseInt(btnType));
		rev.setCusId(Integer.parseInt(cusId));
		LocalDate date = java.time.LocalDate.now();
		String checkDate = String.valueOf(date);
		rev.setDate(checkDate);
		rev.setReview(request.getParameter("description"));
		
		revService.addReview(rev);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully added Review!');");
	    out.println("location='auction_page.jsp';");
	    out.println("</script>");
	}
}
