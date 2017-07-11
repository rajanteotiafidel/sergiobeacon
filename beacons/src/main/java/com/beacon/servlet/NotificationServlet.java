package com.beacon.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class NotificationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NotificationServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		String Immediate="";
		String Near="";
		String Far ="";
		
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
		
		Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
    
		String email = (String) session.getAttribute("email");
		if (session != null && email != "null") {
			String selectProfileTableSQL = "SELECT * from ProximityZone where id=1";
			Connection connection = null;
			try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					return;
				}
				try {
					System.out.println("url="+url);
	    			System.out.println("dbusername="+dbusername);
	    			System.out.println("dbpassword="+dbpassword);
			     	connection = DriverManager.getConnection(url,dbusername,dbpassword);
					PreparedStatement preparedStatement = connection.prepareStatement(selectProfileTableSQL);
			
					ResultSet rs = preparedStatement.executeQuery();
					
					while(rs.next()) {
						
					     Immediate = (String)rs.getObject("Immediate");
						 Immediate = rs.getString("Immediate");
						 Near = rs.getString("Near");
						 Far = rs.getString("Far");
					}
					System.out.println("Immediate==="+Immediate);
					System.out.println("Near==="+Near);
					System.out.println("Far==="+Far);
    				
					session.setAttribute("Immediate", Immediate);
					session.setAttribute("Near", Near);
					session.setAttribute("Far", Far);
					/*request.setAttribute("msg1", "Message Update Successfully.");*/

					response.sendRedirect(request.getContextPath()+"/notification.jsp");
    		           
				} catch (SQLException e) {
					e.printStackTrace();
					return;
				}
				if(connection!=null) {
					connection.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
				return;
			}
		} else {
			response.sendRedirect(request.getContextPath()+"/notification");
		}
	}
	
	public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        		   
	   		String page = "";
		  
		    ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
			InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
	    	Properties properties = new Properties();
	    	properties.load(input);
	    	String  url=properties.getProperty("jdbc.url");
	    	String	dbusername=properties.getProperty("jdbc.username");
	    	String	dbpassword=properties.getProperty("jdbc.password");
	    	String message = "";
	    	String column = "";
	    	String columname1=request.getParameter("Immediate");
	    	String columname2=request.getParameter("Near");
	    	String columname3=request.getParameter("Far");
	    	String message1=request.getParameter("message1");
	    	String message2=request.getParameter("message2");
	    	String message3=request.getParameter("message3");
	    	System.out.println("columname1=="+columname1);
	    	System.out.println("columname2=="+columname2);
	    	System.out.println("columname3=="+columname3);
	    	System.out.println("message1=="+message1);
	    	System.out.println("message2=="+message2);
	    	System.out.println("message3=="+message3);
	    	
	    	try {
	    		try {
	    			Class.forName("com.mysql.jdbc.Driver");
	    		} catch (ClassNotFoundException e) {
	    			e.printStackTrace();
	    			return;
	    		}
	    		Connection connection = null;
	    		
	    		String insertTableSQL ="UPDATE ProximityZone SET  Immediate=?,  Near=?,  Far=? where id =1";
	    		try {
	    			System.out.println("url="+url);
	        		System.out.println("dbusername="+dbusername);
	        		System.out.println("dbpassword="+dbpassword);
	    			connection = DriverManager.getConnection(url,dbusername,dbpassword);
	    
	    			PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
	    			preparedStatement.setString(1, message1);
	    			preparedStatement.setString(2, message2);
	    			preparedStatement.setString(3, message3);
	    				
	    			preparedStatement.executeUpdate();
	    			HttpSession session = request.getSession();
	    		//	request.setAttribute("msg1", msg);
	    		//	session.setMaxInactiveInterval(5*60);
	    			session.setAttribute("msg1", "success");
	    			message = "Message Update successfully";
	    			request.setAttribute("message", message);
	    					
	    			response.sendRedirect(request.getContextPath()+"/notification");
	    				
	    			} catch (SQLException e) {
	    				e.printStackTrace();
	    				return;
	    			}
	    			if(connection!=null) {
	    				connection.close();
	    			}
	    		} catch(Exception e) {
	    			e.printStackTrace();
	    		}
		
	    }
}