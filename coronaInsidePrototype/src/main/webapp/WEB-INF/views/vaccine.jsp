<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
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
#bt1 {
	background: #7E41D9;
}

#bt2 {
	background: #7E41D9;
}

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
										<br> <span class="badge badge-secondary">백신접종현황은
											질병관리청의 '예방접종실적 총 현황'을 기준으로 제공.</span><br> <span
											class="badge badge-secondary">국내현황 ${beforeDate} 24:00
											집계 기준.</span>
									</div>
								</div>

							</div>

							<!-- /.container-fluid -->

						</div>
						<div class="row">
							<div class="col-xs-6 col-xl-12 col-lg-12">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet">
											지역별 접종률

											<div class="btn-group" role="group"
												aria-label="Basic example" style="float: right;">
												<button type="button" class="btn btn-violet"
													onClick="buttonClick2(this)">2차 접종</button>
												<button type="button" class="btn btn-violet"
													onClick="buttonClick1(this)">1차 접종</button>
											</div>
										</h6>
									</div>
									<div class="card-body">
										<div id="myBar">
											<div class="chart-bar">
												<canvas id="myBarChart3"></canvas>
											</div>
										</div>
										<br> <span class="badge badge-secondary">접종률은 전국 및
											시도별 인구 대비 접종자 비율을 제공.</span><br> <span
											class="badge badge-secondary">국내현황 ${beforeDate} 24:00
											집계 기준.</span>
									</div>
								</div>
							</div>
						</div>
						<div class="row">
							<div class="col-xs-6 col-lg-12 mb-3">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet"
											style="text-align: left;">
											백신 종류 <a
												href="https://ncv.kdca.go.kr/menu.es?mid=a10119000000"
												target="_blank" style="float: right;">자세히 보기 ></a>
										</h6>
									</div>
									<div class="card-body">
										<div class="">
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
														<th align="center">백신명</th>
														<td align="center" colspan="1">코미나티주</td>
														<td align="center" colspan="1">-</td>
														<td align="center" colspan="1">한국아스트라제네카<br>코비드-19백신
														</td>
														<td align="center" colspan="1">코비드19백신<br>얀센주
														</td>
													</tr>
													<tr>
														<th align="center">연령</th>
														<td align="center" colspan="1">만 16세 <br>이상
														</td>
														<td align="center" colspan="1">만 18세 <br>이상
														</td>
														<td align="center" colspan="1">만 18세 <br>이상
														</td>
														<td align="center" colspan="1">만 18세 <br>이상
														</td>
													</tr>
													<tr>
														<th align="center">구성</th>
														<td align="center" colspan="1">다회 투여용 <br>바이알
														</td>
														<td align="center" colspan="1">다회 투여용 <br>바이알
														</td>
														<td align="center" colspan="1">다회 투여용 <br>바이알
														</td>
														<td align="center" colspan="1">다회 투여용 <br>바이알
														</td>
													</tr>
													<tr>
														<th align="center">접종 횟수(간격)</th>
														<td align="center" colspan="1">2회, 21일</td>
														<td align="center" colspan="1">2회, 28일</td>
														<td align="center" colspan="1">2회, 8-12주 <br>(*2차접종일
															기준:<br>11~12주) <br>*허가는 4~12주"
														</td>
														<td align="center" colspan="1">1회</td>
													</tr>
													<tr>
														<th align="center">접종량 및 방법</th>
														<td align="center" colspan="1">희석된 백신 0.3㎖ <br>근육주사
														</td>
														<td align="center" colspan="1">0.5㎖ <br>근육주사
														</td>
														<td align="center" colspan="1">0.5㎖<br>근육주사
														</td>
														<td align="center" colspan="1">0.5㎖ <br>근육주사
														</td>
													</tr>
													<tr>
														<th align="center">보관</th>
														<td align="center" colspan="1">-90℃∼-60℃<br>(6개월)
														</td>
														<td align="center" colspan="1">-25℃∼-15℃<br>(7개월)
														</td>
														<td align="center" colspan="1">2∼8℃<br>(6개월)
														</td>
														<td align="center" colspan="1">-25℃∼-15℃<br>(24개월)
														</td>
													</tr>
													<tr>
														<th align="center">유통</th>
														<td align="center" colspan="1">-90℃∼-60℃(6개월)<br>2∼8℃(5일)
														</td>
														<td align="center" colspan="1">2∼8℃<br>(30일)
														</td>
														<td align="center" colspan="1">2∼8℃<br>(6개월)
														</td>
														<td align="center" colspan="1">2∼8℃<br>(3개월)
														</td>
													</tr>
													<tr>
														<th align="center">개봉 후 저장</th>
														<td align="center" colspan="1">희석 후 실온 <br>(2℃∼30℃)6시간
														</td>
														<td align="center" colspan="1">실온 6시간</td>
														<td align="center" colspan="1">실온(30℃이하) <br>6시간
														</td>
														<td align="center" colspan="1">2∼8℃ 6시간 <br>실온(25℃이하)3시간
														</td>
													</tr>
												</tbody>
											</table>
										</div>
										<br> <span class="badge badge-secondary">현재
											우리나라에서는 아스트라제네카, 화이자, 얀센 코로나19 백신이 허가됨.</span><br> <span
											class="badge badge-secondary">출처: 질병관리청 2021.06.01.
											기준.</span>
									</div>
								</div>
							</div>
						</div>

						<div class="row">
							<div class="col-xs-12 col-lg-12 mb-3">
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-violet"
											style="text-align: left;">
											접종계획 <a
												href="https://ncv.kdca.go.kr/gallery.es?mid=a11902000000&bid=0001&list_no=83&act=view"
												target="_blank" style="float: right;">자세히 보기 ></a>
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
														- <span style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														자체/방문
													</td>

												</tr>
												<tr>
													<th scope="row" align="center">4월 1주</th>
													<td align="center">노인 시설 (주거, 주/야간, 단기보호) <br>
														75세 이상 어르신 <br> - <span style="color: #6f42c1"><strong>화이자</strong></span>
														예방접종센터 <br>
													<br> 특수교육 종사자 및 유 · 초중등 보건교사 <br> 어린이집 장애아전문 교직원
														및 간호인력 <br> - <span style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														보건소
													</td>
												</tr>
												<tr>
													<th scope="row" align="center">4월 2주</th>
													<td align="center">장애인 시설 (거주, 주간보호) <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														방문(위탁) <br>
													<br> 교정시설 등 종사자 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														자체/보건소
													</td>
												</tr>
												<tr>
													<th scope="row" align="center">4월 3주</th>
													<td align="center">노인요양공동생활가정 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														방문(위탁) <br>
													<br> 결핵 및 한센인 거주시설 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														방문(보건소)
													</td>
												</tr>
												<tr>
													<th scope="row" align="center">4월 4주</th>
													<td align="center">노숙인 거주 및 이용시설 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														방문(보건소)
													</td>
												</tr>
												<tr>
													<th scope="row" align="center">5월</th>
													<td align="center">항공승무원 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span> 보건소
														등 <br> <br> 65세~74세 어르신 <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														위탁의료기관
													</td>
												</tr>
												<tr>
													<th scope="row" align="center">6월</th>
													<td align="center">65~74세 어르신 <br> 장애인 돌봄 종사자 <br>
														노인 방문 돌봄 종사자 <br> 유치원·어린이집, 초등학교 (1~2학년) 교사 등 <br>
														만성신장질환 (투석환자) <br> 만성중증호흡기질환 <br> 의료기관 및 약국 종사자
														(보건의료인) <br> 사회필수인력 (경찰, 해경, 소방, 군인 등) <br> - <span
														style="color: #6f42c1"><strong>아스트라제네카</strong></span>
														위탁의료기관
													</td>
												</tr>
											</tbody>
										</table>
										<br> <span class="badge badge-secondary">모더나 백신은 아직 국내허가 전으로, 해외 제품 정보이며 향후 변경 가능.</span><br> <span
											class="badge badge-secondary">출처: 질병관리청 2021.04.21.
											기준.</span>

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
		var oneBar0 = parseInt("${vaccineCurrent2[17][2]}");
		var oneBar1 = parseInt("${vaccineCurrent2[16][2]}");
		var oneBar2 = parseInt("${vaccineCurrent2[15][2]}");
		var oneBar3 = parseInt("${vaccineCurrent2[14][2]}");
		var oneBar4 = parseInt("${vaccineCurrent2[13][2]}");
		var oneBar5 = parseInt("${vaccineCurrent2[12][2]}");
		var oneBar6 = parseInt("${vaccineCurrent2[11][2]}");
		var oneBar7 = parseInt("${vaccineCurrent2[10][2]}");
		var oneBar8 = parseInt("${vaccineCurrent2[9][2]}");
		var oneBar9 = parseInt("${vaccineCurrent2[8][2]}");
		var oneBar10 = parseInt("${vaccineCurrent2[7][2]}");
		var oneBar11 = parseInt("${vaccineCurrent2[6][2]}");
		var oneBar12 = parseInt("${vaccineCurrent2[5][2]}");
		var oneBar13 = parseInt("${vaccineCurrent2[4][2]}");
		var oneBar14 = parseInt("${vaccineCurrent2[3][2]}");
		var oneBar15 = parseInt("${vaccineCurrent2[2][2]}");
		var oneBar16 = parseInt("${vaccineCurrent2[1][2]}");

		var twoBar0 = parseInt("${vaccineCurrent2[17][4]}");
		var twoBar1 = parseInt("${vaccineCurrent2[16][4]}");
		var twoBar2 = parseInt("${vaccineCurrent2[15][4]}");
		var twoBar3 = parseInt("${vaccineCurrent2[14][4]}");
		var twoBar4 = parseInt("${vaccineCurrent2[13][4]}");
		var twoBar5 = parseInt("${vaccineCurrent2[12][4]}");
		var twoBar6 = parseInt("${vaccineCurrent2[11][4]}");
		var twoBar7 = parseInt("${vaccineCurrent2[10][4]}");
		var twoBar8 = parseInt("${vaccineCurrent2[9][4]}");
		var twoBar9 = parseInt("${vaccineCurrent2[8][4]}");
		var twoBar10 = parseInt("${vaccineCurrent2[7][4]}");
		var twoBar11 = parseInt("${vaccineCurrent2[6][4]}");
		var twoBar12 = parseInt("${vaccineCurrent2[5][4]}");
		var twoBar13 = parseInt("${vaccineCurrent2[4][4]}");
		var twoBar14 = parseInt("${vaccineCurrent2[3][4]}");
		var twoBar15 = parseInt("${vaccineCurrent2[2][4]}");
		var twoBar16 = parseInt("${vaccineCurrent2[1][4]}");

		function buttonClick1(bt) {
			updateChartType1(bt);
		}
		function buttonClick2(bt) {
			updateChartType2(bt);
		}

		function update() {

			$('#myBar').load(window.location + '#myBar');
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