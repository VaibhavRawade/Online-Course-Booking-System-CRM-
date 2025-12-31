<%@page import="in.sp.main.entity.CustomerEnq"%>
<%@ page language="java" import="java.util.*" import="in.sp.main.entity.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
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
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    
</head>
<body>
	
			<jsp:include page="admin-header.jsp"/>
	
			 
			<br></br>		
				<br></br>		
			 
			  <div class="container" style="padding: 20px; box-shadow: 0px 0px 0px 5px black;">
        		<h3> Number of courses sale</h3>
        		<canvas id="myChart" style="width:100%;max-width:600px"></canvas>
       		 </div>
			 
			 <script>
				const xValues = [
					<c:forEach items="${intrested_course}" var="row" varStatus="status">
						"${row[0]}"${not status.last ? ',' : ''}
					</c:forEach>
					];
				const yValues = [
					<c:forEach items="${intrested_course}" var="row" varStatus="status">
						${row[1]}${not status.last ? ',' : ''}
					</c:forEach>
				];
				
				new Chart("myChart", {
				  type: "line",
				  data: {
				    labels: xValues,
				    datasets: [{
				      fill: false,
				      lineTension: 0,
				      backgroundColor: "rgba(0,0,255,1.0)",
				      borderColor: "rgba(0,0,255,0.1)",
				      data: yValues
				    }]
				  },
				  options: {
				    legend: {display: false},
				    scales: {
				      yAxes: [{ticks: {min: 0, max:10}}],
				    }
				  }
				});
				
				
		</script>
</body>
</html>