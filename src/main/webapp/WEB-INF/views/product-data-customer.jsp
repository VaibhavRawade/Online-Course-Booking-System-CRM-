<%-- 
 
 <%@ page language="java" import="java.util.*" import="in.sp.main.entity.Employee" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Course Details</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
      .course-card {
        border: 1px solid #ccc;
        border-radius: 10px;
      }

      .table th, .table td {
        padding: 0.5rem 1rem;
      }

      .card-header-custom {
        background: linear-gradient(135deg, #6a1b9a, #8e24aa);
        color: white;
        text-align: center;
        font-weight: 600;
        border-radius: 10px 10px 0 0;
      }

      .video-card {
        max-width: 600px;
        margin: auto;
      }
    </style>
  </head>
  <body class="bg-light">

    <jsp:include page="customer-header.jsp"/>
    
    <div class="container mt-4" >
      <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
          <div class="card shadow-sm course-card">
            <div class="card-header card-header-custom">
              <h4 class="mb-0">Course Details</h4>
            </div>
            <div class="card-body">
              <table class="table table-bordered table-striped">
                <tr>
                  <th>Course Name</th>
                  <td>${product.getCoursename()}</td>
                </tr>
                <tr>
                  <th>Course Price</th>
                  <td>
                    <del class="text-danger">${product.getOriginalprice()}</del>
                    <strong class="text-success">${product.getDiscountedprice()}</strong>
                  </td>
                </tr>
                <tr>
                  <th>Course Validity</th>
                  <td>${product.getCoursevaliditiy()}</td>
                </tr>
                <tr>
                  <th>Course Syllabus</th>
                  <td>${product.getSyllabus()}</td>
                </tr>
                <tr>
                  <th>Trainer Name</th>
                  <td>${product.getTrainersname()}</td>
                </tr>
                <tr>
                  <th>Trainer Details</th>
                  <td>${product.getTrainersdetails()}</td>
                </tr>
              </table>
              
              
          <div class="mt-4 video-card" id="videoCardContainer">
			  <div class="card border-0 shadow-sm">
			    <div class="card-header bg-dark text-white text-center">
			      <h5 class="mb-0" id="videoTitle">Watch Course Introduction</h5>
			    </div>
			    <div class="card-body p-2">
			      <div class="ratio ratio-16x9">
			        <iframe id="videoIframe" src="" title="Course Tutorial" allowfullscreen></iframe>
			      </div>
			      <div class="text-center mt-2">
			        <a href="#" target="_blank" class="btn btn-sm btn-danger" id="channelLink">
			          Visit Our YouTube Channel
			        </a>
			      </div>
			    </div>
			  </div>
		</div>





            </div>
          </div>
        </div>
      </div>
      <div class="alert alert-warning mt-4">
        <h5>Important Instructions</h5>
        <p class="text-danger"><b>Do not share your ID and password with anyone; otherwise, your account will get blocked.</b></p>
      </div>
    </div>

  </body>
  
 <script>
  // Injected from backend (Thymeleaf/JSP)
  const rawCourse = "${course}"; // e.g. java, python, dot net, .net

  // Normalize course input
  const normalizeCourse = (name) => {
    name = name.toLowerCase().trim();
    if ([".net", "dotnet", "dot net"].includes(name)) return ".net";
    if (["c", "c++", "c or c++"].includes(name)) return "c or c++";
    if (["react", "angular", "flutter"].includes(name)) return name;
    return name;
  };

  const model = normalizeCourse(rawCourse);

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
      videoUrl: "https://www.youtube.com/embed/SZwF6jZpTYU",
      channelUrl: "https://www.youtube.com/c/Freecodecamp"
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
        videoUrl: "https://www.youtube.com/embed/pQN-pnP7nC8",
        channelUrl: "https://www.youtube.com/c/TraversyMedia"
      },
      css: {
        title: "Watch CSS Course Introduction",
        videoUrl: "https://www.youtube.com/embed/yfoY53QXEnI",
        channelUrl: "https://www.youtube.com/c/TraversyMedia"
      },
      ajax: {
    	    title: "Watch AJAX Course Introduction",
    	    videoUrl: "https://www.youtube.com/embed/KzF2OGI0WSo",
    	    channelUrl: "https://www.youtube.com/c/Techsith"
    	  },
    	  javascript: {
    	    title: "Watch JavaScript Course Introduction",
    	    videoUrl: "https://www.youtube.com/embed/PkZNo7MFNFg",
    	    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
    	  },
  };

  const videoInfo = videoData[model];
  if (videoInfo) {
    document.getElementById("videoTitle").innerText = videoInfo.title;
    document.getElementById("videoIframe").src = videoInfo.videoUrl;
    document.getElementById("channelLink").href = videoInfo.channelUrl;
  } else {
    // Optional fallback
    document.getElementById("videoTitle").innerText = "Course not found.";
    document.getElementById("videoIframe").src = "";
    document.getElementById("channelLink").style.display = "none";
  }
