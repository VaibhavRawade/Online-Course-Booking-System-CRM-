<%-- <%@ page language="java" import="java.util.*" import="in.sp.main.entity.Product" contentType="text/html; charset=ISO-8859-1"
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
		        <center><h2>Products's List</h2></center>   
		        <br/>    
		        <table class="table table-light table-bordered table-striped">
			          	      <tr>
						          <th>Course Name</th>
						          <th>Course Syllabus</th>  
						          <th>Course Price</th>
						          <th>Trainer Name</th>
						          <th>Full Details</th>
						          <th>Update</th>
						          <th>Delete</th>
						       </tr>  
					      <%
							ArrayList<Product> products= (ArrayList<Product>) request.getAttribute("prdlist");
							for (Product product:products) 
							{
						       %>
						       <tr>
								    <td><%= product.getCoursename()%></td>
								    <td><%= product.getSyllabus()%></td>
								    <td>
								    	<del style="color:red"><%= product.getOriginalprice()%></del>
								    	<b><%= product.getDiscountedprice()%></b>
								    </td>
								     <td><%=product.getTrainersname()%></td>
								   	 <td style="text-align: center;">
										  <form action="prdDetails" method="post">
										    <input type="hidden" value="<%=product.getId()%>" name="id"/>
										    <input type="submit" value="DETAILS" class="button_y"/>
										  </form>
							        </td> 
							          	<td style="text-align: center;">
	                						 <form action="updatePrd" method="post">
										       <input type="hidden" value="<%=product.getId()%>" name="id"/>
										       <input type="submit" value="UPDATE" class="button_u"/>
										     </form>    						
	                    		    </td>
							        <td style="text-align: center;">
										  <form action="deletePrd" method="post">
										    <input type="hidden" value="<%=product.getId()%>" name="id"/>
										    <input type="submit" value="DELETE" class="button_d"/>
										  </form>
							        </td> 
							  <%
							}
						  %>
				 </table>
			</div>
			
   </body>
 </html> --%>
 
 
 <%@ page language="java" import="java.util.*" import="in.sp.main.entity.Product" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Management</title>
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
      .button_u, .button_d, .button_y {
        width: 100px;
        margin: 5px;
      }
    </style>
  </head>
  <body>
    <!-- Include Header -->
    <jsp:include page="admin-header.jsp"/>

    <!-- Error Alert -->
    <%
      String errorMessage = (String) request.getAttribute("error");
      if (errorMessage != null) {
    %>
    
    <div class="EmpAddHeader">
      <div class="alert alert-danger container" role="alert" style="margin-top: 100px">
        <div class="row">
          <div class="col-12 text-center">${error}</div>
        </div>
      </div>
    </div>
    <%
      }
    %>

    <!-- Product List Section -->
    <div class="container mt-5">
      <div class="header text-center" style="background-color: white;">
        <br>
        <br>
        <h2 style="color: black;">Courses List</h2>
      </div>
      <br/>  
      <table class="table table-striped table-bordered">
        <thead>
          <tr style="background-color: black">
            <th>Course Name</th>
            <th>Course Syllabus</th>
            <th>Course Price</th>
            <th>Trainer Name</th>
            <th>Full Details</th>
            <th>Update</th>
            <th>Delete</th>
          </tr>
        </thead>
        <tbody>
          <%
            ArrayList<Product> products = (ArrayList<Product>) request.getAttribute("prdlist");
            for (Product product : products) {
          %>
          <tr>
            <td><%= product.getCoursename() %></td>
            <td><%= product.getSyllabus() %></td>
            <td>
              <del style="color:red"><%= product.getOriginalprice() %></del>
              <b><%= product.getDiscountedprice() %></b>
            </td>
            <td><%= product.getTrainersname() %></td>
            <td style="text-align: center;">
              <form action="prdDetails" method="post">
                <input type="hidden" value="<%= product.getId() %>" name="id"/>
                <input type="submit" value="DETAILS" class="btn btn-info"/>
              </form>
            </td>
            <td style="text-align: center;">
              <form action="updatePrd" method="post">
                <input type="hidden" value="<%= product.getId() %>" name="id"/>
                <input type="submit" value="UPDATE" class="btn btn-warning"/>
              </form>
            </td>
            <td style="text-align: center;">
              <form action="deletePrd" method="post">
                <input type="hidden" value="<%= product.getId() %>" name="id"/>
                <input type="submit" value="DELETE" class="btn btn-danger"/>
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
 