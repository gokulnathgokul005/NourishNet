<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Order Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  <style>
    /* Custom CSS for vertical centering and background */
    body, html {
      height: 100%;
      margin: 0;
    }

    body {
      background-color:#f8f9fa;;
    }

    .vertical-center {
      height: 100%;
      display: flex; /* Use flexbox for vertical centering */
      justify-content: center; /* Center horizontally */
      align-items: center; /* Center vertically */
    }

    /* Custom CSS for order details */
    .order-details {
      background-color: #fff;
      border-radius: 10px; 
      padding: 20px; /* Padding */
      box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); /* Box shadow for depth */
      overflow: hidden;
    }

    /* Custom CSS for price text */
    .price {
      font-size: 28px; /* Larger font size */
      color: #007bff; /* Blue color for price */
    }

    /* Custom CSS for Proceed to Payment button */
    .proceed-to-payment-btn {
      background-color: #007bff; /* Blue color */
      color: #fff; /* White text color */
      border: none; /* No border */
      padding: 10px 20px; /* Padding */
      font-size: 18px; /* Font size */
      border-radius: 5px; /* Rounded corners */
      cursor: pointer; /* Cursor on hover */
      transition: background-color 0.3s; /* Smooth transition for background color */
    }
    /* Hover effect */
    .proceed-to-payment-btn:hover {
      background-color: #0056b3; /* Darker blue on hover */
    }
  </style>
</head>
<body>
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  <div class="container-fluid vertical-center">
    <div class="text-center order-details">
      <h2>Your Order</h2>
      <!-- Display order details -->
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <p>Item: Lorem ipsum dolor sit amet</p>
          <!-- Price with larger font size -->
          <p class="price">$19.99</p>
          <p>Quantity: 1</p>
        </div>
      </div>
      <!-- Proceed to Payment button -->
      <div class="mt-4">
        <button class="proceed-to-payment-btn">Proceed to Pay</button>
      </div>
    </div>
  </div>

  <!-- Bootstrap JS (Optional, for some features like dropdowns) -->
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
