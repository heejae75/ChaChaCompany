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

    /*navibar*/
	#board-tap-area{
		width: 80%;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		height : 42px;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #board-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #board-tap-area>ul li a{
    	text-align: center; 	
    }
    
    li:hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	
	#link_active{
		border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6; 
		border-bottom: none;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem;
	}
	
	/*검색영역*/
    #board-search-area>form{
        width: 80%;
        margin:auto;
        margin-top:20px;
    }
    
    #option-box{
        width: 40%;
        float: left;
    }
    #dept_code{
        margin-left: 5px;
    }
    #search-box{
        width: 60%;
        float: left;
    }

    #search-input{
        width: 30%;
        float: left;
    }
   
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
            <h1 style="padding-top: 20px;">결재함</h1>
            <br><br><br><br><br><br>
            
            <div id="board-tap-area">
                <ul class="nav-tabs">
                	<li class="nav-item">
                      <a class="nav-link" href="list.ap">전체</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.ap?status=N">예고함</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.ap?status=P">진행함</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.ap?status=Y">완료함</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.ap?status=R">반려함</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.ap?status=T">임시함</a>
                    </li>
                </ul>

            </div>

            
            <!-- 관리자에게만 보이도록 조건 걸기
            <div id="board-btn-area">
                <button class="btn btn-danger">삭제</button> <button class="btn btn-success">이동</button>               
            </div>
              -->
            <div id="board-list-area">
            
                <table id="board-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th>문서번호</th>
                            <th>부서</th>
                            <th>문서종류</th>
                            <th>제목</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <c:forEach var="a" items="${list}">
                        	<tr>
                        		<td>${a.docNo}</td>
                        		<td>${a.deptCode}</td>
                        		<td>${a.docType }</td>
                        		<td>${a.docTitle }</td>
                        		<td>${a.createDate}</td>
                        	</tr>
                        </c:forEach>
                    </tbody>
                </table>
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
                    			<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage-1}&status=${status}">Previous</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage-1}">Previous</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}" step="1"> 
                    		<c:if test="${!empty status}">
		                        <li class="page-item"><a class="page-link" href="list.ap?currentPage=${p}&status=${status}">${p}</a></li>
                    		</c:if>
                    		<c:if test="${empty status}">
		                        <li class="page-item"><a class="page-link" href="list.ap?currentPage=${p}">${p}</a></li>
                    		</c:if>
                    	</c:forEach>
                    	
                       <c:choose>
                			<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled"><a class="page-link" href="#">Next</a></li>                		
							</c:when>
							<c:when test="${!empty status}">
								<li class="page-item"><a class="page-link" href="list.ap?currentPage=${pi.currentPage+1}&status=${status}">Next</a></li>                		
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
