package com.orderitems;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/viewitem_toshippmnet")
public class viewitem_toshippmnet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int customer_id=(int)session.getAttribute("customer_id");
		int product_id=(int)session.getAttribute("product_id");
		String username=(String)session.getAttribute("User_name");	
		List<customer_details> details=new ArrayList<>();
		 String userdetails_qry="select customer_name,customer_email,customer_phno,customer_address from userdetails where customer_id='"+customer_id+"'";
	}
}
