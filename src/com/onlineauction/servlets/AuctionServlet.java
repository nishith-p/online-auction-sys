package com.onlineauction.servlets;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.regex.Pattern;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.onlineauction.model.Auction;
import com.onlineauction.model.Customer;
import com.onlineauction.service.AuctionService;
import com.onlineauction.service.CustomerService;

/**
 * Servlet implementation class CustomerServlet
 */
@WebServlet("/AuctionServlet")
@MultipartConfig
public class AuctionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger LOGGER = 
            Logger.getLogger(AuctionServlet.class.getCanonicalName());
	private AuctionService aucService;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public AuctionServlet() {
        super();
        aucService = new AuctionService();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	String parts[] = btnType.split(Pattern.quote("."));
    	String type = parts[0];
    	String auctionId = parts[1];
    	
    	if (type.equalsIgnoreCase("view")) {
    		request.setAttribute("auctionId", auctionId);
    		
    		RequestDispatcher view = request.getRequestDispatcher("auction_inside.jsp");
            view.forward(request, response);
    	} else if (type.equalsIgnoreCase("delete")){
    		aucService.deleteAuction(Integer.parseInt(auctionId));
    		
        	out.println("<script type=\"text/javascript\">");
    		out.println("alert('Successfully Deleted!');");
    	    out.println("location='admin_auction.jsp';");
    	    out.println("</script>");
    	} else if (type.equalsIgnoreCase("search")) {
    		request.setAttribute("category", auctionId);
    		
    		RequestDispatcher view = request.getRequestDispatcher("searched_results.jsp");
            view.forward(request, response);
    	} else if (type.equalsIgnoreCase("price")) {
    		request.setAttribute("sPrice", request.getParameter("sPrice"));
    		request.setAttribute("ePrice", request.getParameter("ePrice"));
    		
    		RequestDispatcher view = request.getRequestDispatcher("searched_results.jsp");
            view.forward(request, response);
    	} else if (type.equalsIgnoreCase("nav")) {
    		request.setAttribute("product", request.getParameter("navSearch"));

    		RequestDispatcher view = request.getRequestDispatcher("searched_results.jsp");
            view.forward(request, response);
    	} else if (type.equalsIgnoreCase("home")) {
    		request.setAttribute("itemName", request.getParameter("home-search"));
    		request.setAttribute("home-category", request.getParameter("home-category"));

    		RequestDispatcher view = request.getRequestDispatcher("searched_results.jsp");
            view.forward(request, response);
    	}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	Auction auc = new Auction();
    	String btnType = request.getParameter("btn-value");
    	PrintWriter out = response.getWriter();
    	
    	if(btnType.equalsIgnoreCase("add")) {
    		HttpSession session = request.getSession();
    		auc.setCus_id((int) session.getAttribute("cus_id"));
    		auc.setCategory(request.getParameter("category"));
    		auc.setItemName(request.getParameter("itemName"));
    		auc.setbDescription(request.getParameter("bDescription"));
    		auc.setStartPrice(Double.parseDouble(request.getParameter("startPrice")));
    		String h = request.getParameter("endDate");
    		auc.setEndDate(h);
    		auc.setDescription(request.getParameter("description"));
    		auc.setShippingAndDelivery(request.getParameter("shippingAndDelivery"));
    		auc.setReturnPolicy(request.getParameter("returnPolicy"));
    		
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
                
                auc.setImage1(fileName);
                aucService.addAuction(auc);
                
                writer.println("<script type=\"text/javascript\">");
    			writer.println("alert('Successfully Uploaded!');");
    			writer.println("location='user_account_upload.jsp';");
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
    		
    		out.println("<script type=\"text/javascript\">");
			out.println("alert('Successfully Updated!');");
		    out.println("location='user_account_upload.jsp';");
		    out.println("</script>");
    	} else if (btnType.equalsIgnoreCase("delete")) {
    		
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


