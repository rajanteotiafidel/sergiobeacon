package com.beacon.servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class IndexServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		
		if (session != null && (String) session.getAttribute("email") != "null") {
			request.getRequestDispatcher("/index.jsp").forward(request, response);
	    } else {
	    	response.sendRedirect(request.getContextPath()+"/login.jsp");
	    }
	}
}
