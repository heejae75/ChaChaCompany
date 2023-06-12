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
        background-color: khaki;
    }


    /* 메인 css */
    .main_profile_area{
        border: 1px solid black;
        width: 22%;
        height: 800px;
        border-radius: 20px;
        background-color: lightblue;
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
    }

    #mp_work_input button{
        background-color: #0E6251;
        width: 100px;
        border-radius: 50px;
    }
    
    /* 메인 가운데 전체 div */
    .content_center{
        background-color: gold;
        border: 1px solid black;
        float: left;
        width: 800px;
        height: 100%;
        margin-left: 40px;
    }

    /* 최근 온 메일 */
    .main_mail{
        border: 1px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
        margin-bottom: 24px;
        background-color: pink;
    }

    /* 공지사항 */
    .main_notice{
        border: 1px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
        margin-bottom: 24px;
        background-color: bisque;
    }

    /* 이름 바꿀예정 */
    .main_others{
        border: 1px solid black;
        border-radius: 20px;
        width: 100%;
        height: 250px;
        background-color: salmon;
    }

    /* 제목 */
    .main_ctn_title{
        float: left;
        margin: 12px 0 0 25px;
        font-size: 25px;
    }
    
    /* 플러스 아이콘 */
    .main_ctn_plus{
        float: right;
        margin: 18px 25px;
        cursor: pointer;
    }

    /* 메인 왼쪽 전체 div */
    .content_right{
        border: 1px solid black;
        background-color: lightyellow;
        float: right;
        width: 350px;
        height: 100%;
        
    }

    /* 일정 */
    .main_calender{
        border: 1px solid black;
        width: 100%;
        height: 523px;
        border-radius: 20px;
        background-color: thistle;
        margin-bottom: 26px;
    }

    /* 경조사 */
    .main_event{
        border: 1px solid black;
        width: 100%;
        height: 250px;
        border-radius: 20px;
        background-color: hotpink;
    }
    
    #mainNoticeList{
    	width: 750px;
    	margin: auto;
    	font-size: 18px;
    }
}</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
        <div class="main_profile_area" align="center">
            <div id="main_profile">
                <img src="https://i.imgur.com/hczKIze.jpg" alt="">
                <p style="font-size: 30px; margin: 0 0 0 0;">권수지</p>
                <p>개발1팀 / 사원</p>
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
                    <div style="margin-bottom: 4px;">
                        <span>출근 시간</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>09:30</span>
                    </div>
                    <div style="border: 1px solid black; width: 280px;"></div>
                    <div style="margin: 6px 0 12px 0;">
                        <span>퇴근 시간</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>09:30</span>
                    </div>
                </div>
                <div id="mp_work_input">
                	<form action="insertGo.ar" method="post">
	                    <button type="submit" class="btn btn-primary" style="margin-right: 20px;">출근</button>
                    </form>
                    
                    <form action="insertLeave.ar" method="post">
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
                
                <table id="mainEmailList" border=1 align="center">
                	<tbody>
                	
                	</tbody>
                </table>
            </div>

            <div class="main_notice">
                <div>
                    <div class="main_ctn_title">
                        <span>공지 사항</span>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="list.no">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>
                
                <table id="mainNoticeList" border=1 align="center">
<!--                 	<thead> -->
<!--                 		<tr> -->
<!--                 			<th>제목</th> -->
<!--                 			<th>작성자 </th> -->
<!--                 			<th>작성일 </th> -->
<!--                 			<th>조회수 </th> -->
<!--                 		</tr> -->
<!--                 	</thead> -->
                	
                	<tbody>
                	
                	</tbody>
                </table>
            </div>

            <div class="main_others">
                <div>
                    <div class="main_ctn_title">
                        <span>임직원 조회 </span>
                    </div>
                    <div class="main_ctn_plus">
                        <a href="#">
                            <i class="fa-solid fa-plus fa-2xl" style="color: #0e6251;"></i>
                        </a>
                    </div>
                </div>

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
	   
	   
	   //공지사항 최신순으로 조회 
	   $(function() {
		  mainNoticeBoardList();
		   
// 		  $(document).on("click","#mainNoticeList>tbody>tr",function() {
// 			  location.href="detail.no?boardNo="+$(this).children().eq(0).text();
// 		  })
	   });
	   
	   function mainNoticeBoardList() {
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
	   }
	   
	   //메일 최신순으로 조회
	   function mainEmailList() {
		   $.ajax({
			   url : "mainEmailList.ma",
			   success : function(result) {
				   var str = ""
				   
				   for(var i in result) {
					   str += "<tr>"
					   		+ "<td>" + result[i].emailTitle + "</td>"
					   		+ "<td>" + result[i].sender + "</td>"
					   		+ "<td>" + result[i].sendDate + "</td>"
					   		+ "</tr>"
				   }
				   
				   $("#mainEmailList tbody").html(str);
			   },
			   error : function() {
				   console.log("통신 실패 ");
			   }
		   });
	   }
    </script>
</body>
</html>