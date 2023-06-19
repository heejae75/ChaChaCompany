<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보낸쪽지함</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<!-- icon cdn -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
	.messenger_content {
	    background-color:#0E6251;
	    width:100%;
	    height: 750px;
	    margin:auto;
	}
	.innerOuter {
	    border:1px solid lightgray;
	    width:80%;
	    height:100%;
	    margin:auto;
	    padding:3% 7%;
	    background-color:white;
	}
    
    /* navi + 검색창 영영  */    
	.innerOuter>#msg_header{
		width:100%;
		height: 130px;
		margin-top: 10px;
		margin-bottom : 10px;
	}
    /* navi 영역 */
    #msg_header>#msg_nav{
       	width: 25%;
       	height: 100%;
       	float : left;
    }
        
	#msg_nav>ul{
		list-style-type: none;
		padding: 0;
		margin : 0;
		
	}
        
    #msg_nav li a{
		text-decoration-line: none;
		color: black;
		font-size: 20px;
		font-weight: 700;
	}

	#msg_nav li a:hover{
		font-size :23px;
		color: #009966;	
	}

	/* msg_search area */
    #msgSearchForm{
		width: 75%;
        height: 100%; 
        float : left;
         
   	}
      
     #msgSearchForm>form{
      	width:100%;
      	height:100%;
      	display : flex; /* 중앙정렬 방법 - 부모 요소 고정 */
      	justify-content: left; /* 자식 요소들 가운데로 이동  */
		align-items: center;
	}
      
    form>.custom-select{
    	width: 20%;
    	float:left;
    	margin-right:5px;
	}
      
    form .form-control{
    	width: 40%;
    	float:left;
    	margin-right: 5px;
	}
	
	/* list- button 영역 */
	#msg_list>#msg_btn_area{
		width : 100%;
		margin-top : 10px;
		margin-bottom :20px;
	}  
  
	#sendMsgList {
      	text-align:center;
	}
      
    #sendMsgList>tbody>tr:hover {
      	cursor:pointer;
   	}
	
	#pagingArea {
      
      width:fit-content;
      margin:auto;
   	}
        
      
