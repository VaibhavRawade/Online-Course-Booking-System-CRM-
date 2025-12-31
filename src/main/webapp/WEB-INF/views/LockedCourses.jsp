 
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
    .course-list {
      display: flex;
      flex-wrap: wrap;
      gap: 15px;
      justify-content: center;
      padding: 20px;
    }

    .course-card {
      background: linear-gradient(135deg, #fdfcfb 0%, #e2d1c3 100%);
      border: 2px solid #ffb300;
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
      padding-bottom: 56.25%;
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

    .no-courses-message {
      font-size: 1.5em;
      text-align: center;
      margin-top: 50px;
      color: #dc3545;
    }
    
    
    
           /* Custom header styles */
        .header-bg {
            background: linear-gradient(to right, #2a3d68, #1e2d48);
            color: white;
        }

        .logo {
    font-size: 1.8em;
    font-weight: bold;
    color: #ffcd39;
    text-decoration: none;
    white-space: nowrap; /* Prevents the text from breaking */
    overflow: hidden;    /* Ensure overflow text is hidden if it's too long */
    text-overflow: ellipsis; /* Optional: Adds ellipsis if the text overflows */
}
        .navbar {
            background-color: transparent;
        }

        .btn-group .btn {
            background-color: #ffcd39;
            color: white;
            font-weight: bold;
            border-radius: 25px;
            padding: 10px 20px;
        }

        .btn-group .dropdown-menu {
            border-radius: 8px;
            box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.15);
        }

        .dropdown-item {
            font-weight: 500;
        }

        .dropdown-item:hover {
            background-color: #333;
            color: #ffcd39;
        }
  </style>
</head>
<body>

    <!-- Header section -->
    <div class="container-fluid header-bg py-3">
        <div class="container">
            <div class="row align-items-center">

                <!-- Logo and title section -->
                <div class="col-3" margin>
                    <a href="homepage" class="logo" style="float:left;    margin-left: -145px;">ONLINE COURSE BOOKING SYSTEM</a>
                </div>

                <!-- Empty space for alignment -->
                <div class="col-6"></div>

                <!-- Menu section -->
                  
                <div class="col-3">
                    <div class="btn-group navbar">
                        <button type="button" class="btn btn-danger dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" style="margin-right: -100px;">
                            Menu
                        </button>
                        <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="homepage">HOME</a></li>
                        <li><a class="dropdown-item" href="loginpage">ADMIN-LOGIN</a></li>
                         <li><a class="dropdown-item" href="loginpageuser">STUDENT-LOGIN</a></li>
                        <li><a class="dropdown-item" href="aboutUs">ABOUT-US</a></li>
                        <li><a class="dropdown-item" href="contactUs">CONTACT-US</a></li>
                        </ul>
                        

                    </div>
                </div>
            </div>
            </div>
        </div>
 
  <h2 class="text-center mt-4">Watch Course Tutorials</h2>

  <!-- Video Section -->
  <div class="mt-4" id="videoCardContainer">
    <div class="card border-0 shadow-sm mx-auto">
      <div class="card-header">
        <h5 id="videoTitle">Select a Course</h5>
      </div>

<div class="card-body p-2" style="display: flex; justify-content: center; align-items: center; flex-direction: column;">
  <div id="videoContainer" 
       style="position: relative; width: 75%; height: 300px; display: inline-block; margin: auto;">
    
    <iframe id="videoIframe" 
            src="" 
            style="width: 100%; height: 100%;" 
            allowfullscreen>
    </iframe>
    
    <div id="videoOverlay"
         style="position: absolute; top: 0; left: 0; width: 100%; height: 100%; cursor: pointer; background: rgba(0,0,0,0); z-index: 10;">
    </div>
    
  </div>
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
      
     <%--  <div class="course-card" onclick="setVideo('${courseLower}')">
        <h5>${course.coursename}</h5>
      </div>
       --%>
       
      <div class="course-card" onclick="setVideo('${courseLower}')">
		  <h5>${course.coursename}</h5>
		  <p><strong>Price:</strong> ₹${course.originalprice}</p>
		  <p><strong>Trainer:</strong> ${course.trainersname}</p>
		  <p><strong>Course Validity:</strong> ${course.coursevaliditiy}</p>
	</div>
      
    </c:forEach>

    <c:if test="${empty prdlist}">
      <p class="no-courses-message">No courses available at the moment. Please check back later.</p>
    </c:if>
  </div>

  <script>
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

    function normalizeCourse(name) {
      const key = name.toLowerCase().trim();
      if ([".net", "dot net", "dotnet"].includes(key)) return ".net";
      if (["c or c++", "c", "c++"].includes(key)) return "c or c++";
      if (["javascript", "java script"].includes(key)) return "javascript";
      if (["ajax", "a j a x"].includes(key)) return "ajax";
      if (["ms excel", "excel", "microsoft excel"].includes(key)) return "excel"; 
      return key;
    }

    function setVideo(courseName) {
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

    // Trigger on video click
    document.addEventListener("DOMContentLoaded", function () {
      const videoContainer = document.getElementById("videoContainer");

      videoContainer.addEventListener("click", function (e) {
        e.preventDefault();
        const confirmed = confirm("Please subscribe to watch the video. Click OK to login and continue.");
        if (confirmed) {
          window.location.href = "/loginpageuser";
        }
      });

      // Load default video
      setVideo("java");
    });
  </script>

<script>
  document.addEventListener("DOMContentLoaded", function () {
    const videoOverlay = document.getElementById("videoOverlay");

    videoOverlay.addEventListener("click", function () {
      const confirmed = confirm("Please subscribe to watch the video. Click OK to login and continue.");
      if (confirmed) {
        window.location.href = "/loginpageuser";
      }
    });

    setVideo("java"); // Load default video
  });
</script>

    <!-- Bootstrap JS and Popper.js for dropdown functionality -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.min.js"></script>

</body>
</html>
    
    
    
    
    
    
    