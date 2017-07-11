package com.beacon.servlet;

import java.io.*;
import java.net.*;
import java.util.ArrayList;
import java.util.List;
import com.beacon.model.*;
import javax.json.Json;
import javax.json.JsonReader;
import javax.servlet.*;
import javax.servlet.http.*;
import java.math.BigInteger;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import com.google.gson.*;
import java.lang.StringBuilder;
import com.beacon.model.*;

public class GetForObserved extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetForObserved() {
		super();
	}

	static String jsondata1="";

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("**********GetForObserved*********** ");
		
	        String advertid = request.getParameter("advertid");
			String advertype = request.getParameter("advertype");
			String telemetry="MjAxNy0wNC0wNFQwOTowMDowMC4wMDBaIDI4LjIgMTAuOA==";
			String timestampMs="2017-04-04T09:00:00.000Z";
			
			System.out.println("advertid============="+advertid);
			System.out.println("advertype============="+advertype);
			
			AdvertisedId advertisedId = new AdvertisedId();
			advertisedId.setId(advertid);
			advertisedId.setType(advertype);
		
			Observations o = new Observations();
			
			
			List<Observations> obs=new  ArrayList<Observations>();
			
			List<String> namespacedTypes = new ArrayList<String>();
			
			String namespacedType = "proximity-160315/en";
			namespacedTypes.add(namespacedType);
	
			o.setAdvertisedId(advertisedId); 
			o.setTelemetry(telemetry);
			o.setTimestampMs(timestampMs);
			
			obs.add(o);
			
			GetForObserveds gc = new GetForObserveds();
			gc.setObservations(obs);
			gc.setNamespacedTypes(namespacedTypes);
			
			Gson ga = new GsonBuilder().disableHtmlEscaping().create();;
			 jsondata1= ga.toJson(gc);
			System.out.println("jsondata1====111>>>>>>="+jsondata1);	
			try {
				StringBuffer beaconJSON = sendPOST(jsondata1);
				response.getWriter().write(beaconJSON.toString());
			} catch (Exception e) {
				
				e.printStackTrace();
			}
//			 sendPOST(jsondata1);
	}

	static String respon = "";
	private StringBuffer sendPOST(String jsondata1) throws IOException {
		
		String url="https://proximitybeacon.googleapis.com/v1beta1/beaconinfo:getforobserved?fields=beacons&key=AIzaSyDc05mW5bE1X6NPTuvs6ewqTXaamNTtS4A";
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		con.setRequestMethod("POST");

		// For POST only - START
		con.setDoOutput(true);
		con.setRequestProperty("content-type", "application/json");
		OutputStream os = con.getOutputStream();
		System.out.println(jsondata1);
		os.write(jsondata1.getBytes());
		os.flush();
		os.close();
		// For POST only - END
		StringBuffer response = new StringBuffer();
		int responseCode = con.getResponseCode();
		System.out.println("POST Response Code :: " + responseCode);

		if (responseCode == HttpURLConnection.HTTP_OK) { //success
			BufferedReader in = new BufferedReader(new InputStreamReader(
					con.getInputStream()));
			String inputLine;

			while ((inputLine = in.readLine()) != null) {
				response.append(inputLine);
			}
			in.close();

			
			// print result
			System.out.println("GETFOROBSERVERD Response ==== "+response.toString());
			
			
		} else {
			System.out.println("POST request not worked");
		}
		return response;
	}
}