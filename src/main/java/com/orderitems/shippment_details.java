package com.orderitems;

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
import javax.servlet.http.HttpSession;
import com.Database.Dbconnection;

@WebServlet("/shippment_details")
public class shippment_details extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	 
		 String name=null;
		 String email=null;
		 String address=null;
		 String phno=null;
		 String itemname=null;
		 int itemprice=0;
		 int item_quantity=0;
		 byte[]itemimg=null;
		 
	 HttpSession session=request.getSession();
	 int id=(int)session.getAttribute("c_id");
	 int item_id=Integer.parseInt(request.getParameter("itemid"));
	  List<customer_details> details=new ArrayList<>();
    String userdetails_qry="select customer_name,customer_email,customer_phno,customer_address from userdetails where customer_id='"+id+"'";
	  try {
		PreparedStatement ps=Dbconnection.prepareStatementQuery(userdetails_qry);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 {
			 name=rs.getString("customer_name");
			 email=rs.getString("customer_email");
			 address=rs.getString("customer_address");
			 phno=rs.getString("customer_phno");
		 }
	} catch (SQLException e) {
		e.printStackTrace();
	} 

	  String cart_itemdetails="select cartitem_name,cartitem_items,cartitem_price,cartitem_image from cart  where cartItem_id="+item_id+"";
		 try
		 {
		 PreparedStatement ps=Dbconnection.prepareStatementQuery(cart_itemdetails);
		 ResultSet rs=ps.executeQuery();
		 if(rs.next())
		 {
			 itemname=rs.getString("cartitem_name");
			 item_quantity=rs.getInt("cartitem_Items");
			 itemprice=rs.getInt("cartitem_price");
			 itemimg=rs.getBytes("cartitem_image");
		 }
		 }catch(SQLException ex)
		 {
			ex.printStackTrace();
		 }
	  customer_details  cd= new customer_details(name,email,address,phno,itemname,item_id,itemprice,item_quantity,itemimg); 
	  details.add(cd);
	  request.setAttribute("order_details",details);
	  RequestDispatcher dispatcher=request.getRequestDispatcher("order_details.jsp");
	  dispatcher.forward(request, response);
	}
}