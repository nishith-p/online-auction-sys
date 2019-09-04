package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineauction.model.Subscriber;
import com.onlineauction.service.SubscriberService;

/**
 * Servlet implementation class SubscriberServlet
 */
@WebServlet("/SubscriberServlet")
public class SubscriberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private SubscriberService subService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubscriberServlet() {
        super();
        subService = new SubscriberService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("btn-value");
		PrintWriter out = response.getWriter();
		
		subService.deleteSubscriber(Integer.parseInt(value));
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully Deleted!');");
		out.println("location='admin_subscriber.jsp';");
	    out.println("</script>");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Subscriber sub = new Subscriber();
		PrintWriter out = response.getWriter();
		
		sub.setEmail(request.getParameter("sub-input"));
		subService.addSubscriber(sub);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully Subscribed!');");
		out.println("history.go(-1);");
	    out.println("</script>");
	
	}

}
