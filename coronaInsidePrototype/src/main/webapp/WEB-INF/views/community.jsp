<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 커뮤니티</title>
	<link rel="stylesheet" href="resources/css/bootstrap.min.css">
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
	<!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="resources/css/styles.css" rel="stylesheet" />
    
</head>
<body id="page-top">

	<!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;" href="home">Corona Inside</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-violet text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                	<li class="nav-item mx-0 mx-lg-1 login-item"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login">로그인 하기</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="coronaCurrent">코로나 현황</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-selected" href="community">커뮤니티</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="selfcheck">셀프체크</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="faq">FAQ</a></li>
                </ul>
            </div>
            <button class="bg-primary rounded text-white login-btn" onClick="location.href='login'">로그인</button>
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
    	<h1 class="masthead-heading text-center text-secondary text-uppercase mb-0">커뮤니티</h1>
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
    			<tr>
    				<td>테스트1</td>
    				<td>test123</td>
    				<td class="text-center">12</td>
    				<td class="text-center">2021.02.05</td>
    			</tr>
    			<tr>
    				<td>테스트2</td>
    				<td>test321</td>
    				<td class="text-center">1</td>
    				<td class="text-center">2021.02.04</td>
    			</tr>
    			<tr>
    				<td>테스트3</td>
    				<td>test56</td>
    				<td class="text-center">16</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트4</td>
    				<td>test567</td>
    				<td class="text-center">162</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트5</td>
    				<td>test56</td>
    				<td class="text-center">16</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트6</td>
    				<td>test12</td>
    				<td class="text-center">1563</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트7</td>
    				<td>test56</td>
    				<td class="text-center">16</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트8</td>
    				<td>test56</td>
    				<td class="text-center">716</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트9</td>
    				<td>test56</td>
    				<td class="text-center">313</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트10</td>
    				<td>test56</td>
    				<td class="text-center">16512</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트11</td>
    				<td>test56</td>
    				<td class="text-center">3</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    			<tr>
    				<td>테스트12</td>
    				<td>test56</td>
    				<td class="text-center">126</td>
    				<td class="text-center">2021.02.03</td>
    			</tr>
    		</tbody>
    	</table>
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
    <script src="resources/js/scripts.js"></script>
</body>
</html>