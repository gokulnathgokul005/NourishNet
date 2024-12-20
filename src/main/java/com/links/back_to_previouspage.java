package com.links;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/back_to_previouspage")
public class back_to_previouspage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		int c_id=(int)session.getAttribute("customer_id");
		int p_id=(int)session.getAttribute("product_id");
	    String name=(String)session.getAttribute("User_name");
	    
	    session.setAttribute("customer_id",c_id);
	    session.setAttribute("product_id",p_id);
	    session.setAttribute("user_name",name);
	    RequestDispatcher dispatcher=request.getRequestDispatcher("Homeservlet");
	    dispatcher.forward(request, response);
	}
}
