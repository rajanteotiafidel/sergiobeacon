package com.beacon.servlet;

import java.io.*;
import java.net.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import org.json.simple.parser.JSONParser;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class GetNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetNotification() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Get Notification doGet=====================");
		String message = "Test Message";
		
		System.out.println("Get Notification doget");

/*		Message msg=new Message();
		msg.setMessage("Test it");

	    	String json = new Gson().toJson(msg);
	    	response.setContentType("application/json");
	    	response.setCharacterEncoding("UTF-8"); */
	    	response.getWriter().write(message); 
		
	}
}
