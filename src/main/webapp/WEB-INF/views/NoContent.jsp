<%--  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="customer-header.jsp"/>

	<br>
	<br>
	<br>
	<H1 style="text-align: center">Sorry You Did not Purchase Any Course </H1>
</body>
</html> 
 --%>
 
 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>No Course Purchased</title>
<style>
   
    .message-box {
        background-color: white;
        padding: 40px;
        border-radius: 15px;
        box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        text-align: center;
        max-width: 600px;
        width: 90%;
    }

    .message-box h1 {
        color: #444;
        margin-bottom: 20px;
    }

    .message-box p {
        color: #666;
        font-size: 18px;
    }

    .btn {
        display: inline-block;
        margin-top: 25px;
        padding: 10px 25px;
        background-color: #66a6ff;
        color: white;
        text-decoration: none;
        border-radius: 25px;
        transition: background 0.3s ease;
    }

    .btn:hover {
        background-color: #558de8;
    }
</style>
</head>
<body>
    <jsp:include page="customer-header.jsp"/>

   <div class="message-box" style="background-color: white; padding: 40px; border-radius: 15px; box-shadow: 0 8px 16px rgba(0,0,0,0.2); text-align: center; max-width: 600px; width: 90%; position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;">
    <h1 style="color: #444; margin-bottom: 20px;">Oops! No Courses Purchased</h1>
    <p style="color: #666; font-size: 18px;">It looks like you haven't enrolled in any course yet. Explore our offerings and start learning today!</p>
<!--     <a href="courses.jsp" style="display: inline-block; margin-top: 25px; padding: 10px 25px; background-color: #66a6ff; color: white; text-decoration: none; border-radius: 25px; transition: background 0.3s ease;">Browse Courses</a>
 --></div>

</body>
</html>
 
