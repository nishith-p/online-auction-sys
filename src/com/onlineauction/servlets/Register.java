package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.DatatypeConverter;
import com.onlineauction.model.Customer;
import com.onlineauction.service.CustomerService;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CustomerService cusService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        cusService = new CustomerService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Customer cus = new Customer();
		Customer checkCus;
		
		String btnType = request.getParameter("btn-value");
		
		if (btnType.equalsIgnoreCase("update")) {
			cus.setUserName(request.getParameter("uName"));
			cus.setEmail(request.getParameter("email"));
			cus.setFirstName(request.getParameter("fName"));
			cus.setLastName(request.getParameter("lName"));
			
			cusService.updateCustomer(cus);
			response.sendRedirect("home.jsp");
			
		} else {
			cus.setUserName(request.getParameter("uName"));
			cus.setEmail(request.getParameter("email"));
			
			checkCus = cusService.getCustomerByOtherType(cus.getUserName(), "uname");
			
			PrintWriter out = response.getWriter();
			
			if (checkCus == null) {
				checkCus = cusService.getCustomerByOtherType(cus.getEmail(), "email");
				
				if (checkCus == null) {
					String temPass = request.getParameter("password");
					String hashValue = "";
					
					try {
						MessageDigest md = MessageDigest.getInstance("SHA-256");
						md.update(temPass.getBytes());
						
						byte[] digestedBytes = md.digest();
						hashValue = DatatypeConverter.printHexBinary(digestedBytes).toLowerCase();
						
						cus.setPassword(hashValue);	
						cusService.addCustomer(cus);
					} catch(Exception e) {
						e.printStackTrace();
					}
					
					out.println("<script type=\"text/javascript\">");
					out.println("alert('Successfully Registered!');");
				    out.println("location='login.jsp';");
				    out.println("</script>");
					
				} else {
					  out.println("<script type=\"text/javascript\">");
					  out.println("alert('Email is already existing in the System!');");
					  out.println("location='login.jsp';");
					  out.println("</script>");
				}
			} else {
				  out.println("<script type=\"text/javascript\">");
				  out.println("alert('User Name is already existing in the System!');");
				  out.println("location='login.jsp';");
				  out.println("</script>");
			}
		}
		
		
	}

}
