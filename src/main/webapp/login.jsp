<%-- 
    Document   : login
    Created on : Jun 17, 2023, 10:35:34 AM
    Author     : gokul
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/login.css">
        <link rel="stylesheet" href="bootstrap-css/bootstrap.min.css">
        <style>
			 body {
				    position: relative;
				    background-image: url("bg-images/abc.jpg");
				    background-position: center;
				    background-repeat: no-repeat;
				    background-size:cover;
				    background-attachment: fixed;
                 }
			 
        </style>
            <script>
            window.onload = function() {
                window.history.forward();
            }
             function isempty()
             {
            	 var input_username=document.getElementById("username").value;
            	 var input_password=document.getElementById("password").value;
            	if(input_username=="")
            	 {
            		 alert("Enter username");
            		 return false;
            	 }
            	else if(input_password=="")
            		{
            		  alert("Enter password");
            		  return false;
            		}
            	 else
            		 {
            		  return true;
            		 }  
             }
            </script>
    </head>
    <body >
         <script src="js/jquery.min.js" ></script>
        <script src="js/bootstrap.min.js"></script>
        <div class="container">
            <div class="row" id=row>
                <div class="col-md-4" id=row>
            </div>
                <div class="col-md-4" style="align-content:center;align-items:center;">
                    <h1 style="text-align:center;color:red;padding:20px">Login</h1>
                </div>
                <div class="col-md-4">
                </div>
            </div>
            <br>
            <div class="row">
                <div class="col-md-4">
                </div>
                <div class="col-md-4 col-xs-12">
                    <form class="form" action="Loginservlet" method="get">
                        <label>Email:</label>
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input type="Email" name="email" class="form-control" placeholder="email" id="username">
                            </div>
                    <label>Password:</label>         
                            <div class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>         
                                <input type="password" name="password" class="form-control" placeholder="password" id="password">
                            </div>
                             <br>
                            <div class="input-group">
                            <input type="checkbox" name="chexkbox" required="enable"><label>Required*</label>
                            </div>
                             <div>
                            <input type="submit" name="btnsubmit" value="submit" class="btn btn-success" onclick="return isempty()">
                </div>
                    </form>
                    <h4 style="font-weight:bolder;text-align:center;color:white;">(OR)</h4>
                    <a style="text-align:center;font-weight:bolder;position:fixed;padding-left:155px;color:red;" href="register.jsp">New_user!</a>
                    <%
                    String btn=request.getParameter("btnsubmit");
                    if(btn!=null)
                    {
                       String message=(String)request.getAttribute("msg");
                      if(message!=null)
                      {
                    	  out.println(message);
                      }
                    }
                    %>
                <div class="col-md-3">
                </div>
            </div>
        </div>
    </body>
</html>