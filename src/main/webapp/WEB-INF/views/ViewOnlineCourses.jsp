
  
  
  <%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Online Courses</title>
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    /* Styling for course list and cards */
    .course-list {
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
      justify-content: center;
      padding: 20px;
    }
    /* .course-card {
    	color:red;
      background-color: #f8f9fa;
      border: 1px solid #ccc;
      border-radius: 10px;
      padding: 20px;
      text-align: center;
      width: 220px;
      box-shadow: 0 4px 8px rgba(0,0,0,0.1);
      transition: transform 0.3s ease, box-shadow 0.3s ease;
      cursor: pointer;
    } */
   .course-card {
  background: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
  border: 2px solid #ffb300; /* Elegant golden border */
  border-radius: 15px;
  padding: 20px;
  text-align: center;
  width: 240px;
  margin: 10px;
  box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
  transition: transform 0.3s ease, box-shadow 0.3s ease, background 0.3s ease;
  cursor: pointer;
  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  color: #333;
}

.course-card h5 {
  font-size: 1.2rem;
  font-weight: 600;
  margin: 0;
  color: #4e342e;
}

.course-card:hover {
  transform: scale(1.05);
  box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
  background: linear-gradient(135deg, #ffe082 0%, #ffca28 100%);
  border-color: #ffa000;
  color: #000;
}

.course-card:hover h5 {
  color: #bf360c;
}
   

.course-card:hover h5 {
  color: #000;
}
    /* Video section styling */
    #videoCardContainer {
      max-width: 800px;
      margin: 20px auto;
    }
    .card-header {
      background-color: #343a40;
      color: white;
      text-align: center;
      padding: 12px;
    }
    .card-body {
      padding: 20px;
    }
    .ratio {
      position: relative;
      padding-bottom: 56.25%; /* 16:9 aspect ratio */
      height: 0;
      overflow: hidden;
      max-width: 100%;
      background: #000;
    }
    .ratio iframe {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
    }

    /* Fallback for no courses */
    .no-courses-message {
      font-size: 1.5em;
      text-align: center;
      margin-top: 50px;
      color: #dc3545;
    }
  </style>
</head>
<body>

<jsp:include page="admin-header.jsp"/>

<h2 class="text-center mt-4">Watch Course Tutorials</h2>

<!-- Video Section -->
<div class="mt-4" id="videoCardContainer">
  <div class="card border-0 shadow-sm mx-auto">
    <div class="card-header">
      <h5 id="videoTitle">Select a Course</h5>
    </div>
    <div class="card-body p-2">
      <div class="text-center">
        <iframe id="videoIframe" src="" style="width: 75%; height: 300px;" allowfullscreen></iframe>
      </div>
      <div class="text-center mt-2">
        <a href="#" target="_blank" class="btn btn-sm btn-danger" id="channelLink" style="display:none;">
          Visit Our YouTube Channel
        </a>
      </div>
    </div>
  </div>
</div>

<!-- Course List Section -->
<div class="course-list mt-4">
  
  <c:forEach var="course" items="${prdlist}">
    <c:set var="courseLower" value="${fn:toLowerCase(course.coursename)}" />
    <div class="course-card" onclick="loadVideo('${courseLower}')">
      <h5>${course.coursename}</h5>
    </div>
    
    
  </c:forEach>

  <!-- No courses available -->
  <c:if test="${empty prdlist}">
    <p class="no-courses-message">No courses available at the moment. Please check back later.</p>
  </c:if>
</div>

