<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
  <style>
	.content{
        width: 1570px;
        background-color: khaki;
    }
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
<%@ include file="../../common/menubar.jsp" %>
 
    <div class="content">
        <div id="board">
            <h1>공지사항</h1>
            <div id="board-tap-area">
                <ul id="nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="#">공지사항</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.dc">자료실</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">대여</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">자유게시판</a>
                    </li>
                </ul>

            </div>

            <div>
                <form action="list.no" id="board-search-area" method="get">
                    <div id="option-box" align="right" >
                    <input type="hidden" name="currentPage" value="1">
                        <select name="status" id="dept_code" class="btn btn-secondary dropdown-toggle" style="background-color: white; color:#0c0d0d; height: 38px; margin-right: 3px;">
                            <option>부서선택</option>
                            <option value="D1">인사관리부</option>
                            <option value="D2">회계관리부</option>
                            <option value="D3">마케팅부</option>
                            <option value="D4">국내영업부</option>
                            <option value="D5">해외영업부</option>
                            <option value="D6">기술지원부</option>
                            <option value="D7">총무부</option>
                            <option value="D8">회계부</option>
                            <option value="D9">기타</option>
                        </select>
                    </div>
                    <div id="search-box">
                        <input type="text" name="keyword" class="form-control" id="search-input" value="${keyword }"> 
                        <button type="submit" class="btn btn-secondary" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg"></i></button><!-- icon 사이즈 변경 fa-2xs /xs / sm / lg/ xl/ 2xl -->
                    </div>
                </form>
            </div>
            
            <!-- 검색어 select값 유지 -->
            <c:if test="${not empty status }">
				<script>
				$(function(){
					
					$("#board-search-area option").each(function(){
						if($(this).val()=="${status}"){
							$(this).attr("selected", true);
						}
					});
					
					
				});
				</script>
			</c:if>
            
            <!-- 관리자에게만 보이도록 조건 걸기  -->
            <div id="board-btn-area">
                <button class="btn btn-danger">삭제</button> <button class="btn btn-success">작성</button>               
            </div>
            <div id="board-list-area">
                <table id="board-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                            <th>첨부파일</th>
                            <th>즐겨찾기</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                    	<c:forEach var="n" items="${list }">
	                        <tr onclick="location.href='detail.no?nno=${n.boardNo }'">
	                            <td>${n.boardNo }</td>                            
	                            <td align="left">
	                            	<c:if test="${n.importanceLevel eq 'I' }">
	                            		<button type="button" class="btn btn-danger btn-sm" disabled style="background-color: #c42d2d">중요</button>
	                            	</c:if>
	                            ${n.boardTitle }</td>      
	                            <td>${n.deptName }</td>
	                            <td>${n.count }</td>
	                            <td>${n.createDate }</td>
	                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
	                            <td><input type="checkbox"></td>
	                        </tr>
                       </c:forEach>
                        
                        
                    </tbody>
                </table>
            </div>
            <br><br>
            <!-- 검색어 조건으로 페이징처리 -->
            <div id="board-pagebar-area">
                <div id="pagingArea">
                    <ul class="pagination">
	                    <c:choose>
							<c:when test="${empty status }">
							 	<li id="previous-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage - 1 }">Previous</a></li>
							</c:when>
							<c:otherwise>
								<li id="previous-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage - 1 }&status=${status }&keyword=${keyword}">Previous</a></li>
							</c:otherwise>
						</c:choose>
						
						<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }" step="1">
							<c:choose>
								<c:when test="${empty status }">
									<li class="page-item"><a class="page-link" href="list.no?currentPage=${p }">${p }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link" href="list.no?currentPage=${p }&status=${status }&keyword=${keyword}">${p }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
		                    	
                       <c:choose>
							<c:when test="${empty status }">
								<li id="next-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage + 1 }">Next</a></li>
							</c:when>
							<c:otherwise>
								<li id="next-btn" class="page-item"><a class="page-link" href="list.no?currentPage=${pi.currentPage + 1 }&status=${status }&keyword=${keyword}">Next</a></li>
							</c:otherwise>
						</c:choose>
						
                    </ul>
                </div>
            </div>
            
            <!-- 현재페이지에 따라 이전/다음버튼 disabled처리 -->
            <c:if test="${pi.currentPage eq 1 }">
            	<script>
            		$(function(){
            			$("#previous-btn>a").removeAttr('href');
            		});
            	</script>
            </c:if>
            
            <c:if test="${pi.currentPage eq pi.maxPage }">
            	<script>
            		$(function(){
            			$("#next-btn>a").removeAttr('href');
            		});
            	</script>
            </c:if>
            
            
        </div>
        <br><br><br>
    </div>

</body>
</html>
