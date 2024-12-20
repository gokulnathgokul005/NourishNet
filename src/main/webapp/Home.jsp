<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import ="java.sql.Blob"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Base64"%>
<%@page import="com.Home.Product"%>
<%@page import="com.Database.Dbconnection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type
    
    
    " content="text/html; charset=UTF-8">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <title>Home Page</title>
    <link rel="stylesheet" href="bootstrap-css/bootstrap.min.css">
    <link rel="stylesheet" href="css/Home.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
 <style> 
 		 body {
				    position: relative;
				    background-image: url("bg-images/homebg.jpg");
				    background-position: center;
				    background-repeat: no-repeat;
				    background-size: cover;
				    background-attachment: fixed;
				    background-color: rgba(0, 0, 0, 0.8);
                 }
  					               
        .product-container {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .navbar {
            margin-bottom: 20px;
        }

        .navbar-brand {
            margin-right: auto;
        }

        .dropdown-menu {
            position: absolute;
            right: 0;
            left: auto;
            margin-top: 10px; /* Adjust the margin as needed */
        }

        .action-buttons {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/homescript.js"></script>
    <%!String name=null;%>
    <%!int id=0;%>
        <%
          name=(String)session.getAttribute("user_name");
          id=(int)session.getAttribute("session_id");
          if(id==0)
          {
        	  response.sendRedirect("login.jsp");
          }
          session.setAttribute("Username",name);
          session.setAttribute("c_id",id);        
        %>
    <nav class="navbar navbar-inverse" id="navbar">
        <div class="container-fluid" id="c-f">
            <div class="navbar-header navbar-left" id="n-h">
                <p class="navbar-brand" id="n-b">NourishNet</p>
            </div>
            <ul class="nav navbar-nav" id="cos">
                <li><a href="Homeservlet"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="cartpageservlet"><i class="fas fa-shopping-cart"></i> Cart</a></li>
            </ul>
             <form class="navbar-form navbar-left" action="searchbar"> <!-- Adjusted class to include navbar-left -->
            <div class="form-group">
                <input type="text" class="form-control" placeholder="Search" name="searchitem">
            </div>
            <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span></button>
        </form> <!-- Moved the form inside the navbar -->
              <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i><%out.print("  "+name);%><span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><i class="fas fa-user-circle"></i> Account</a></li>
              <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
              <li><a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
          </li>
        </ul>
        </div>
    </nav>
<div class="container">
    <div class="row">
  <%
        List<Product> productList=(List<Product>)request.getAttribute("productList");
        	for(Product product:productList)
        	{
        	%>
                <div class="col-lg-3 col-md-3 col-xs-12">
                    <div class="card text-center">
                        <img class="card-img-top" src="data:image/jpeg;base64, <%= new String(Base64.getEncoder().encode(product.getImage()))%>">
                        <div class="card-body">
                        <%
                         String p_name=product.getName();
                         int p_id=product.getId();
                        %>
                            <h5 class="card-title"><%=p_name%></h5>
                            <a href="view_itemservlet?sid=<%=p_id%>" class="btn btn-success" style="font-weight:bold;" name="cartlink">Add to cart</a>                        </div>
                    </div>
                </div>
            <%
        	}
        %>
    </div>
</div>
</body>
</html>
