<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@  taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous"></script>
</head>
<body>
		
			<jsp:include page="admin-header.jsp"/>
		
			
			<br/>
            <div class="container-fluid ">
                <div class="container">
                    <div class="row">
                        <div class="col-4"> </div>
                        <div class="col-4 d-flex justify-content-center">
                            <div class="login_div_design bg-light form13">
                       
                                  <h3> Update Employee </h3>
                              	  <br/>
		         				  <form:form action="updateEmployeeForm" method="post" modelAttribute="model-register">
										<div class="mb-3">
											<label class="form-label">Enter Full Name</label>
											<form:input path="name" cssClass="form-control" value="${model_emp.getName()}"/>
											<form:errors path="name" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Email</label>
											<form:input path="email" cssClass="form-control" value="${model_emp.getEmail()}"/>
											<form:errors path="email" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Password</label>
											<form:password path="password" cssClass="form-control" value="${model_emp.getPassword()}"/>
											<form:errors path="password" cssClass="error_message_design" />
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Phone No.</label>
											<form:input path="phone" cssClass="form-control" value="${model_emp.getPhone()}"/>
											<form:errors path="phone" cssClass="error_message_design"/>
										</div>
										<input type="submit" value="Register" class="btn btn-primary" />
									</form:form>
                            </div>
                        </div>
                        <div class="col-4"> </div>
                    </div>
                </div>
            </div>
            
        </body>
</html>