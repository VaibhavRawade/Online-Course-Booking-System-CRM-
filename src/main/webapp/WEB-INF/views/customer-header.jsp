<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
</head>
<body>
			  <div class="container-fluid bg-primary text-white HeaderFooter">
			      <div class="container">
			          <div class="row">
			
			              <div class="col-3">
			                  <a href="homepage" style="color:white">CRM Application </a>
			              </div>
			
			              <div class="col-6">
			              </div>
			
			              <div class="col-3">
			                  <div class="btn-group navbar">
			                      <img src="/images/logo-admin1.jpg" height="40" width="40">
			                        &nbsp;
			                      <span style="color: black;font-size:19px;">User</span>
			                        &nbsp; &nbsp;
                  				   <a href="loginpage" style="color: black;font-size:19px;">logout</a>
			                  </div>
			              </div>
			          </div>
			      </div>
			   </div>
				
				   
		 	 <nav class="navbar navbar-expand-sm bg-dark navbar-dark container-fluid">
		            <div class="container">
		                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
		                    <span class="navbar-toggler-icon"></span>
		                </button>
		                <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
		                    <ul class="navbar-nav">
		                        </li>
		             
		                        <li class="nav-item dropdown">
		                            <a class="nav-link dropdown-toggle" href="enquiryForm">Customer's Enquiry</a>
		                        </li>
		                        <li class="nav-item dropdown">
		                            <a class="nav-link dropdown-toggle" href="customerfollowUp">Customer Follow Up's</a>
		                        </li>
		                        
		                         
		                    </ul>
		                </div>
		            </div>
		        </nav>
		 	

</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>CRM Application - Customer</title>
    <!-- Adding Bootstrap 5 for better styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fb;
        }

        /* Header Section */
        .HeaderFooter {
            padding: 20px 0;
            background-color: #007bff;
            color: white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            border-bottom: 3px solid #f1f1f1;
        }
        .HeaderFooter a {
            font-weight: bold;
            text-decoration: none;
            color: white;
        }

        .HeaderFooter .btn-group {
            display: flex;
            align-items: center;
        }
        .HeaderFooter .btn-group img {
            border-radius: 50%;
            margin-right: 10px;
        }

        /* Navbar Section */
        .navbar {
            background-color: #343a40 !important;
            margin-top: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-toggler {
            border: 1px solid #fff;
        }

        .navbar-nav .nav-item .nav-link {
            font-size: 18px;
            font-weight: 500;
            transition: background-color 0.3s ease-in-out;
        }

        .navbar-nav .nav-item .nav-link:hover,
        .navbar-nav .nav-item .nav-link:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-radius: 5px;
        }

        .navbar-nav .nav-item .dropdown-menu {
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        .navbar-nav .nav-item .dropdown-item {
            font-size: 16px;
            font-weight: 400;
            transition: background-color 0.3s ease;
        }

        .navbar-nav .nav-item .dropdown-item:hover {
            background-color: #f8f9fa;
            color: #343a40;
        }

        .navbar-toggler-icon {
            background-color: white;
        }

        /* Responsive styling */
        @media (max-width: 768px) {
            .HeaderFooter .container {
                text-align: center;
            }

            .btn-group img {
                width: 35px;
                height: 35px;
            }

            .navbar-collapse {
                text-align: center;
            }
        }
    </style>
  </head>
  <body>

    <!-- Header Section -->
    <div class="container-fluid HeaderFooter">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-3">
                    <a href="homepage" class="fs-4" style="color: black; text-decoration: none; border: 2px solid black; padding: 5px 10px; display: inline-block;background-color: white">CRM Application</a>
                </div>
                <div class="col-6 text-center">
                    <!-- Optional Center Section if needed -->
                </div>
                <div class="col-3 text-end">
                    <div class="btn-group">
                        <img src="/images/logo-admin1.jpg" height="40" width="40">
                        <span class="fs-5">User</span>
                        <a href="loginpageuser" class="text-black ms-3 fs-5" style="background-color:red; color:white; padding:5px 10px; border-radius:5px; text-decoration:none; font-weight:bold; transition: background-color 0.3s;margin-right: 50px;"> Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Navbar Section -->
    <nav class="navbar navbar-expand-sm navbar-dark container-fluid">
        <div class="container">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-center" id="collapsibleNavbar">
                <ul class="navbar-nav">
                    <!-- Customer Enquiry Dropdown -->
                    <li class="nav-item">
                        <a class="nav-link" href="enquiryForm">Customer's Enquiry</a>
                    </li>
                    
                    <li class="nav-item">
                        <a class="nav-link" href="prdDetailsCustomer">Purchased Course</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Bootstrap JS (including Popper.js for dropdowns and tooltips) -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>

  </body>
</html>
