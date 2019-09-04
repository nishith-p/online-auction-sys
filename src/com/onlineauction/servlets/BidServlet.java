package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineauction.model.Bid;
import com.onlineauction.service.AuctionService;
import com.onlineauction.service.BidService;

/**
 * Servlet implementation class BidServlet
 */
@WebServlet("/BidServlet")
public class BidServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BidService bidService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BidServlet() {
        super();
        bidService = new BidService();
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
		String btnValue = request.getParameter("btn-value");
		double bidPrice = Double.parseDouble(request.getParameter("bid"));
		PrintWriter out = response.getWriter();
		
		String parts[] = btnValue.split("-");
		String auctionId = parts[0];
		double currentPrice = Double.parseDouble(parts[1]);
		String cusId = parts[2];
		
		if (cusId == null) {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Please Log in first!');");
		    out.println("location='login.jsp';");
		    out.println("</script>");
		} else {
			if (currentPrice >= bidPrice) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Bid Price is lower than the current price');");
			    out.println("history.go(-1);");
			    out.println("</script>");
			} else {
				Bid bid = new Bid();
				AuctionService auc = new AuctionService();
				
				bid.setAuctionId(Integer.parseInt(auctionId));
				bid.setCusId(Integer.parseInt(cusId));
				bid.setPrice(bidPrice);
				
				bidService.addBid(bid);
				auc.updateCurrentPrice(Integer.parseInt(auctionId), bidPrice);
				
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Bid was Successfull');");
				out.println("location='auction_page.jsp';");
			    out.println("</script>");
			}
		}
	}

}
