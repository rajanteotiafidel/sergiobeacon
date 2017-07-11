package com.beacon.servlet;

import java.io.*;
import java.sql.*;
import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

public class UserLoginServlet extends HttpServlet{
 
	
    private static final long serialVersionUID = 1L;
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    	InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
    	Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
    	
    	String name = null;
    	String email=request.getParameter("email");
    	String password=request.getParameter("password");
    	String msg = "Sorry, username and password do not match!";

    	try {
    		try {
    			Class.forName("com.mysql.jdbc.Driver");
    		} catch (ClassNotFoundException e) {
    			e.printStackTrace();
    			return;
    		}
    		Connection connection = null;
    		String selectLoginTableSQL = "SELECT * from User_Profile where email = ? and password = ?";
    		try {
    			System.out.println("url=="+url);
    			System.out.println("dbusername=="+dbusername);
    			System.out.println("dbpassword=="+dbpassword);
    		
    			connection = DriverManager.getConnection(url,dbusername,dbpassword);
    			PreparedStatement preparedStatement = connection.prepareStatement(selectLoginTableSQL);
    			preparedStatement.setString(1, email);
    			preparedStatement.setString(2, password);
    			ResultSet rs = preparedStatement.executeQuery();
    			int count = 0;
    			while(rs.next()) {
    				count++;
    				name = (String)rs.getObject("full_name");
    				System.out.println("Name == "+name);
    			}
    			if(count>0) {
    					HttpSession session=request.getSession();
    					session.setAttribute("name", name);
    		            session.setAttribute("email",email);
    		            session.setAttribute("password",password);

    		            response.sendRedirect(request.getContextPath()+"/dashboard.jsp");
    			} else {
    				
    				request.setAttribute("msg", msg);
    				request.getRequestDispatcher("/login.jsp").forward(request, response);
    			}
    		} catch (SQLException e) {
    			e.printStackTrace();
    			return;
    		}
        }catch(Exception e){
            e.printStackTrace();
			return;
        }
    }
}