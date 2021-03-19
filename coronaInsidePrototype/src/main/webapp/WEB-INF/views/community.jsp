<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 커뮤니티</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/assets/img/favicon.ico" />
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
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;" href="${pageContext.request.contextPath}/home">Corona Inside</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-violet text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item mx-0 mx-lg-1 login-item"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath}/login">로그인 하기</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath}/coronaCurrent">코로나 현황</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-selected" href="${pageContext.request.contextPath}/community">커뮤니티</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath}/selfcheck">셀프체크</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="${pageContext.request.contextPath}/faq">FAQ</a></li>
                </ul>
            </div>
            <button class="bg-primary rounded text-white login-btn" onClick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
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
    <section class="page-section" id="freeboard">
    	<div class="container">
    	<h1 class="masthead-heading text-center text-secondary text-uppercase mb-0"><a class="a-violet" href="${pageContext.request.contextPath}/community">게시판</a></h1>
    	<table class="styled-table table-hover">
    		<thead>
    			<tr>
    				<th >제목</th>
    				<th >작성자</th>
    				<th >추천</th>
    				<th >날짜</th>
    			</tr>
    		</thead>
    		
    		<tbody>
    			<c:set var="num" value="0"/>
   				<c:forEach var="post" items="${posts}">
   					<c:if test="${num < page*10 && num > page*10-11 }">
		    			<tr>
							<td><button onClick="location.href='${pageContext.request.contextPath}/post/${post.postNo}'">${post.title}</button></td>
		    				<td class="text-center">${post.author}</td>
		    				<td class="text-center">${post.like}</td>
		    				<td class="text-center">${post.date}</td>
		    			</tr>
	    			</c:if>
	    			<c:set var="num" value="${num+1}"/>
    			</c:forEach>
    			<c:set var="pages" value="${num/10}" />
    			<c:if test="${num%10 != 0}"> <c:set var="pages" value="${pages+1}"/> </c:if>
    		</tbody>
    	</table>
    	<p align="center">
    		<c:forEach var="i" begin="1" end="${pages}" step="1">
    			<c:choose>
    				<c:when test="${page == i}"> <a class="a-violet-bold" href="${pageContext.request.contextPath}/community/${i}">${i}</a>&nbsp;&nbsp;</c:when>
    				<c:otherwise> <a class="a-violet" href="${pageContext.request.contextPath}/community/${i}">${i}</a>&nbsp;&nbsp;</c:otherwise>
    			</c:choose>
    		</c:forEach>
    	</p>
    	<p align="right"> <button type="submit" align="right" class="btn btn-default bg-violet text-white" onClick="location.href='${pageContext.request.contextPath}/communityPostMake'">글 작성</button> </p>
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