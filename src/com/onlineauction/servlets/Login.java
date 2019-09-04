package com.onlineauction.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;
import com.onlineauction.model.Customer;
import com.onlineauction.service.CustomerService;
import com.onlineauction.service.LoginDao;

@WebServlet("/Login")
public class Login extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private CustomerService cusService;
	private Customer cus;
	
	public Login() {
        super();
        cusService = new CustomerService();
    }
	

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String uName = req.getParameter("uName");
		String password = req.getParameter("password");
		String hashValue = "";
		
		try {
			MessageDigest md = MessageDigest.getInstance("SHA-256");
			md.update(password.getBytes());
			
			byte[] digestedBytes = md.digest();
			hashValue = DatatypeConverter.printHexBinary(digestedBytes).toLowerCase();
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		LoginDao dao = new LoginDao();
		PrintWriter out = res.getWriter();
		
		if(dao.check(uName, hashValue)) {
			HttpSession session = req.getSession();
			cus = new Customer();
			
			cus = cusService.getCustomerByOtherType(uName, "uname");
			session.setAttribute("cus_id", cus.getCus_id());
			session.setAttribute("username", uName);

			if (uName.equalsIgnoreCase("admin")) {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Successfully logged in!');");
			    out.println("location='admin_customer.jsp';");
			    out.println("</script>");
			} else {
				out.println("<script type=\"text/javascript\">");
				out.println("alert('Successfully logged in!');");
			    out.println("location='home.jsp';");
			    out.println("</script>");
			}
			
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('User Name or Password is invalid!');");
		    out.println("location='login.jsp';");
		    out.println("</script>");
		}
		
	}
}
