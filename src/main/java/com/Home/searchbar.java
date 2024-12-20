package com.Home;
import com.Database.*;

import java.beans.Statement;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/searchbar")
public class searchbar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String item_name=request.getParameter("searchitem");
		List<Product>productList=new ArrayList<>();
		int i_id=0;
		String item_name1=null;
		double item_price=0;
		int item_available=0;
	    byte[]item_image=null;
		try
		{
		String qry="select i_id,i_name,i_price,i_img,i_available from product_details where i_name='"+item_name+"'";
		PreparedStatement st=Dbconnection.prepareStatementQuery(qry);
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			i_id=rs.getInt("i_id");
			item_name1=rs.getString("i_name");
			item_price=rs.getDouble("i_price");
			item_available=rs.getInt("i_available");
			item_image=rs.getBytes("i_img");
			
			Product product=new Product(i_id,item_name1,item_price,item_available,item_image);
			productList.add(product);		
		}
		rs.close();
		st.close();
		}
		catch(SQLException ex)
		{
			System.out.println(ex);
		}
		request.setAttribute("productList",productList);
		RequestDispatcher dispatcher=request.getRequestDispatcher("Home.jsp");
		dispatcher.forward(request, response);
	}

}
