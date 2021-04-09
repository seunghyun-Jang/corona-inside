<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import ="kr.ac.hansung.cse.*" %>

<%@ page import="java.io.PrintWriter" %> <!-- 자바스크립트 만들어주기위해 -->

<% request.setCharacterEncoding("UTF-8"); %> <!-- 건너오는 데이터를 UTF-8받기위해 -->

<jsp:useBean id="User" class="kr.ac.hansung.cse.UserVO" scope="page" /> <!-- scope는 현페이지에서만 빈즈가 사용되어지도록 제한 -->

<jsp:setProperty name="User" property="username" /> 

<jsp:setProperty name="User" property="password" /> <!-- 로그인 페이지에서 받은 userID PW -->

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>

</head>

<body>

    <%

    UserDAO userDAO = new UserDAO();
   // UserVO vo = new UserVO();
    int result = userDAO.loginCheck(User);
    if(result == 1){
        PrintWriter pout = response.getWriter();
        session.setAttribute("username",User.getUsername());
        pout.println("<script>");
        pout.println("location.href='home.jsp'");
        pout.println("</script>");
    }
    else if(result == 0){
        PrintWriter pout = response.getWriter();
        pout.println("<script>");
        pout.println("alert('가입되지 않은 아이디입니다.')");
        pout.println("history.back()");
        pout.println("</script>");
    }
    else if(result == -1){
        PrintWriter pout = response.getWriter();
        pout.println("<script>");
        pout.println("alert('비밀번호가 일치하지 않습니다.')");
        pout.println("history.back()");
        pout.println("</script>");
    }
    else if(result == -2){
        PrintWriter pout = response.getWriter();
        pout.println("<script>");
        pout.println("alert('데이터베이스 오류가 발생했습니다. 잠시 후에 다시 시도해주세요.')");
        pout.println("history.back()");
        pout.println("</script>");
    }
    %>


</body>

</html>