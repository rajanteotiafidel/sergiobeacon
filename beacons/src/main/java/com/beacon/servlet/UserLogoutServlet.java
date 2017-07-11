package com.beacon.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserLogoutServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String logmsg = "You've been successfully logged out";
			HttpSession session=request.getSession(false);
			
			try{
			session.removeAttribute((String)session.getAttribute("email"));
			session.invalidate();
			if (session != null) {
				  session.setMaxInactiveInterval(0);
			}
			request.setAttribute("logmsg", logmsg);
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		
			}
       	    catch (Exception e) {
		    System.out.println("Error in Logout="+e);
        	}
		   }
}
