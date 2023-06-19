<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>결재함</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/final3/resources/css/Approval_EnrollList.css" >
</head>
<body id="body-pd">
	<%@ include file="../common/menubar.jsp" %>
    <div class="content">
        <div id="board">
            <h1 style="padding-top: 20px;">결재 문서</h1>
            <br><br><br><br><br><br>
                         
            <div id="board-list-area">
            
                <table id="board-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th width="70px">번호</th>
                            <th width="70px">양식명</th>
                            <th width="140px">설명</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="t" items="${list}" varStatus="status">
                        	<tr>
                        		<td width="70px">${status.count}</td>
                        		<td width="70px">${t.docName}</td>
                        		<td></td>
                        		<td width="70px"><button class="btn btn-danger">삭제</button></td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button class="btn btn-success">문서 추가</button> 
            </div>
        </div>
    </div>
	<script>
		$(function(){
			$("#board-list>tbody>tr").click(function(){
				var appNo = $(this).children().eq(0).text();
				
				location.href = "enrollForm.ap?appNo="+appNo;
			});
		});
	</script>
</body>
</html>
