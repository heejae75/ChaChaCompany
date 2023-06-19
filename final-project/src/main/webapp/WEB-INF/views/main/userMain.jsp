<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/css/User_main.css" rel="stylesheet"> -->
<style>

	.content{
        width: 1570px;
        height: 800px;
        margin-top: 105px;
/*      background-color: khaki; */
    }


    /* 메인 css */
    .main_profile_area{
        width: 22%;
        height: 800px;
        border-radius: 20px;
        background-color: rgb(203, 235, 216);
        float: left;
    }

    #main_profile img{
        border: 1px solid black;
        width: 200px;
        height: 200px;
        border-radius: 100px;
        margin-top: 80px;
        
    }

    .main_profile_area a{
        text-decoration: none;
        color: black;
        cursor: pointer;
    }

	/* 출퇴근 기록하는 div */
    #main_profile_work {
        background-color: white;
        width: 310px;
        height: 260px;
        border-radius: 20px;
        margin: 13px;
    }

    #mp_work_input button{
        background-color: #0E6251;
        width: 100px;
        border-radius: 50px;
        float: left;
        margin-left: 35px;
    }
    
    /* 메인 가운데 전체 div */
    .content_center{
/*         background-color: gold; */
        float: left;
        width: 800px;
        height: 100%;
        margin-left: 40px;
    }

    /* 최근 온 메일 */
    .main_mail{
        border: 2px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
        margin-bottom: 24px;
    }

    /* 공지사항 */
    .main_notice{
        border: 2px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
        margin-bottom: 24px;
    }
    
    /* 공지사항 탭 메뉴 전체 div */
    #main_user_tab_area{
    	width: 20%;
		margin: 15px 0 0 20px ;
		float:left;
    }
    
    #main_user_tab_area>ul{
		width:100%;
		height : 30px;
		list-style-type : none;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #main_user_tab_area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
        background-color : rgb(203, 235, 216);
/*     	border : 1px solid black; */
    	border-radius: 10px;
    	
    }
    
    
    #notice_new>a, #notice_liked>a{
    	text-decoration: none;
    	color: black;
    	margin-left: 18px;
    	font-size: 20px;
    }
    
    #notice_new:hover, #notice_liked:hover{
    	backgroundcolor: rgb(203, 235, 216);
    }
    
    #others_team>a{
    	text-decoration: none;
    	color: black;
    	margin-left: 15px;
    	font-size: 20px;
    }
    
    #others_all>a{
    	text-decoration: none;
    	color: black;
    	margin-left: 26px;
    	font-size: 20px;
    }
    
    /* 이름 바꿀예정 */
    .main_others{
        border: 2px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
    }

    /* 제목 */
    .main_ctn_title{
        float: left;
		margin: 12px 0 0 25px;
        font-size: 30px;
        font-weight: bold;
    }
    
    /* 플러스 아이콘 */
    .main_ctn_plus{
        float: right;
		margin: 18px 25px;
        cursor: pointer;
    }

    /* 메인 왼쪽 전체 div */
    .content_right{
/*         background-color: lightyellow; */
        float: right;
        width: 350px;
        height: 100%;
        
    }

    /* 일정 */
    .main_calender{
        border: 2px solid black;
        width: 100%;
        height: 523px;
        border-radius: 20px;
        margin-bottom: 26px;
    }

    /* 경조사 */
    .main_event{
        border: 2px solid black;
        width: 100%;
        height: 250px;
        border-radius: 20px;
    }
    
    /* 공지사항 테이블  */
    #mainNoticeList{
    	width: 750px;
    	margin: auto;
    	font-size: 20px;
    }
    
    /* 이메일 테이블  */
    #mainEmailList{
    	width: 750px;
    	margin: auto;
    	font-size: 20px;
    }
    
    #mainOthersList{
