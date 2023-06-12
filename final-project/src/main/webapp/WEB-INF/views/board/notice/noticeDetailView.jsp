<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
​
        table * {margin:5px;}
        table {width:100%;}
    </style>
</head>
<body>
        
<%@ include file="../../common/menubar.jsp" %>
​
    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>게시글 상세보기</h2>
            <br>
​
            <a class="btn btn-secondary" style="float:right;" href="list.no">목록으로</a>
            <br><br>
​
            <table id="contentArea" align="center" class="table">
                <tr>
                    <th width="100">제목</th>
                    <td colspan="2">${b.boardTitle }</td>
                    <td align="right"><button id="bookmarkButton"><span id="bookmarkIcon"></span></button></td>
                </tr>
                <tr>
                    <th>작성자</th>
                    <td>${b.deptName }</td>
                    <th>작성일</th>
                    <td>${b.createDate }</td>
                </tr>
                <tr>
                    <th>첨부파일</th>
                    <td colspan="3">
                        <a href="${at.changeName }" download="${at.originName }">${at.originName}</a>
                    </td>
                </tr>
                <tr>
                    <th>내용</th>
                    <td colspan="3"></td>
                </tr>
                <tr>
                    <td colspan="4"><p style="height:150px;">${b.boardContent }</p></td>
                </tr>
            </table>
            <br>
​
            <div align="center">
                <!-- 수정하기, 삭제하기 버튼은 이 글이 본인이 작성한 글일 경우에만 보여져야 함 -->
         		<a class="btn btn-primary" onclick="formSubmit(1);">수정하기</a>
	            <a class="btn btn-danger" onclick="formSubmit(2);">삭제하기</a>
            </div>
            <br><br>
            
            <script>
            // 수정/삭제시 글번호와 첨부파일 번호 보내기
            function formSubmit(num){
            	var formObj = $("<form>");
            	
            	var boardNo = $("<input>").prop("type", "hidden").prop("name", "boardNo").prop("value", "${b.boardNo}");
            	var filePath = $("<input>").prop("type","hidden").prop("name","filePath").prop("value","${at.changeName}")
            	var obj = formObj.append(boardNo);
            	
            	if(num == 1){ // 수정
            		obj.attr("action","updateForm.no").attr("method","get");
            	}else{ // 삭제
            		obj.append(filePath);
            		obj.attr("action","delete.no").attr("method","post");
            	}
            	
            	$("body").append(obj);
            	
            	obj.submit();
            
            	}
            
            </script>
