<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/final3/login" method="post">
	<div> 아이디 <input type="text" name="userId" /> </div> 
	<div> 비밀번호 <input type="password" name="userPwd" /> </div> 
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
	<div> <input type="submit" value="로그인"/> </div> 
</form>
</body>
</html>