/*      	border: 1px solid black;  */
    	width: 750px;
    	height: 80px;
    	margin: auto;
    	text-align:center;
    }
    
    #others_profile_table{
    	margin: auto;
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
        <div class="main_profile_area" align="center">
            <div id="main_profile">
                <img src="https://i.imgur.com/hczKIze.jpg" alt="">
                <p style="font-size: 30px; margin: 0 0 0 0;">${loginUser.userName }</p>
                <p>${loginUser.deptCode } / ${loginUser.jobCode }</p>
                <div>
                    <a href="#">마이페이지</a>
                    <a href="#">로그아웃</a>
                </div>
                <br>
            </div>

            <div id="main_profile_card" align="center">
                <div style="float: left; margin:0 0 0 65px;">
                    <a href="#">
                        <i class="fa-sharp fa-solid fa-address-card" style="color: #000000; font-size: 70px;"></i>
                        <p style="margin:0 0 0 0;">명함 보기</p>
                    </a>
                </div>
                <div>
                    <a href="#">
                        <i class="fa-sharp fa-regular fa-address-card" style="color: #000000; font-size: 70px;"></i>
                        <p style="margin:0 0 0 0;">명함 신청</p>
                    </a>
                </div>
            </div>

            <div id="main_profile_work">
                <div id="mp_sysdate">
                        <br>
                        <p id="user_date" style="font-size: 22px; margin: 0 0 0 0;"></p>
                        <h1 id="user_clock"></h1>
                        <!-- <span style="font-size: 45px; font-weight: bold;"></span> -->
                </div>

                <div id="mp_work_output">
                    <div id="begin_time" style="margin-bottom: 4px;">
                    	<div>
                    		출근 시간 
                    	</div>
                    	<div>
                    		${mainAt.onTime }
                    	</div>
                    </div>
                    <div style="border: 1px solid black; width: 280px;"></div>
                    <div id="end_time" style="margin: 6px 0 12px 0;">
                    	<div>
                    		퇴근 시간 
                    	</div>
                    	<div>
                    		${mainAt.offTime}
                    	</div>
                    </div>
                </div>
                <div id="mp_work_input">
                	<c:choose>
                		<c:when test=""> <!-- 출근 버튼이 찍혔을때 한번만 버튼 누를수 있게 하기 -->
             				
                		</c:when>
                		<c:otherwise> <!-- 출근이 안 찍혔으면 퇴근 버튼 비활성 -->
                			
                		</c:otherwise>
                	</c:choose>
                	<form action="insertGo.ma" method="post">
                 		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <button type="submit" class="btn btn-primary">출근</button>
                    </form>
                    
                    <form action="insertLeave.ma" method="post">
                    	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
	                    <button type="submit" class="btn btn-primary">퇴근</button>
                    </form>
                </div>
            </div>
        </div>
        
        <!-- 메인 가운데 부분 -->
        <div class="content_center">
            <div class="main_mail">
                <div>
                    <div class="main_ctn_title">
                        <span>최근 온 메일</span>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
                
                <table id="mainEmailList"  align="center">
                	<tbody>
                	
                	</tbody>
                </table>
            </div>

            <div class="main_notice">
                <div>
                    <div class="main_ctn_title">
                        <span>공지 사항</span>
                        
                    </div>
                    <div id="main_user_tab_area">
	                    <ul id="nav-tabs">
							<li class="nav-item" id="notice_new" data-tab="mainNoticeList">
							    <a class="nav-link active" id="link_active" aria-current="page" href="#">new </a>
							</li>
							<li class="nav-item" id="notice_liked" data-tab="mainNoticeLikedList">
							    <a class="nav-link" href="#" id="link_active">liked </a>
							</li>
						</ul>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="list.no">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
                
                <table id="mainNoticeList" align="center">
                	<tbody>
                	</tbody>
                </table>
            </div>

            <div class="main_others">
                <div>
                    <div class="main_ctn_title">
                        <span>임직원 조회 </span>
                    </div>
                    <div id="main_user_tab_area">
	                    <ul id="nav-tabs">
							<li class="nav-item" id="others_team" data-tab="mainOthersTemaList">
							    <a class="nav-link active" id="link_active" aria-current="page" href="#">Team </a>
							</li>
							<li class="nav-item" id="others_all" data-tab="mainOthersAllList">
							    <a class="nav-link" href="#" id="link_active">All </a>
							</li>
						</ul>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>

				<table id="mainOthersList"  align="center">
					<tbody>
						
					</tbody>
				</table>
            </div>
        </div>

        <!-- 메인 오른쪽 부분 -->
        <div class="content_right">
            <div class="main_calender">
                <div>
                    <div class="main_ctn_title">
                        <span>일정</span>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="main_event">
                <div>
                    <div class="main_ctn_title">
                        <span>경조사</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="modal fade" id="others_profile" tabindex="-1"  role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">정보</h4>
				</div>
				<div class="modal-body" id="other_profile_body">
					<table border=1 id="others_profile_table" class="table">
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기 </button>
<!-- 					<button type="button" class="btn btn-primary">변경 </button> -->
				</div>
			</div>
		</div>
	</div>
    
    <script>
	  	//자바스크립트 실시간 시계
	    function getTime() {
	        const clock = document.getElementById("user_clock");
	        const date = document.getElementById("user_date");
	        const time = new Date();
	        const weekList = ['일', '월', '화', '수', '목', '금', '토'];
	        const calendar = time.getFullYear() + "년 " + (time.getMonth()+1) + "월 " + time.getDate() +"일 " + weekList[time.getDay()] + "요일";
	        let amPm = "AM";
	        let hours = addZeros(time.getHours(),2);
	        const minutes = addZeros(time.getMinutes(),2);
	        const seconds = addZeros(time.getSeconds(),2);
	
	        if(hours >= 12) {
	            amPm="PM"
	            hours = addZeros(hours-12,2);
	        }
	
	        date.innerHTML = calendar;
	        clock.innerHTML = amPm + " " + hours + ":" + minutes + ":" + seconds;
	
	        setTimeout(getTime, 1000);
	   }
	
	   function addZeros(num, digit){
	        let zero = "";
	        num = num.toString();
	        if(num.length < digit) {
	            for(let i =0; i<digit - num.length; i++){
	                zero += "0";
	            }
	        }
	        return zero + num;
	   }
	   getTime();
	   
	   
	   //최근 온 메일 조회 
	   $(function() {
		  
		  mainEmailList();
		  
		  $("#mainNoticeList>tbody").on("click","tr", function() {
			  //console.log($(this).children().eq(0).children().val());
			  var boardNo = $(this).children().eq(0).children().val();
			  location.href="detail.no?boardNo="+boardNo;
		  })
	   });
	   
	   /* function mainNoticeBoardList() {
		   $.ajax({
			   url : "mainNoticeList.ma",
			   success : function(result) {
				   var str = "";
				   
				   for(var i in result) {
					   str += "<tr>"
					   		+ "<td>" + result[i].boardTitle + "</td>"
					   		+ "<td>" + result[i].boardWriter + "</td>"
					   		+ "<td>" + result[i].createDate + "</td>"
					   		+ "</tr>"
				   }
				   
				   $("#mainNoticeList tbody").html(str);
			   },
			   error : function() {
				   console.log("통신 실패 ");
			   }
		   });
	   } */
	   
	   //메일 최신순으로 조회
	   function mainEmailList() {
		   $.ajax({
			   url : "mainEmailList.ma",
			   type : "POST",
			   beforeSend : function(xhr)
	            {
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
			   success : function(result) {
				   var str = ""
				   
				   for(var i in result) {
					   str += "<tr>"
					   		+ "<td style='width:60%; '>" + result[i].emailTitle + "</td>"
					   		+ "<td style='width:20%; text-align:right; '>" + result[i].sender + "</td>"
					   		+ "<td style='width:20%; text-align:right;'>" + result[i].sendDate + "</td>"
					   		+ "</tr>"
				   }
				   
				   $("#mainEmailList tbody").html(str);
			   },
			   error : function() {
				   console.log("통신 실패 ");
			   }
		   });
	   }
	   
	   /* 공지사항 탭  */
	   /* 공지사항 최신 순 탭  */
	    $(function() {
	    	$("#notice_new").click(function(){
	    		var activeTab = $(this).attr("data-tab");
 	    		$("#notice_liked").css("background-color", "rgb(203, 235, 216)"); //모든 탭의 배경색 초기화
	    		$(this).css("background-color", "#0E6251"); // 클릭한 탭의 배경색 변경
	    		$.ajax({
	 			   url : "mainNoticeList.ma",
	 			   type : "POST",
				   beforeSend : function(xhr)
		            {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
	 			   success : function(result) {
	 				   
	 				   var str = "";
	 				   
	 				   for(var i in result) {
	 					   str += "<tr>"
	 					   		+ "<td><input type = 'hidden' value='"+result[i].boardNo+"'></td>"
	 					   		+ "<td style='width:60%; '>" + result[i].boardTitle + "</td>"
	 					   		+ "<td style='width:20%; text-align:right; '>" + result[i].boardWriter + "</td>"
	 					   		+ "<td style='width:20%; text-align:right;'>" + result[i].createDate + "</td>"
	 					   		+ "</tr>"
	 				   }
	 				   
	 				   $("#mainNoticeList tbody").html(str);
	 			   },
	 			   error : function() {
	 				   console.log("통신 실패 ");
	 			   }
	 		   });
	    		
	    	})
	    		$("#notice_new").click();
	    });
	   
	   /* 공지사항 즐겨찾기한 탭  */
	   $(function() {
		   $("#notice_liked").click(function() {
			   var activeTab = $(this).attr("data-tab");
	    		$("#notice_new").css("background-color", "rgb(203, 235, 216)"); //모든 탭의 배경색 초기화
	    		$(this).css({"background-color": "#0E6251", "color":"white"});  // 클릭한 탭의 배경색 변경
			   $.ajax({
				   url : "mainNoticeLiked.ma",
				   type : "POST",
				   beforeSend : function(xhr)
		            {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
				   success : function(result) {
					   console.log(result);
					   var str ="";
					   
					   for(var i in result) {
	 					   str += "<tr>"
	 					   		+ "<td><input type = 'hidden' value='"+result[i].boardNo+"'></td>"
	 					   		+ "<td style='width:60%; '>" + result[i].boardTitle + "</td>"
	 					   		+ "<td style='width:20%; text-align:right; '>" + result[i].boardWriter + "</td>"
	 					   		+ "<td style='width:20%; text-align:right;'>" + result[i].createDate + "</td>"
	 					   		+ "</tr>"
	 				   }
					   
					   $("#mainNoticeList tbody").html(str);
				   },
	 			   error : function() {
	 				   console.log("통신 실패 ");
	 			   }
			   });
		   });
	   });
	   
	   //임직원 조회
	   //팀원 조회 
	   $(function() {
		   $("#others_team").click(function() {
			   var activeTab = $(this).attr("data-tab");
			   $("#others_all").css("background-color", "rgb(203, 235, 216)");
			   $(this).css({"background-color": "#0E6251", "color":"white"});
			   $.ajax({
				   url : "mainOthersTeamList.ma",
				   type : "POST",
				   beforeSend : function(xhr)
		            {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
				   success : function(result){
					    var str = "";
				        var rowCount = 0;
				        
				        for (var i = 0; i < result.length; i++) {
				          if (i % 5 === 0) { 
				            str += "<tr id='mainTeamTr" + rowCount + "'>";
				            rowCount++;
				          }
				          
				          str += "<td>"
				          		+ "<p data-target='#others_profile' data-toggle='modal'>" 
				          		+ result[i].userName 
				          		+ " " + result[i].jobName 
				          		+ "<input type = 'hidden' value='"+result[i].deptName+"'>"
				          		+ "<input type = 'hidden' value='"+result[i].phone+"'>"
				          		+ "<input type = 'hidden' value='"+result[i].email+"'>"
				          		+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>";
				          		+ "</p></td>"
				          		
				          
				          if (i % 5 === 4 || i === result.length - 1) {
				            str += "</tr>";
				          }
				        }
					   $("#mainOthersList tbody").html(str);
					   
					   
					   $("p[data-target='#others_profile']").click(function(){
							//console.log($(this).closest("td").index());
							var index = $(this).closest("td").index(); //
							var userData = result[index];
							
							var userName = userData.userName;
							var jobName = userData.jobName;
							var deptName = userData.deptName;
							var phone = userData.phone;
							var email = userData.email;
							var empolymentDate = userData.empolymentDate;
							
							$("#others_profile_table tbody").html(
								"<tr><td>이름</td><td>" + userName + "</td></tr>" +
								"<tr><td>직급</td><td>" + jobName + "</td></tr>" +
								"<tr><td>부서</td><td>" + deptName + "</td></tr>" +
								"<tr><td>전화번호</td><td>" + phone + "</td></tr>" +
								"<tr><td>이메일</td><td>" + email + "</td></tr>"
								+"<tr><td>입사일 </td><td>" + empolymentDate + "</td></tr>" 
							);
					   })
				   },
				   error : function() {
					   console.log("통신 실패 ");
				   }
			   });
		   });
		   
		   $("#others_team").click();
	   });
	   
	   //전직원 조회 
	   $(function() {
		   $("#others_all").click(function() {
			   var activeTab = $(this).attr("data-tab");
			   $("#others_team").css("background-color", "rgb(203, 235, 216)");
			   $(this).css({"background-color": "#0E6251", "color":"white"});
			   $.ajax({
				   url : "mainOthersAllList.ma",
				   type : "POST",
				   beforeSend : function(xhr)
		            {
		                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
		            },
				   success : function(result){
					   var str = "";
				        var rowCount = 0;
				        
				        for (var i = 0; i < result.length; i++) {
				          if (i % 5 === 0) {
				            str += "<tr id='mainTeamTr" + rowCount + "'>";
				            rowCount++;
				          }
				          
				          str += "<td>"
				          		+ "<p data-target='#others_profile' data-toggle='modal'>["
				          		+ result[i].deptName +"]<br>"
				          		+ result[i].userName +" "
				          		+ result[i].jobName 
				          		+ "<input type = 'hidden' value='"+result[i].phone+"'>"
				          		+ "<input type = 'hidden' value='"+result[i].email+"'>"
				          		+ "<input type = 'hidden' value='"+result[i].empolymentDate+"'>"
				          		+ "</p></td>";
				          
				          if (i % 5 === 4 || i === result.length - 1) {
				            str += "</tr>";
				          }
				        }
					   $("#mainOthersList tbody").html(str);
					   
					   
					   $("p[data-target='#others_profile']").click(function(){
							console.log($(this).closest("td").index());
							var index = $(this).closest("td").index();
							var userData = result[index];
							
							var userName = userData.userName;
							var jobName = userData.jobName;
							var deptName = userData.deptName;
							var phone = userData.phone;
							var email = userData.email;
							var empolymentDate = userData.empolymentDate;
							
							$("#others_profile_table tbody").html(
								"<tr><td>이름</td><td>" + userName + "</td></tr>" +
								"<tr><td>직급</td><td>" + jobName + "</td></tr>" +
								"<tr><td>부서</td><td>" + deptName + "</td></tr>" +
								"<tr><td>전화번호</td><td>" + phone + "</td></tr>" +
								"<tr><td>이메일</td><td>" + email + "</td></tr>" 
								+"<tr><td>입사일 </td><td>" + empolymentDate + "</td></tr>" 
							);
					   })
					   
				   },
				   error : function() {
					   console.log("통신 실패 ");
				   }
			   });
		   });
		   
	   });
    </script>
</body>
</html>