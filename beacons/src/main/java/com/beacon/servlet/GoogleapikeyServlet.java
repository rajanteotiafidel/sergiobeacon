package com.beacon.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.*;
public class GoogleapikeyServlet extends HttpServlet{
 
	
	
	
    private static final long serialVersionUID = 1L;
    public void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    	
    	
   // 	String msg = "API Key Already Registered....";
    	response.sendRedirect(request.getContextPath()+"/googleapi.jsp");
    	
    	/*HttpSession session = request.getSession(false);
    	String apikey1 = (String) session.getAttribute("apikey");
    	String email = (String) session.getAttribute("email");
    	System.out.println(apikey1);
    	if (email == null) {
    		response.sendRedirect(request.getContextPath()+"/login.jsp");
    	} else if (apikey1 == null) {
			response.sendRedirect(request.getContextPath()+"/googleapi.jsp");
		} else {
			response.sendRedirect(request.getContextPath()+"/googleapisuccess.jsp");
   		}*/
    }
			
	/*public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
		Properties properties = new Properties();
		
    	properties.load(input);
    	
    	//String driver=properties.getProperty("jdbc.driver");
    	String url=properties.getProperty("jdbc.url");
    	String dbusername=properties.getProperty("jdbc.username");
    	String dbpassword=properties.getProperty("jdbc.password");
		String projectid=request.getParameter("projectid");
	    String apikey=request.getParameter("apikey");
   		try {
   			try {
   				Class.forName("com.mysql.jdbc.Driver");
   			} catch (ClassNotFoundException e) {
   				e.printStackTrace();
   				return;
   			}
   			Connection connection = null;

   			String insertTableSQL = "INSERT INTO googleApikey(ProjectId, ApiKey) VALUES (?,?)";
   			try {
   				System.out.println("url="+url);
    			System.out.println("dbusername="+dbusername);
    			System.out.println("dbpassword="+dbpassword);
      				connection = DriverManager.getConnection(url,dbusername,dbpassword);
					PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
					preparedStatement.setString(1, projectid);
					preparedStatement.setString(2, apikey);
					preparedStatement.executeUpdate();
					HttpSession session1=request.getSession();
					session1.setAttribute("projectid", projectid);
					session1.setAttribute("apikey", apikey);
					response.sendRedirect(request.getContextPath()+"/googleapisuccess.jsp");
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
		
    }*/
}