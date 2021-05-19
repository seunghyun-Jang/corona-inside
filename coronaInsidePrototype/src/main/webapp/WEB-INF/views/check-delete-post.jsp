<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	if(!session.getAttribute("username").equals(author)) {
		alert("작성자가 아니면 글을 삭제하실 수 없습니다!")
		window.location.href = 'post/' + postNo;
	}
	var password = prompt("비밀번호를 입력하세요");
	
	if(password.equals(session.getAttribute("password"))) {
		var choice = confirm("삭제하시겠습니까?");
		
		if(choice) {
			window.location.href = 'do-deletepost/' + postNo;
		} else {
			alert("취소되었습니다!")
			window.location.href = 'post/' + postNo;
		}
	} else {
		alert("비밀번호가 틀렸습니다!")
		window.location.href = 'post/' + postNo;
	}
</script>
</head>
<body>
</body>
</html>