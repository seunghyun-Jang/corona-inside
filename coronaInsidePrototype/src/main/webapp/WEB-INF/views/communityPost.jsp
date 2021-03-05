<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 커뮤니티</title>
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="assets/img/favicon.ico" />
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
    
    <section class="page-section" id="post">
    	<h1 class="masthead-heading text-center text-secondary text-uppercase mb-0"><a class="a-violet" href="${pageContext.request.contextPath}/community">게시판</a></h1>
    	<div class="container">
    		<table class="styled-table">
    			<tbody>
    				<tr>
				    	<td><br><h3>${post.title}</h3></td>
				    </tr>
				    <tr>
				    	<td>작성자 : ${post.author}  &emsp; 날짜 : ${post.date}</td>
				    </tr>
				    <tr>
					    <td><br><br>${post.content} <br>
					    <br><br><br><p align="center">
					    	<button class="bg-violet like-btn rounded text-white" onClick="location.href='${pageContext.request.contextPath}/post/${post.postNo}/like'">추천&nbsp;&nbsp;${post.like}</button>
					    	&emsp;<button class="bg-red like-btn rounded text-white" onClick="location.href='${pageContext.request.contextPath}/post/${post.postNo}/unlike'">비추&nbsp;&nbsp;-${post.unlike}</button></p>
					    <p align="right"> <button type="submit" onClick="location.href='${pageContext.request.contextPath}/communityPostEdit/${post.postNo}'" class="btn btn-default bg-violet text-white">글 수정</button> </p></td>
				    </tr>
				    <tr> <td>
				    	<div class="row">
					    <div class="col-12">
					      <div class="comments">
					        <div class="comments-details">
					          <span class="total-comments comments-sort">117개의 댓글</span>
					        </div>
					        <div class="comment-box add-comment">
					          <span class="commenter-pic">
					            <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					          </span>
					          <span class="commenter-name">
					            <input type="text" placeholder="여기에 댓글을 입력하세요." name="Add Comment">
					            <button type="submit" class="btn btn-default bg-violet">댓글 달기</button>
					            <button type="cancel" class="btn btn-default">취소</button>
					          </span>
					        </div>
					        <div class="comment-box">
					          <span class="commenter-pic">
					            <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					          </span>
					          <span class="commenter-name">
					            <a class="a-violet" href="#">코로나맨1</a> <span class="comment-time">2시간 전</span>
					          </span>       
					          <p class="comment-txt more">1번째 댓글 테스트</p>
					          <div class="comment-meta">
					            <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
					            <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
					            <button class="comment-reply reply-popup"><i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
					          </div>
					          <div class="comment-box add-comment reply-box">
					            <span class="commenter-pic">
					              <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					            </span>
					            <span class="commenter-name">
					              <input type="text" placeholder="Add a public reply" name="Add Comment">
					              <button type="submit" class="btn btn-default bg-violet">답글달기</button>
					              <button type="cancel" class="btn btn-default reply-popup">취소</button>
					            </span>
					          </div>
					        </div>
					        <div class="comment-box">
					          <span class="commenter-pic">
					            <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					          </span>
					          <span class="commenter-name">
					            <a class="a-violet" href="#">코로나맨2</a> <span class="comment-time">2시간 전</span>
					          </span>       
					          <p class="comment-txt more">ABCDEFGHIJKLMNOPQRSTUVWXYZ.</p>
					          <div class="comment-meta">
					            <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
					            <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
					            <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
					          </div>
					          <div class="comment-box replied">
					            <span class="commenter-pic">
					              <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					            </span>
					            <span class="commenter-name">
					              <a class="a-violet" href="#">코로나맨1</a> <span class="comment-time">1시간 전</span>
					            </span>       
					            <p class="comment-txt more">테스트 TEST 테스트 TEST</p>
					            <div class="comment-meta">
					              <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
					              <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
					              <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
					            </div>
					            <div class="comment-box replied">
					              <span class="commenter-pic">
					                <img src="${pageContext.request.contextPath}/resources/assets/img/favicon.ico" class="img-fluid">
					              </span>
					              <span class="commenter-name">
					                <a class="a-violet" href="#">코로나맨2</a> <span class="comment-time">29분 전</span>
					              </span>       
					              <p class="comment-txt more">굿</p>
					              <div class="comment-meta">
					                <button class="comment-like"><i class="fa fa-thumbs-o-up" aria-hidden="true"></i> 99</button>
					                <button class="comment-dislike"><i class="fa fa-thumbs-o-down" aria-hidden="true"></i> 149</button> 
					                <button class="comment-reply"><i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
					              </div>
					            </div>
					          </div>
					        </div>
					      </div>
					    </div>
					  </td>
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
    <script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script>
		// Reply box popup JS
		$(document).ready(function(){
		  $(".reply-popup").click(function(){
		    $(".reply-box").toggle();
		  });
		});
	</script>
</body>
</html>