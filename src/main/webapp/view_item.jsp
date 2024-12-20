<!DOCTYPE html>
<%@page import="java.util.List"%>
<%@page import ="java.sql.Blob"%>
<%@page import="java.util.Base64"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View Item</title>
<link rel="stylesheet" href="bootstrap-css/bootstrap.min.css">
<link rel="stylesheet" href="css/view_item.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<style>
  .product-container {
    position: relative; /* Ensure positioning context for pseudo-element */
    background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white background */
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    backdrop-filter: blur(10px); /* Apply blur effect */
    overflow: hidden; /* Hide overflowing content */
  }
  .navbar {
    margin-bottom: 20px;
  }
  .navbar-brand {
    margin-right: auto;
  }
  .dropdown-menu {
    right: 0;
    left: auto;
  }
  .action-buttons {
    margin-top: 20px;
  }
  .mb-3
  {
    font-size:20px;
    font-weight:bold;  
  }
   .mb-3 .price {
        font-size: 20px;
        color: red;
    }
     .btn-custom {
      background-color: #9c27b0;
      border-color:purple; 
    }

    .btn-custom:hover {
      background-color: red;
      border-color:red
    }
    span {
    color:yellow;
}
</style>
</head>
<body>
 <%
 String username=(String)request.getAttribute("c_username");
 out.println(username);
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
        <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"><%out.print("  "+username);%></i><span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><i class="fas fa-user-circle"></i> Account</a></li>
              <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
              <li><a href="logout"><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
          </li>
        </ul>
    </div>
</nav>
<div class="container mt-5 pt-4">
  <div class="row justify-content-center">
    <div class="col-md-8 product-container shadow p-4 mb-5 bg-body rounded">
     <a href="back_to_previouspage" class="btn btn-custom">
    <span class="oi oi-arrow-left" aria-hidden="true">back to Surfing</span>
     </a>
      <div class="row">
        <div class="col-md-5 product-image text-center">
         <img src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode((byte[]) request.getAttribute("imagedata"))) %>" alt="Biriyani" height="200px">
        </div>
        <div class="col-md-7 product-info">
        <%
        int id=(int)session.getAttribute("c_id");
        int p_id=(int)session.getAttribute("product_id");
        
  			session.setAttribute("customer_id",id);
  			session.setAttribute("product_id",p_id);
  			session.setAttribute("User_name",username);
        %>
          <h1 class="mb-4"><%=request.getAttribute("namedata")%></h1>
          <p class="mb-3">Price:<span class="price"><%=request.getAttribute("pricedata")%></span>/-</p>
          <div class="rating mb-3">
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="fas fa-star"></i>
            <i class="far fa-star"></i>
          </div><p>4.5(10k+ratings)</p>
          <p>southIndian .Indian</p>
          <div class="quantity mb-4">
            <button class="btn btn-sm btn-outline-dark minus">-</button>
            <input type="number" min="1" max="99" step="1" value="1" class="form-control mx-2">
            <button class="btn btn-sm btn-outline-dark plus">+</button>
          </div>
          <div class="action-buttons row">
  <div class="col-md-6">
    <form method="get" action="Addtocart_logic">
      <input type="hidden" name="quantity" id="quantity" value="1">
      <button type="submit" class="btn btn-primary add-to-cart me-2">Add to Cart</button>
    </form>
  </div>
  <div class="col-md-6">
    <form method="get" action="">
      <input type="hidden" name="quantity" id="quantity" value="1">
      <button type="button" class="btn btn-success">Buy Now</button>
    </form>
  </div>
</div>
          
        </div>
      </div>
    </div>
  </div>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
$(document).ready(function() {
  $('.minus').click(function () {
    var $input = $(this).parent().find('input');
    var value = parseInt($input.val());
    if (value > 1) {
      value = value - 1;
    } else {
      value = 1;
    }
    $input.val(value);
    $('#quantity').val(value);
  });
  
  $('.plus').click(function () {
    var $input = $(this).parent().find('input');
    var value = parseInt($input.val());
    if (value < 99){
      value = value + 1;
    } else {
      value=99;
    }
    $input.val(value);
    $('#quantity').val(value); 
  });
});
</script>
</body>
</html>
