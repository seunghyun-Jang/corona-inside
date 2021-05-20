<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Corona Inside : 셀프 방역점수 체크</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon"
	href="${pageContext.request.contextPath}/resources/assets/img/favicon_covid.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
		#bt1 {background:#7E41D9;}/*전구 켜기 버튼 css속성*/
		#bt2 {background:#7E41D9;}/*전구 끄기 버튼 css속성*/
		
		.table tbody th {
  			vertical-align: middle;
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
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-selected"
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
		</div>
	</header>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Begin Page Content -->
				<div class="container-fluid">
					<div class="row">
						<!-- Content Row -->
						<div class="row">
							<!-- Content Column -->
							<div class="col-xs-6 col-lg-12 mb-3">
								<!-- Color System -->

								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet">백신 접종 현황</h6>
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
												<tr class="bg-violet text-white">
													<th scope="row" align="center">${vaccineCurrent[0][0]}</th>
													<td align="center"><strong>${vaccineCurrent[0][1]}</strong></td>
													<td align="center"><strong>${vaccineCurrent[0][2]}</strong></td>
													<td align="center"><strong>${vaccineCurrent[0][3]}</strong></td>
													<td align="center"><strong>${vaccineCurrent[0][4]}</strong></td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[1][0]}</th>
													<td align="center">${vaccineCurrent[1][1]}</td>
													<td align="center">${vaccineCurrent[1][2]}</td>
													<td align="center">${vaccineCurrent[1][3]}</td>
													<td align="center">${vaccineCurrent[1][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[2][0]}</th>
													<td align="center">${vaccineCurrent[2][1]}</td>
													<td align="center">${vaccineCurrent[2][2]}</td>
													<td align="center">${vaccineCurrent[2][3]}</td>
													<td align="center">${vaccineCurrent[2][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[3][0]}</th>
													<td align="center">${vaccineCurrent[3][1]}</td>
													<td align="center">${vaccineCurrent[3][2]}</td>
													<td align="center">${vaccineCurrent[3][3]}</td>
													<td align="center">${vaccineCurrent[3][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[4][0]}</th>
													<td align="center">${vaccineCurrent[4][1]}</td>
													<td align="center">${vaccineCurrent[4][2]}</td>
													<td align="center">${vaccineCurrent[4][3]}</td>
													<td align="center">${vaccineCurrent[4][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[5][0]}</th>
													<td align="center">${vaccineCurrent[5][1]}</td>
													<td align="center">${vaccineCurrent[5][2]}</td>
													<td align="center">${vaccineCurrent[5][3]}</td>
													<td align="center">${vaccineCurrent[5][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[6][0]}</th>
													<td align="center">${vaccineCurrent[6][1]}</td>
													<td align="center">${vaccineCurrent[6][2]}</td>
													<td align="center">${vaccineCurrent[6][3]}</td>
													<td align="center">${vaccineCurrent[6][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[7][0]}</th>
													<td align="center">${vaccineCurrent[7][1]}</td>
													<td align="center">${vaccineCurrent[7][2]}</td>
													<td align="center">${vaccineCurrent[7][3]}</td>
													<td align="center">${vaccineCurrent[7][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[8][0]}</th>
													<td align="center">${vaccineCurrent[8][1]}</td>
													<td align="center">${vaccineCurrent[8][2]}</td>
													<td align="center">${vaccineCurrent[8][3]}</td>
													<td align="center">${vaccineCurrent[8][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[9][0]}</th>
													<td align="center">${vaccineCurrent[9][1]}</td>
													<td align="center">${vaccineCurrent[9][2]}</td>
													<td align="center">${vaccineCurrent[9][3]}</td>
													<td align="center">${vaccineCurrent[9][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[10][0]}</th>
													<td align="center">${vaccineCurrent[10][1]}</td>
													<td align="center">${vaccineCurrent[10][2]}</td>
													<td align="center">${vaccineCurrent[10][3]}</td>
													<td align="center">${vaccineCurrent[10][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[11][0]}</th>
													<td align="center">${vaccineCurrent[11][1]}</td>
													<td align="center">${vaccineCurrent[11][2]}</td>
													<td align="center">${vaccineCurrent[11][3]}</td>
													<td align="center">${vaccineCurrent[11][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[12][0]}</th>
													<td align="center">${vaccineCurrent[12][1]}</td>
													<td align="center">${vaccineCurrent[12][2]}</td>
													<td align="center">${vaccineCurrent[12][3]}</td>
													<td align="center">${vaccineCurrent[12][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[13][0]}</th>
													<td align="center">${vaccineCurrent[13][1]}</td>
													<td align="center">${vaccineCurrent[13][2]}</td>
													<td align="center">${vaccineCurrent[13][3]}</td>
													<td align="center">${vaccineCurrent[13][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[14][0]}</th>
													<td align="center">${vaccineCurrent[14][1]}</td>
													<td align="center">${vaccineCurrent[14][2]}</td>
													<td align="center">${vaccineCurrent[14][3]}</td>
													<td align="center">${vaccineCurrent[14][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[15][0]}</th>
													<td align="center">${vaccineCurrent[15][1]}</td>
													<td align="center">${vaccineCurrent[15][2]}</td>
													<td align="center">${vaccineCurrent[15][3]}</td>
													<td align="center">${vaccineCurrent[15][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[16][0]}</th>
													<td align="center">${vaccineCurrent[16][1]}</td>
													<td align="center">${vaccineCurrent[16][2]}</td>
													<td align="center">${vaccineCurrent[16][3]}</td>
													<td align="center">${vaccineCurrent[16][4]}</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[17][0]}</th>
													<td align="center">${vaccineCurrent[17][1]}</td>
													<td align="center">${vaccineCurrent[17][2]}</td>
													<td align="center">${vaccineCurrent[17][3]}</td>
													<td align="center">${vaccineCurrent[17][4]}</td>
												</tr>
									

											</tbody>
										</table>
										<br>
										<span class="badge badge-secondary">백신접종현황은 질병관리청의 '예방접종실적 총 현황'을 기준으로 제공.</span><br>
										<span class="badge badge-secondary">국내현황 ${today} 00:00 집계 기준.</span>
									</div>
								</div>

							</div>
							
							<!-- /.container-fluid -->

						</div>
						<div class="row">
							<div class="col-xs-6 col-xl-12 col-lg-12">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet">지역별 접종률
											<!--  <button class="rounded text-white float-right mx-3 badge-pill" id="bt2" onClick="buttonClick2(this)">2차 접종</button>
											<button class="rounded text-white float-right mx-0 badge-pill" id="bt1" onClick="buttonClick1(this)">1차 접종</button> -->
											
											<div class="btn-group" role="group" aria-label="Basic example" style="float: right;">
  												<button type="button" class="btn btn-violet" onClick="buttonClick2(this)">2차 접종</button>
  												<button type="button" class="btn btn-violet" onClick="buttonClick1(this)">1차 접종</button>
											</div>
										</h6>
									</div>
									<div class="card-body">
										<div id="myBar">
											<div class="chart-bar">
												<canvas id="myBarChart3"></canvas>
											</div>
										</div>
										<br>
										<span class="badge badge-secondary">접종률은 전국 및 시도별 인구 대비 접종자 비율을 제공.</span><br>
										<span class="badge badge-secondary">국내현황 ${today} 00:00 집계 기준.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-lg-12 mb-3">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet" style="text-align:left;">
										백신 종류
		
    									<a href="https://ncv.kdca.go.kr/menu.es?mid=a10119000000" target="_blank" style="float:right;">자세히 보기 ></a>
										</h6>
									</div>
									<div class="card-body">
										<table class="table table-striped">
											<thead class="text-center thead-light">
												<tr>
													<th scope="col" rowspan="2">제조사</th>
													<th scope="col" colspan="2">mRNA 백신(핵산백신)</th>
													<th scope="col" colspan="2">바이러스 벡터 백신</th>
												</tr>
												<tr>
													<th scope="col">화이자 및 바이오엔텍</th>
													<th scope="col">모더나</th>
													<th scope="col">아스트라제네카</th>
													<th scope="col">얀센</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row" align="center">백신명</th>
													<td align="center">코미나티주</td>
													<td align="center">-</td>
													<td align="center">한국아스트라제네카코비드-19백신</td>
													<td align="center">-</td>
												</tr>
												<tr>
													<th scope="row" align="center">연령</th>
													<td align="center">만 16세 이상</td>
													<td align="center">만 18세 이상</td>
													<td align="center">만 18세 이상</td>
													<td align="center">-</td>
												</tr>
												<tr>
													<th scope="row" align="center">구성</th>
													<td align="center">다회 투여용 바이알</td>
													<td align="center">다회 투여용 바이알</td>
													<td align="center">다회 투여용 바이알</td>
													<td align="center">-</td>
												</tr>
												<tr>
													<th scope="row" align="center">접종 횟수(간격)</th>
													<td align="center">2회, 21일</td>
													<td align="center">2회, 28일</td>
													<td align="center">2회, 8-12주 (*2차접종일 기준 11~12주) *허가는 4~12주"</td>
													<td align="center">1회</td>
												</tr>
												<tr>
													<th scope="row" align="center">접종량 및 방법</th>
													<td align="center">희석된 백신 0.3㎖</td>
													<td align="center">0.5㎖</td>
													<td align="center">0.5㎖</td>
													<td align="center">-</td>
												</tr>
												<tr>
													<th scope="row" align="center">${vaccineCurrent[5][0]}</th>
													<td align="center">근육주사</td>
													<td align="center">근육주사</td>
													<td align="center">근육주사</td>
													<td align="center">-</td>
												</tr>
												<tr>
													<th scope="row" align="center">보관</th>
													<td align="center">-90℃∼-60℃(6개월)</td>
													<td align="center">-20℃(6개월)</td>
													<td align="center">2∼8℃(6개월)</td>
													<td align="center">-20℃(24개월)</td>
												</tr>
												<tr>
													<th scope="row" align="center">유통</th>
													<td align="center">-90℃∼-60℃(6개월) 2∼8℃(5일)</td>
													<td align="center">2∼8℃(30일)</td>
													<td align="center">2∼8℃(6개월)</td>
													<td align="center">2∼8℃(3개월)</td>
												</tr>
												<tr>
													<th scope="row" align="center">개봉 후 저장</th>
													<td align="center">희석 후 실온 (2℃∼30℃)6시간</td>
													<td align="center">실온 6시간</td>
													<td align="center">실온(30℃이하) 6시간</td>
													<td align="center">냉장에서 4∼6시간</td>
												</tr>
											</tbody>
										</table>
										<br>
										<span class="badge badge-secondary">모더나 백신과 얀센 백신은 아직 국내허가 전으로, 해외 제품 정보이며 향후 변경 가능</span><br>
										<span class="badge badge-secondary">출처: 질병관리청 2021.04.21. 기준</span>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12 col-lg-12 mb-3">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet" style="text-align:left;">
										접종계획
		
    									<a href="https://ncv.kdca.go.kr/gallery.es?mid=a11902000000&bid=0001&list_no=83&act=view" target="_blank" style="float:right;">자세히 보기 ></a>
										</h6>
									</div>
									<div class="card-body">
										<table class="table table-striped">
											<thead class="text-center thead-light">	
												<tr>
													<th scope="col" colspan="1">접종 일정</th>
													<th scope="col" colspan="3">접종 대상 및 방법</th>		
												</tr>
											</thead>
											<tbody>
												<tr>
													<th scope="row" align="center">3월 4주</th>
													<td align="center">65세 이상 입원·입소자 및 종사자 자체 방문 <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 자체/방문</td>
													
												</tr>
												<tr>
													<th scope="row" align="center">4월 1주</th>
													<td align="center">노인 시설 (주거, 주/야간, 단기보호)  <br>
																		75세 이상 어르신  <br>
																		- <span style="color: #6f42c1"><strong>화이자</strong></span> 예방접종센터  <br><br>
																		특수교육 종사자 및 유 · 초중등 보건교사 <br>
																		어린이집 장애아전문 교직원 및 간호인력 <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 보건소</td>		
												</tr>
												<tr>
													<th scope="row" align="center">4월 2주</th>
													<td align="center">장애인 시설 (거주, 주간보호) <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 방문(위탁) <br><br>
																		교정시설 등 종사자 <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 자체/보건소</td>
												</tr>
												<tr>
													<th scope="row" align="center">4월 3주</th>
													<td align="center">노인요양공동생활가정 <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 방문(위탁) <br><br>
																		결핵 및 한센인 거주시설 <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 방문(보건소)</td>
												</tr>
												<tr>
													<th scope="row" align="center">4월 4주</th>
													<td align="center">노숙인 거주 및 이용시설  <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 방문(보건소)</td>
												</tr>
												<tr>
													<th scope="row" align="center">5월</th>
													<td align="center">항공승무원  <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 보건소 등  <br> <br>
																		65세~74세 어르신  <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 위탁의료기관</td>
												</tr>
												<tr>
													<th scope="row" align="center">6월</th>
													<td align="center">65~74세 어르신 <br>
																		장애인 돌봄 종사자 <br>
																		노인 방문 돌봄 종사자 <br>
																		유치원·어린이집, 초등학교 (1~2학년) 교사 등 <br>
																		만성신장질환 (투석환자) <br>
																		만성중증호흡기질환 <br>
																		의료기관 및 약국 종사자 (보건의료인) <br>
																		사회필수인력 (경찰, 해경, 소방, 군인 등) <br>
																		- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span> 위탁의료기관</td>
												</tr>
											</tbody>
										</table>
										<br>
										<span class="badge badge-secondary">모더나 백신과 얀센 백신은 아직 국내허가 전으로, 해외 제품 정보이며 향후 변경 가능</span><br>
										<span class="badge badge-secondary">출처: 질병관리청 2021.04.21. 기준</span>
		
									</div>
								</div>
							</div>
						</div>
					</div>
					
					
					<!-- End of Main Content -->

					<!-- Copyright Section-->
					<div class="copyright py-4 text-center text-white">
						<div class="container">
							<small>Copyright © Corona-Inside 2021</small>
						</div>
					</div>
				</div>
				<!-- End of Content Wrapper -->

			</div>
		</div>
	</div>
	<!-- Page level plugins -->
	<script src="resources/vendor/chart.js/Chart.min.js"></script>
	
	
	
	<script>
	
	
	
	
		var oneBar0 = parseInt("${vaccineCurrent[17][2]}");
		var oneBar1 = parseInt("${vaccineCurrent[16][2]}");
		var oneBar2 = parseInt("${vaccineCurrent[15][2]}");
		var oneBar3 = parseInt("${vaccineCurrent[14][2]}");
		var oneBar4 = parseInt("${vaccineCurrent[13][2]}");
		var oneBar5 = parseInt("${vaccineCurrent[12][2]}");
		var oneBar6 = parseInt("${vaccineCurrent[11][2]}");
		var oneBar7 = parseInt("${vaccineCurrent[10][2]}");
		var oneBar8 = parseInt("${vaccineCurrent[9][2]}");
		var oneBar9 = parseInt("${vaccineCurrent[8][2]}");
		var oneBar10 = parseInt("${vaccineCurrent[7][2]}");
		var oneBar11 = parseInt("${vaccineCurrent[6][2]}");
		var oneBar12 = parseInt("${vaccineCurrent[5][2]}");
		var oneBar13 = parseInt("${vaccineCurrent[4][2]}");
		var oneBar14 = parseInt("${vaccineCurrent[3][2]}");
		var oneBar15 = parseInt("${vaccineCurrent[2][2]}");
		var oneBar16 = parseInt("${vaccineCurrent[1][2]}");

		var twoBar0 = parseInt("${vaccineCurrent[17][4]}");
		var twoBar1 = parseInt("${vaccineCurrent[16][4]}");
		var twoBar2 = parseInt("${vaccineCurrent[15][4]}");
		var twoBar3 = parseInt("${vaccineCurrent[14][4]}");
		var twoBar4 = parseInt("${vaccineCurrent[13][4]}");
		var twoBar5 = parseInt("${vaccineCurrent[12][4]}");
		var twoBar6 = parseInt("${vaccineCurrent[11][4]}");
		var twoBar7 = parseInt("${vaccineCurrent[10][4]}");
		var twoBar8 = parseInt("${vaccineCurrent[9][4]}");
		var twoBar9 = parseInt("${vaccineCurrent[8][4]}");
		var twoBar10 = parseInt("${vaccineCurrent[7][4]}");
		var twoBar11 = parseInt("${vaccineCurrent[6][4]}");
		var twoBar12 = parseInt("${vaccineCurrent[5][4]}");
		var twoBar13 = parseInt("${vaccineCurrent[4][4]}");
		var twoBar14 = parseInt("${vaccineCurrent[3][4]}");
		var twoBar15 = parseInt("${vaccineCurrent[2][4]}");
		var twoBar16 = parseInt("${vaccineCurrent[1][4]}");
		
		
		

		function buttonClick1(bt) {
			/* var obj = document.getElementById("myBarChart3")
			if(obj!=null) {
				
				obj.setAttribute('id','myBarChart2');
			
				//$('#myBar').load("/coronaInsidePrototype/coronaCurrent.jsp");
			}
			alert(obj.getAttribute("id")); */
			updateChartType1(bt);
			
	
			var bt1 = document.getElementById("bt1");
			bt1.style.background="#343a40";
	
			var bt2 = document.getElementById("bt2");//전구끄기 버튼 색변경
			bt2.style.background="#7E41D9";	
			
			
		}
		function buttonClick2(bt) {
			/* var obj = document.getElementById("myBarChart2")
			
			if(obj!=null) {
				obj.setAttribute('id','myBarChart3');
			
				//$('#myBar').load("/coronaInsidePrototype/coronaCurrent.jsp");
			}
			alert(obj.getAttribute("id")); */
			updateChartType2(bt);
			
			var bt2 = document.getElementById("bt2");
			bt2.style.background="#343a40";
		
	
			var bt1 = document.getElementById("bt1");//전구끄기 버튼 색변경
			bt1.style.background="#7E41D9";	
			
		}
		
		function update() {

			
			$('#myBar').load(window.location+'#myBar');
			}

	</script>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Third party plugin JS-->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/demo/chart-bar-demo3.js"></script>
	
</body>
</html>