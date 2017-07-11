package com.beacon.servlet;

import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class UserRegisterServlet extends HttpServlet{
 
    private static final long serialVersionUID = 1L;
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
    	InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
    	
    	Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
    	
    	String full_name=request.getParameter("full_name");
    	String password=request.getParameter("password");
    	String email=request.getParameter("email");
    	String cpwd = request.getParameter("cpwd");
    	String msg = "Email ID Already Registered....";
    	String success = "You've successfully registered...";
    	String pwd = "Passwords donot match...";
    	
    	if(!password.equals(cpwd)) {
			request.setAttribute("msg", pwd);
			response.sendRedirect(request.getContextPath()+"/register.jsp");
		}
    	else {
    		try {
    			try {
    				Class.forName("com.mysql.jdbc.Driver");
    			} catch (ClassNotFoundException e) {
    				e.printStackTrace();
    				return;
    			}
    			Connection connection = null;
    			String selectTableSQL = "SELECT email FROM User_Profile where email = ?";
    			String insertTableSQL = "INSERT INTO User_Profile (full_name, password, email) VALUES (?,?,?)";
    			try {
    				connection = DriverManager.getConnection(url, dbusername, dbpassword);
    				PreparedStatement ps = connection.prepareStatement(selectTableSQL);
    				ps.setString(1, email);
    				ResultSet rs = ps.executeQuery();
    				int count = 0;
    				while(rs.next()) {
    					count++;
    				}
    				if(count>0) {
    					request.setAttribute("msg", msg);
    					response.sendRedirect(request.getContextPath()+"/register.jsp");
    				} else {
    					PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
    					preparedStatement.setString(1, full_name);
    					preparedStatement.setString(2, password);
    					preparedStatement.setString(3, email);
    					preparedStatement.executeUpdate();
    					request.setAttribute("msg", success);
    					response.sendRedirect(request.getContextPath()+"/login.jsp");
    				}
    			} catch (SQLException e) {
    				e.printStackTrace();
    				return;
    			}
    			if(connection!=null) {
    				connection.close();
    			}
    		}catch(Exception e){
    			e.printStackTrace();
    		}
		}
    }
}