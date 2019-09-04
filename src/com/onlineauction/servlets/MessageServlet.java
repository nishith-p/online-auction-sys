package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.onlineauction.model.Message;
import com.onlineauction.service.MessageService;

/**
 * Servlet implementation class MessageServlet
 */
@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MessageService msj;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MessageServlet() {
        super();
        msj = new MessageService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String value = request.getParameter("btn-value");
		PrintWriter out = response.getWriter();
		
		msj.deleteMessage(Integer.parseInt(value));
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully Deleted the Message!');");
	    out.println("location='admin_message.jsp';");
	    out.println("</script>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Message message = new Message();
		PrintWriter out = response.getWriter();
		
		message.setName(request.getParameter("name"));
		message.setEmail(request.getParameter("email"));
		message.setPhone(request.getParameter("phone"));
		message.setMessage(request.getParameter("message"));
		
		msj.addMessage(message);
		
		out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully Send Message!');");
	    out.println("location='contact_us.jsp';");
	    out.println("</script>");
	}

}
