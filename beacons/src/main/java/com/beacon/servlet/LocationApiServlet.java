package com.beacon.servlet;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LocationApiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LocationApiServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {

		HttpSession session = request.getSession(false);
		String address = (String) session.getAttribute("add");
		System.out.println("address p ==== " + address);
		
	//	String address="America/Los_Angeles";
		String argurl = "http://maps.googleapis.com/maps/api/geocode/json?address=%20" + address + "&sensor=true";

		System.out.println("argurl = " + argurl);

		String accoutnXml = "";
		/*JSONObject xmlJSONObj = null;
		String jsonPrettyPrintString = null;*/

		try {
			URL url = new URL(argurl);
			URLConnection con = url.openConnection();
			// specify that we will send output and accept input
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setConnectTimeout(20000); // long timeout, but not infinite
			con.setReadTimeout(20000);
			con.setUseCaches(false);
			con.setDefaultUseCaches(false);
			// tell the web server what we are sending
			con.setRequestProperty("Content-Type", "application/json charset=utf-8");
			OutputStreamWriter writer = new OutputStreamWriter(con.getOutputStream());
			writer.write(accoutnXml);
			writer.flush();
			writer.close();
			// reading the response
			InputStreamReader reader = new InputStreamReader(con.getInputStream());
			StringBuilder buf = new StringBuilder();
			char[] cbuf = new char[2048];
			int num;
			while (-1 != (num = reader.read(cbuf))) {
				buf.append(cbuf, 0, num);
			}

			String accountresult = buf.toString();
			System.out.println("Locationapi = "+accountresult);
			/*
			 * System.out.println("accountresult=="+accountresult);
			 * System.err.println("\nResponse from server after POST:\n" +
			 * accountresult); JSONObject jsonObj = new
			 * JSONObject(accountresult); System.out.println("jsonObj"+jsonObj);
			 * 
			 * JSONObject sync_reponse = jsonObj.getJSONObject("shadow");
			 * JSONObject reponse = sync_reponse.getJSONObject("location");
			 * 
			 * address = reponse.getString("timezone");
			 * System.out.println("address:= " + address);
			 */

			response.getWriter().write(accountresult.toString());

		} catch (Throwable t) {
			t.printStackTrace(System.out);
		}

	}
}
