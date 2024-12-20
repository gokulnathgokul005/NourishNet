package com.Database;
import java.sql.*;
public class Dbconnection 
{
	 private static String username="root";
	 private static  String password="root";
	 private static String path="jdbc:mysql://localhost/store";
	 static{
	  try
	  {
	 Class.forName("com.mysql.cj.jdbc.Driver");
	  }
	  catch(Exception e)
	  {
		  System.out.println(e);
	  }
	  }
	 public static Connection getConnection() throws SQLException {
	        return DriverManager.getConnection(path, username, password);
	    }

	 public static PreparedStatement prepareStatementQuery(String sql) throws SQLException {
	        Connection connection = getConnection();
	        return connection.prepareStatement(sql);
	    }
	    public static Statement Statement()throws SQLException
	    {
	    	 Connection connection = getConnection();
	    	 return connection.createStatement();
	    }
	    public static ResultSet fetchallproduct() throws SQLException
	    {
	    	return Statement().executeQuery("select * from product_details");
	    }
	    public static ResultSet fetchalluserdetails()throws SQLException
	    {
	    	return Statement().executeQuery("select * from userdetails");
	    }
}