</script>

</html>
  --%>
 
 
 
  
  
  <%@ page language="java" import="java.util.*" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Course Details</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />
  <style>
    .course-card { border: 1px solid #ccc; border-radius: 10px; }
    .table th, .table td { padding: 0.5rem 1rem; }
    .card-header-custom {
      background: linear-gradient(135deg, #6a1b9a, #8e24aa);
      color: white; text-align: center; font-weight: 600;
      border-radius: 10px 10px 0 0;
    }
    .video-card { max-width: 600px; margin: auto; }
  </style>
</head>
<body class="bg-light">

  <jsp:include page="customer-header.jsp"/>

  <div class="container mt-4">
    <c:forEach var="product" items="${products}">
      <div class="row justify-content-center mb-4">
        <div class="col-lg-8 col-md-10">
          <div class="card shadow-sm course-card" 
               data-course="${product.coursename}" 
               data-id="${product.id}">
            <div class="card-header card-header-custom">
              <h4 class="mb-0">${product.coursename}</h4>
            </div>
            <div class="card-body">
              <table class="table table-bordered table-striped">
                <tr><th>Course Name</th><td>${product.coursename}</td></tr>
                <tr>
                  <th>Course Price</th>
                  <td>
                    <del class="text-danger">${product.originalprice}</del>
                    <strong class="text-success">${product.discountedprice}</strong>
                  </td>
                </tr>
                <tr><th>Course Validity</th><td>${product.coursevaliditiy}</td></tr>
                <tr><th>Course Syllabus</th><td>${product.syllabus}</td></tr>
                <tr><th>Trainer Name</th><td>${product.trainersname}</td></tr>
                <tr><th>Trainer Details</th><td>${product.trainersdetails}</td></tr>
              </table>

              <div class="mt-4 video-card">
                <div class="card border-0 shadow-sm">
                  <div class="card-header bg-dark text-white text-center">
                    <h5 class="mb-0 video-title">Watch Course Introduction</h5>
                  </div>
                  <div class="card-body p-2">
                    <div class="ratio ratio-16x9">
                      <iframe class="video-iframe" src="" title="Course Tutorial" allowfullscreen></iframe>
                    </div>
                    <div class="text-center mt-2">
                      <a href="#" target="_blank" class="btn btn-sm btn-danger channel-link">
                        Visit Our YouTube Channel
                      </a>
                    </div>
                  </div>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>
    </c:forEach>

    <div class="alert alert-warning mt-4">
      <h5>Important Instructions</h5>
      <p class="text-danger"><b>Do not share your ID and password with anyone; otherwise, your account will get blocked.</b></p>
    </div>
  </div>

  <!-- Script outside the loop -->
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
    	        videoUrl: "https://www.youtube.com/embed/SZwF6jZpTYU",
    	        channelUrl: "https://www.youtube.com/c/Freecodecamp"
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
    	          videoUrl: "https://www.youtube.com/embed/pQN-pnP7nC8",
    	          channelUrl: "https://www.youtube.com/c/TraversyMedia"
    	        },
    	        css: {
    	          title: "Watch CSS Course Introduction",
    	          videoUrl: "https://www.youtube.com/embed/yfoY53QXEnI",
    	          channelUrl: "https://www.youtube.com/c/TraversyMedia"
    	        },
    	        ajax: {
    	      	    title: "Watch AJAX Course Introduction",
    	      	    videoUrl: "https://www.youtube.com/embed/KzF2OGI0WSo",
    	      	    channelUrl: "https://www.youtube.com/c/Techsith"
    	      	  },
    	      	  javascript: {
    	      	    title: "Watch JavaScript Course Introduction",
    	      	    videoUrl: "https://www.youtube.com/embed/PkZNo7MFNFg",
    	      	    channelUrl: "https://www.youtube.com/c/ProgrammingwithMosh"
    	      	  },
    };

    const normalizeCourse = (name) => {
      name = name.toLowerCase().trim();
      if ([".net", "dotnet", "dot net"].includes(name)) return ".net";
      if (["c", "c++", "c or c++"].includes(name)) return "c or c++";
      return name;
    };

    document.querySelectorAll(".course-card").forEach(card => {
      const rawCourse = card.dataset.course;
      const model = normalizeCourse(rawCourse);
      const videoInfo = videoData[model];

      const titleEl = card.querySelector(".video-title");
      const iframeEl = card.querySelector(".video-iframe");
      const channelLinkEl = card.querySelector(".channel-link");

      if (videoInfo) {
        titleEl.innerText = videoInfo.title;
        iframeEl.src = videoInfo.videoUrl;
        channelLinkEl.href = videoInfo.channelUrl;
      } else {
        titleEl.innerText = "Course not found.";
        iframeEl.src = "";
        channelLinkEl.style.display = "none";
      }
    });
  </script>

</body>
</html>