​
            <table id="replyArea" class="table" align="center">
                <thead>
                    <tr>
	                   <th colspan="2">
	                       <textarea class="form-control" name="replyContent" id="reply-input" cols="55" rows="2" style="resize:none; width:100%;"></textarea>
	                   </th>
	                   <th style="vertical-align:middle"><button class="btn btn-secondary" id="reply-btn" onclick="insertReply();">등록하기</button></th>
                    </tr>
                    <tr>
                        <td colspan="3">댓글(<span id="rcount"></span>)</td>
                    </tr>
                </thead>
                <tbody>
                    <!-- 댓글출력 -->
                </tbody>
            </table>
        </div>
        <br><br>
    </div>
    
     <!-- 댓글 수정/삭제 모달시작 -->
   	<div class="modal fade" id="updateReply-modal" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
				
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">댓글 수정</h4>
				    </div>
				    <div class="modal-body">
				    
				      	<div class="form-group">
		                    <label for="update_replyNo">댓글 번호</label>
		                    <input class="form-control" id="update_replyNo" name="replyNo" readonly>
		                </div>
		                <div class="form-group">
		                    <label for="update_replyContent">댓글 내용</label>
		                    <input class="form-control" id="update_replyContent" name="replyContent">
		                </div>
		                <div class="form-group">
		                    <label for="update_replyWriter">댓글 작성자</label>
		                    <input class="form-control" id="update_replyWriter" name="replyWriter" readonly>
		                </div>
				      
				    </div>
				    <div class="modal-footer">
				      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="updateReply()">수정</button>
				      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="deleteReply()">삭제</button>
				    </div>
			    
			    
			  </div>
		</div>
	</div>
  <!-- 댓글 수정/삭제 모달 끝 -->

   
     <script>
     // 댓글 입력창 빈칸일때 알람
 	$("#reply-btn").click(function(){
 		chkblankReply =$("#reply-input").val();
 		if(chkblankReply.length==0){
 			alert("댓글을 입력해주세요.")
 		}
 	});
     
    // 댓글불러오기
    $(function(){
    	selectReplyList();
    	
    });
    	function selectReplyList(){
    		
	    	$.ajax({
	    		url : "replyList.no",
	    		data : {
	    			boardNo : "${b.boardNo}"
	    		},
	    		success : function(list){
	    			
	    			var str = "";    				
	    			for(var i in list){
	    				str += "<tr id='reply-row'>"
	    					+ "<td id='replyNo-data'>" + list[i].replyNo + "</td>"
	    					+ "<th id='replyWriter-data'>" + list[i].deptName + " " + list[i].userName + "</th>"
	    					+ "<td id='replyContent-data'>" + list[i].replyContent + "</td>"
	    					+ "<td>" + list[i].createDate + "</td>";
	    					
	    				/* if (${loginUser.userNo} == list[i].replyWriter) {
	    		            str += 
	    		            	"<td><button type='button' class='btn btn-xs btn-success' data-toggle='modal' data-target='#updateReply-modal'>댓글 수정</button></td>"
	    				}
 */
	    		          str += "<td><button type='button' id='update-modal-btn' class='btn btn-xs btn-success' data-toggle='modal' data-target='#updateReply-modal'>댓글 수정</button></td>"
	    		        	 + "</tr>";
	    			}
	    			
	    			
	    			$("#replyArea tbody").html(str);
	    			$("#rcount").text(list.length);
	    		
	    		},
	    		error : function(){
	    			console.log("통신오류");
	    		}
	    	});
    
    	};
    	
    
    // 댓글쓰기
   function insertReply(){
    	
    	$.ajax({
    		url : "insertReply.no",
    		data : {
    			replyWriter : "1",
    			replyContent : $("#reply-input").val(),
    			refBno : "${b.boardNo}"
    		},
    		success : function(result){
    			if(result == "success"){
	    			selectReplyList();
	    			$("#reply-input").val("");
    			}
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    	
    }
    
    // 댓글 수정 모달에 정보 띄우기
   $("#replyArea button[id=update-modal-btn]").on("click", function () {
	    var reply = $(this).parent();
	    console.log(this);

	    var replyNo = reply.find("#replyNo-data").text();
	    var replyContent = reply.find("#replyContent-data").text();
	    var replyWriter = reply.find("#replyWriter-data").text();

	    $("#update_replyNo").val(replyNo);
	    $("#update_replyContent").val(replyContent);
	    $("#update_replyWriter").val(replyWriter);

	});
    
    // 댓글 수정
   function updateReply(){
    	
    	$.ajax({
    		url : "updqteReply.no",
    		data : {
    			replyNo : $("#update_replyNo").val(),
    			replyContent : $("#update_replyContent").val()
    		},
    		success : function(result){
    			if(result == "success"){
    				selectReplyList();
    			}
    		},
    		error : function(){
    			console.log("통신오류");	
    		}
    	});
    	
    }
    
    // 즐겨찾기여부 불러오기
    $(function(){
    	selectBookmark();
    });
    
    function selectBookmark(){
    	
    	$.ajax({
    		url : "bookmark.no",
    		data : {
    			boardNo : "${b.boardNo}",
    			userNo : /* "${loginUser.userNo}" */ "1"
    		},
    		success : function(result){
    			console.log("통신성공");
    			
    			if(result == "Y"){ // 즐겨찾기 한 글이라면 빨간 아이콘
    				var icon = $('<i>').addClass('fa-solid fa-bookmark').css('color', '#e91616');
    			    $('#bookmarkIcon').append(icon);
    			}else{ // 즐겨찾기 안했으면 빈 아이콘
    			    var icon = $('<i>').addClass('fa-regular fa-bookmark');
    			    $('#bookmarkIcon').append(icon);  
    			}
    			
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    };
    // 즐겨찾기 추가 또는 즐겨찾기 해제
    
    $("#bookmarkButton").click(function(){
    	
    	$.ajax({
    		url : "checkBookmark.no",
    		data : {
    			boardNo : "${b.boardNo}",
    			userNo : /* "${loginUser.userNo}" */ "1"
    		},
    		success : function(result){
    			if(result == 'I'){ // 즐겨찾기 추가한 경우
    				window.alert("즐겨찾기에 추가되었습니다.");
    				$('#bookmarkIcon').remove();
    			}else if(result == "D"){ // 즐겨찾기 해제한 경우
    				window.alert("즐겨찾기에서 해체되었습니다.");
    				$('#bookmarkIcon').remove();
    			}else{
    				console.log("즐겨찾기 기능 실패");
    			}
    			
    			selectBookmark();
    			location.reload();
    		},
    		error : function(){
    			console.log("통신오류");
    		}
    	});
    });
   
    </script>
</body>
</html>
