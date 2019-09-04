package com.onlineauction.servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.onlineauction.model.Customer;
import com.onlineauction.service.CustomerService;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/CustomerServlet")
@MultipartConfig
public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = 
            Logger.getLogger(CustomerServlet.class.getCanonicalName());
	private CustomerService cusService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public CustomerServlet() {
        super();
        cusService = new CustomerService();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	cusService.deleteCustomer(Integer.parseInt(btnType));
    	
    	out.println("<script type=\"text/javascript\">");
		out.println("alert('Successfully Deleted!');");
	    out.println("location='admin_customer.jsp';");
	    out.println("</script>");	
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Customer cus = new Customer();
    	String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	if(btnType.equalsIgnoreCase("update")) {
    		cus.setUserName(request.getParameter("uName"));
    		cus.setEmail(request.getParameter("email"));
    		cus.setFirstName(request.getParameter("fName"));
    		cus.setLastName(request.getParameter("lName"));
    		cus.setAbout(request.getParameter("about"));
    		cusService.updateCustomer(cus);
    		
    		out.println("<script type=\"text/javascript\">");
			out.println("alert('Successfully Updated!');");
		    out.println("location='user_account_settings.jsp';");
		    out.println("</script>");
    	} else if (btnType.equalsIgnoreCase("file")) {
    		HttpSession session = request.getSession();
    		cus.setUserName((String) session.getAttribute("username"));
    		
    		final String path = "E:\\Development\\OOP Project\\2nd-year-oop-project\\OOP Web Project\\Online Auction\\WebContent\\uploads";
            final Part filePart = request.getPart("file");
            final String fileName = getFileName(filePart);

            OutputStream out1 = null;
            InputStream filecontent = null;
            final PrintWriter writer = response.getWriter();

            try {
                out1 = new FileOutputStream(new File(path + File.separator
                        + fileName));
                filecontent = filePart.getInputStream();

                int read = 0;
                final byte[] bytes = new byte[1024];

                while ((read = filecontent.read(bytes)) != -1) {
                    out1.write(bytes, 0, read);
                }
                //writer.println("New file " + fileName + " created at " + path);
                
                LOGGER.log(Level.INFO, "File{0}being uploaded to {1}", 
                        new Object[]{fileName, path});
                
                cus.setImage(fileName);
                cusService.uploadProfilePicture(cus);
                
                writer.println("<script type=\"text/javascript\">");
    			writer.println("alert('Successfully Uploaded!');");
    		    writer.println("location='user_account_settings.jsp';");
    		    writer.println("</script>");
                
            } catch (FileNotFoundException fne) {
                writer.println("You either did not specify a file to upload or are "
                        + "trying to upload a file to a protected or nonexistent "
                        + "location.");
                writer.println("<br/> ERROR: " + fne.getMessage());

                LOGGER.log(Level.SEVERE, "Problems during file upload. Error: {0}", 
                        new Object[]{fne.getMessage()});
            } finally {
                if (out1 != null) {
                    out1.close();
                }
                if (filecontent != null) {
                    filecontent.close();
                }
                if (writer != null) {
                    writer.close();
                }
            }
    	}
	} 
    
    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        LOGGER.log(Level.INFO, "Part Header = {0}", partHeader);
        for (String content : part.getHeader("content-disposition").split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(
                        content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}


