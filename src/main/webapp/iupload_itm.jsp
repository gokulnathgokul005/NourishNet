<%-- 
    Document   : upload_img
    Created on : Jul 20, 2023, 3:01:51 PM
    Author     : gokul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type`" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="uploadservlet" method="post" enctype="multipart/form-data">
            <table border="1">
                <tr>
                    <td>
                        itmName:
                    </td>
                    <td>
                        <input type="text" name="itemname">
                    </td>
                </tr>
                <tr>
                    <td>
                        Price:
                    </td>
                    <td>
                        <input type="text" name="price">
                    </td>
                </tr>
                <tr>
                    <td>
                       items:
                    </td>
                    <td>
                        <input type="text" name="item">
                    </td>
                </tr>
           <tr>
                <td>
                    filename:
                </td>
                <td>
                    <input type="file" name="img">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="submit" name="btnsubmit">
                </td>
            </tr>
        </table>
        </form>
    </body>
</html>
