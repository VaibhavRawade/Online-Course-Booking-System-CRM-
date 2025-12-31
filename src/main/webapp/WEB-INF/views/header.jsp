
 
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CRM Application</title>

    <!-- Bootstrap 5 CSS for responsive design and styles -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        /* Custom header styles */
        .header-bg {
            background: linear-gradient(to right, #2a3d68, #1e2d48);
            color: white;
        }

        .logo {
    font-size: 1.8em;
    font-weight: bold;
    color: #ffcd39;
    text-decoration: none;
    white-space: nowrap; /* Prevents the text from breaking */
    overflow: hidden;    /* Ensure overflow text is hidden if it's too long */
    text-overflow: ellipsis; /* Optional: Adds ellipsis if the text overflows */
}
        .navbar {
            background-color: transparent;
        }

        .btn-group .btn {
            background-color: #ffcd39;
            color: white;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }

        .btn-group .dropdown-menu {
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        .dropdown-item {
            font-weight: 500;
        }

        .dropdown-item:hover {
            background-color: #333;
            color: #ffcd39;
        }
    </style>
</head>
<body>

    <!-- Header section -->
    <div class="container-fluid header-bg py-3">
        <div class="container">
            <div class="row align-items-center">

                <!-- Logo and title section -->
                <div class="col-3" margin>
                    <a href="homepage" class="logo" style="float:left;    margin-left: -145px;">ONLINE COURSE BOOKING SYSTEM</a>
                </div>

                <!-- Empty space for alignment -->
                <div class="col-6"></div>

                <!-- Menu section -->
                  
                <div class="col-3">
                    <div class="btn-group navbar">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="margin-right: -100px;">
                            Menu
                        </button>
                        <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="homepage">HOME</a></li>
                        <li><a class="dropdown-item" href="loginpage">ADMIN-LOGIN</a></li>
                         <li><a class="dropdown-item" href="loginpageuser">STUDENT-LOGIN</a></li>
                        <li><a class="dropdown-item" href="aboutUs">ABOUT-US</a></li>
                        <li><a class="dropdown-item" href="contactUs">CONTACT-US</a></li>
                        </ul>
                        
<a href='/lockCourses' class="btn btn-primary" 
   style="position: absolute; right: 0; top: 49%; transform: translateY(-48%);
          margin-left: -200px; padding: 5px 15px; height: 46px; width: 100px; margin-right:20px;
          font-size: 16px; border-radius: 20px; display: flex; align-items: center; justify-content: center;">
    Courses
</a>


                    </div>
                </div>
            </div>
            </div>
        </div>

    <!-- Bootstrap JS and Popper.js for dropdown functionality -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>

 