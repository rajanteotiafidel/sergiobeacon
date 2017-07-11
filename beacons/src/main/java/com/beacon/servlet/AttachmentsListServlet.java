package com.beacon.servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.parser.JSONParser;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


public class AttachmentsListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AttachmentsListServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("Attachments List Servlet doPost=====================");
		String beaconName = (String) request.getParameter("bn");
		try {
			 String data = "refresh_token=1/Ev7PAI_mVA_3ik-vTxYEkDxKrwdj_RDw4Qnaxnz-YIE"
		                + "&client_id=130861355666-44lr3ab0j97l6bh0maic8he87kahd710.apps.googleusercontent.com"
		                + "&client_secret=tJsXI7HpkfDHcW0Fopd5azO1"
		                + "&grant_type=refresh_token";
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpPost(urlstr,data);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response === "+googleReponse.getAccess_token());
			StringBuffer attachmentJSON = sendGet(googleReponse.getAccess_token(), beaconName);
			JSONParser parser = new JSONParser();
			Object obj = parser.parse(attachmentJSON.toString());
			System.out.println("obj ----- ************ "+obj);
			response.getWriter().write(obj.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("AttachmentsListServlet End doPost");
	}
	
	public String httpPost(String urlstr, String data) throws IOException
	{
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
		System.out.println(builder.toString());
		return builder.toString();
	}
	
	// HTTP GET request
	private StringBuffer sendGet(String token, String beaconName) throws Exception {

		String url="https://proximitybeacon.googleapis.com/v1beta1/"+beaconName+"/attachments";
		
		URL obj = new URL(url);
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		int responseCode = con.getResponseCode();
		
		System.out.println("\nSending 'GET' request to URL : " + url);
		System.out.println("Response Code : " + responseCode);

		BufferedReader in = new BufferedReader( new InputStreamReader(con.getInputStream()));
		String inputLine;
		StringBuffer response = new StringBuffer();

		while ((inputLine = in.readLine()) != null) {
			response.append(inputLine);
		}
		in.close();

		//print result
		String attachmentsList = response.toString();
		/*Gson gson = new GsonBuilder().setPrettyPrinting().create();
		BeaconList beaconList=gson.fromJson(attachmentsList, BeaconList.class);
		System.out.println("attachmentsList==="+attachmentsList.getBeacons()); */
		System.out.println("attachmentsList==="+attachmentsList);
		return response;
	}
}