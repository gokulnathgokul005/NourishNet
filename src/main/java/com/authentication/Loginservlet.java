package com.authentication;
import com.Database.*;
import java.sql.*;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Loginservlet")
public class Loginservlet extends HttpServlet 
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		HttpSession session=request.getSession();
		String email=request.getParameter("email");
		String pass=request.getParameter("password");
			try
			{
				String qry="select customer_id,customer_name,customer_email,customer_password from userdetails where customer_email='"+email+"'and customer_password='"+pass+"'";
				Statement statement=Dbconnection.Statement();
				ResultSet rs=statement.executeQuery(qry);
				if(rs.next())
				{
					int id=Integer.parseInt(rs.getString("customer_id"));
					String Name=rs.getString("customer_name");
					String username=rs.getString("customer_email");
					String password=rs.getString("customer_password");
					if(email.equals(username)&&pass.equals(password))
					{
					HttpSession session1=request.getSession();
				    session1.setAttribute("c_id",id);
					session1.setAttribute("user_name",Name);
					}
				}
				else
				{
					String invalid="Invalid crendentials!";
					request.setAttribute("msg",invalid);
					RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
					dispatcher.forward(request, response);
				}
				RequestDispatcher dispatcher=request.getRequestDispatcher("Homeservlet");
				dispatcher.forward(request, response);
				rs.close();
				statement.close();
			}
			catch(Exception e)
			{
				System.out.println(e);
			}
		}
	}
