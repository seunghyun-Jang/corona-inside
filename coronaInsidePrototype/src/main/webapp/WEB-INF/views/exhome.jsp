<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<title>Test page</title>
		<style>
	    	table {
	    		position:absolute; top:50%; left: 51%; transform:translate(-50%, -50%);
	   			text-align:center;
	   			border-collapse: separate;
 				border-spacing: 20px 20px;
	    	}
	    	button {
	    		width: 160px;
	    		height: 100px;
	    		font-size:16px;
	    		font-weight: bold;
	    		border-radius: 15px;
	    		box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2), 0 6px 20px 0 rgba(0,0,0,0.19);
	    	}
	    </style>
	</head>
	<body>

		<table>
			<tr>
				<td><button type="button" onclick="location.href='coronaCurrent'">코로나<br>현황</button></td>
				<td><button type="button" onclick="location.href='community'">커뮤니티</button></td>
			</tr>
			<tr>
				<td><button type="button" onclick="location.href='selfcheck'">셀프<br>방역점수 체크</button></td>
				<td><button type="button" onclick="location.href='faq'">FAQ</button></td>
			</tr>
		</table>
	</body>
</html>
