<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
	.outer{
        width: 30%;
        margin: auto;
        margin-top: 10%;
	}
</style>
</head>
<body>
	<div class="outer">
        <h1>KH COMPANY ERP</h1>
        <br><br>
		<form action="/final3/login" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" /> 
			<div>
				<label for="userId">ID</label>
				<input type="text" class="form-control" placeholder="아이디를 입력해주세요" name="userId" id="userId"/>
			</div> 
			<div>
				<label for="userPwd">Password</label>
				<input type="password" class="form-control" placeholder="비밀번호를 입력해주세요" name="userPwd" id="userPwd"/>
			</div>
				<!-- 로그인 실패 메세지 띄워주기 -->
				<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
					<font color="red">
				  		${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</p>
						<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
					</font>
				</c:if>
			<div class="form-group form-check">
				<label class="form-check-label">
      				<input class="form-check-input" type="checkbox"> Remember me
      			</label>
			</div>
			<input type="submit" class="btn btn-primary" value="로그인"/>
		</form>
	</div>
</body>
</html>