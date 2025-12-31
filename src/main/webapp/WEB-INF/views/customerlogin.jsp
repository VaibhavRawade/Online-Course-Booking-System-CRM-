
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Login Page</title>

    <!-- Link to Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Custom Styles -->
    <link rel="stylesheet" href="css/style.css">

</head>



<body class="d-flex flex-column min-vh-100">
    <jsp:include page="header.jsp" />
	
    <div class="container flex-grow-1 d-flex align-items-center justify-content-center">
        <div class="col-12 col-md-6 col-lg-4">
            <div class="login_div_design bg-light rounded p-4 shadow-lg" style="border: 2px solid #000000; border-radius: 10px;color:black">
                <% 
                    String error = (String) request.getAttribute("error");
                    if (error != null) { 
                %>
                <div class="alert alert-danger" role="alert">
                    <h4 class="alert-heading">Error!</h4>
                    <p><%= error %></p>
                </div>
                <% 
                    }
                %>

                <form action="loginPageUser" method="post">
                    <h3 class="text-center mb-4">Student Login</h3>

                    <div class="mb-3">
                        <label for="email1" class="form-label">Enter Email</label>
                        <input type="email" name="email1" id="email1" class="form-control" required />
                    </div>

                    <div class="mb-3">
                        <label for="pass1" class="form-label">Enter Password</label>
                        <input type="password" name="pass1" id="pass1" class="form-control" required />
                        <div class="form-text">We will not share your email id with anyone...</div>
                    </div>

                    <button type="submit" class="btn btn-primary w-100 mt-3 py-2">Login</button>
                </form>

               <div class="text-center mt-3">
                    <small>Don't have an account? <a href="registerpageUser" class="text-decoration-none">Register here</a></small>
                </div> 
            </div>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>


</html>





