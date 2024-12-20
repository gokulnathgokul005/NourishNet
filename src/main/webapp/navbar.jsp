<%-- 
    Document   : navbar
    Created on : Jul 1, 2023, 2:57:48 PM
    Author     : gokul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>navbar Page</title>
        <link rel="Stylesheet" href="bootstrap-css/bootstrap.min.css">
        <link rel="Stylesheet" href="css/navbar.css">
    </head>
    <body>
        <script src="js/jquery.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
           <nav class="navbar navbar-inverse" id="navbar">
  <div class="container-fluid" id="c-f">
    <div class="navbar-header navbar-left" id="n-h">
      <p class="navbar-brand" id="n-b">NourishNet</p>
    </div>
      <ul class="nav navbar-nav" id="cos">
          <li><a class="active" href="Home.jsp">Home</a></li>
      <li><a href="register.jsp">Sign up</a></li>
      <li><a href="login.jsp">log in</a></li>
      <li><a href="cart.jsp">cart</a></li>
      <li><a href="#">orders</a></li>
    </ul>
    <form class="navbar-form navbar-right" action="/action_page.php">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
         <button type="submit" class="btn btn-warning"><span class="glyphicon glyphicon-search"></span></button>
    </form>
  </div>
</nav>   
    </body>
</html>