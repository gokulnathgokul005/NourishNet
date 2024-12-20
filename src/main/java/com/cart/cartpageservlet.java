package com.cart;

import java.io.IOException;
import com.Database.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/cartpageservlet")
public class cartpageservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		
		int customer_id=(int)session.getAttribute("c_id");
		String username=(String)session.getAttribute("User_name");
		int total_price=0;
		if(customer_id!=0)
		{
			List<Cartitems>cartitem=new ArrayList<>();
			 try
			 {
				String qry="select cartitem_name,cartitem_items,cartitem_price,cartitem_image,cartItem_id "
						+ "from cart where customer_id="+customer_id+"";
				PreparedStatement st=Dbconnection.prepareStatementQuery(qry);
				ResultSet rs=st.executeQuery(qry);
				rs=st.executeQuery();
				while(rs.next())
				{
					String productname=rs.getString("cartitem_name");
					int productquanitity=rs.getInt("cartitem_items");
					int productprice=rs.getInt("cartitem_price");
					byte[]productimg=rs.getBytes("cartitem_image");
					int Id=rs.getInt("cartItem_id");
					Cartitems items=new Cartitems(Id,productname,productquanitity,productprice,productimg);
				    cartitem.add(items);
				}
				rs.close();
				st.close();
				}catch(SQLException ex)
			 {
					System.out.println(ex);
			 }
			 try {
				total_price=fetch_all_priceincart(customer_id);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 request.setAttribute("customer_id",customer_id);
			  request.setAttribute("username",username);
			  request.setAttribute("Total_price",total_price);
			  request.setAttribute("cart",cartitem);
		      request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	}
	public int fetch_all_priceincart(int customerid) throws SQLException
	{
		int total_price=0;
		String sql="select cartitem_price from cart where customer_id="+customerid+"";
		PreparedStatement ps=Dbconnection.prepareStatementQuery(sql);
		ResultSet rs=ps.executeQuery();
		while(rs.next())
	      {
			int fetchpriec=rs.getInt("cartitem_price");
			total_price=fetchpriec+total_price;
		  }
		return total_price;
	}
}