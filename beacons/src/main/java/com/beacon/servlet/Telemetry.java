package com.beacon.servlet;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Properties;

import com.beacon.model.*;
import com.google.gson.*;
import javax.servlet.*;
import javax.servlet.http.*;
import org.joda.time.DateTime;
import org.joda.time.DateTimeZone;

public class Telemetry extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Telemetry() {
		super();
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ClassLoader classLoader = Thread.currentThread().getContextClassLoader();
		InputStream input = classLoader.getResourceAsStream("dbConnection.properties");
		Properties properties = new Properties();
	    properties.load(input);
	    String  url = properties.getProperty("jdbc.url");
	    String	dbusername = properties.getProperty("jdbc.username");
	    String	dbpassword = properties.getProperty("jdbc.password");
	    Connection connection = null;
    	
		long millisecondsSinceEpoch = 0;
		HttpSession session = request.getSession(false);
		String teledate = null;
		String telelight = null;
		String teletemp = null;
		System.out.println("**********Entering Telemetry doPost()*********** ");
		
		String identifier = request.getParameter("identifier").toLowerCase();
		
		System.out.println("identifier = "+identifier);
		String authcredentials = "Y2l3ZWItdGVjaC1sbGMtcy15b3VyLW93bi0tY25xOjQxZGVhMTM2MDA5ZDY4NDVlNjgwMzVmMTMwMzFiZmQw";
		StringBuffer telemetryJSON = null;
		try {
			telemetryJSON = sendGet(authcredentials, identifier);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		System.out.println("telemetryJSON ========--------->>>>>>>> "+telemetryJSON );
		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		TeleData teledata = gson.fromJson(telemetryJSON.toString(), TeleData.class);
		List<Data> list = teledata.getData();
		System.out.println("teledata.getData() === "+list);
		Iterator<Data> iterator = list.iterator();
		while (iterator.hasNext()) {
			Data data=iterator.next();
			teledate = data.getDate();
			telelight = data.getAmbient_Light_Level();
			teletemp = data.getTemperature();
			System.out.println("Date === "+teledate);
			System.out.println("Ambient_Light_Level === "+telelight);
			System.out.println("Temperature === "+teletemp);
			try {
				DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSXXX");
				Date date = sdf.parse(teledate); 
				System.out.println("date ==== "+date);
				sdf.setTimeZone(TimeZone.getTimeZone("IST"));
				System.out.println(sdf.format(date));
				System.out.println("date ==== "+date);
					
				DateTime dateTimeUtc = new DateTime( date, DateTimeZone.UTC );
					
				System.out.println("dateTimeUtc ==== "+dateTimeUtc);
				DateTime dateTimeToronto = dateTimeUtc.withZone( DateTimeZone.forID("Asia/Calcutta") );
					
				System.out.println("dateTimeToronto ==== "+dateTimeToronto);
					
				millisecondsSinceEpoch = dateTimeUtc.getMillis();
				System.out.println("millisecondsSinceEpoch ==== "+millisecondsSinceEpoch);
				
			} catch (ParseException e) {
				e.printStackTrace();
			}
			try {
		    	try {
		    		Class.forName("com.mysql.jdbc.Driver");
		    	} catch (ClassNotFoundException e) {
		    		e.printStackTrace();
		    		return;
		    	}
		    	String selectTableSQL = "SELECT Timestamp FROM telemetry where Timestamp = ?";		
		    	String insertTableSQL = "INSERT INTO telemetry (Temperature, Lightsensor, Timestamp) VALUES (?,?,?)";
		    	try {
		    		connection = DriverManager.getConnection(url, dbusername, dbpassword);
		    		PreparedStatement ps = connection.prepareStatement(selectTableSQL);
	    			ps.setString(1, Long.toString(millisecondsSinceEpoch));
	    			ResultSet rs = ps.executeQuery();
	    			int count = 0;
	    			while(rs.next()) {
	    				count++;
	    			}
	    			if(count == 0) {
	    				PreparedStatement preparedStatement = connection.prepareStatement(insertTableSQL);
		    			preparedStatement.setString(1, teletemp);
		    			preparedStatement.setString(2, telelight);
		    			preparedStatement.setLong(3, millisecondsSinceEpoch);
		    			preparedStatement.executeUpdate();
	    			}
	    					
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
		List<Map<String,Object>> teleList = new ArrayList<Map<String,Object>>();
		
		try {
	    	try {
	    		Class.forName("com.mysql.jdbc.Driver");
	    	} catch (ClassNotFoundException e) {
	    		e.printStackTrace();
	    		return;
	    	}
	    	
	    	String selectTableSQL = "SELECT * FROM telemetry";		
	    	try {
	    		connection = DriverManager.getConnection(url, dbusername, dbpassword);
	    		PreparedStatement ps = connection.prepareStatement(selectTableSQL);
    			ResultSet rs = ps.executeQuery();
    			int count = 0;
    			while(rs.next()) {
    				count++;
    				Map<String,Object> telemetry = new HashMap<String,Object>();
    				try {
    					if(rs.getString("Temperature") != null){
    						telemetry.put("\"Temperature\"", rs.getString("Temperature").toString());
    					}else{
    						telemetry.put("\"Temperature\"", null);
    					}
    					if(rs.getString("Lightsensor") != null){
    						telemetry.put("\"Lightsensor\"", rs.getString("Lightsensor").toString());
    					}else{
    						telemetry.put("\"Lightsensor\"", null);
    					}
    					telemetry.put("\"Timestamp\"", rs.getString("Timestamp").toString());
    				} catch (SQLException e) {
    		    		e.printStackTrace();
    		    		return;
    		    	}
    				teleList.add(telemetry);
    				System.out.println("telemetry == "+telemetry);
    			}
    			System.out.println("teleList == "+teleList);
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
		
		String teleResponse = "{\"data\""+":"+teleList+"}";
		teleResponse = teleResponse.replace("=", ":");
		System.out.println("respo = "+teleResponse);
		System.out.println("================>>>>>>>>>>>>>>..leaving doPost() of Telemetry");
		System.out.println("identifier = "+identifier);
		response.getWriter().write(teleResponse);
		
	}
	
	// HTTP GET request
	private StringBuffer sendGet(String authcredentials, String identifier) throws Exception {

		String url = "https://cloud.estimote.com/v2/devices/"+identifier+"/telemetry";

		URL urlobj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) urlobj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		con.setRequestProperty("authorization", "Basic "+authcredentials);
		con.setRequestProperty("cache", "false");
		con.setUseCaches( false );
	    con.setDefaultUseCaches( false );
		
	    int responseCode = con.getResponseCode();
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		
	    HttpURLConnection httpConn = (HttpURLConnection)con;
	    InputStream is;
	    if (httpConn.getResponseCode() >= 400) {
	        is = httpConn.getErrorStream();
	    } else {
	        is = httpConn.getInputStream();
	    }
	    
	    if(responseCode>=400) {
	    	return new StringBuffer(Integer.toString(responseCode));
	    }

		BufferedReader in = new BufferedReader( new InputStreamReader(is));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		String strelemetryList = response.toString();
		System.out.println("str Telemetry List ------->>>>>> "+strelemetryList);
		
		return response;
	}
}    
