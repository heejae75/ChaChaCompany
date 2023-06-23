<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 상세페이지 </title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

  <style>
	
	.content{
	  	width: 1570px;
		margin-top:-105px;
	}
	
	/* 이전으로버튼 */
   #boardList-btn{
   		margin-right: 150px;
   		text-align: right;
   }
   #boardList-btn > button{
   		background-color: #0E6251;
   		color: white;
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
		display: flex;
	}
	
    #board-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #board-tap-area>ul li a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;	
    }
    
   #board-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	
	#board-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
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

	/* 게시글영역 */
    #board-detail-area{
        width: 80%;
        margin: auto;
        margin-top : 10px;
    }
    
    #document-table{
    	font-size: 16px;
    
    }
    
    #document-table a{
    	text-decoration: none;
    	color : black;
    }
    </style>
    
</head>
<%@ include file="../../common/menubar.jsp" %>
	<div class="content">
		<div id="board-tap-area">
            <ul id="nav-tabs"  class="nav-tabs nav-pills">
				<li role="presentation">
					<a href="list.no">공지사항</a>
				</li>
				<li role="presentation" class="active">
	 				<a href="list.dc">자료실</a>
				</li>
				<li role="presentation">
					<a href="list.re">대여</a>
				</li>
				<li role="presentation">
					<a href="#">커뮤니티</a>
				</li>
			</ul>
		</div>
		<br>
     	<div id="boardList-btn">
   			<button class="btn btn-sm" onclick="location.href='list.dc'">목록으로</button>
		</div>
		<br>
        <div id="board-detail-area">
			<table id="document-table" class="table" align="center">
                 <thead>
                     <tr>
                         <td width="10%" style="text-align: center;"><b>제목</b></td>
                         <c:choose>
                          <c:when test="${b.importanceLevel eq 'I'}">
                           <td width="65%"><b style="color: red;">[중요]</b> &nbsp; ${b.boardTitle}</td>      
                          </c:when>
                          <c:otherwise>
                              <td width="65%"> &nbsp; ${b.boardTitle}</td>
                          </c:otherwise>
                         </c:choose>      
                         <td width="10%" style="text-align: center;">조회수</td>
                         <td style="text-align: center;" >${b.count}</td>
                     </tr>
                     <tr>
                         <td style="text-align: center;"><b>작성자</b></td>
                         <td> &nbsp; ${b.deptName}</td>
                         <td style="text-align: center;">작성일</td>
                         <td style="text-align: center;">${b.createDate}</td>
                         
                     </tr>
                 </thead>
                 <tbody>
             		<tr>
             			<td style="text-align: center;"><b>첨부파일</b></td>
                    	<td></td>
                    	<td style="text-align: center;">프린트</td>
                       	<td style="text-align: center;"><button class="btn btn-secondary" style="background-color: white;"><i class="fa-sharp fa-solid fa-print fa-lg" style="color: #0c0d0d;"></i></button></td>
           			</tr>
           			<tr>
          				<td colspan="4">
                  	 		<c:forEach var="at" items="${atList}">
                        		<ul>
                        			<li><a href="/final3${at.filePath}" download="${at.originName}">${at.originName}</a></li>
                        		</ul>
                			</c:forEach>		
                   		</td>
           			</tr>
                 	<tr>
                 		<td colspan="4" style="padding-left: 40px;"><p style="height:300px;"> ${b.boardContent} </p></td>
                 	</tr>
                 </tbody>
        	</table>
	    <hr>   
       	</div>
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
								location.href="/final3/member/list.dc";
								
						},
						
						error : function(){
							console.log("통신실패")
						}
			    		
		    		
			    	});
		    		
		    	}
		    }
		</script>
	</div>
</body>
</html>


