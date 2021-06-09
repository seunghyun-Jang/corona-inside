<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<title>Corona Inside : 커뮤니티</title>
	<link rel="stylesheet" href="../resources/css/bootstrap.min.css">
	<!-- Favicon-->
    <link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon_covid.ico" />
    <!-- Font Awesome icons (free version)-->
    <script src="${pageContext.request.contextPath}/resources/js/all.min.js" crossorigin="anonymous"></script>
    <link href="${pageContext.request.contextPath}/resources/css/all.min.css" rel="stylesheet">
	<!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
	<!-- Core theme CSS (includes Bootstrap)-->
    <link href="${pageContext.request.contextPath}/resources/css/styles.css" rel="stylesheet" />
    
</head>
<body id="page-top">

	<!-- Navigation-->
   <!-- Navigation-->
   <nav
      class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
      id="mainNav">
      <div class="container">
         <a class="navbar-brand js-scroll-trigger" style="padding-left: 10px;"
            href="${pageContext.request.contextPath}home">Corona Inside</a>
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
                     href="${pageContext.request.contextPath}/login">로그인</a></li>
               </sec:authorize>
               <sec:authorize access="isAuthenticated()">
                  <li class="login-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger login-displayusername-mobile">
                  <sec:authentication property="principal.nickname" /> 님 환영합니다.</a></li> 
                  <li class="nav-item login-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                  href="${pageContext.request.contextPath}/logout">로그아웃</a></li>
               </sec:authorize>
              <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-non-selected"
                  href="${pageContext.request.contextPath}/corona">코로나 현황</a></li>
               <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-non-selected"
                  href="${pageContext.request.contextPath}/vaccine">백신현황</a></li>
               <li class="nav-item mx-0 mx-lg-1"><a
                  class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger text-selected"
                  href="${pageContext.request.contextPath}/community">
                  	<i class="fas fa-chevron-right sel-icons"></i> 커뮤니티 <i class="fas fa-chevron-left sel-icons"></i></a></li>

            </ul>

         </div>
         <sec:authorize access="isAuthenticated()">
            <p class="login-displayusername">
               <sec:authentication property="principal.nickname"/>
               님 <br>환영합니다.
            </p>
         </sec:authorize>
         
         <sec:authorize access="isAnonymous()">
            <button class="bg-primary rounded text-white login-btn"
               id="login-btn" onClick="location.href='${pageContext.request.contextPath}/login'">로그인</button>
         </sec:authorize>
         <sec:authorize access="isAuthenticated()">
            <button class="bg-primary rounded text-white login-btn"
               id="login-btn" onClick="location.href='${pageContext.request.contextPath}/logout'">로그아웃</button>
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
                <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                <div class="divider-custom-line"></div>
            </div>
        </div>
    </header>
    
    <section class="page-section" id="post">
    	<div class="container">
    		<h2 class="masthead-heading text-secondary text-uppercase mb-4-5"><a class="a-violet" href="${pageContext.request.contextPath}/community">커뮤니티</a></h2>
    		<table class="styled-table">
    			<tbody>
    				<tr>
				    	<td><br><h3>${post.title}</h3></td>
				    </tr>
				    <tr>
				    	<td>작성자 : ${post.author}  &emsp; <i class="far fa-clock"></i> ${post.datetime}</td>
				    </tr>
				    <tr>
					    <td>
						    <br><br>${fn:replace(post.content, replaceChar, "<br>")} <br><br><br><br>
						    <p class="p-like" align="center">
						    	<button class="btn-like rounded text-white" onClick="doPostLike('like')">추천&nbsp;&nbsp;${post.likeCount}</button>
						    	&emsp;<button class="btn-unlike rounded text-white" onClick="doPostLike('unlike')">비추&nbsp;&nbsp;-${post.unlikeCount}</button>
						    </p>
						    <p align="right">
						    	<sec:authorize access="isAuthenticated()">
						    		<sec:authentication property="principal.username" var="username"/>
						    		<c:if test="${username.equals(post.username)}">
								    	<button type="button" class="btn btn-default bg-blue text-white"
								    		onClick="location.href='${pageContext.request.contextPath}/community-post-edit/${post.postNo}'">글 수정</button>
								    	<button type="button" class="btn btn-default bg-gray text-white"
								    		onClick="clickDeleteBtn(${post.postNo})">글 삭제</button>
							    	</c:if>
						    	</sec:authorize>
						    </p>
						</td>
				    </tr>
				    <tr> <td style="padding-bottom: 50px;">
				    	<div class="col-12">
					      <div class="comments">
					        <div class="comments-details">
					          <span class="total-comments comments-sort">${fn:length(replies)}개의 댓글</span>
					        </div>
					        <div class="comment-box add-comment">
					          <span class="commenter-name p-left">
					          	<sf:form method="post" action="${pageContext.request.contextPath}/do-reply" modelAttribute="reply">
					          	
				              		<sf:input class="control" type="text" placeholder="여기에 답글을 입력하세요." name="Add Comment" path="content"/>
				              		<sf:errors class="error" path="content"/>
				              		<sf:input class="control" type="hidden" path="parentId" value="${0}"/>
									<sf:errors class="error" path="parentId"/>
									<sf:input class="control" type="hidden" path="postNo" value="${post.postNo}"/>
									<sf:errors class="error" path="postNo"/>
									<sf:input class="control" type="hidden" path="author" value="${username}"/>
									<sf:errors class="error" path="author"/>
									
				              		<button type="submit" class="btn btn-default bg-violet">답글달기</button>
				              	</sf:form>
					          </span>
					        </div>
					        
					        <c:forEach var="best_reply" items="${best_replies}">
					        	<div class="comment-box-best">
					        		<span class="commenter-name nametag">
						            	<span class="best-comment">BEST <i class="far fa-star"></i></span><a class="a-violet" href="#"> ${best_reply.author}</a> <span class="comment-time">${best_reply.date}</span>
						          	</span>       
						          	<p class="comment-txt more">
						          		<c:if test="${best_reply.parentId != 0}"><a class="a-violet a-bg-violet" href="#">@${best_reply.parentAuthor}</a>&nbsp; </c:if>
						          		${best_reply.content}
						          	</p>
						          	<div class="comment-meta likeb-${best_reply.replyId}">
						            	<button class="comment-like" onClick="doReplyLike('like', '${best_reply.replyId}', ' .likeb-${best_reply.replyId}')"><i class="far fa-thumbs-up" aria-hidden="true"></i>&nbsp;${best_reply.likeCount}</button>
						            	<button class="comment-dislike" onClick="doReplyLike('unlike', '${best_reply.replyId}', ' .likeb-${best_reply.replyId}')"><i class="far fa-thumbs-down" aria-hidden="true"></i>&nbsp;${best_reply.unlikeCount}</button> 
						            	<button class="comment-reply" onClick="replyToggle('reply-${best_reply.replyId}')"><i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
						          	</div>
						          	
						          	<div id="reply-${best_reply.replyId}" class="comment-box add-comment reply-box">
						            	<span class="commenter-name">
							            	<sf:form method="post" action="${pageContext.request.contextPath}/doreply" modelAttribute="reply">
							              		<sf:input class="control" type="text" placeholder="여기에 답글을 입력하세요." name="Add Comment" path="content"/>
							              		<sf:errors class="error" path="content"/>
							              		<sf:input class="control" type="hidden" path="parentId" value="${best_reply.replyId}"/>
												<sf:errors class="error" path="parentId"/>
												<sf:input class="control" type="hidden" path="groupNo" value="${best_reply.groupNo}"/>
												<sf:errors class="error" path="groupNo"/>
												<sf:input class="control" type="hidden" path="postNo" value="${best_reply.postNo}"/>
												<sf:errors class="error" path="postNo"/>
												<sf:input class="control" type="hidden" path="author" value="${username}"/>
												<sf:errors class="error" path="author"/>
												<button type="submit" class="btn btn-default bg-violet">답글달기</button>
							              		
							              	</sf:form>
							              	<button type="cancel" class="btn btn-default" onClick="replyToggle('reply-${best_reply.replyId}')">취소</button>
						            	</span>
						          	</div>
						        </div>
					        </c:forEach>
					        
					        
					        <c:forEach var="reply" items="${replies}">
					        	<c:choose>
				    				<c:when test="${reply.parentId == 0}"><div class="comment-box"></c:when>
				    				<c:otherwise><div class="comment-box replied"></c:otherwise>
				    			</c:choose>
						          	<span class="commenter-name nametag">
						            	<a class="a-violet" href="#">${reply.author}</a> <span class="comment-time">${reply.date}</span>
						          	</span>       
						          	<p class="comment-txt more">
						          		<c:if test="${reply.parentId != 0}"><a class="a-violet a-bg-violet" href="#">@${reply.parentAuthor}</a>&nbsp; </c:if>
						          		${reply.content}
						          	</p>
						          	<div class="comment-meta like-${reply.replyId}">
						            	<button class="comment-like" onClick="doReplyLike('like', '${reply.replyId}', ' .like-${reply.replyId}')">
						            		<i class="far fa-thumbs-up" aria-hidden="true"></i>&nbsp;${reply.likeCount}</button>
						            	<button class="comment-dislike" onClick="doReplyLike('unlike', '${reply.replyId}', ' .like-${reply.replyId}')">
						            		<i class="far fa-thumbs-down" aria-hidden="true"></i>&nbsp;${reply.unlikeCount}</button> 
						            	<button class="comment-reply" onClick="replyToggle('reply-${reply.replyId}')">
						            		<i class="fa fa-reply-all" aria-hidden="true"></i> 답글달기</button>         
						          	</div>
						          	
						          	<div id="reply-${reply.replyId}" class="comment-box add-comment reply-box">
						            	<span class="commenter-name">
							            	<sf:form method="post" action="${pageContext.request.contextPath}/do-reply" modelAttribute="reply">
							              		<sf:input class="control" type="text" placeholder="여기에 답글을 입력하세요." name="Add Comment" path="content"/>
							              		<sf:errors class="error" path="content"/>
							              		<sf:input class="control" type="hidden" path="parentId" value="${reply.replyId}"/>
												<sf:errors class="error" path="parentId"/>
												<sf:input class="control" type="hidden" path="groupNo" value="${reply.groupNo}"/>
												<sf:errors class="error" path="groupNo"/>
												<sf:input class="control" type="hidden" path="postNo" value="${reply.postNo}"/>
												<sf:errors class="error" path="postNo"/>
												<sf:input class="control" type="hidden" path="author" value="${username}"/>
												<sf:errors class="error" path="author"/>
												<button type="submit" class="btn btn-default bg-violet">답글달기</button>
							              		
							              	</sf:form>
							              	<button type="cancel" class="btn btn-default" onClick="replyToggle('reply-${reply.replyId}')">취소</button>
						            	</span>
						          	</div>
						          </div>
					        </c:forEach>
					        
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
       	<div class="container"><small>Corona-Inside 2021</small></div>
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
		function replyToggle(id) {
			obj=document.getElementById(id);
			$(obj).slideToggle("normal");
		}
		
		function doPostLike(todo) {
			var req = new XMLHttpRequest();
			var page = "${pageContext.request.contextPath}/post/${post.postNo}";
			if(todo == "like") {
				page += "/do-postlike";
			}
			else if(todo == "unlike") {
				page += "/do-postunlike";
			}
			req.open("GET", page);
			req.onreadystatechange = function() {
				if (req.readyState == 4 && req.status == 200) {
					$(".p-like").load(window.location.href + " .p-like");
				}
			}
			req.send();
		}
		
		function doReplyLike(todo, replyId, id) {
			var req = new XMLHttpRequest();
			var page = "${pageContext.request.contextPath}/post/" + replyId;
			if(todo == "like") {
				page += "/do-replylike";
			}
			else if(todo == "unlike") {
				page += "/do-replyunlike";
			}
			req.open("GET", page);
			req.onreadystatechange = function() {
				if (req.readyState == 4 && req.status == 200) {
					$(id).load(window.location.href + id);
				}
			}
			req.send();
		}
		
		function clickDeleteBtn(postNo) {
			var choice = confirm("삭제하시겠습니까?");
				
			if(choice) {
				doDelete(postNo);
				alert("삭제되었습니다!");
			} else {
				alert("취소되었습니다!");
			}
		}
		
		function doDelete(postNo) {
			window.location.href = '${pageContext.request.contextPath}/do-deletepost/' + postNo;
			
		}
		
	</script>
</body>
</html>