package com.beacon.servlet;

import java.io.*;
import java.sql.*;
import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

public class ChangePasswordServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession(false);
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
		
		Properties properties = new Properties();
    	properties.load(input);
    	String driver=properties.getProperty("jdbc.driver");
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");

		
		String email = (String) session.getAttribute("email");
		if (session != null && email != "null") {
			String selectProfileTableSQL = "SELECT * from User_Profile where email = ?";
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
					preparedStatement.setString(1, email);
					ResultSet rs = preparedStatement.executeQuery();
					while(rs.next()) {
						System.out.println("ChangePasswordServlet");
				    	session.setAttribute("orgName",(String)rs.getObject("orgName"));
						
					}
					request.getRequestDispatcher("/changepassword.jsp").forward(request, response);
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
			response.sendRedirect(request.getContextPath()+"/login.jsp");
		}
	}
	
	protected void doPost (HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ChangePassword-----11------>>>");
		HttpSession session = request.getSession(false);
		
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
		
		Properties properties = new Properties();
    	properties.load(input);
    	//String driver=properties.getProperty("jdbc.driver");
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
		String msg = "User Details Updated Successfully";
		
		String email = (String) session.getAttribute("email");
		String selectProfileTableSQL = "SELECT * from User_Profile where email = ?";
		if(request.getParameter("submit")!=null) {
			//String subplan=request.getParameter("subplan");
	    
			
			String orgName=request.getParameter("orgName");
	    	String password=request.getParameter("password");
	    	System.out.println("orgName="+orgName);
	    	System.out.println("password="+password);
	    	try {
				try {
					Class.forName("com.mysql.jdbc.Driver");
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
					return;
				}
				Connection connection = null;
				String insertTableSQL = "UPDATE User_Profile SET  password=? where email =?";
				try {
					System.out.println("ChangePassword----------22->>>");
					System.out.println("url="+url);
	    			System.out.println("dbusername="+dbusername);
	    			System.out.println("dbpassword="+dbpassword);
				
			     	connection = DriverManager.getConnection(url,dbusername,dbpassword);
					
			     	PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
					
					preparedStatement.setString(1, password);
					preparedStatement.setString(2, email);
					preparedStatement.executeUpdate();
					String success = "Records updated successfully";
					PreparedStatement st = connection.prepareStatement(selectProfileTableSQL);
					st.setString(1, email);
					ResultSet rs = st.executeQuery();
					while(rs.next()) {
					
						session.setAttribute("otheri",(String)rs.getObject("orgName"));
						if (password != session.getAttribute("password")) {
							String insertLoginTableSQL = "UPDATE User_Profile SET password=? where email = ?";
							System.out.println("**********444");
							PreparedStatement ps = connection.prepareStatement(insertLoginTableSQL);
							ps.setString(1, password);
							ps.setString(2, email);
							ps.executeUpdate();
							session.setAttribute("password",(String)rs.getObject("password"));
							request.setAttribute("msg", msg	);
						}
					}
					
		            request.setAttribute("msg", success);
					response.sendRedirect(request.getContextPath()+"/changepassword");
				} catch (SQLException e) {
					e.printStackTrace();
					return;
				}
				if(connection!=null) {
					connection.close();
				}
			}catch(Exception e){
				e.printStackTrace();
				return;
			}
		} 
	}
}