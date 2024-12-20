<%-- 
    Document   : register
    Created on : Jul 6, 2023, 5:35:10 PM
    Author     : gokul
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> register Page</title>
        <link rel="Stylesheet" href="bootstrap-css/bootstrap.min.css">
        <link rel="Stylesheet" href="bootstrap-css/bootstrap.css">
        <style type="text/css">
            body
            {
                background-image:linear-gradient(rgba(0,0,0,.5),rgba(0,0,0,.5)),url("bg-images/reg2.jpg");
                background-repeat:no-repeat;
                background-attachment:fixed;
                background-size:cover;
            }
              .form-signup
              {
                  width:300px;
                  margin:0 30px;
              }
              h1
              {
                  text-align:center;
                  font-family:cursive;
                  font-weight:bold;
                  color:darkorange;
              }
              i
              {
                  color:#080808;
              }
              label
              {
                  color:white;
              }
        </style>
    </head>
    <body>
       <script src="js/jquery.min.js" ></script>
       <script src="js/bootstrap.min.js"></script>
       <div class="container">
           <form class="form-signup" action="Signupservlet" method="get">
               <h1>Register</h1>
            <div class="form-group">
           <div class="row">
               <div class="col-md-6 col-xs-6">
                   <div class="input-group">
                       <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                   <input type="text"class="form-control" name="name" placeholder="Name">
                   </div>
            </div>
               <div class="col-md-6 col-xs-6">
                   <div class="input-group">
                   <span class="input-group-addon"><i class="glyphicon glyphicon-heart"></i></span>
                   <input type="age"class="form-control" name="age" placeholder="age">
                   </div>
            </div>
           </div>
            </div>
           <div class="form-group">
            <div class="input-group">
             <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
               <input type="email" class="form-control" name="email" placeholder="email">
            </div>
           </div>
           <div class="form-group">
               <div class="input-group">
                   <span class="input-group-addon"><i class="glyphicon glyphicon-phone-alt"></i></span>
               <input type="text" class="form-control" name="phoneno" placeholder="Phno">
               </div>
           </div>
           <div class="form-group">
               <div class="input-group">
                   <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
               <input type="password"class="form-control" name="password" placeholder="password">
               </div>
           </div>
           <div class="form-group">
               <div class="input-group">
                   <span class="input-group-addon"><i class="glyphicon glyphicon-map-marker"></i></span>
               <input type="text" class="form-control"name="Address" placeholder="Location">
               </div>
           </div>
           <div class="form-group">
               <input type="checkbox" name="checkbox" required="enable">  <label>I accept the terms & condition</label>        
            </div>
            <div class="form-group">
                <input type="submit" class="btn btn-success btn-block" name="btn_submit">
                 <%
             String btn=request.getParameter("btn_submit");
            if(btn!=null)
            {
              String msg=(String)request.getAttribute("msg");
              if(msg!=null)
              {
            	  out.print(msg);
              }
            }
            %>
            </div>
           </form>
            </div>
    </body>
</html>
