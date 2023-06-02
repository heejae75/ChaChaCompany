<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 상세페이지 </title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
	
	#document-detail{
        width: 100%;
        height: 100%;
    }
    
    #document-detail div{
        width: 80%;
        margin: auto;
    }

    /* navi 영역 */
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
    
    /* btn-area */
    #board-btn-area{
        text-align: center;
    }

    #board-btn-area>button{
        margin: 20px 10px 20px 10px;
    }
    /* table-area */
    #document-table>table{
        width:100%
    }

    </style>
    
</head>
<%@ include file="../../common/menubar.jsp" %>
<body id="body-pd">
    <div class="content">
        <div id="document-detail">
            <h1 style="padding-top: 20px;">자료실</h1>
            <div id="board-tap-area">
                <ul id="nav-tabs">
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
            <br>
            
            <div id="document-table">
            	<form action="" method="">
                <table border="1">
                    <thead>
                        <tr>
                            <td width="10%" style="text-align: center;">인사팀</td>      
                            <td width="65%"> &nbsp; 재직증명서 신청 양식</td>      
                            <td width="10%" style="text-align: center;">작성일</td>
                            <td width="15%" style="text-align: center;">2023-05-30</td>
                        </tr>
                        <tr>
                            <td colspan="2"></td>
                            <td style="text-align: center;" >10</td>
                            <td style="text-align: center;"><i class="fa-solid fa-download fa-lg " style="color : #0c0d0d"></i> &nbsp; &nbsp; &nbsp; 
                                                            <i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i>
                            </td>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td colspan="4">
                                <br>
                                <div id="file-area" style="margin-left: 0;">
                                    <input type="file" download="">
                                    <input type="file" download="">
                                    <input type="file" download="">
                                    <input type="file" download=""> 
                                </div>
                                <br>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4"><textarea style="resize: none; width: 100%; height: 200px;" readonly> 게시글 내용 영역 </textarea></td>
                        </tr>

                    </tbody>
                </table>
	            <div id="board-btn-area">
	                <button class="btn btn-secondary">취소</button> <button class="btn btn-success">수정하기</button>               
	            </div>
	       		</form>
            </div>
            
        </div>
        <br><br><br>
    </div>
</body>
</html>




