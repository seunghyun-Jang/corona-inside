<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 셀프 방역점수 체크</title>
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
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="community">커뮤니티</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-selected" href="selfcheck">셀프체크</a></li>
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
    <div class="row">
    	<h1 class="masthead-heading text-center text-secondary text-uppercase mb-0">셀프 방역점수 체크</h1>
    </div>
    
    <!-- SelfCheck Form -->
    <div class="container-fluid">
		<div class="modal-dialog">
	    	<div class="modal-content">
	        	<div class="modal-header">
	            	<h3><span class="label label-warning" id="qid">1</span> 설문조사 테스트</h3>
	        	</div>
		        <div class="modal-body">
		            <div class="col-xs-3 col-xs-offset-5">
		            	<div id="loadbar" style="display: none;">
		                	<div class="blockG" id="rotateG_01"></div>
		                 	<div class="blockG" id="rotateG_02"></div>
		                  	<div class="blockG" id="rotateG_03"></div>
		                	<div class="blockG" id="rotateG_04"></div>
		                 	<div class="blockG" id="rotateG_05"></div>
		                	<div class="blockG" id="rotateG_06"></div>
		                  	<div class="blockG" id="rotateG_07"></div>
		                  	<div class="blockG" id="rotateG_08"></div>
		              	</div>
		          	</div>
		          	<div class="quiz" id="quiz" data-toggle="buttons">
			           	<label class="element-animation1 btn btn-lg btn-violet btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="1">매우 그렇다</label>
			           	<label class="element-animation2 btn btn-lg btn-violet btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="2">조금 그렇다</label>
			           	<label class="element-animation3 btn btn-lg btn-violet btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="3">보통이다</label>
			           	<label class="element-animation4 btn btn-lg btn-violet btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="4">조금 그렇지 않다</label>
			           	<label class="element-animation5 btn btn-lg btn-violet btn-block"><span class="btn-label"><i class="glyphicon glyphicon-chevron-right"></i></span> <input type="radio" name="q_answer" value="5">매우 그렇지 않다</label>
		   			</div>
	   			</div>
			   	<div class="modal-footer text-muted">
			    	<span id="answer"></span>
				</div>
			</div>
		</div>
	</div>
    
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