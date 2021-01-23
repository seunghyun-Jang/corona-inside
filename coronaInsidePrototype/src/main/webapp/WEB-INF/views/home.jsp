<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Test page</title>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
        
        <style>
        	button {
			  border: 0;
			  outline: 0;
			  background-color: transparent
			}
			button:focus{ 	
			  border: none;
			  outline:none;
		    }
        </style>
        
	</head>
	
	<body id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand js-scroll-trigger" href="#page-top">Corona Inside</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="coronaCurrent">코로나 현황</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="community">커뮤니티</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="selfcheck">셀프 방역점수 체크</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="faq">FAQ</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Masthead-->
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="resources/assets/img/avataaars.svg" alt="" />
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Corona Inside</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- Masthead Subheading-->
                <p class="masthead-subheading font-weight-light mb-0">Hong.C.H - Jang.S.H - DdoSol</p>
            </div>
        </header>
        <!-- Menu Section-->
        <section class="page-section portfolio" id="portfolio">
            <div class="container">
                <!-- Portfolio Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">MENU</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <br>
                <!-- Portfolio Grid Items-->
                <div class="row justify-content-center">
                    <!-- Portfolio Item 1-->
                    <button class="col-md-5 col-lg-5 mb-5" onclick="location.href='coronaCurrent'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal1">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<i class="fas fa-plus fa-3x"></i>
                                	<h1 class="masthead-heading mb-0">코로나<br>현황</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/portfolio/cabin.png" alt="" />
                        </div>
                    </button>
                    <!-- Portfolio Item 2-->
                    <button class="col-md-5 col-lg-5 mb-5" onclick="location.href='community'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<i class="fas fa-plus fa-3x"></i>
                                	<h1 class="masthead-heading mb-0">커뮤니티</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/portfolio/circus.png" alt="" />
                        </div>
                    </button>
                    <!-- Portfolio Item 3-->
                    <button class="col-md-6 col-lg-5 mb-5 mb-lg-0" onclick="location.href='selfcheck'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<i class="fas fa-plus fa-3x"></i>
                                	<h1 class="masthead-heading mb-0">셀프<br>방역점수 체크</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/portfolio/game.png" alt="" />
                        </div>
                    </button>
                    <!-- Portfolio Item 4-->
                    <button class="col-md-6 col-lg-5" onclick="location.href='faq'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<i class="fas fa-plus fa-3x"></i>
                                	<h1 class="masthead-heading mb-0">FAQ</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/portfolio/submarine.png" alt="" />
                        </div>
                    </button>
                </div>
            </div>
        </section>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Contact form JS-->
        <script src="assets/mail/jqBootstrapValidation.js"></script>
        <script src="assets/mail/contact_me.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
        
    </body>
	<!-- <body>
		<table>
			<tr>
				<td><button type="button" onclick="location.href='coronaCurrent'">코로나<br>현황</button></td>
				<td><button type="button" onclick="location.href='community'">커뮤니티</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="location.href='selfcheck'">셀프<br>방역점수 체크</button></td>
				<td><button type="button" onclick="location.href='faq'">FAQ</button></td>
			</tr>
		</table>
	</body> -->
</html>
