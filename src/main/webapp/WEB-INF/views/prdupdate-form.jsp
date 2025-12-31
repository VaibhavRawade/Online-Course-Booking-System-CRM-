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
                       
                                  <h3> Update Course Details </h3>
                              	  <br/>
		         				  <form:form action="updateProductForm" method="post" modelAttribute="model-register">
										<div class="mb-3">
											<label class="form-label">Course Name</label>
											<form:input path="coursename" cssClass="form-control" value="${model_prd.getCoursename()}" />
											<form:errors path="coursename" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Course Syllabus</label>
											<form:textarea path="syllabus" cssClass="form-control" value="${model_prd.getSyllabus()}" />
											<form:errors path="syllabus" cssClass="error_message_design" />
										</div>
										<div class="mb-3">
											<label class="form-label">Course Original Price</label>
											<form:input path="originalprice" cssClass="form-control" value="${model_prd.getOriginalprice()}" />
											<form:errors path="originalprice"  cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Course Discounted Price</label>
											<form:input path="discountedprice" cssClass="form-control" value="${model_prd.getDiscountedprice()}"/>
											<form:errors path="discountedprice" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Course Validity</label>
											<form:input path="coursevaliditiy" cssClass="form-control" value="${model_prd.getCoursevaliditiy()}"/>
											<form:errors path="coursevaliditiy" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Trainer name</label>
											<form:input path="trainersname" cssClass="form-control" value="${model_prd.getTrainersname()}" />
											<form:errors path="trainersname" cssClass="error_message_design"/>
										</div>
										<div class="mb-3">
											<label class="form-label">Trainer Details</label>
											<form:textarea path="trainersdetails" cssClass="form-control" value="${model_prd.getTrainersdetails()}"/>
											<form:errors path="trainersdetails" cssClass="error_message_design"/>
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