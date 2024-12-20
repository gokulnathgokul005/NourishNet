package com.register;
import com.Database.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Signupservlet
 */
@WebServlet("/Signupservlet")
public class Signupservlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			String userid=null;
			String username=request.getParameter("name");
			String password=request.getParameter("password");
			int  age=Integer.parseInt(request.getParameter("age"));
			String email=request.getParameter("email");
			String phno=request.getParameter("phoneno");
			String address=request.getParameter("Address");
			String qry="Insert into userdetails(customer_id,customer_name,customer_age,customer_email,customer_phno,customer_password,customer_address)values(?,?,?,?,?,?,?)";
			PreparedStatement statement=Dbconnection.prepareStatementQuery(qry);
			statement.setString(1,userid);
			statement.setString(2,username);
			statement.setInt(3,age);
			statement.setString(4,email);
			statement.setString(5,phno);
			statement.setString(6,password);
			statement.setString(7,address);
			int check=statement.executeUpdate();
			statement.close();
			if(check>0)
			{
		      response.sendRedirect("login.jsp");
			}
			else
			{
				String invalid="signup unsucessfull";
				request.setAttribute("msg",invalid);
				RequestDispatcher dispatcher=request.getRequestDispatcher("register.jsp");
				dispatcher.forward(request, response);
			}
		}catch(Exception e) {
			System.out.println(e);
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
