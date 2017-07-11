package com.beacon.servlet;

import java.io.*;
import java.net.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.math.BigInteger;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import com.google.gson.*;
import com.beacon.model.*;
import com.beacon.model.Properties;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AddBeacon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddBeacon() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("Add Beacons ===================>>>>>>>>>>>>>> ");
		try {
	        String type = request.getParameter("aidtype");
			String uuid = request.getParameter("uuid");
			String major = request.getParameter("major");
			String minor = request.getParameter("minor");
			String status = "ACTIVE";
			String pid = request.getParameter("placeid");
			String lat = request.getParameter("latitude");
			String lng = request.getParameter("longitude");
			String level = "0";
			String stability = "STABLE";
			String desc = request.getParameter("description");
			String pos = "entryway"; 
			
			uuid = uuid.replace("-", "");
			System.out.println("uuid = "+uuid);
			String maj = Integer.toHexString(Integer.parseInt(major));
			String min = Integer.toHexString(Integer.parseInt(minor));
			
			int x = maj.length();
			switch(x) {
				case 1:
					maj = "0"+"0"+"0"+maj;
					System.out.println("maj = "+maj);
					break;
				case 2:
					maj = "0"+"0"+maj;
					System.out.println("maj = "+maj);
					break;
				case 3:
					maj = "0"+maj;
					System.out.println("maj = "+maj);
					break;
			}
			
			int y = min.length();
			switch(y) {
				case 1:
					min = "0"+"0"+"0"+min;
					System.out.println("min = "+min);
					break;
				case 2:
					min = "0"+"0"+min;
					System.out.println("min = "+min);
					break;
				case 3:
					min = "0"+min;
					System.out.println("min = "+min);
					break;
			}
				

			String id = uuid + maj + min;
			
			System.out.println("AddBeacon id =="+id);
			System.out.println("major converted = "+maj.toUpperCase());
			System.out.println("minor converted = "+min.toUpperCase());
			System.out.println("id = "+id);
			//hex to Base64 //Eddystone UID to Advertised ID
			BigInteger bigint = new BigInteger(id, 16);
		    StringBuilder sb = new StringBuilder();
		    byte[] ba = Base64.encodeInteger(bigint);
		    for (byte b : ba) {
		        sb.append((char)b);
		    }
		    String adid = sb.toString();
		    System.out.println("Base64 Advertised ID: " + adid);
			
			AdvertisedId aid = new AdvertisedId();
			aid.setType(type);
			aid.setId(adid);
			
			//base64 to hex //Advertised ID to Eddystone UID
/*			byte[] decoded = Base64.decodeBase64(base64);
			String hexString = Hex.encodeHexString(decoded);
			System.out.println("hexString = "+hexString);*/
			
			LatLng ll = new LatLng();
			ll.setLatitude(Double.parseDouble(lat));
			ll.setLongitude(Double.parseDouble(lng));
			
			IndoorLevel il = new IndoorLevel();
			il.setName(level);
			
			Properties prop = new Properties();
			prop.setPosition(pos);
			
			Beacon b = new Beacon();
			b.setAdvertisedId(aid);
			b.setStatus(status);
			b.setPlaceId(pid);
			b.setLatLng(ll);
			b.setIndoorLevel(il);
			b.setExpectedStability(stability);
			b.setDescription(desc);
			b.setProperties(prop);
			System.out.println("b*********--/////-------------- "+b);

			Gson ga = new Gson();
			String f = ga.toJson(b);
			System.out.println("JSON===========;:>>>>>>>>>> "+f);
		
			 String data = "refresh_token=1/Ev7PAI_mVA_3ik-vTxYEkDxKrwdj_RDw4Qnaxnz-YIE"
		                + "&client_id=130861355666-44lr3ab0j97l6bh0maic8he87kahd710.apps.googleusercontent.com"
		                + "&client_secret=tJsXI7HpkfDHcW0Fopd5azO1"
		                + "&grant_type=refresh_token";
			
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpPost(urlstr,data);
			System.out.println("httpresponse====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in add beacon === "+googleReponse.getAccess_token());
			StringBuffer beaconJSON = sendPost(googleReponse.getAccess_token(), f);
			System.out.println("beaconJSON ========--------->>>>>>>> "+beaconJSON );
			String msg ="";

			try {
				if (Integer.parseInt(beaconJSON.toString()) >= 400) {
					switch(Integer.parseInt(beaconJSON.toString())) {
						case 400:
							msg = "Invalid UUID or Major or Minor";
							System.out.println("msg = "+msg);
							break;
						case 404:
							msg = "Bad Request";
							System.out.println("msg = "+msg);
							break;
						case 409:
							msg = "Beacon Already Registered";
							System.out.println("msg = "+msg);
							break;
						default:
							msg = "Invalid Request";
							System.out.println("msg = "+msg);
					}	
				}
			} catch (NumberFormatException e) {
				System.out.println("NumberFormatException * ");
				msg = "Beacon Added Successfully";
				e.printStackTrace();
			} catch(NullPointerException e) {
				e.printStackTrace();
			}
			response.sendRedirect(request.getContextPath()+"/location.jsp?error="+msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doPost of Add Beacons");
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
	private StringBuffer sendPost(String token, String g) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/beacons:register";
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("POST");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		con.setRequestProperty("Content-Length", String.valueOf(g.length()));
		con.setRequestProperty("charset", "utf-8");
		con.setRequestProperty("cache", "false");
		con.setUseCaches( false );
	    con.setDefaultUseCaches( false );
		con.setDoOutput(true);
		con.setDoInput(true);
		
	    OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
	    writer.write(g);
	    writer.flush();
	    System.out.println("writer = "+writer);
	    writer.close();
	    
	    int responseCode = con.getResponseCode();
		System.out.println("\nSending 'POST' request to URL : " + url);
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