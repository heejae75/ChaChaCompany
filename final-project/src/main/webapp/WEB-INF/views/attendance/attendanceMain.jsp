<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>근태관리_나의근무</title>
<style>
	.content{
        width: 1570px;
    }
	
     /*navibar*/
	#att-tap-area{
		width: 80%;
		margin: auto;
	}
	
	#att-tap-area>ul{
		width:100%;
		height : 42px;
		list-style-type : none;
		margin-bottom: 30px;
	}
	
	#nav-tabs{
		padding : 0;
		display: flex;
	}
	
    #att-tap-area>ul li{
    	width :98px;
    	margin-right: 5px;
    	float : left;
    }
    
    #att-tap-area a{
    	width: 100%;
    	height : 100%;
    	display: inline-block;
    	text-align: center;
    	line-height: 40px;
    	background-color: lightgrey;
    	text-decoration: none;
    	color: black;
    }
    
    #att-tap-area>ul li:not(.active):hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
	 #att-tap-area .active a{
	 	border-botton: none;
	 	background-color: #0E6251;
	 	color: white;
	 }
    
    /* 캘린더 스타일 */
    #calendar{
    	width: 100%;
    	height: 100%;
    	margin-top: 50px;
    	margin-left: 0;
    }
    .fc-toolbar{
    	margin-top: 60px !important;
    	margin-bottom: 40px !important;
    	font-size: 10px !important;
    }
    .fc-right, .fc-today-button{
    	font-size: 13px !important;
    }
	.fc-toolbar h2{
	  	font-size: 20px !important;
	}
    /* 캘린더구역 */
    #calendar-container{
   		margin: auto;
   		width: 80%;
    	height: 80%;
    }
    
</style>
</head>
<body id="body-pd">
 <%@ include file="../common/menubar.jsp" %>  
 
 
    <div class="content" >
           <div id="att-tap-area">
                <ul id="nav-tabs"  class="nav-tabs nav-pills">
					<li role="presentation" class="active">
						<a href="userAtt.at">나의근무</a>
					</li>
					<li role="presentation">
					 	<a href="deptAtt.at">팀의근무</a>
					</li>
				</ul>
            </div>
	        <!-- 캘린더구역 -->
	        <div id="calendar-container">
				<div id="calendar"></div>
			</div>
			<!-- 캘린더구역 끝 -->
      </div>
      <br><br><br><br>
 
  
  <script>
   $(document).ready(function() {
	   
		$("#calendar").fullCalendar({
			height 					  : 800,
			locale 					  : "ko",    
			timezone                  : "local", 
			nextDayThreshold          : "09:00:00",
			allDaySlot                : false,
			displayEventTime          : true,
			displayEventEnd           : true,
			firstDay                  : 1, //월요일이 먼저 오게 하려면 1
			weekNumbers               : false,
			selectable                : true,
			weekNumberCalculation     : "ISO",
			eventLimit                : true,
			views                     : { 
			                             
				                              },
			navLinks                  : true,
			timeFormat                : "HH:mm",
			defaultTimedEventDuration : "01:00:00", // 한시간단위
			minTime                   : "09:00:00",
			maxTime                   : "19:00:00",
			slotLabelFormat           : "HH:mm",
			slotDuration			  : "1:00:00", // 시간 슬롯 단위를 1시간으로 설정
			weekends                  : false, // 주말 안보이게
			nowIndicator              : true,
			header                    : {
			                              left   : "today",
			                              center : "prev, title, next",
			                              right  : "agendaMonth, agendaWeek, listWeek"
			                            },
			defaultView				  : "agendaMonth",
			views                     : {
				 						  month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
			                              agendaWeek : {
				  	                          columnFormat : "M/D ddd",
					                          titleFormat  : "YYYY/MM/D",
					                          eventLimit   : false
				                          },
				                          listWeek : {
				                          columnFormat : ""
				                          }
				                        },
			buttonText				  : {
				today: '오늘',
				week: '주간', 
				list: '목록'},
			
			selectHelper : true,
			select : function(start, end) { // 화면에서 날짜 선택하면
				
	           },
	           
	           events: function(start, end, timezone, callback) { // 화면에 이벤트 출력
	        	   
	        	      $.ajax({
	        	        url: "attList.at", // 예약 정보를 가져올 컨트롤러 URL
	        	        beforeSend : function(xhr){
	                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                    },
	        	        success: function(list) {
	        	        	
	        	          
	        	        },
	        	        error: function() {
	        	        	console.log("예약 정보를 가져오는 데 실패했습니다.");
	        	        }
	        	      });
	        	    },
	        	 
	        	eventClick: 
	        		
	        		function(arg){ // 화면에서 일정 선택하면

	        			
		        		
		        	},
	        	    
	        	eventRender: function(event, element) {
	        	  
		        
	        	   
	        	     
	        	       }
	        	 	}
			});
		
		
		
		});

 	
  </script>
   


</body>
</html>