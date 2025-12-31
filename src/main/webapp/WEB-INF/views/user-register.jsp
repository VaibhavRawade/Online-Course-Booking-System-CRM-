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
</head>
<body>
			<jsp:include page="header.jsp"/>
		
            <div class="container-fluid ">
                <div class="container">
                    <div class="row">
                        <div class="col-4"> </div>
                        <div class="col-4 d-flex justify-content-center">
                            <div class="login_div_design bg-light form13">
                       
                                  <h3> Register User </h3>
                              	  <br/>
		         				  <form:form action="registerUser" method="post" modelAttribute="model-register">
										<div class="mb-3">
											<label class="form-label">Enter Full Name</label>
											<form:input path="name" cssClass="form-control" />
											<form:errors path="name" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Email</label>
											<form:input path="email" cssClass="form-control" />
											<form:errors path="email" cssClass="error_message_design" />
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Password</label>
											<form:password path="password" cssClass="form-control" />
											<form:errors path="password"  cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Enter Phone No.</label>
											<form:input path="phone" cssClass="form-control" />
											<form:errors path="phone" cssClass="error_message_design"/>
										</div>
										
										<input type="submit" value="Register" class="btn btn-primary" />
										<a href="/loginpageuser" class="btn btn-primary">Back</a>
										
									</form:form>
                            </div>
                        </div>
                        <div class="col-4"> </div>
                    </div>
                </div>
            </div>
            <br>
             <jsp:include page="footer.jsp"/>
        </body>
</html>