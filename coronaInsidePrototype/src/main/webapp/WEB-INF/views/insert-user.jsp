<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
   prefix="sec"%>

<%@ page import="kr.ac.hansung.dto.*"%>
<%@ page import="kr.ac.hansung.dao.*"%>
<%@ page import="kr.ac.hansung.model.*"%>

<%@ page import="java.io.PrintWriter"%>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%-- <jsp:useBean id="User" class="kr.ac.hansung.dto.UserVO" scope="page" /> 
 --%>
<jsp:useBean id="User" class="kr.ac.hansung.model.CustomUserDetails"
	scope="page" />

<jsp:setProperty name="User" property="user_id" />

<jsp:setProperty name="User" property="user_pw" />

<jsp:setProperty name="User" property="username" />

<!DOCTYPE html>

<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title></title>

</head>

<body>
	<%
		CustomUserDetails user = new CustomUserDetails();
	%>


</body>

</html>