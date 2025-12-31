<%--  <%@ page language="java" import="in.sp.main.entity.Product" import="java.util.*" contentType="text/html;charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@  taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
 
<!DOCTYPE html>
<html>
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
			<jsp:include page="customer-header.jsp"/>
			
			<% 
		 	String str=(String)request.getAttribute("error");
			int value1=0;
		 	if(str!=null)
		 	{
		 		%>
		 		<br>

					<div class="EmpAddHeader">
				       <div class="alert alert-info container" role="alert">
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
			
			<br/>
            <div class="container-fluid ">
                <div class="container">
                    <div class="row">
                        <div class="col-4"> </div>
                        <div class="col-4 d-flex justify-content-center">
                            <div class="login_div_design bg-light form13">
                       
                                  <h3>Customer Enquiry Form</h3>
                              	  <br/>
		         				  <form:form action="registerCustomer" method="post" modelAttribute="model-attribute">
										<div class="mb-3">
											<label class="form-label">Enter Full Name</label>
											<form:input path="name" cssClass="form-control" />
											<form:errors path="name" cssClass="error_message_design"/>
										</div>
										
										<div class="mb-3">
											<label class="form-label">Enter Phone</label>
											<form:input path="phone" cssClass="form-control" />
											<form:errors path="phone" cssClass="error_message_design" />
										</div>
										
										<div class="mb-3">
											<label class="form-label">Enter Course</label>
												<form:select path="intrestedcourse" cssClass="form-select">
													<form:option value="">Selected Course</form:option>
													<form:options items="${courses_list}"/>
												</form:select>
										</div>
										
										<div class="mb-3">
											<label class="form-label">Enquiry Date</label>
											<form:input type="date" path="enquirydate" cssClass="form-control" />
											<form:errors path="enquirydate" cssClass="error_message_design"/>
							     		</div>
							     		
										<div class="mb-3">
											<label class="form-label">Enquiry Type</label>
											<form:select path="enquirytype" cssClass="form-select">
												<form:option value="">Select Enquiry Type</form:option>
												<form:option value="Call">Call</form:option>
												<form:option value="Mail">Mail</form:option>
												<form:option value="Website">Website</form:option>
												<form:option value="Social Networking">Social Networking</form:option>
											</form:select>													
										</div>
										
										<div class="mb-3">
											<label class="form-label">Status</label>
											<form:select path="status" cssClass="form-select">
												<form:option value="">Select Status</form:option>
												<form:option value="1">Interested</form:option>
												<form:option value="0">Not - Interested</form:option>
												<form:option value="8">Purchased</form:option>
											</form:select>
									       <form:errors path="status" cssClass="error_message_design" />
								        </div>
								        
										<div class="mb-3">
											<label class="form-label">Discussion</label>
											<form:textarea path="discussion" cssClass="form-control" />
											<form:errors path="discussion" cssClass="error_message_design"/>
										</div>
										
										<div class="mb-3">
											<label class="form-label">Call To</label>
											<form:select path="callto" cssClass="form-select">
												<form:option value="">Call To</form:option>
												<form:option value="Customer to Company">Customer to Company</form:option>
												<form:option value="Company to Customer">Company to Customer</form:option>
												<form:errors path="discussion" cssClass="error_message_design"/>
											</form:select>
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


 --%>
 
 
 
 
 <%@ page language="java" import="in.sp.main.entity.Product" import="java.util.*" contentType="text/html;charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Enroll Now</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<jsp:include page="customer-header.jsp"/>

	<% 
	String str = (String) request.getAttribute("error");
	if (str != null) {
	%>
	<br>
	<div class="EmpAddHeader">
	    <div class="alert alert-info container" role="alert">
	        <div class="row">
	            <div class="col-4"></div>
	            <div class="col-6">${error}</div>
	            <div class="col-2"></div>
	        </div>
	    </div>
	</div>
	<% } %>

	<br/>
    <div class="container-fluid">
        <div class="container">
            <div class="row">
                <div class="col-4"> </div>
                <div class="col-4 d-flex justify-content-center">
                    <div class="login_div_design bg-light form13">
                       <h3 style="text-align: center; font-size: 24px; padding: 12px; background-color: #28a745; color: white; border-radius: 8px; margin: 10px 0;">
  Enroll Now
</h3>

                        <br/>
                        <%-- <form:form action="registerCustomer" method="post" modelAttribute="model-attribute">
						    <div class="mb-3">
						        <label class="form-label">Enter Full Name</label>
						        <form:input path="name" cssClass="form-control" />
						        <form:errors path="name" cssClass="error_message_design"/>
						    </div>
						
						    <div class="mb-3">
						        <label class="form-label">Enter Phone</label>
						        <form:input path="phone" cssClass="form-control" />
						        <form:errors path="phone" cssClass="error_message_design" />
						    </div>
						
						    <div class="mb-3">
						        <label class="form-label">Enter Course</label>
						        <form:select path="intrestedcourse" cssClass="form-select" id="courseSelect">
						            <form:option value="">Selected Course</form:option>
						            <form:options items="${courses_list}"/>
						        </form:select>
						    </div>
						
						    <!-- Price Display Section -->
						    <div class="mb-3" id="priceBox" style="display: none;">
						        <label class="form-label">Course Price</label>
						        <input type="text" id="coursePrice" class="form-control" readonly />
						    </div>
						
						    <div class="mb-3">
						        <label class="form-label">Enquiry Date</label>
						        <form:input type="date" path="enquirydate" cssClass="form-control" />
						        <form:errors path="enquirydate" cssClass="error_message_design"/>
						    </div>
						
						    <div class="mb-3">
						        <label class="form-label">Enquiry Type</label>
						        <form:select path="enquirytype" cssClass="form-select">
						            <form:option value="">Select Enquiry Type</form:option>
						            <form:option value="Call">Call</form:option>
						            <form:option value="Mail">Mail</form:option>
						            <form:option value="Website">Website</form:option>
						            <form:option value="Social Networking">Social Networking</form:option>
						        </form:select>
						    </div>
						
						    <div class="mb-3">
						        <label class="form-label">Status</label>
						        <form:select path="status" cssClass="form-select">
						            <form:option value="">Select Status</form:option>
						            <form:option value="1">Interested</form:option>
						            <form:option value="0">Not - Interested</form:option>
						            <form:option value="8">Purchased</form:option>
						        </form:select>
						        <form:errors path="status" cssClass="error_message_design" />
						    </div>
						
						    <input type="submit" value="Register" class="btn btn-primary" />
						</form:form>
                         --%>
   <form:form action="registerCustomer" method="post" modelAttribute="model-attribute" style="max-width: 800px; margin: auto; padding: 20px; border: 1px solid #ddd; border-radius: 8px; background-color: #f7f7f7;">
    <!-- Full Name -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Enter Full Name</label>
        <form:input path="name" cssClass="form-control" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;"/>
    </div>
    <form:errors path="name" cssClass="error_message_design" style="color: red; font-size: 14px; margin-bottom: 10px;"/>

    <!-- Phone -->
   <%--  <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Enter Phone</label>
        <form:input path="phone" cssClass="form-control" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;"/>
    </div>
    <form:errors path="phone" cssClass="error_message_design" style="color: red; font-size: 14px; margin-bottom: 10px;"/> --%>

    <!-- Course -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Select Course</label>
        <form:select path="intrestedcourse" cssClass="form-select" id="courseSelect" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
            <form:option value="">Select Course</form:option>
            <form:options items="${courses_list}"/>
        </form:select>
    </div>

    <!-- Price Display Section -->
    <div class="mb-3" id="priceBox" style="display: none;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333;">Course Price</label>
        <input type="text" id="coursePrice" class="form-control" readonly style="padding: 10px; border-radius: 5px; border: 1px solid #ccc;"/>
    </div>

    <!-- Enquiry Date -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Enquiry Date</label>
        <form:input type="date" path="enquirydate" cssClass="form-control" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;"/>
    </div>
    <form:errors path="enquirydate" cssClass="error_message_design" style="color: red; font-size: 14px; margin-bottom: 10px;"/>

    <!-- Enquiry Type -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Enquiry Type</label>
        <form:select path="enquirytype" cssClass="form-select" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
            <form:option value="">Select Enquiry Type</form:option>
            <form:option value="Call">Call</form:option>
            <form:option value="Mail">Mail</form:option>
            <form:option value="Website">Website</form:option>
            <form:option value="Social Networking">Social Networking</form:option>
        </form:select>
    </div>

    <!-- Status -->
    <div style="display: flex; justify-content: space-between; margin-bottom: 15px;">
        <label class="form-label" style="font-size: 16px; font-weight: bold; color: #333; flex: 1;">Status</label>
        <form:select path="status" cssClass="form-select" style="flex: 2; padding: 10px; border-radius: 5px; border: 1px solid #ccc;">
            <form:option value="">Select Status</form:option>
            <form:option value="1">Interested</form:option>
<%--             <form:option value="0">Not - Interested</form:option>
 --%>            <form:option value="8">Purchased</form:option>
        </form:select>
    </div>
    <form:errors path="status" cssClass="error_message_design" style="color: red; font-size: 14px; margin-bottom: 10px;"/>

    <!-- Submit Button -->
    <input type="submit" value="Register" class="btn btn-primary" style="background-color: #007bff; color: white; padding: 12px 24px; border: none; border-radius: 5px; font-size: 16px; width: 100%; cursor: pointer; margin-top: 20px;"/>
</form:form>
   
                    </div>
                </div>
                <div class="col-4"> </div>
            </div>
        </div>
    </div>
<script>
    $(document).ready(function () {
        $('#courseSelect').change(function () {
            var selectedCourse = $(this).val();  // Get selected course name

            if (selectedCourse !== "") {
                $.ajax({
                    url: '/getCoursePrice',
                    type: 'GET',
                    data: { courseName: selectedCourse },  // Send the course name
                    dataType: 'json', // Expect JSON formatted response
                    success: function (data) {
                        console.log(data);  // Log the response to check if the price is received
                        $('#coursePrice').val(data.price);  // Set the course price in the text box
                        $('#priceBox').show();  // Reveal the price box if hidden
                    },
                    error: function () {
                        $('#coursePrice').val('');
                        $('#priceBox').hide();
                    }
                });
            } else {
                $('#priceBox').hide();
            }
        });
    });
</script>

</body>
</html>
 