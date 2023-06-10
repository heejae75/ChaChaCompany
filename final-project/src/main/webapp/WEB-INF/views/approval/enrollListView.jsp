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
    
  <style>

 
   
   /* 버튼영역 */
    #board-btn-area{
        width: 80%;
        margin: auto;
        margin-bottom: 20px;
    }
    
    /* 게시글 목록영역 */
    #board-list-area{
        width: 80%;
        margin: auto;
    }
    
    #board-list{
        text-align:center;
    }

    #pagingArea {
        width:fit-content; 
        margin:auto;
    }

    </style>


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
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="a" items="${list}">
                        	<tr>
                        		<td width="70px">${a.docNo}</td>
                        		<td width="70px">${a.docType}</td>
                        		<td></td>
                        		<td><button class="btn btn-danger">삭제</button></td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
                <button class="btn btn-success">문서 추가</button> 
            </div>
            <br><br>
            <div id="board-pagebar-area">
                <div id="pagingArea">
                    <ul class="pagination">
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq 1 }">
		                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    		</c:when>
                    		<c:when test="${!empty status}">
                    			<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage-1}">Previous</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${pi.currentPage-1}">Previous</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1"> 
                    		<c:if test="${!empty status}">
		                        <li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${p}">${p}</a></li>
                    		</c:if>
                    		<c:if test="${empty status}">
		                        <li class="page-item"><a class="page-link" href="enrollList.ap?currentPage=${p}">${p}</a></li>
                    		</c:if>
                    	</c:forEach>
                    	
                       <c:choose>
                			<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>                		
							</c:when>
							<c:when test="${!empty status}">
								<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage+1}">Next</a></li>                		
                    		</c:when>
                			<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage+1}">Previous</a></li>
							</c:otherwise>
                		</c:choose>
                        
                        
                    </ul>
                </div>
            </div>
        </div>
        <br><br><br>
    </div>
	
</body>
</html>
