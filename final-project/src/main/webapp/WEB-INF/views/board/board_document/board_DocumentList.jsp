<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실</title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link href="resources/css/document-modal.css" rel="stylesheet">
  <style>
	
	.document-area{
		width : 100%;
		height : 100%;
		
	}
	/*navibar*/
	#board-tap-area{
		width: 80%;
		height : 50px;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		margin : 0;
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
	#board-search-area{
		width:100%;
		height: 50px;
	}
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
        height : 50px;
        margin: auto;
    }
    
    #board-btn-area>button{
   		float: right; 
   		margin-left: 10px;
        margin-bottom : 10px;
    }
    
    /* 게시글 목록영역 */
    #board-list-area{
        width: 80%;
        margin: auto;
    }
    
    #board-list,#icon-list{
        text-align:center;
    }
	
	#board-list-area>#board-list{
		width:80%;
		float:left;
		
	}
	
	#board-list-area>#icon-list{
		width:20%;
		margin-left:0px;
		margin-right:0px;
		
	}
	
    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
    
    #icon-list i:hover{
    	font-size: 25px;
    }
	
    </style>
</head>
<%@ include file="../../common/menubar.jsp" %>
<body id="body-pd">
    <div class="content">
        <div class="document-area">
            <h1 style="padding-top: 20px;">자료실</h1> 
            <div id="board-tap-area">
                <ul id="nav-tabs" style="float:left;">
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
            
           	<!-- 검색창 영역  -->
            <div id="board-search-area">
                <form action="search.dc" method="get">
                    <div id="option-box" align="right" >
                        <select id="dept_code" name="deptCode" class="btn btn-secondary dropdown-toggle" style="background-color: white; color:#0c0d0d; height: 38px; margin-right: 3px;">
                            <option value="전체">전체</option>
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
                        <input type="text" name="keyword" class="form-control" id="search-input" value="${keyword}"> <button type="submit" class="btn btn-secondary" style="background-color: #0E6251; margin-left: 2px;"><i id="search-icon" class="fa-solid fa-magnifying-glass fa-lg"></i></button><!-- icon 사이즈 변경 fa-2xs /xs / sm / lg/ xl/ 2xl -->
                    </div>
                </form>
            <c:if test="${not empty deptCode }">
            <script>
            /* 검색시 옵션 고정 script */
            $(function(){
            	$("#option-box option[value = ${deptCode}]").attr("selected",true);
            	
            });
            
            </script>
            </c:if>
            
            </div>
            <!-- 관리자에게만 보이도록 조건 걸기  -->
            <div id="board-btn-area">
                <button class="btn btn-danger" id="document_delete" disabled>삭제</button> <button class="btn btn-success" onclick="location.href='enroll.dc'">작성</button>               
            </div>
            
            <script>
            /* 선택 삭제 script */
            	//체크 박스 선택시 삭제 버튼 활성화 (기본: 비활성화)
             	$(function(){
	            	$("#icon-list>tbody").on("click","input[type=checkbox]",function(){
	            		
	            		$("#document_delete").attr("disabled", false);
	            		
	            	});
	            }); 
				
            	//체크박스 선택시 게시글 번호 배열에 담기 
            	$(function(){
            		
            		var bnoArr = new Array();
            		
            		$("#icon-list>tbody").on("change","input[type=checkbox]",function(){
            			
            			console.log($(this));
            			//게시글 번호 
            			var $bno =$(this).parent().siblings().children().eq(1).val();
            			
	            		var query = 'input[name="select_chk"]:checked';
		            		
	            		//선택된 체크박스 개수 
	            		var selectElements = document.querySelectorAll(query)
	            		console.log("selectElement:",selectElements.length);
	
	            		if($(this).prop("checked")==true){
		            		bnoArr.push($bno);
	            		}else{
	            			
	            			for(let i = 0 ; i<bnoArr.length; i++){
	            				if(bnoArr[i] === $bno){
	            					bnoArr.splice(i,1);
	            				}
	            			}
	            		}
	            		
	            		console.log(bnoArr);
            		});
            		
            		//삭제버튼 클릭시 
            		$("#document_delete").click(function(){
            			console.log(bnoArr);
            			
            		
		        		if(confirm("선택한 게시글을 삭제하시겠습니까?")){
	            			
	            			$.ajax({
	            				url : "selectDelete.dc",
	            				
	            				data : {bnoArr : bnoArr },
	            				
	            				type :"get",
	            				
	            				traditional: true, //배열 넘기는 옵션
	            				
	            				success: function(result){
	            					
	            					if(result='YYYY'){
	            						alert("게시물 삭제가 완료되었습니다.");
	            					}else{
	            						alert("삭제에 실패하였습니다. 다시 시도해주세요");
	            					}
	            					
	            					location.reload();
	            				},
	            				
	            				error : function(){
	            					console.log("통신오류");
	            				}
	            			
	            			})
	            			
	            			
	            		} 
            			
            		});	
            		
            	});
	            
            </script>
            <!-- 리스트 영역 -->
            <div id="board-list-area">
                <table id="board-list" class="table table-hover" align="center">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>조회수</th>
                            <th>작성일</th>
                        </tr>
                    </thead>
                    <tbody align="center">
	                    <c:choose>
	                    	<c:when test="${empty bList}">
	                    		<tr>
	                    			<td colspan="7">조회된 게시글이 없습니다.</td>
	                    		</tr>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<c:forEach var="b" items="${bList}">
	                    		<tr>
		                    		<td>${b.boardNo}</td>
		                    		<c:choose>
		                    			<c:when test="${b.importanceLevel eq 'I'}">
				                            <td><b style="color:red">[중요]</b> ${b.boardTitle}</td>      
		                    			</c:when>
		                    			<c:otherwise>
		                    				<td><b>[일반]</b> ${b.boardTitle}</td>
		                    			</c:otherwise>
		                    		</c:choose>                        
		                            <td><b>[${b.deptName}]</b> ${b.boardWriter}</td>      
		                            <td>${b.count}</td>
		                            <td>${b.createDate}</td>
	                    		</tr>
	                    		</c:forEach>
	                    	</c:otherwise>
	                    </c:choose>
                    </tbody>
                </table>
                <!-- icon 영역 -->
	           	<table id="icon-list" class="table table" align="center">
                    <thead>
                        <tr>
                            <th>다운로드</th>
                            <th>선택</th>
                        </tr>
                    </thead>
                    <tbody align="center">
                   		<c:forEach var="b" items="${bList}">
                		<tr>
                       		<!-- icon 클릭시 첨부파일 리스트 조회 =>다운로드, print 가능하게 구현하기 -->
                       		<td><i id="down" class="fa-solid fa-download fa-lg" style="color : #0c0d0d;"></i>
                       			<input type="hidden" value="${b.boardNo}"></td>
                       		<!-- 관리자에게만 보이도록 조건 걸기  -->
                       		<td><input type="checkbox" class="form-check-input" name="select_chk" style="width: 15px; height:15px"></td>
                		</tr>
                   		</c:forEach>
                    </tbody>
                </table>
           	</div>
                <script>
                	/* detailView 이동 script */
                	$(function(){
                		$("#board-list>tbody ").on("click","tr",function(){
                			
                			var bno = $(this).children().eq(0).text();
                			
                			location.href="detail.dc?bno="+bno;
                			
                		});
                	});
                
                </script>
                <!-- modal 팝업 창 -->
		        <div class="container">
		            <div class="popup-wrap" id="popup"> <!-- 모달을 감싸줄 박스 -->
		                <div class="popup"> <!-- 실질적 모달 팝업 -->
		                    <div class="popup-head"> <!-- 로고영역 -->
		                        <span class="head-title" style="font-size: 30px; color:white;">회사로고</span>
		                    </div>
		                    <div class="popup-body"> <!-- 컨텐츠 영역  -->
		                        <div class="body-content">
		                            <div class="body-titlebox">
		                            	<h3>자료실</h3>
		                            </div>
		                            <div class="body-contentbox">
										<table>
											
										</table>
		                            </div>
		                        </div>
		                    </div>
		                    <div class="popup-foot" align="center"> <!-- 푸터 버튼 영역 -->
		                        <span class="pop-btn-confirm" id="confirm" style="color:white;">확인</span>
		                        <span class="pop-btn-close" id="close" style="color:white;">창닫기</span>
		                    </div>
		                </div>
		            </div>
		        </div>
                
                <script>
                	/* list에서 파일 다운 script */
                	$(function(){
                		
                		$("#confirm").click(function(){
                            modalClose();
                        });
                        
                        $('#close').click(function(){
                            modalClose(); //모달 닫기 함수 호출
                        });

                        function modalClose(){
                            $('#popup').fadeOut(); //페이드아웃 효과 
                        }
                        
                		/* 다운로드 아이콘 클릭시 발생할 이벤트 */
                		$("#icon-list>tbody td").on("click","#down",function(){
                			
                			$("#popup").css('display','flex').hide().fadeIn();
                			
                			var bno = $(this).next().val();
                			
                			
							
                			$.ajax({
                				
                				url : "fileDown.dc",
                				
                			 	data : {
                			 		bno : bno
                			 	},
                			 	
                			 	success : function(result){
                			 		
                			 		var fileList = "";
									
                			 		for(var i in result){
                			 			fileList += "<tr>"
                			 					 + "<td>"+"<a href='/final3"+result[i].filePath+"' download='"+result[i].originName+"'>"+result[i].originName+"</a></td>"   
                			 					 + "</tr>"; 
                			 		
	                			 		$(".body-contentbox>table").html(fileList);
                			 		}
                			 	},
                			 	
                			 	error : function(){
                			 		console.log("통신오류");
                			 	}
                				
                			});
                		
                		});
                	})
                
                </script>
            <br><br><br>
            <div id="board-pagebar-area">
                <div id="pagingArea">
                    <ul class="pagination">
                    	<c:choose>
                    		<c:when test="${pi.currentPage eq 1 }">
		                        <li class="page-item disabled"><a class="page-link">이전</a></li>
                    		</c:when>
                    		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="list.dc?currentPage=${pi.currentPage-1}">이전</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
	                        <li class="page-item"><a class="page-link" href="list.dc?currentPage=${p}">${p}</a></li>
                    	</c:forEach>
                    	<c:choose>
                    		<c:when test="${pi.maxPage eq pi.currentPage}">
		                        <li class="page-item disabled"><a class="page-link">다음</a></li>
                    		</c:when>
                    		<c:otherwise>
		                        <li class="page-item"><a class="page-link" href="list.dc?currentPage=${pi.currentPage+1}">다음</a></li>
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


