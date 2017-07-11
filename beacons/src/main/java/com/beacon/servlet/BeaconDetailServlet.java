package com.beacon.servlet;

import java.io.*;
import java.net.URL;
import java.net.URLConnection;
import java.util.Properties;

import javax.servlet.*;
import javax.servlet.http.*;

import org.codehaus.jettison.json.JSONObject;

import com.sun.jersey.core.util.Base64;

public class BeaconDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BeaconDetailServlet() {
		super();
	}
	
	String api_url="";

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String identifier = request.getParameter("identifier");
		System.out.println("identifier=="+identifier);
		String webPage = "https://cloud.estimote.com/v2/devices/" + identifier;
		String name = "renault-3ii";
		String password = "9e8e206ef03d63c9ec64cc31ef00033d";
		String authString = name + ":" + password;
		try {
			byte[] authEncBytes = Base64.encode(authString.getBytes());
			String authStringEnc = new String(authEncBytes);
			URL url = new URL(webPage);
			URLConnection urlConnection = url.openConnection();
			urlConnection.setRequestProperty("Authorization", "Basic " + authStringEnc);
			InputStream is = urlConnection.getInputStream();
			InputStreamReader isr = new InputStreamReader(is);
			int numCharsRead;
			char[] charArray = new char[1024];
			StringBuffer sb = new StringBuffer();
			while ((numCharsRead = isr.read(charArray)) > 0) {
				sb.append(charArray, 0, numCharsRead);
			}
			String accountresult = sb.toString();
			JSONObject jsonObj = new JSONObject(accountresult);

			JSONObject sync_reponse = jsonObj.getJSONObject("shadow");
			JSONObject reponse = sync_reponse.getJSONObject("location");

			
			String name1 = sync_reponse.getString("name");
			String GeoLocationn = reponse.getString("timezone");
			String Tags= sync_reponse.getString("tags");
			String address = reponse.getString("timezone");

			HttpSession session = request.getSession();
			session.setAttribute("add", address);
			session.setAttribute("name1", name1);
			session.setAttribute("geolocation", GeoLocationn);

			response.getWriter().write(sb.toString());

		} catch (Exception e) {

		}
	}
	
	 public void doPost (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		        String identifier = request.getParameter("identifier");
			    String	id = request.getParameter("identifier");	

				String webPage = "https://cloud.estimote.com/v2/devices/" + identifier;
				String name = "renault-3ii";
				String password = "9e8e206ef03d63c9ec64cc31ef00033d";
				String authString = name + ":" + password;
				try {
					byte[] authEncBytes = Base64.encode(authString.getBytes());
					String authStringEnc = new String(authEncBytes);
					URL url = new URL(webPage);
					URLConnection urlConnection = url.openConnection();
					urlConnection.setRequestProperty("Authorization", "Basic " + authStringEnc);
					InputStream is = urlConnection.getInputStream();
					InputStreamReader isr = new InputStreamReader(is);
					int numCharsRead;
					char[] charArray = new char[1024];
					StringBuffer sb = new StringBuffer();
					while ((numCharsRead = isr.read(charArray)) > 0) {
						sb.append(charArray, 0, numCharsRead);
					}
					String accountresult = sb.toString();
					JSONObject jsonObj = new JSONObject(accountresult);
				//	System.out.println("BeaconsDeatils=" + jsonObj);

					JSONObject sync_reponse = jsonObj.getJSONObject("shadow");
					JSONObject reponse = sync_reponse.getJSONObject("location");

					
					String name1 = sync_reponse.getString("name");
					String GeoLocationn = reponse.getString("timezone");
					String Tags= sync_reponse.getString("tags");
					String address = reponse.getString("timezone");

					HttpSession session = request.getSession();
					session.setAttribute("add", address);
					session.setAttribute("name1", name1);
					session.setAttribute("geolocation", GeoLocationn);

					response.getWriter().write(sb.toString());

	 }
	  catch (Exception e) {

		}
	 }
}