<script>
// Video data based on course names
const videoData = {
  java: {
    title: "Watch Java Course Introduction",
    videoUrl: "https://www.youtube.com/embed/grEKMHGYyns",
    channelUrl: "https://www.youtube.com/c/HarryJava"
  },
  python: {
    title: "Watch Python Course Introduction",
    videoUrl: "https://www.youtube.com/embed/_uQrJ0TkZlc",
    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
  },
  php: {
    title: "Watch PHP Course Introduction",
    videoUrl: "https://www.youtube.com/embed/OK_JCtrrv-c",
    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
  },
  ".net": {
	  title: "Watch .NET Course Introduction",
		  videoUrl: "https://www.youtube.com/embed/0yWAtQ6wYNM",
	    channelUrl: "https://www.youtube.com/c/IAmTimCorey"
	},
  devops: {
    title: "Watch DevOps Course Introduction",
    videoUrl: "https://www.youtube.com/embed/0yWAtQ6wYNM",
    channelUrl: "https://www.youtube.com/c/TechWorldwithNana"
  },
  excel: {
    title: "Watch Excel Course Introduction",
    videoUrl: "https://www.youtube.com/embed/UAX9YkYMTU8",
    channelUrl: "https://www.youtube.com/c/ExcelIsFun"
  },
  mysql: {
    title: "Watch MySQL Course Introduction",
    videoUrl: "https://www.youtube.com/embed/HXV3zeQKqGY",
    channelUrl: "https://www.youtube.com/c/Freecodecamp"
  },
  postgresql: {
    title: "Watch PostgreSQL Course Introduction",
    videoUrl: "https://www.youtube.com/embed/qw--VYLpxG4",
    channelUrl: "https://www.youtube.com/c/ProgrammingKnowledge"
  },
  "c or c++": {
    title: "Watch C/C++ Course Introduction",
    videoUrl: "https://www.youtube.com/embed/KJgsSFOSQv0",
    channelUrl: "https://www.youtube.com/c/ProgrammingKnowledge"
  },
  react: {
    title: "Watch React Course Introduction",
    videoUrl: "https://www.youtube.com/embed/bMknfKXIFA8",
    channelUrl: "https://www.youtube.com/c/Freecodecamp"
  },
  angular: {
    title: "Watch Angular Course Introduction",
    videoUrl: "https://www.youtube.com/embed/2OHbjep_WjQ",
    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
  },
  flutter: {
    title: "Watch Flutter Course Introduction",
    videoUrl: "https://www.youtube.com/embed/x0uinJvhNxI",
    channelUrl: "https://www.youtube.com/c/Freecodecamp"
  },
  html: {
	    title: "Watch HTML Course Introduction",
	    videoUrl: "https://www.youtube.com/embed/pQN-pnXPaVg",
	    channelUrl: "https://www.youtube.com/c/Freecodecamp"
	  },
	  css: {
	    title: "Watch CSS Course Introduction",
	    videoUrl: "https://www.youtube.com/embed/1PnVor36_40",
	    channelUrl: "https://www.youtube.com/c/Freecodecamp"
	  },
	  javascript: {
	    title: "Watch JavaScript Course Introduction",
	    videoUrl: "https://www.youtube.com/embed/PkZNo7MFNFg",
	    channelUrl: "https://www.youtube.com/c/Freecodecamp"
	  },
	  jquery: {
	    title: "Watch jQuery Course Introduction",
	    videoUrl: "https://www.youtube.com/embed/hMxGhHNOkCU",
	    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
	  },
	  ajax: {
	    title: "Watch AJAX Course Introduction",
	    videoUrl: "https://www.youtube.com/embed/82hnvUYY6QA",
	    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
	  }
};

// Normalize course names
function normalizeCourse(name) {
  const key = name.toLowerCase().trim();
  if ([".net", "dot net", "dotnet"].includes(key)) return ".net";
  if (["c or c++", "c", "c++"].includes(key)) return "c or c++";
  if (["javascript", "java script"].includes(key)) return "javascript";
  if (["ajax", "a j a x"].includes(key)) return "ajax";
  return key;
}

// Load video based on course name
function loadVideo(courseName) {
  const key = normalizeCourse(courseName);
  const videoInfo = videoData[key];

  const videoTitle = document.getElementById("videoTitle");
  const videoIframe = document.getElementById("videoIframe");
  const channelLink = document.getElementById("channelLink");

  if (videoInfo) {
    videoTitle.innerText = videoInfo.title;
    videoIframe.src = videoInfo.videoUrl;
    channelLink.href = videoInfo.channelUrl;
    channelLink.style.display = "inline-block";
  } else {
    videoTitle.innerText = "Video not available for this course.";
    videoIframe.src = "";
    channelLink.style.display = "none";
  }
}

// Set default video when page loads
window.onload = function() {
  loadVideo("java");  // You can set any default course here, like "java"
}
</script>

</body>
</html>
  