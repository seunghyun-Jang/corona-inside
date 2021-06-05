<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>

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
        
        <style>
		
		.table tbody th {
  			vertical-align: middle;
		}
		
		@media screen and (max-width: 600px) {
  			.table {
    			font-size: 12px;
  			}
		}
		
		</style>
        
	</head>
	
	<body id="page-top">
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
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>

			<!-- Masthead Subheading-->
			<!-- <p class="masthead-subheading font-weight-light mb-0">Hong.C.H - Jang.S.H - DdoSol</p> -->
		</div>
	</header>
	<!-- Menu Section-->
    <section class="page-section portfolio" id="portfolio">
        <div class="container">
            
            <!-- Grid Items-->
            <div class="container-fluid">
            	<div class="row">
            		<div class="col-xs-12 col-lg-12">
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-violet" style="text-align:left;">
					일일 확진자 수

									<a href="#" onclick="location.href='corona'" style="float:right;">자세히 보기 ></a>
					</h6>
					
				</div>
				<div class="card-body">
					<table class="table">
							<tbody>
								<tr class="bg-violet text-white">
									<th scope="row" align="center"><div id="date"> </div></th>
									<td align="center"><div id="today"> </div> </td>
								</tr>
								<tr>
									<th scope="row" align="center">vs 어제</th>
									<td align="center"><div id="yesterday"> </div> </td>
								</tr>
								<tr>
									<th scope="row" align="center">vs 1주전</th>
									<td align="center"><div id="weekago"> </div> </td>		
								</tr>
							</tbody>
						</table>
				</div>
			</div>
		</div>
	    <div class="col-xs-12 col-lg-12">
	       	<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-violet" style="text-align:left;">코로나 뉴스 리스트
					
						<a href="#section" onclick="location.href='corona'" style="float:right;">뉴스 더 보기 ></a>
					</h6>
				</div>
				<div class="card-body">
					<ul class="list-group">
						<li class="list-group-item"><a href=${href0} target="_blank">${item0}</a></li>
						<li class="list-group-item"><a href=${href1} target="_blank">${item1}</a></li>
						<li class="list-group-item"><a href=${href2} target="_blank">${item2}</a></li>
					
					</ul>
				</div>
			</div>
		</div>
		<div class="col-xs-6 col-lg-12 mb-3">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-violet" style="text-align:left;">백신 접종 현황
							<a href="#" onclick="location.href='vaccine'" style="float:right;">자세히 보기 ></a>
						</h6>
					</div>
					<div class="card-body">
						<table class="table">

							<thead class="text-center thead-light">
								<tr>
									<th scope="col" rowspan="2">구분</th>
									<th scope="col" colspan="2">1회차 접종</th>
									<th scope="col" colspan="2">2회차 접종</th>
								</tr>
								<tr>
									<th scope="col">당일 실적</th>
									<th scope="col">당일 누계</th>
									<th scope="col">당일 실적</th>
									<th scope="col">당일 누계</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row" align="center">${vaccineCurrent0}</th>
									<td align="center"><strong>${vaccineCurrent1}</strong></td>
									<td align="center"><strong>${vaccineCurrent2}</strong></td>
									<td align="center"><strong>${vaccineCurrent3}</strong></td>
									<td align="center"><strong>${vaccineCurrent4}</strong></td>
								</tr>
							</tbody>
						</table>
						<span class="badge badge-secondary">국내현황 ${beforeDate2} 24:00 집계 기준.</span>
					</div>
				</div>

			</div>
	
	</div>
            </div>
            
        	<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">MENU</h2>
            <!-- Icon Divider-->
            <div class="divider-custom">
                <div class="divider-custom-line"></div>
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
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
						HANSUNG <br /> UNIVERSITY
					</p>
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
					<h4 class="text-uppercase mb-4">MEMBER</h4>
					<p class="lead mb-0">
						HONG<br> JANG<br> DDO
					</p>
				</div>
			</div>
		</div>
	</footer>
	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © Corona-Inside 2021</small>
		</div>
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
		
		document.getElementById("date").innerHTML=date1+" 일자 확진자 수";
		document.getElementById("today").innerHTML=(cnt0-cnt1)+" 명";

		if((cnt0-cnt1)-(cnt1-cnt2)>0) {
			document.getElementById("yesterday").innerHTML=(cnt0-cnt1)-(cnt1-cnt2)+" ↑";
			document.getElementById("yesterday").style.color="red";
		} else {
			document.getElementById("yesterday").innerHTML=(cnt0-cnt1)-(cnt1-cnt2)+" ↓";
			document.getElementById("yesterday").style.color="blue";
		}
		
		
		if((cnt0-cnt1)-(cnt6-cnt7)>0) {
			document.getElementById("weekago").innerHTML=(cnt0-cnt1)-(cnt6-cnt7)+" ↑";
			document.getElementById("weekago").style.color="red";
		} else {
			document.getElementById("weekago").innerHTML=(cnt0-cnt1)-(cnt6-cnt7)+" ↓";
			document.getElementById("weekago").style.color="blue";
		}
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
