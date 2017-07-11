package com.beacon.servlet;

import java.io.*;
import java.net.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.*;
import javax.servlet.http.*;
import java.math.BigInteger;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Hex;
import com.google.gson.*;
import com.beacon.model.*;
import com.google.gson.GsonBuilder;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class AddAttachment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddAttachment() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("AddAttachment doPost ===================>>>>>>>>>>>>>> ");
		try {
			
	        String beaconName = request.getParameter("gbn");
	        String title = request.getParameter("atitle");
	        String url = request.getParameter("aurl");
	        String startdate = request.getParameter("sdate");
	        String enddate = request.getParameter("edate");
	        String starttime = request.getParameter("stime");
	        String endtime = request.getParameter("etime");
	        String namespacedType = "com.google.nearby/en";
	        
	        System.out.println("beaconName = "+beaconName);
	        System.out.println("title = "+title);
	        System.out.println("url = "+url);
	        System.out.println("startdate = "+startdate);
	        System.out.println("enddate = "+enddate);
	        System.out.println("starttime = "+starttime);
	        System.out.println("endtime = "+endtime);
	        List<Targeting> target = new ArrayList<Targeting>();
/*	        SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("dd-MM-yyyy");
	        String date = DATE_FORMAT.format(startdate);
	        System.out.println("Today in dd-MM-yyyy format : " + date);*/
	        if(null != startdate) {
	        	Targeting targeting = new Targeting();
	        	targeting.setStartDate(startdate);
	        	targeting.setEndDate(enddate);
//				targeting.setStartTime(starttime);
//				targeting.setEndTime(endtime);
			
	        	target.add(targeting);
	        }
	        Attachments attach = new Attachments();
	        attach.setTitle(title);
			attach.setUrl(url);
			if(null != startdate) {
				attach.setTargeting((List<Targeting>) target);
			}
		
	        Gson ga = new Gson();
			String json = ga.toJson(attach);
			
			System.out.println("data JSON ===========;:>>>>>>>>>> "+json);
			String data = Base64.encodeBase64String(json.getBytes()).trim();
			data = data.replace("\r\n", "");
		    System.out.println("Base64 Attachment Data : " + data);
			
		    Attachments attach1 = new Attachments();
			attach1.setNamespacedType(namespacedType);
			attach1.setData(data);
			System.out.println("attach *********--/////-------------- "+attach1);
			
			json = ga.toJson(attach1);
			
			System.out.println("Attachment JSON ===========;:>>>>>>>>>> "+json);
			
			 String urldata = "refresh_token=1/Ev7PAI_mVA_3ik-vTxYEkDxKrwdj_RDw4Qnaxnz-YIE"
		                + "&client_id=130861355666-44lr3ab0j97l6bh0maic8he87kahd710.apps.googleusercontent.com"
		                + "&client_secret=tJsXI7HpkfDHcW0Fopd5azO1"
		                + "&grant_type=refresh_token";

			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpPost(urlstr,urldata);
			System.out.println("httpresponse====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in AddAttachment === "+googleReponse.getAccess_token());
			StringBuffer attachmentJSON = sendPost(googleReponse.getAccess_token(), beaconName, json);
			System.out.println("attachmentJSON ========--------->>>>>>>> "+attachmentJSON );

			response.sendRedirect(request.getContextPath()+"/location.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doPost of AddAttachment");
	}
	
	public String httpPost(String urlstr, String urldata) throws IOException {
	    URL url = new URL(urlstr);
	    URLConnection connection = url.openConnection();
	    connection.setDoOutput(true);
	    OutputStreamWriter writer = new OutputStreamWriter(connection.getOutputStream());
	    writer.write(urldata);
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
	private StringBuffer sendPost(String token, String beaconName, String json) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/"+beaconName+"/attachments?projectId=proximity-160315&fields=attachmentName%2CcreationTimeMs%2Cdata%2CnamespacedType&key=AIzaSyDc05mW5bE1X6NPTuvs6ewqTXaamNTtS4A";
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("POST");
		con.setRequestProperty("authorization", "Bearer "+token);
		con.setRequestProperty("content-type", "application/json");
		con.setRequestProperty("Content-Length", String.valueOf(json.length()));
		con.setRequestProperty("charset", "utf-8");
		con.setRequestProperty("cache", "false");
		con.setUseCaches( false );
	    con.setDefaultUseCaches( false );
		con.setDoOutput(true);
		con.setDoInput(true);
		
	    OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
	    writer.write(json);
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
		String strattachmentList = response.toString();
		System.out.println("str AddAttachment List ------->>>>>> "+strattachmentList);
		return response;
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		System.out.println("AddAttachment doGet ===================>>>>>>>>>>>>>> ");
		try {
	        String beaconName = request.getParameter("gbn");
	        System.out.println("beaconName = "+beaconName);
			
			 String data = "refresh_token=1/Ev7PAI_mVA_3ik-vTxYEkDxKrwdj_RDw4Qnaxnz-YIE"
		                + "&client_id=130861355666-44lr3ab0j97l6bh0maic8he87kahd710.apps.googleusercontent.com"
		                + "&client_secret=tJsXI7HpkfDHcW0Fopd5azO1"
		                + "&grant_type=refresh_token";
			
			String urlstr="https://www.googleapis.com/oauth2/v4/token";
			String httpresponse=httpGet(urlstr,data);
			System.out.println("httpresponse ====== "+httpresponse);
			Gson gson = new GsonBuilder().setPrettyPrinting().create();
			OAuthResponse googleReponse=gson.fromJson(httpresponse, OAuthResponse.class);
			System.out.println("google Response in AddAttachment === "+googleReponse.getAccess_token());
			StringBuffer attachmentJSON = sendGet(googleReponse.getAccess_token(), beaconName);
			System.out.println("attachmentJSON ========--------->>>>>>>> "+attachmentJSON );

			response.getWriter().write(attachmentJSON.toString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("================>>>>>>>>>>>>>>..leaving doGet of AddAttachment");
	}
	
	public String httpGet(String urlstr, String data) throws IOException {
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
	private StringBuffer sendGet(String token, String beaconName) throws Exception {

		String url = "https://proximitybeacon.googleapis.com/v1beta1/"+beaconName+"/attachments";
//		String url = "https://proximitybeacon.googleapis.com/v1beta1/beacons/1!7e9ba3c4ba7c441ead0a33cff06395d2006400c8/attachments";
		URL obj = new URL(url);
		
		HttpURLConnection con = (HttpURLConnection) obj.openConnection();
		// optional default is GET
		con.setRequestMethod("GET");
		con.setRequestProperty("authorization", "Bearer "+token);
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
		String strattachmentList = response.toString();
		System.out.println("str AddAttachment List ------->>>>>> "+strattachmentList);
		return response;
	}
}