package com.beacon.servlet;

import java.io.*;
import java.sql.*;
import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

public class EstomiteLoginServlet extends HttpServlet{
 
	ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
	InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
	
    private static final long serialVersionUID = 1L;
    public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	Properties properties = new Properties();
    	properties.load(input);
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
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
    		String selecteLoginTableSQL = "SELECT * from Estimote where email = ? and password = ?";
    		try {
    			System.out.println("url="+url);
    			System.out.println("dbusername="+dbusername);
    			System.out.println("dbpassword="+dbpassword);
    			connection = DriverManager.getConnection(url,dbusername,dbpassword);
    			PreparedStatement preparedStatement = connection.prepareStatement(selecteLoginTableSQL);
    			preparedStatement.setString(1, email);
    			preparedStatement.setString(2, password);
    			ResultSet rs = preparedStatement.executeQuery();
    			int count = 0;
    			while(rs.next()) {
    				count++;
    			}
    			if(count>0) {
    		            response.sendRedirect(request.getContextPath()+"/eAssociate.jsp");
    			} else {
    				request.setAttribute("msg", msg);
    				request.getRequestDispatcher("/estimote.jsp").forward(request, response);
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