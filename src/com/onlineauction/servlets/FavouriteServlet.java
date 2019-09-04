package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineauction.model.Favourite;
import com.onlineauction.service.FavouriteService;

/**
 * Servlet implementation class FavouriteServlet
 */
@WebServlet("/FavouriteServlet")
public class FavouriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private FavouriteService favService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FavouriteServlet() {
        super();
        favService = new FavouriteService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	String parts[] = btnType.split(Pattern.quote("."));
    	String type = parts[0];
    	String auctionId = parts[1];
    	String cusId = parts[2];
    	
    	if (type.equalsIgnoreCase("add")) {
    		Favourite fav = new Favourite();
        	fav.setAuctionId(Integer.parseInt(auctionId));
        	fav.setCus_id(Integer.parseInt(cusId));
        	
        	favService.addFavourite(fav);
        	
        	out.println("<script type=\"text/javascript\">");
    		out.println("alert('Added to Favourite!');");
    	    out.println("location='auction_page.jsp';");
    	    out.println("</script>");
    	} else {
    		favService.deleteFavourite(auctionId, cusId);
    		
    		out.println("<script type=\"text/javascript\">");
    		out.println("alert('Successfully Deleted!');");
    	    out.println("location='user_account_favourite.jsp';");
    	    out.println("</script>");
    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
