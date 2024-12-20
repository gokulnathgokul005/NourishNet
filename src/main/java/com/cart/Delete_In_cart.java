package com.cart;

import com.Database.*;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/Delete_In_cart")
public class Delete_In_cart extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	 String cart_id=request.getParameter("itemid");
	 
	 String Item_name=null;
	 int cartItem_quanity=0;
	 try {
	 String selectqry="select cartitem_name,cartitem_items from cart where cartItem_id="+cart_id+"";
	 PreparedStatement statemet=Dbconnection.prepareStatementQuery(selectqry);
	 ResultSet rs=statemet.executeQuery();
	 if(rs.next())
	 {
	 Item_name=rs.getString("cartitem_name");
	  cartItem_quanity=rs.getInt("cartitem_items");	 
	 }
	 Update_product_details(Item_name,cartItem_quanity);
	 String qry="Delete from cart where cartItem_id="+cart_id+"";
		PreparedStatement ps=Dbconnection.prepareStatementQuery(qry);
		 int check=ps.executeUpdate();
		 if(check>0)
		 {
		 response.sendRedirect("cartpageservlet");
		 }
	} catch (SQLException e) {
		e.printStackTrace();
	}
	}

	private void Update_product_details(String item_name, int cartItem_quanity)throws SQLException 
	{
		int available=0;
		int product_details_available=0;
		String selectqry="select i_available from product_details where i_name='"+item_name+"'";
		Statement statement=Dbconnection.Statement();
		ResultSet rst=statement.executeQuery(selectqry);
		if(rst.next())
		{
			product_details_available=rst.getInt("i_available");
		}
		available=product_details_available+cartItem_quanity;
		String updateqry="update product_details set i_available="+available+" where  i_name='"+item_name+"'";
		PreparedStatement st=Dbconnection.prepareStatementQuery(updateqry);
		st.executeUpdate();
	}
}
