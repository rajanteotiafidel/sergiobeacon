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
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

public class Oauth2callback extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Oauth2callback() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("entering Oauth2callback doGet");
		try {
			String code = request.getParameter("code");
	        String data = "code="
	                + code
	                + "&client_id="+Setup.CLIENT_ID
	                + "&client_secret="+Setup.CLIENT_SECRET
	                + "&redirect_uri="+Setup.REDIRECT_URL
	                + "&grant_type=authorization_code";
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			System.out.println("data ====== "+data);
			String httpresponse=httpPost(urlstr,data);
			System.out.println("httpresponse====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("googleReponse === "+googleReponse.getAccess_token());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("leaving Oauth2callback doGet");
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
		System.out.println("Oauth2callback builder------------>>>>>>>. "+builder.toString());
		return builder.toString();
	}
}