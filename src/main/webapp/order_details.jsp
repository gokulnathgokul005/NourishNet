<!DOCTYPE html>
<%@page import="com.orderitems.customer_details"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Base64"%>
<html>
<head>
    <title>Shipping Details</title>
    <!-- Internal Bootstrap CSS -->
    <link href="bootstrap-css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding-top:200px;
        }
        .container {
            max-width: 800px;
            padding: 20px;
        }
        h2 {
            text-align: center;
        }
        .details {
            margin-bottom: 20px;
        }
        .details label {
            font-weight: bold;
        }
        .details input[type="text"] {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }
        .edit-button {
            display: inline-block;
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
            text-align: center;
            text-decoration: none;
            font-size: 16px;
            margin-top: 10px;
            cursor: pointer;
        }
        /* Center align the button */
        .center-align {
            text-align: center;
        }
        /* Left div for table */
        .left-div {
            text-align: left;
        }
        /* Right div for image */
        .right-div {
            text-align: center;
        }
        .right-div img {
            max-width: 100%;
            height: auto;
            border-radius: 5px;
            margin-bottom: 20px;
        }
        
        .empty-row {
            height: calc((50vh - 80px) - 160px);
        }
        
        .img{
        width: 300px;
        height: 400px;
        display: flex;
        align-items: center;
        justify-content:center;
		}
    </style>
</head>
<body>

<div class="container">
    <h2>Shipping Details</h2>
    <div class="row">
        <!-- Left div for table -->
        <div class="col-md-6 left-div">
        <%
           List<customer_details>details=(List<customer_details>)request.getAttribute("order_details");
        		for(customer_details data:details)
        		{
        %>
            <div class="details">
                <label for="itemName">Item Name:</label>
                <input type="text" class="form-control" id="itemName" name="itemName" value="<%=data.getCustomer_name()%>" readonly>
            </div>
            
            <div class="details">
                <label for="itemPrice">Item Price:</label>
                <input type="text" class="form-control" id="itemPrice" name="itemPrice" value="<%=data.getItemprice()%>" readonly>
            </div>
            
            <div class="details">
                <label for="itemQuantity">Item Quantity:</label>
                <input type="text" class="form-control" id="itemQuantity" name="itemQuantity" value="<%=data.getItemquantity()%>" readonly>
            </div>
            
            <div class="details">
    <label for="mobileNumber">Mobile Number:</label>
    <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" value="<%=data.getCustomer_phno()%>" readonly>
    <button class="btn btn-success mt-2 edit-button" onclick="enableEdit('mobileNumber')">Edit</button>
</div>
            
            <div class="details">
                <label for="shippingAddress">Shipping Address:</label>
                <input type="text" class="form-control" id="shippingAddress" name="shippingAddress" value="<%=data.getCustomer_address()%>" readonly>
                <button class="btn btn-success mt-2 edit-button" onclick="enableEdit('shippingAddress')">Edit</button>
            </div>
      
            <div class="center-align">
                <button class="btn btn-primary" onclick="submitForm()">Order Now</button>
            </div>
        </div>
        <!-- Right div for image -->
        <div class="col-md-6 right-div">
            <!-- Empty row for upper vertical centering -->
            <div class="row empty-row"></div>
            <!-- Image row -->
            <div class="row">
                <div class="col-md-12">
                    <img class="img" src="data:image/jpeg;base64,<%=new String(Base64.getEncoder().encode(data.getItemimg()))%>" alt="Food Image">
                </div>
            </div>
            <!-- Empty row for lower vertical centering -->
            <div class="row empty-row"></div>
        </div>
    </div>
    <%}%>
</div>

<!-- Internal Bootstrap JS -->
<script src="js/bootstrap/js/bootstrap.min.js"></script>

<script>
    function enableEdit(elementId) {
        var element = document.getElementById(elementId);
        element.removeAttribute('readonly');
        element.focus();
    }

    function submitForm() {
        var itemName = document.getElementById('itemName').value;
        var itemPrice = document.getElementById('itemPrice').value;
        var itemQuantity = document.getElementById('itemQuantity').value;
        var shippingAddress = document.getElementById('shippingAddress').value;
        var shippingPincode = document.getElementById('shippingPincode').value;
        
        var formData = {
            itemName: itemName,
            itemPrice: itemPrice,
            itemQuantity: itemQuantity,
            shippingAddress: shippingAddress,
            shippingPincode: shippingPincode
        };
        
        alert(JSON.stringify(formData));
    }
</script>

</body>
</html>