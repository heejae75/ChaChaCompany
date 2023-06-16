<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 상세페이지 </title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
	
	.document-content{
	  	width : 100%;
	  	height: 100%;
	}
  	
  	/* navi */
  	#board-tap-area{
  		width: 100%;	
  		margin:auto;
  	}
  
  
	#board-tap-area>ul{
		padding-top : 50px;
		height : 100px;
		list-style-type : none;
	}
	
	#board-tap-area>h1{
		padding-top : 50px;
		width : 10%;
		float : left;
		
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
    
     /* 버튼영역 */
    #board-btn-area{
       width: 100%;
       height: 50px;
       text-align:center;
    }

    #board-btn-area>button{
        margin: 20px 10px 20px 10px;
    }
	
	select,input,textarea{
		padding: 0;
		border: 0;
	}

	/* 테이블 영역 */
	#document-detail{
		width : 100%;
		margin-top:40px;
    }
    
    #document-detail div{ /* => document-table-area */
        width: 80%;
        margin: auto;
    }
    
    #document-table{
    	width : 100%;
		
    }
    
    #document-table td{
    	height : 50px;
    	border : 3px solid black;
    }
    </style>
    
</head>
<%@ include file="../../common/menubar.jsp" %>
<body id="body-pd">
    <div class="content">
        <div class="document-content">
            <div id="board-tap-area">
            	<h1>자료실</h1>
                <ul id="nav-tabs">
				  	<li class="nav-item">
				    	<a class="nav-link" aria-current="page" href="list.no">공지사항</a>
				 	</li>
				  	<li class="nav-item">
				    	<a class="nav-link active" id="link_active" href="list.dc">자료실</a>
				  	</li>	
				  	<li class="nav-item">
				    	<a class="nav-link" href="#">대여</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link">커뮤니티</a>
				  	</li>
				</ul>
			</div>

			<div id="document-detail">
	            <div id="document-table-area">
	                <table id="document-table" border="1">
	                    <thead>
	                        <tr>
	                            <td width="10%" style="text-align: center;"><b>${b.deptName}</b></td>
	                            <c:choose>
		                            <c:when test="${b.importanceLevel eq 'I'}">
			                            <td width="65%"><b style="color: red;">[중요]</b> &nbsp; ${b.boardTitle}</td>      
		                            </c:when>
		                            <c:otherwise>
		                                <td width="65%"><b>[일반]</b> &nbsp; ${b.boardTitle}</td>
		                            </c:otherwise>
	                            </c:choose>      
	                            <td width="10%" style="text-align: center;">작성일</td>
	                            <td width="15%" style="text-align: center;">${b.createDate}</td>
	                        </tr>
	                        <tr>
	                            <td colspan="2"></td>
	                            <td style="text-align: center;" >${b.count}</td>
	                            <td style="text-align: center;"><button class="btn btn-secondary"><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></button></td>
	                        </tr>
	                    </thead>
	                    <tbody>
                        	<tr>
                           		<td colspan="4">
                       	 			<c:forEach var="at" items="${atList}">
	                            	<a href="/final3${at.filePath}" download="${at.originName}">${at.originName}</a><br>
                     				</c:forEach>		
                           		</td>
                       		</tr>
	                        <tr>
	                            <td colspan="4"><textarea class="form-control" style="resize: none; width: 100%; height: 300px;" readonly> ${b.boardTitle} </textarea></td>
	                        </tr>
	                    </tbody>
	                </table>
	            </div>
	        </div>
	        
	         <!-- 관리자에게만 보이도록 조건 걸기  -->
            <div id="board-btn-area">
		    	<button class="btn btn-danger" onclick="documentDelete();">삭제</button> 
		    	<button type="submit" class="btn btn-success" onclick="location.href='update.dc?bno='+${b.boardNo}">수정</button>               
		    </div>
		    <script>
		    /* 게시글 삭제 이벤트  */
		    function documentDelete(){
		    	
		    	var bno=${b.boardNo};
		    	
		    	if(confirm("게시글은 삭제후 복구가 불가능 합니다. 삭제 하시겠습니까?")){
			    	$.ajax({
						url: "delete.dc",
						
						data : {bno : bno},
						
						success : function(result){
							console.log(result);
							
							if(result="YYYY"){
								alert("삭제가 완료되었습니다.")
							}else{
								alert("삭제에 실패하였습니다 다시 시도해주세요")

							}
								location.href="/final3/list.dc";
								
						},
						
						error : function(){
							console.log("통신실패")
						}
			    		
		    		
			    	});
		    		
		    	}
		    }
		    </script>
        </div>
        
        <br><br><br>
    </div>
</body>
</html>


