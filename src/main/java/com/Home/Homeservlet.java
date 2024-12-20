package com.Home;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import  javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.Dbconnection;

@WebServlet("/Homeservlet")
public class Homeservlet extends HttpServlet {
	
	/**
	 *  
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	HttpSession session=request.getSession();	
	int session_id=0;
	String name=null;
		
		 if(session.getAttribute("c_id")==null)
		 {
			 response.sendRedirect("login.jsp");
		 }
		 else
		 {
		 session_id=(int)session.getAttribute("c_id");
		 name=(String)session.getAttribute("user_name");
	 ResultSet rs=null;
	 List<Product>productList=new ArrayList<>();
	 try
	 {
		String qry="select * from product_details";
		PreparedStatement st=Dbconnection.prepareStatementQuery(qry);
		rs=st.executeQuery();
		while(rs.next())
		{
			int item_id=Integer.parseInt(rs.getString("i_id"));
			String item_name=rs.getString("i_name");
			double item_price=rs.getDouble("i_price");
			int item_available=rs.getInt("i_available");
			byte[]item_image=rs.getBytes("i_img");
	        
			Product product=new Product(item_id,item_name,item_price,item_available,item_image);
			productList.add(product);
		}
		rs.close();
		st.close();
		}
	 catch(Exception e)
	 {
		 System.out.println(e);
	 }
	    session.setAttribute("session_id", session_id);
	    session.setAttribute("user_name", name);
		request.setAttribute("productList",productList);
		RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
	}
}
}