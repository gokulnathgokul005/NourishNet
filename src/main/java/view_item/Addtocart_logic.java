package view_item;


import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.Database.Dbconnection;

@WebServlet("/Addtocart_logic")
public class Addtocart_logic extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		int customer_id=(int)session.getAttribute("customer_id");
		int product_id=(int)session.getAttribute("product_id");
		String username=(String)session.getAttribute("User_name");
		if(product_id!=0||customer_id!=0)   
		{
			int price=0; 
			int original_price=0;
			int original_quantity=0;
			String Item_Name=null;
			boolean exists=false;
			
			
			int quantity = Integer.parseInt(request.getParameter("quantity"));
			try {
				original_quantity=fetchoriginalquantity(product_id);
				Item_Name=fetchItem_Name(product_id);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if(quantity>original_quantity)
			{
				session.setAttribute("c_id",customer_id);
				session.setAttribute("user_name",username);	
			    session.setAttribute("product_id",product_id);
				request.setAttribute("errorMessage", "Sorry, only " +original_quantity+" "+Item_Name+" are available");
				request.getRequestDispatcher("view_itemservlet?sid="+product_id).forward(request,response);
			}
			else
			{  
			try {
				original_price=fetchOriginalPrice(product_id);
				price=original_price*quantity;
				int updatequantity=original_quantity-quantity;
				updateproduct_details(updatequantity,product_id);
				
				
				//**********************************
				exists=checkif_itemexist(Item_Name);
				if(exists==true)
				{
				  int cart_id=0;
				  int cart_price=0;
				  int cart_quantity=0;
				  String selectid="select cartItem_id,cartitem_items,cartitem_price from cart where cartitem_name='"+Item_Name+"'";
				  PreparedStatement ps=Dbconnection.prepareStatementQuery(selectid);
				  ResultSet rs=ps.executeQuery();
				  if(rs.next())
				  {
					cart_id=rs.getInt("cartItem_id");
					cart_quantity=rs.getInt("cartitem_Items");
					cart_price=rs.getInt("cartitem_price");
				  }
				  int u_quanitity=quantity+cart_quantity;
				  int u_price=price+cart_price;
				  String updateitem="Update cart set cartitem_items="+u_quanitity+",cartitem_price="+u_price+" where cartItem_id="+cart_id+"";
				  PreparedStatement st=Dbconnection.prepareStatementQuery(updateitem);
				  st.executeUpdate();
				}
				else
				{
				Add_to_cart(price,quantity,customer_id,product_id);
				}
				session.setAttribute("c_id",customer_id);
			    session.setAttribute("user_name",username);	
				response.sendRedirect("cartpageservlet");
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		     }
		}
		else
		{
			response.sendRedirect("login.jsp");
		}
	  }
	
	//*********
	private boolean checkif_itemexist(String item_Name)throws SQLException
	{
		boolean exists=false;
		String checkitem="Select cartitem_name from cart where cartitem_name='"+item_Name+"'";
		PreparedStatement ps=Dbconnection.prepareStatementQuery(checkitem);
	    ResultSet rs=ps.executeQuery();
	    if(rs.next())
	    {
	      exists=true;	
	     }
		return exists;
	}
	////*********
	private String fetchItem_Name(int p_id) throws SQLException{
		String Name=null;
		PreparedStatement st=Dbconnection.prepareStatementQuery("Select i_name from product_details where i_id="+p_id+"");
		ResultSet rs=st.executeQuery();
		if(rs.next())
		{
			Name=rs.getString("i_name");
		}
		return Name;
	}
	public int fetchOriginalPrice(int p_id) throws SQLException {
	    int original_price = 0; 

	    try {
	        java.sql.Statement st = Dbconnection.Statement();
	        ResultSet rs = st.executeQuery("SELECT i_price FROM product_details WHERE i_id = "+p_id+"");
	        if (rs.next()) {
	            original_price = rs.getInt("i_price"); // Use getInt() directly to retrieve integer values
	        }

	        rs.close();
	        st.close();
	    } catch (SQLException ex) {
	        ex.printStackTrace();
	    }
	    return original_price;
	}

	public int fetchoriginalquantity(int p_id)throws SQLException
	{
		int original_quantity=0; 
		java.sql.Statement st = Dbconnection.Statement();
	     ResultSet rs = st.executeQuery("SELECT i_available FROM product_details WHERE i_id="+p_id+"");
	     if(rs.next())
	     {
	     original_quantity=rs.getInt("i_available");
	     }
		return original_quantity;
	}
	public void  updateproduct_details(int updatequantity,int product_id)throws SQLException
	{
		PreparedStatement ps=Dbconnection.prepareStatementQuery("update product_details set i_available=? where i_id=?");
		ps.setInt(1,updatequantity);
		ps.setInt(2, product_id);
		ps.executeUpdate();
	}
	public void Add_to_cart(int price,int quantity,int customer_id,int product_id)throws SQLException
	{
		String item_name=null;
		java.sql.Statement st=Dbconnection.Statement();
		ResultSet rs=st.executeQuery("Select i_name,i_img from product_details where i_id="+product_id+"");
		if(rs.next())
		{
	    item_name=rs.getString("i_name");
	    InputStream imagestream=rs.getBinaryStream("i_img");
		PreparedStatement ps=Dbconnection.prepareStatementQuery("Insert into "
				+ "cart(cartitem_name,cartitem_items,cartitem_price,customer_id,cartitem_image)values(?,?,?,?,?)");
		ps.setString(1, item_name);
		ps.setInt(2,quantity);
		ps.setInt(3,price);
		ps.setInt(4,customer_id);
		ps.setBinaryStream(5, imagestream);
		ps.executeUpdate();
		}
	}
}
