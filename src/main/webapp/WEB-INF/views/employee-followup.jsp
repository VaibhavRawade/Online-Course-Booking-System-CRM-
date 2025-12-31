<%-- <%@page import="in.sp.main.entity.CustomerEnq" %>
<%@ page language="java" import="java.util.*" import="in.sp.main.entity.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
  	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</head>
<body>
	
	<jsp:include page="admin-header.jsp"/>
	
	   <br/><br/> 	
		     <div class="container mt-3">
		    		  <center><h3>Course Purchesed Customers</h3></center>  
		       <br/>     
		        <table class="table table-light table-bordered table-striped" border="2" bordercolor:"blue">
			          	      <tr>
				                   <th>Name</th>
				                   <th>Phone No.</th>
				                   <th>PurchesedCourse</th>
				              </tr>
					      <%	
							ArrayList<CustomerEnq> custenq = (ArrayList<CustomerEnq>) request.getAttribute("listCustomer");
					      	for(CustomerEnq customer:custenq)
					      	{
					      		String a=customer.getStatus();
					      	    if(a.equals("8"))
					      		{
							       %>
							       <tr>
									    <td><%=customer.getName() %></td>
									    <td><%=customer.getPhone() %></td>			
									    <td><%=customer.getIntrestedcourse() %></td>					   
								   </tr>
								   <% 
								 }
							}
						  %>
				 </table>
			</div>
			
			
			
</body>
</html> --%>


<%@ page language="java" import="java.util.*" import="in.sp.main.entity.CustomerEnq" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Customer Inquiry Management</title>
    <link rel="stylesheet" href="css/style.css">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <style>
      body {
        background-color: #f8f9fa;
        font-family: 'Arial', sans-serif;
      }
      .header {
        background-color: #007bff;
        color: white;
        padding: 10px 0;
      }
      .EmpAddHeader {
        margin-top: 20px;
      }
      .table th, .table td {
        text-align: center;
        vertical-align: middle;
      }
      .table thead {
        background-color: #007bff;
        color: white;
      }
      .alert-danger {
        margin-top: 20px;
      }
      .button_u, .button_d, .button_y {
        width: 100px;
        margin: 5px;
      }
    </style>
  </head>
  <body>
    <!-- Include Header -->
    <jsp:include page="employee-header.jsp"/>

    <!-- Error Alert -->
    <%
      String errorMessage = (String) request.getAttribute("error");
      if (errorMessage != null) {
    %>
    <div class="EmpAddHeader">
      <div class="alert alert-danger container" role="alert">
        <div class="row">
          <div class="col-12 text-center">${errorMessage}</div>
        </div>
      </div>
    </div>
    <%
      }
    %>

    <!-- Customer Inquiry List Section -->
    <div class="container mt-5">
      <div class="header text-center" style="background-color: white;">
        <br>
         <br>
        <h2 style="color: black;">Course Purchased Student List</h2>
      </div>
      <br/>  
      <table class="table table-striped table-bordered">
        <thead>
          <tr style="background-color: black">
            <th>Name</th>
            <th>Phone No.</th>
            <th>Purchased Course</th>
          </tr>
        </thead>
        <tbody>
          <%
            ArrayList<CustomerEnq> customers = (ArrayList<CustomerEnq>) request.getAttribute("listCustomer");
            for (CustomerEnq customer : customers) {
              if ("8".equals(customer.getStatus())) {  // Filter by status
          %>
          <tr>
            <td><%= customer.getName() %></td>
            <td><%= customer.getPhone() %></td>
            <td><%= customer.getIntrestedcourse() %></td>
          </tr>
          <%
              }
            }
          %>
          
         
        </tbody>
      </table>
    </div>
  </body>
</html>
