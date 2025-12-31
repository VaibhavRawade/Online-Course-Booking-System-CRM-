<%@page import="in.sp.main.entity.CustomerEnq" %>
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
	
	<jsp:include page="employee-header.jsp"/>
	
	   <br/><br/> 	
		     <div class="container mt-3">
		     <br>
		      <br>
		       <br>
		    		  <center><h3>My Intrested Course</h3></center> 
				<!-- <p> Below are the details of customer's to be called </p>   -->
		       <br/>     
		        <table class="table table-light table-bordered table-striped" border="2" bordercolor:"blue">
			          	      <tr>
				                   <th>Name</th>
				                   <th>Phone No.</th>
				                   <th>IntrestedCourse</th>
				                   <th>Enquiry Date</th>
				              </tr>
					      <%	
							ArrayList<CustomerEnq> custenq = (ArrayList<CustomerEnq>) request.getAttribute("listCustomer");
					      	for(CustomerEnq customer:custenq)
					      	{
					      		String a=customer.getStatus();
					      	    if(a.equals("1"))
					      		{
							       %>
							       <tr>
									    <td><%=customer.getName() %></td>
									    <td><%=customer.getPhone() %></td>			
									    <td><%=customer.getIntrestedcourse() %></td>
									    <td><%=customer.getEnquirydate()%></td>						   
								   </tr>
								   <% 
								 }
							}
						  %>
				 </table>
			</div>
			
			
</body>
</html>