<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실</title>
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
        
    }
    
    #board-btn-area>button{
   		float: right; 
   		margin-left: 10px;
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
<%@ include file="../../common/menubar.jsp" %>
<body id="body-pd">
    <div class="content">
        <div id="board">
            <h1 style="padding-top: 20px;">자료실</h1> 
            <div id="board-tap-area">
                <ul id="nav-tabs" style="float:left;">
					<li class="nav-item">
						<a class="nav-link" aria-current="page" href="#">공지사항</a>
					</li>
					<li class="nav-item">
					 	<a class="nav-link active" id="link_active" href="home.cm">자료실</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="#">대여</a>
					</li>
					<li class="nav-item">
						<a class="nav-link">커뮤니티</a>
					</li>
				</ul>
            </div>

            <div id="board-search-area">
                <form action="" >
                    <div id="option-box" align="right" >
                        <select id="dept_code" class="btn btn-secondary dropdown-toggle" style="background-color: white; color:#0c0d0d; height: 38px; margin-right: 3px;">
                            <option>부서선택</option>
                            <option value="D1">기타</option>
                            <option value="D2">회계관리부</option>
                            <option value="D3">마케팅부</option>
                            <option value="D4">국내영업부</option>
                            <option value="D5">해외영업부</option>
                            <option value="D6">기술지원부</option>
                            <option value="D7">총무부</option>
                            <option value="D8">회계부</option>
                            <option value="D9">인사관리부</option>
                        </select>
                    </div>
                    <div id="search-box">
                        <input type="text" class="form-control" id="search-input"> <button class="btn btn-secondary" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg"></i></button><!-- icon 사이즈 변경 fa-2xs /xs / sm / lg/ xl/ 2xl -->
                    </div>
                </form>
            </div>
            <!-- 관리자에게만 보이도록 조건 걸기  -->
            <div id="board-btn-area">
                <button class="btn btn-danger">삭제</button> <button class="btn btn-success" onclick="location.href='enroll.dc'">작성</button>               
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
                            <th>다운로드</th>
                            <th>프린트</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                        <tr>
                            <td>1</td>                        
                            <td>[중요]재직증명서 신청 양식</td>      
                            <td>인사팀</td>      
                            <td>10</td>
                            <td>2023-05-30</td>
                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
                            <td><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></td>
                        </tr>
                        <tr>
                            <td>1</td>                        
                            <td>[일반]재직증명서 신청 양식</td>      
                            <td>인사팀</td>      
                            <td>10</td>
                            <td>2023-05-30</td>
                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
                            <td><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></td>
                        </tr>
                        <tr>
                            <td>1</td>                        
                            <td>재직증명서 신청 양식</td>      
                            <td>인사팀</td>      
                            <td>10</td>
                            <td>2023-05-30</td>
                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
                            <td><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></td>
                        </tr>
                        <tr>
                            <td>1</td>                        
                            <td>재직증명서 신청 양식</td>      
                            <td>인사팀</td>      
                            <td>10</td>
                            <td>2023-05-30</td>
                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
                            <td><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></td>
                        </tr>
                        <tr>
                            <td>1</td>                        
                            <td>재직증명서 신청 양식</td>      
                            <td>인사팀</td>      
                            <td>10</td>
                            <td>2023-05-30</td>
                            <td><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i></td>      
                            <td><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></td>
                        </tr>
                        
                    </tbody>
                </table>
            </div>
            <br><br>
            <div id="board-pagebar-area">
                <div id="pagingArea">
                    <ul class="pagination">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                        <li class="page-item"><a class="page-link" href="#">1</a></li>
                        <li class="page-item"><a class="page-link" href="#">2</a></li>
                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                        <li class="page-item"><a class="page-link" href="#">4</a></li>
                        <li class="page-item"><a class="page-link" href="#">5</a></li>
                        <li class="page-item"><a class="page-link" href="#">Next</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <br><br><br>
    </div>
</body>
</html>


