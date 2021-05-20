<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Corona Inside</title>
		<link rel="stylesheet" href="resources/css/bootstrap.min.css">
		<!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon_covid.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
		<!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="resources/css/styles.css" rel="stylesheet" />
	</head>
	
	<script>
		function login_Btn() {
			const btnElement = document.getElementById('login-btn');
			if (session.getAtrribute("username") != null)
				btnElement.innerText = '로그아웃';
		}
	</script>
	
	<body id="page-top">
        <!-- Navigation-->
		<nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
			<div class="container">
				<a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;" href="home">Corona Inside</a>
				<button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-violet text-white rounded"
					type="button" data-toggle="collapse" data-target="#navbarResponsive"
					aria-controls="navbarResponsive" aria-expanded="false"
					aria-label="Toggle navigation">Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
					<ul class="navbar-nav ml-auto">
					<c:choose>
						<c:when test="${session.getAttribute('username') == null}">
							<li class="nav-item mx-0 mx-lg-1 login-item"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
								href="login">로그인 하기</a></li>
						</c:when>
						<c:when test="${session.getAttribute('username') != null}">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger">
									<%=session.getAttribute("username")%>님 환영합니다.
							</a></li>
						</c:when>
					</c:choose>
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
				<c:choose>
					<c:when test="${session.getAttribute('username') == null}">
						<button class="bg-primary rounded text-white login-btn"
							id="login-btn" onClick="location.href='login'">로그인</button>
					</c:when>
					<c:when test="${session.getAttribute('username') != null}">
						<button class="bg-primary rounded text-white login-btn"
							id="login-btn" onClick="location.href='logout'">로그아웃</button>
					</c:when>
				</c:choose>
		</div>
		</nav>
        <!-- Masthead-->
        <header class="masthead bg-violet text-white text-center">
            <div class="container d-flex align-items-center flex-column">
                <!-- Masthead Avatar Image-->
                <!-- <img class="masthead-avatar mb-5" src="resources/assets/img/covid.svg" alt="" /> -->
                <!-- Masthead Heading-->
                <h1 class="masthead-heading text-uppercase mb-0">Corona Inside</h1>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                
                <!-- Masthead Subheading-->
                <!-- <p class="masthead-subheading font-weight-light mb-0">Hong.C.H - Jang.S.H - DdoSol</p> -->
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
                <div class="container-fluid">
                	<div class="row">
                		<div class="col-xs-12 col-lg-12">
                			<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-violet">코로나 뉴스 리스트</h6>
								</div>
								<div class="card-body">
									<ul class="list-group">
										<li class="list-group-item"><a href=${href0} target="_blank">${item0}</a></li>
										<li class="list-group-item"><a href=${href1} target="_blank">${item1}</a></li>
										<li class="list-group-item"><a href=${href2} target="_blank">${item2}</a></li>
									
									</ul>
								</div>
								
							</div>
							<br>
						</div>
						<div class="col-xs-12 col-lg-12">
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-violet">일별 신규 확진자 수
									<!-- <button class="bg-violet rounded text-white float-right badge-pill" onClick="buttonClick3(this)">1달</button>			
									<button class="bg-violet rounded text-white float-right mx-3 badge-pill" onClick="buttonClick2(this)">2주</button>
									<button class="bg-violet rounded text-white float-right mx-0 badge-pill" onClick="buttonClick1(this)">1주</button> -->
									</h6>
									
								</div>
								<div class="card-body">
									<div id="myBar">
										<div class="chart-bar">
											<canvas id="myBarChart2"></canvas>
										</div>
									</div>
									<br><span class="badge badge-secondary">국내현황 ${beforeHour} 00:00 집계 기준.</span>
									
									
								</div>
							</div>
							
						</div>
					</div>
                </div>
                <div class="row justify-content-center">
                    <!-- Item 1-->
                    <button class="col-md-4 col-lg-4 mb-5" onclick="location.href='corona'">
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
                    <button class="col-md-4 col-lg-4 mb-5" onclick="location.href='vaccine'">
                        <div class="portfolio-item mx-auto" data-toggle="modal" data-target="#portfolioModal4">
                            <div class="portfolio-item-caption d-flex align-items-center justify-content-center h-100 w-100">
                                <div class="portfolio-item-caption-content text-center text-white">
                                	<h1 class="masthead-heading mb-0">백신 현황</h1>
                                </div>
                            </div>
                            <img class="img-fluid" src="resources/assets/img/item/vaccine.svg" alt="" />
                        </div>
                        <br>
                        <h2 class="masthead-heading text-center text-secondary mb-0">백신 현황</h2>
                    </button>
                    <!-- Item 3-->
                    <button class="col-md-4 col-lg-4 mb-5" onclick="location.href='community'">
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
        <script>
        function strAddSlash(str) {
			var len = str.length;
			var rtnStr = "";
			for (var i = 0, j = len; i < len; i++, j--) {
				if (j % 2 == 0 && j != len) {
					rtnStr += "/";
				}
				rtnStr += str.charAt(i);
			}
			return rtnStr;
		};



		var date0 = strAddSlash("${InfDTO.getItem()[0].getStateDt()}".substring(4, 8));
		var date1 = strAddSlash("${InfDTO.getItem()[1].getStateDt()}".substring(4, 8));
		var date2 = strAddSlash("${InfDTO.getItem()[2].getStateDt()}".substring(4, 8));
		var date3 = strAddSlash("${InfDTO.getItem()[3].getStateDt()}".substring(4, 8));
		var date4 = strAddSlash("${InfDTO.getItem()[4].getStateDt()}".substring(4, 8));
		var date5 = strAddSlash("${InfDTO.getItem()[5].getStateDt()}".substring(4, 8));
		var date6 = strAddSlash("${InfDTO.getItem()[6].getStateDt()}".substring(4, 8));
		var date7 = strAddSlash("${InfDTO.getItem()[7].getStateDt()}".substring(4, 8));
		
		var cnt0 = "${InfDTO.getItem()[0].getDecideCnt()}";
		var cnt1 = "${InfDTO.getItem()[1].getDecideCnt()}";
		var cnt2 = "${InfDTO.getItem()[2].getDecideCnt()}";
		var cnt3 = "${InfDTO.getItem()[3].getDecideCnt()}";
		var cnt4 = "${InfDTO.getItem()[4].getDecideCnt()}";
		var cnt5 = "${InfDTO.getItem()[5].getDecideCnt()}";
		var cnt6 = "${InfDTO.getItem()[6].getDecideCnt()}";
		var cnt7 = "${InfDTO.getItem()[7].getDecideCnt()}";
        </script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <!-- Core theme JS-->
        <script src="resources/js/scripts.js"></script>
        <script src="resources/vendor/chart.js/Chart.min.js"></script>
		<script src="resources/js/demo/chart-bar-demo2.js"></script>
        
    </body>

</html>
