<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 커뮤니티</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon_covid.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    
</head>
<body id="page-top">

	<!-- Navigation-->
   <!-- Navigation-->
   <nav
      class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
      id="mainNav">
      <div class="container">
         <a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;"
            href="home">Corona Inside</a>
         <button
            class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-violet text-white rounded"
            type="button" data-toggle="collapse" data-target="#navbarResponsive"
            aria-controls="navbarResponsive" aria-expanded="false"
            aria-label="Toggle navigation">
            Menu <i class="fas fa-bars"></i>
         </button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto">
               <sec:authorize access="isAnonymous()">
                  <li class="nav-item mx-0 mx-lg-1 login-item"><a
                     class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                     href="login">로그인</a></li>
               </sec:authorize>
               <sec:authorize access="isAuthenticated()">
                  <li class="login-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger login-displayusername-mobile">
                  <sec:authentication property="principal.nickname" /> 님 환영합니다.</a></li> 
                  <li class="nav-item login-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="logout">로그아웃</a></li>
               </sec:authorize>
               <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="corona">코로나 현황</a></li>
               <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="vaccine">백신현황</a></li>
               <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="community">커뮤니티</a></li>

            </ul>

         </div>
         <sec:authorize access="isAuthenticated()">
            <p class="login-displayusername">
               <sec:authentication property="principal.nickname" />
               님 <br>환영합니다.
            </p>
         </sec:authorize>
         
         <sec:authorize access="isAnonymous()">
            <button class="bg-primary rounded text-white login-btn"
               id="login-btn" onClick="location.href='login'">로그인</button>
         </sec:authorize>
         <sec:authorize access="isAuthenticated()">
            <button class="bg-primary rounded text-white login-btn"
               id="login-btn" onClick="location.href='logout'">로그아웃</button>
         </sec:authorize>
      </div>
   </nav>
	<!-- Masthead-->
    <header class="masthead bg-violet text-white text-center">
        <div class="container d-flex align-items-center flex-column">
            <!-- Masthead Heading-->
            <h1 class="masthead-heading text-uppercase mb-0">Corona Inside</h1>
            <!-- Icon Divider-->
            <div class="divider-custom divider-light">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
        </div>
    </header>
    
    <section class="page-section" id="post">
    	<h2 class="masthead-heading text-secondary text-uppercase mb-4-5"><a class="a-violet" href="${pageContext.request.contextPath}/community">커뮤니티</a></h2>
    	<div class="container">
    		<form method="post" action="${pageContext.request.contextPath}/do-editpost/${post.postNo}">
    		<table class="styled-table">
    			<tbody>
    				<tr>
				    	<td><br><h6>글 제목: &nbsp;${post.title}</h6> 
				    </tr>
				    <tr>
					    <td><br><textarea rows="20" style="width:100%;" name="content">${post.content}</textarea><br><br>
					    <p align="center"> <button type="submit" class="btn btn-default bg-violet text-white">완료</button> </p></td>
				    </tr>
				</tbody>
		    </table>
		    </form>
		</div>
	</section>
	<!-- Copyright Section-->
   	<div class="copyright py-4 text-center text-white">
       	<div class="container"><small>Copyright © Corona-Inside 2021</small></div>
   	</div>
   	
   	<!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Core theme JS-->
    <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>