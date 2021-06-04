<!------ Include the above in your HEAD tag ---------->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Corona Inside : SignUp</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css">
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js"
	crossorigin="anonymous"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
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
					<li class="nav-item mx-0 mx-lg-1 login-item"><a
						class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
						href="login">로그인 하기</a></li>
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
			<button class="bg-primary rounded text-white login-btn"
				onClick="location.href='login'">로그인</button>
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
	<section class="login-section" id="signup">
		<div id="signup">
			<div class="container">
				<div id="login-row"
					class="row justify-content-center align-items-center">
					<div id="login-column" class="col-md-6">
						<div id="login-box" class="col-md-12">
							<form id="signUp-form" class="form" action="insert-user"
								method="post">
								<h1 class="text-center text-violet">회원가입</h1>
								<div class="form-group">
									<label for="username" class="text-violet font-weight-bold">아이디</label><br>
									<input type="text" name="username" id="username"
										class="form-control">
										<span>아이디는 4~8자리이어야 합니다.</span>
								</div>
								<div class="form-group">
									<label for="password" class="text-violet font-weight-bold">비밀번호</label><br>
									<input type="password" name="password" id="password"
										class="form-control">
										<span>비밀번호는 6~12자리 영문 숫자 조합이어야 합니다.</span>
								</div>
								<div class="form-group">
									<label for="password" class="text-violet font-weight-bold">닉네임</label><br>
									<input type="text" name="nickname" id="nickname"
										class="form-control">
								</div>
								<div class="form-group">
									<input type="submit" name="submit"
										class="btn bg-violet text-white font-weight-bold" value="회원가입">
									<input type="hidden" name="${_csrf.parameterName}"
										value="${_csrf.token}" />
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Copyright Section-->
	<div class="copyright py-4 text-center text-white">
		<div class="container">
			<small>Copyright © Corona-Inside 2021</small>
		</div>
	</div>
</body>