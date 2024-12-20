<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
      <link href="css/Banner.css" rel="stylesheet">
      <link rel="stylesheet" href="bootstrap-css/bootstrap.min.css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
      <style>
      .error{
	    text-align: center;
    display: flex;
}
      </style>
</head>
<body>
    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/homescript.js"></script>
    
  	<nav class="navbar navbar-inverse" id="navbar">
        <div class="container-fluid error" id="c-f">
            <div class="navbar-header" id="n-h">
                <p class="navbar-brand text-center" id="n-b">NourishNet</p> <!-- Added text-center class -->
            </div>
        </form> <!-- Moved the form inside the navbar -->
              <ul class="nav navbar-nav navbar-right">
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fas fa-user"></i><span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a href="#"><i class="fas fa-user-circle"></i> Account</a></li>
              <li><a href="#"><i class="fas fa-cog"></i> Settings</a></li>
              <li><a href=""><i class="fas fa-sign-out-alt"></i> Logout</a></li>
            </ul>
          </li>
        </ul>
        </div>
    </nav>
    <%
     int session_id=0;
     String name=null;
     session_id=(int)session.getAttribute("c_id");
	 name=(String)session.getAttribute("user_name");
    %>
    <div class="banner">
        <img src="bg-images/Bannerimg.jpg" alt="Banner Image">
        <div class="banner-content">
          <h2>Discover Deliciousness</h2>
          <p>Explore our wide range of tasty treats</p>
          <a href="HomeServlet" class="cta-button">Shop Now</a>
        </div>
      </div>      
</body>
</html>