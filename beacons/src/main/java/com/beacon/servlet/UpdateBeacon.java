package com.beacon.servlet;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.google.gson.*;
import com.beacon.model.*;
import com.beacon.model.Properties;

public class UpdateBeacon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateBeacon() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("Update Beacons ===================>>>>>>>>>>>>>> ");
		try {
	        String beaconName = request.getParameter("bn");
			String adtype = request.getParameter("atype");
			String adid = request.getParameter("aid");
			String status = request.getParameter("stats");
			String placeid = request.getParameter("placeid1");
			String latitude = request.getParameter("lati");
			String longitude = request.getParameter("longi");
			String level = request.getParameter("ilname");
			String stability = request.getParameter("stabily");
			String desc = request.getParameter("descrip");
			String propname = request.getParameter("pname");
		    String propplace = request.getParameter("pplace");
		    String position = request.getParameter("pos");
			
			AdvertisedId aid = new AdvertisedId();
			aid.setType(adtype);
			aid.setId(adid);
			
			LatLng LatLng = new LatLng();
			LatLng.setLatitude(Double.parseDouble(latitude));
			LatLng.setLongitude(Double.parseDouble(longitude));
			
			IndoorLevel indoorlevel = new IndoorLevel();
			indoorlevel.setName(level);
			
			Properties property = new Properties();
			property.setName(propname);
			property.setPlace(propplace);
			property.setPosition(position);
			
			Beacon Beacon = new Beacon();
			Beacon.setBeaconName(beaconName);
			Beacon.setAdvertisedId(aid);
			Beacon.setStatus(status);
			Beacon.setPlaceId(placeid);
			Beacon.setLatLng(LatLng);
			Beacon.setIndoorLevel(indoorlevel);
			Beacon.setExpectedStability(stability);
			Beacon.setDescription(desc);
			Beacon.setProperties(property);
			System.out.println("Beacon*********--/////-------------- "+Beacon);

			Gson gsonBeacon = new Gson();
			String jsonBeacon = gsonBeacon.toJson(Beacon);
			System.out.println("JSON===========:>>>>>>>>>> "+jsonBeacon);
		
			 String data = "refresh_token=1/Ev7PAI_mVA_3ik-vTxYEkDxKrwdj_RDw4Qnaxnz-YIE"
		                + "&client_id=130861355666-44lr3ab0j97l6bh0maic8he87kahd710.apps.googleusercontent.com"
		                + "&client_secret=tJsXI7HpkfDHcW0Fopd5azO1"
		                + "&grant_type=refresh_token";
				
			String urlstr = "https://www.googleapis.com/oauth2/v4/token";
			String httpresponse = httpPost(urlstr, data);
			System.out.println("httpresponse====== " + httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse = gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in add beacon === "+googleReponse.getAccess_token());
			StringBuffer beaconJSON = sendPost(googleReponse.getAccess_token(), beaconName, jsonBeacon);
			System.out.println("beaconJSON ========--------->>>>>>>> "+beaconJSON );

			response.sendRedirect(request.getContextPath()+"/location.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doPost of Update Beacons");
	}
	
	public String httpPost(String urlstr, String data) throws IOException {
	    URL url = new URL(urlstr);
	    URLConnection connection = url.openConnection();
	    connection.setDoOutput(true);
	    OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
	    writer.write(data);
	    writer.flush();
	    
	    HttpURLConnection httpConn = (HttpURLConnection)connection;
	    InputStream is;
	    if (httpConn.getResponseCode() >= 400) {
	        is = httpConn.getErrorStream();
	    } else {
	        is = httpConn.getInputStream();
	    }
	    BufferedReader reader = new BufferedReader(new InputStreamReader(is));
	    String line = "";
	    StringBuilder builder = new StringBuilder();
	    while((line = reader.readLine()) != null) {
	        builder.append(line);
	    }
		System.out.println("Add builder------------>>>>>>>. "+builder.toString());
		return builder.toString();
	}
	
	// HTTP GET request
	private StringBuffer sendPost(String token, String beaconName, String jsonBeacon) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/"+beaconName;
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("PUT");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		con.setRequestProperty("Content-Length", String.valueOf(jsonBeacon.length()));
		con.setRequestProperty("charset", "utf-8");
		con.setRequestProperty("cache", "false");
		con.setUseCaches(false);
	    con.setDefaultUseCaches(false);
		con.setDoOutput(true);
		con.setDoInput(true);
		
	    OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
	    writer.write(jsonBeacon);
	    writer.flush();
	    System.out.println("writer = "+writer);
	    writer.close();
	    
	    int responseCode = con.getResponseCode();
		System.out.println("\nSending 'PUT' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);
		
	    HttpURLConnection httpConn = (HttpURLConnection)con;
	    InputStream is;
	    if (httpConn.getResponseCode() >= 400) {
	        is = httpConn.getErrorStream();
	    } else {
	        is = httpConn.getInputStream();
	    }
	    
	    if(responseCode<400) {
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
		String strbeaconList = response.toString();
		System.out.println("strbeaconList------->>>>>> "+strbeaconList);
/*		Gson gson = new GsonBuilder().setPrettyPrinting().create();
		BeaconList beaconList=gson.fromJson(strbeaconList, BeaconList.class);
		System.out.println("beaconList === "+beaconList.getTotalCount());
		List<Object> al = new ArrayList<Object>();
		al.add(beaconList.getBeacons());*/
		return response;
	}
}