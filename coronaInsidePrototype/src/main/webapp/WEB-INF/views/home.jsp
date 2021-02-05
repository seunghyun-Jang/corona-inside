<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Corona Inside</title>
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
                <a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;" href="#page-top">Corona Inside</a>
                <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-violet text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ml-auto">
                    	<li class="nav-item mx-0 mx-lg-1 login-item"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="login">로그인 하기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="coronaCurrent">코로나 현황</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="community">커뮤니티</a></li>
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
                <!-- Masthead Avatar Image-->
                <img class="masthead-avatar mb-5" src="resources/assets/img/covid.svg" alt="" />
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
                <!-- Grid Items-->
                <div class="row justify-content-center">
                    <!-- Item 1-->
                    <button class="col-md-5 col-lg-5 mb-5" onclick="location.href='coronaCurrent'">
                        <div class="portfolio-item mx-auto">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<h1 class="masthead-heading mb-0">코로나<br>현황</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/item/covidcurrent.svg" alt="" />
                        </div>
                        <br>
                        <h2 class="masthead-heading text-center text-secondary mb-0">코로나 현황</h2>
                    </button>
                    <!-- Item 2-->
                    <button class="col-md-5 col-lg-5 mb-5" onclick="location.href='community'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal3">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<h1 class="masthead-heading mb-0">커뮤니티</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/item/community.svg" alt="" />
                        </div>
                        <br>
                        <h2 class="masthead-heading text-center text-secondary mb-0">커뮤니티</h2>
                    </button>
                    <!-- Item 3-->
                    <button class="col-md-5 col-lg-5 mb-5 mb-lg-0" onclick="location.href='selfcheck'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<h1 class="masthead-heading mb-0">방역점수<br>셀프체크</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/item/test2.svg" alt="" />
                        </div>
                        <br>
                        <h2 class="masthead-heading text-center text-secondary mb-0">방역점수 셀프체크</h2>
                    </button>
                    <!-- Item 4-->
                    <button class="col-md-5 col-lg-5" onclick="location.href='faq'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal6">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<h1 class="masthead-heading mb-0">FAQ</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/item/faq2.svg" alt="" />
                        </div>
                        <br>
                        <h2 class="masthead-heading text-center text-secondary mb-0">FAQ</h2>
                    </button>
                </div>
            </div>
        </section>
        
        <!-- Footer-->
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            HANSUNG
                            <br />
                            UNIVERSITY
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Around the Web</h4>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-facebook-f"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-twitter"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-linkedin-in"></i></a>
                        <a class="btn btn-outline-light btn-social mx-1" href="#!"><i class="fab fa-fw fa-dribbble"></i></a>
                    </div>
                    <!-- Footer About Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">MEMBER</h4>
                        <p class="lead mb-0">
                            HONG<br>
                            JANG<br>
                            DDO
                        </p>
                    </div>
                </div>
            </div>
        </footer>
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
