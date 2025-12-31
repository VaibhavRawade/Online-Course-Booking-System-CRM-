<%-- <%@ page language="java" import="java.util.*" import="in.sp.main.entity.Employee" contentType="text/html; charset=ISO-8859-1"
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
		 	
		 	<%
		 			 	String str=(String)request.getAttribute("error");
		 			 			 	if(str!=null)
		 			 			 	{
		 			 	%>
				<div class="EmpAddHeader">
					<div class="alert alert-danger container" role="alert">
						<div class="row">
							<div class="col-4"></div>
							<div class="col-6">${error}</div>
							<div class="col-2"></div>
					  	</div>
				 	</div>
			 	</div>
			 	<%
			 	}
			 	%>
		 	
		     <br/><br/> 	
		     <div class="container mt-3">
		       <center><h2>Employee's List</h2></center>   
		       <br/>     
		        <table class="table table-light table-bordered table-striped">
			          	      <tr>
						          <th>Name</th>
						          <th>Email</th>  
						          <th>Phone</th>
						          <th>Update</th>
						          <th>Delete</th>
						       </tr>  
					      <%
  					      ArrayList<Employee> users = (ArrayList<Employee>) request.getAttribute("emplist");
  					        					      					for (Employee user: users) 
  					        					      					{
  					      %>
						       <tr>
								    <td><%= user.getName() %></td>
								    <td><%= user.getEmail() %></td>
								    <td><%= user.getPhone() %></td>
								   	<td style="text-align: center;">
	                						 <form action="updateEmp" method="post">
										       <input type="hidden" value="<%=user.getEmail()%>" name="email"/>
										       <input type="submit" value="UPDATE" class="button_u"/>
										     </form>    						
	                    		    </td>
							        <td style="text-align: center;">
										  <form action="deleteEmp" method="post">
										    <input type="hidden" value="<%=user.getId()%>" name="id"/>
										    <input type="submit" value="DELETE" class="button_d"/>
										  </form>
							        </td> 
							   </tr>
							  <%
							}
						  %>
				 </table>
			</div>
			
   </body>
 </html> --%>
 
 
 <%@ page language="java" import="java.util.*" import="in.sp.main.entity.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Employee Management</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
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
      .button_u, .button_d {
        width: 100px;
        margin: 5px;
      }
    </style>
  </head>
  <body>
    <!-- Navigation Header -->
    <jsp:include page="admin-header.jsp"/>
    
    <!-- Error Alert -->
    <%
      String str = (String) request.getAttribute("error");
      if (str != null) {
    %>
    <div class="EmpAddHeader">
      <div class="alert alert-danger container" role="alert">
        <div class="row">
          <div class="col-12 text-center">${error}</div>
        </div>
      </div>
    </div>
    <%
      }
    %>

    <!-- Employee List Section -->
    <div class="container mt-5">
     <div class="header text-center" style="background-color: white;">
     <br>
     <br>
    	<h2 style="color: black;">Employee List</h2>
 	 </div>
      <br/>  
      <table class="table table-striped table-bordered">
        <thead>
        <tr style="background-color: black">

            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Update</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <%
            ArrayList<Employee> users = (ArrayList<Employee>) request.getAttribute("emplist");
            for (Employee user : users) {
          %>
          <tr>
            <td><%= user.getName() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhone() %></td>
            <td>
              <form action="updateEmp" method="post">
                <input type="hidden" value="<%= user.getEmail() %>" name="email"/>
                <button type="submit" class="btn btn-warning">Update</button>
              </form>
            </td>
            <td>
              <form action="deleteEmp" method="post">
                <input type="hidden" value="<%= user.getId() %>" name="id"/>
                <button type="submit" class="btn btn-danger">Delete</button>
              </form>
            </td>
          </tr>
          <%
            }
          %>
        </tbody>
      </table>
    </div>
  </body>
</html>
 