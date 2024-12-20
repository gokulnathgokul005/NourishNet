package view_item;

import java.sql.*;
import com.Database.Dbconnection;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/view_itemservlet")
public class view_itemservlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String username=null;
		 HttpSession session=request.getSession();
		 int product_id=Integer.parseInt(request.getParameter("sid"));
		 int customer_id=(int)session.getAttribute("c_id");
	  if(product_id!=0||customer_id!=0)
	  {
		  try
		  {
		  PreparedStatement statement=Dbconnection.prepareStatementQuery("select customer_name from userdetails where customer_id="+customer_id+"");
		   ResultSet user_rs=statement.executeQuery();
		   if(user_rs.next())
		   {
			   username=user_rs.getString("customer_name");
		   }
		   Statement item_rs=Dbconnection.Statement();
		   ResultSet rs=item_rs.executeQuery("select i_name,i_price,i_img from product_details where i_id="+product_id+"");
		  if(rs.next())
		   {   
			  byte[]item_img=rs.getBytes("i_img");
			  String item_name=rs.getString("i_name");
			  int item_price=Integer.parseInt(rs.getString("i_price"));
			  session.setAttribute("customer_id",customer_id);
			  session.setAttribute("product_id",product_id);
			  request.setAttribute("namedata",item_name);
			  request.setAttribute("imagedata",item_img);
			  request.setAttribute("pricedata",item_price);
			  rs.close();
		   }
		  }
		  catch(SQLException sq)
		  {
			  System.out.println(sq);
		  }
		   request.setAttribute("c_username",username);
		   request.setAttribute("product_id",product_id);
		   RequestDispatcher dispatcher=request.getRequestDispatcher("view_item.jsp");
		   dispatcher.forward(request, response);
	  }
	  else
	  {
		  response.sendRedirect("Homeservlet");
	  }
	}
	}
