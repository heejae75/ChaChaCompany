<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>당신은 권한이 없습니다~</h1>
	<p>principal : <sec:authentication property="principal"/></p>
	<p>사용자 아이디: <sec:authentication property="principal.username"/></p>
	<p> 사용자 권한 리스트: <sec:authentication property="principal.authorities"/></p>
	<script>
		setTimeout('mainPage()', 3000);
		console.log("123");
		console.log("${loginUser.userId}");
		function mainPage(){
			location.href="/final3/member/mainPage";
		}
	</script>
</body>
</html>