<%@page import="com.cart.Cartitems"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.cart.*"%>
<%@page import="java.util.Base64"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cart Page</title>
    <link rel="stylesheet" href="bootstrap-css/bootstrap.min.css">
    <link rel="stylesheet" href="css/cart.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            position: relative;
            background-image: url("bg-images/cart-bg.jpg");
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            background-attachment: fixed;
            margin: 0; /* Remove default margin */
            padding-top: 80px; /* Adjust padding-top to accommodate navbar height */
        }
        .product-container {
            background-color: #f8f9fa;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .navbar {
            margin-bottom: 0; /* Remove default margin-bottom */
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
        table {
            width: 100%;
            border-collapse: collapse;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #007bff;
            color: #fff;
        }
        td {
            background-color: #f8f9fa;
            color: #333;
            text-align:center;
	        padding:0px;
	        justify-content:center; 
	         height: 100px; 
	          font-weight:bolder;      
        }
        tbody tr:hover {
            background-color: #cfd8dc;
        }
       .footer {
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
            height:15%;
            background-color:silver;
            padding: 20px;
            text-align: center;
            display:flex;
        }
        .price {
            font-size: 20px;
            font-weight:bolder;
             
        }
    </style>
</head>
<body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>

    <nav class="navbar navbar-inverse" id="navbar">
        <div class="container" id="c-f">
            <div class="navbar-header navbar-left" id="n-h">
                <p class="navbar-brand" id="n-b">NourishNet</p>
            </div>
            <ul class="nav navbar-nav" id="cos">
                <li><a href="Homeservlet"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="cartpageservlet"><i class="fas fa-shopping-cart"></i> Cart</a></li>
            </ul>
            <%
             int customer_id=(int)request.getAttribute("customer_id");
             String name=(String)request.getAttribute("username");
             session.setAttribute("c_id",customer_id);
             session.setAttribute("name",name);
             %>
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i><%=name%><span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#"><i class="fas fa-user-circle"></i> Account</a></li>
                        <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
                        <li><a href="logout"><i class="fas fa-sign-out-alt"></i>Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <table class="table" id="cart-table">
                    <thead>
                        <tr>
                            <th>Image</th>
                            <th>Name</th>
                            <th>Items</th>
                            <th>Price</th>
                            <th>Order</th>
                            <th>Delete</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                      List<Cartitems> p=(List<Cartitems>)request.getAttribute("cart");
                        for (Cartitems items:p) { %>
                            <tr data-product-id="<%= items.getCartItemId()%>">
                                <td style=" vertical-align:middle;"><img src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(items.getItemimage()))%>" style="width: 100px; height: auto;"></td>
                                <td style=" vertical-align: middle;"><%=items.getItemname()%></td>
                                <td  style=" vertical-align: middle;"><%= items.getItemquantity() %></td>
                                <td  style=" vertical-align: middle;">Rs:<%= items.getItemprice()%></td>
                                <form action="shippment_details" method="post"> 
                                <input type="hidden" name="itemid" value="<%=items.getCartItemId()%>">         
                                <td  style=" vertical-align: middle;"><button type="submit" class="btn btn-primary">Order</button></td>
                                </form>
                               <form action="Delete_In_cart" method="post">
                               <input type="hidden" name="itemid" value="<%=items.getCartItemId()%>">
                               <td  style=" vertical-align: middle;"><button type="submit" class="btn btn-danger">Delete</button></td>
                              </form>
                            </tr> 
                            <%}
                            %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>       
</body>
<div class="footer">
       <form action="" method="post">
        <div class="price">Total price:<span class="value"><%=request.getAttribute("Total_price")%></span>/-</div>
        <button class="btn btn-primary buy-button">Buy All</button>
        </form>
    </div>
</html>