</style>
</head>
<body>
	<div class="messenger_content">
	<div class="innerOuter">
		<h2 style="font-weight:800;">쪽지</h2> 
		<div id="msg_header">
			<!-- 쪽지 네비영역 -->
			<div id="msg_nav">
				<ul>
					<li><a href="insert.mg">쪽지쓰기</a></li>
					<li><a href="list.mg">받은쪽지함</a></li>
					<li><a href="slist.mg">보낸쪽지함</a></li>
					<li><a href="tlist.mg">휴지통</a></li>
				</ul>
			</div>
	        <!-- 쪽지 검색 영역 -->
	        <div id="msgSearchForm">
		        <form action="sendSearch.mg" method="get">
		        	<select id="option-box" class="custom-select" name="category">
		            	<option value="writer">작성자</option>
						<option value="title">제목</option>
		           	</select>
		            <input type="text" class="form-control" name="keyword" value="${keyword}" required>
		            <input type="hidden" name="userNo" value="${loginUser.userNo }">
					<button type="submit" class="btn btn-secondary">검색</button>
		    	</form>
	        </div>
		</div>	
		<c:if test="${not empty category}">
		<script>
			$(function(){
				$("#option-box option[value='${catecory}']").attr("selected", true);	
			})
		</script>
		</c:if>	
		<div id="msg_list">
			<div id="msg_btn_area">
				<button type="button" id="sendMsg-delete" class="btn btn-danger">삭제</button>
			</div>
			
            <table id="sendMsgList" class="table table-hover">
                <thead>
                    <tr>
                        <th width="10%">선택</th>
                        <th width="10%">받는사람</th>
                        <th width="40%">제목</th>
                        <th width="15%"></th>
                        <th width="25%">날짜</th>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty msgList}">
                			<tr>
	               				<td colspan ="5">조회된 쪽지가 없습니다.</td>
	               			</tr>
                		</c:when>
                		<c:otherwise>
                			<c:forEach var="m" items="${msgList}">
                				<tr>
                					<td onclick="event.cancelBubble=true"><input type="checkbox" style="width:15px; height:15px;"></td>
			                        <td>${m.receiver}<input type="hidden" value="${m.messengerNo}"></td>
	                        		<td style="text-align:left;">${m.msgTitle}</td>
			                        <td><c:choose>
			                        		<c:when test="${m.readStatus eq 'Y' }">
			                        		 	읽음
			                        		</c:when>
			                        		<c:otherwise>
			                        		 읽지 않음
			                        		</c:otherwise>
			                        	</c:choose>
			                        </td>
			                        <td>${m.sendDate}</td>
                				</tr>
                			</c:forEach>
                		</c:otherwise>
                	</c:choose>
                </tbody>
            </table>
		</div>  
		
		<script>
			/* 상세페이지 이동 스크립트  */
			$(function(){
				$("#sendMsgList>tbody ").on("click", "td", function(){
					//console.log($(this).siblings().eq(1).children().val()); msgNo 확인용 
					
					var msgNo = $(this).siblings().eq(1).children().val();
					
					location.href="messenger.mg?msgNo="+msgNo;
					
				});
			});	
			
			/* 선택 삭제 스크립트  */
			$(function(){
				var msgNoArr = []; //쪽지 번호를 담아줄 배열 생성 
				
				$("#sendMsgList>tbody td").on("click","input[type=checkbox]", function(){
					
					var $msgNo = $(this).parent().siblings().eq(0).children().val();
					
					if($(this).prop("checked")==true){
						msgNoArr.push($msgNo);
					}else{
						for(var i = 0 ; i< msgNoArr.length ; i++){
							if(msgNoArr[i]=== $msgNo){
								msgNoArr.splice(i,1);
							}							
						}
					}
				});
				
				$("#sendMsg-delete").on("click",function(){
					if(msgNoArr.length == 0){
						alert("삭제하실 쪽지를 선택해주세요")
					}else{
						if(confirm("쪽지를 삭제하시겠습니까?")){
							
							$.ajax({
								url : "sendMsgUpdate.mg",
								
								type :"get",
	            				
	            				traditional: true, //배열 넘기는 옵션
								
	            				data : {msgNoArr : msgNoArr},
								
								success : function(result){
									if(result == "YYYY"){
										if(confirm("쪽지가 삭제되었습니다. 휴지통으로 이동하시겠습니까?")){
											location.href="tlist.mg";
										}
									}else{
										alert("쪽지 삭제에 실패하였습니다. 다시 시도해 주세요 ")
									}
									
									location.reload();
								},
								
								error : function(){
									console.log("통신 실패")
								}
							
							});
						}
					}
					
					
				});
			});
			
			
			
		
		</script> 
		<div id="board-pagebar-area">
            <div id="pagingArea">
                <ul class="pagination">
                	<c:choose>
                		<c:when test="${pi.currentPage eq 1 }">
		                    <li class="page-item disabled"><a class="page-link">이전</a></li>
                		</c:when>
                		<c:otherwise>
		                    <li class="page-item"><a class="page-link" href="slist.mg?currentPage=${pi.currentPage-1}">이전</a></li>
                		</c:otherwise>
                	</c:choose>
                	<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">	
	                    <li class="page-item"><a class="page-link" href="slist.mg?currentPage=${p}">${p}</a></li>
                	</c:forEach>
                	<c:choose>
                		<c:when test="${pi.maxPage eq pi.currentPage}">
		                    <li class="page-item disabled"><a class="page-link">다음</a></li>
                		</c:when>
                		<c:otherwise>
		                    <li class="page-item"><a class="page-link" href="slist.mg?currentPage=${pi.currentPage+1}">다음</a></li>
                		</c:otherwise>
                	</c:choose>
                </ul>
            </div>

		</div>
            <br clear="both"><br>
        </div>
	</div>
</body>
</html>