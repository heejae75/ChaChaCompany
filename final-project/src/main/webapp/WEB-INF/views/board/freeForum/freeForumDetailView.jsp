<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>게시글 상세 페이지</title>
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
		margin-bottom: 30px;
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
    
    #board-tap-area a{
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
	.outer{
		width: 80%;
		height: 800px;
		margin : auto;
	}
	#category_div{
		font-size : 20px;
		font-weight : 900;
	}
	#title_div{
		font-size : 45px;
		font-weight : 900;
	}
	#info_div{
		float : right;
		width : 250px;
		height : 100px;
		border : 2px solid black;
	}
	.outer>div div{
		float:left;
	}
	.table-responsive{
        width: 100%;
        margin : auto;
    }
	.table-responsive th{
        text-align: center;
    }
    #like_div{
    	margin-top : 80px;
    	text-align : center;
    }
    #like_div button{
    	width : 100px;
    	text-align : center;
    }
</style>
</head>
<body id="body-pd">
<%@ include file="../../common/menubar.jsp" %>
 
	<div class="content">
		<div id="board-tap-area">
			<ul id="nav-tabs"  class="nav-tabs nav-pills">
				<li role="presentation">
					<a href="list.no">공지사항</a>
				</li>
				<li role="presentation">
				 	<a href="list.dc">자료실</a>
				</li>
				<li role="presentation">
					<a href="list.re">대여</a>
				</li>
				<li role="presentation" class="active">
					<a href="list.fr">커뮤니티</a>
				</li>
			</ul>
		</div>
		<div class=outer>
			<div id="inner_div1">
				<div>
					<div id="category_div">
						[${board.categoryName}]
					</div>
					<br>
					<div id="title_div">
						${board.boardTitle}
					</div>
				</div>
				<div id="info_div">
					<div class="table-responsive">
						<table class="table">
							<thead>
								<tr>
									<th style="width:80px">조회</th>
									<th style="width:110px">좋아요</th>
									<th style="width:80px">댓글</th>
								</tr>
							</thead>
					        <tbody>
								<tr>
									<th>${board.count}</th>
									<th>${recommend}</th>
									<th>234</th>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<br><br><br><br>
			<div id="content_div">
				${board.boardContent}
			</div>
			<br><br>
			<br>
			<div id="like_div">
				<button id="recommend_btn" type="button" class="btn btn-info" onclick="recommend()">좋아요[${recommend}]</button>
				<button id="deprecated_btn" type="button" class="btn btn-danger" onclick="deprecated()">싫어요[0]</button>
			</div>
		</div>
	</div>
	
<script>

	
	$(function(){
		$(".page-link").eq(${pi.currentPage}).css('color', 'red');
	});
	
	$(".table>tbody>tr").click(function(){
		var dv = event.currentTarget;
		var boardNo = dv.children[0].innerText
		location.href = "/final3/${role}/detailList.fr?boardNo=" + boardNo;
	});
	
	function recommend(){
		$.ajax({
			url : "recommend.fr",
			type : "post",
			data : {
				boardNo : "${board.boardNo}"
			},
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(result){
				if(!isNaN(result)){
					$("#recommend_btn").text("좋아요[" + result + "]");
				}else{
					alert(result);
				}
			}
		});
	}
	
	function deprecated(){
		$.ajax({
			url : "deprecated.fr",
			type : "post",
			data : {
				boardNo : "${board.boardNo}"
			},
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(result){
				if(!isNaN(result)){
					$("#deprecated_btn").text("싫어요[" + result + "]");
				}else{
					alert(result);
				}
			}
		});		
	}
</script>	
</body>
</html>
