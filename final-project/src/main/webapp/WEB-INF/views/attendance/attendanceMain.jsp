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
        height: 800px;
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
	.fc-agendaWeek-view .fc-time-grid .fc-slats td {
	  	height: 52px; 
	}
	#wrap{
		margin: auto;
		width: 80%;
		height: 100%;
	}
    /* 캘린더구역 */
    #calendar-container{
   		margin: auto;
   		width: 50%;
   		height: 100%;
   		display: inline-block;
   		float: left;
    }
    /* 오늘의 근무 구역 */
    #att-today{
    	height: 100%;
    	width: 50%;
    	display: inline-block;
    	float: left;
    	margin-top: 60px;
    }
    #att-panel table{
    	margin: auto;
    	margin-top:10px;
    	height: 80%;
    	width: 95%;
    }
    #att-panel table thead td{
    	border: none!important;
    } 
    #att-panel table td{
    	padding: 5px;
    	vertical-align: middle;
    }
    #att-panel table tbody{
    	font-size: 13px;
    }
    #att-panel{
    	height: 45%;
    	width: 80%;
    	margin: auto;
    }
    .panel-heading{
    	color: #0E6251;
    	font-weight: 600;
    }
    
   /* 나의근무구역 */
    #record-panel{
    	height: 50%;
    	width: 80%;
    	margin: auto;
    	margin-top: 10px;
    }
    #record-panel table{
    	margin: auto;
    	margin-top:10px;
    	height: 80%;
    	width: 95%;
    }
    #record-panel .title{
    	font-size: 13px;
    }
    #record-panel .date, #record-panel tbody td{
    	border: none!important;
    } 
    #record-panel table td{
    	padding: 5px;
    	vertical-align: middle;
    }
    .progress{margin:auto!important;}
   
    
    
    
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
            
	        
	        <div id="wrap">
	        	<!-- wrap -->
		        <div id="calendar-container">
					<div id="calendar"></div>
				</div>
				
				
				<div id="att-today">
				
					<div class="panel panel-info" id="att-panel">
						<div class="panel-heading">근무계획</div>
					
						<table class="table">
							<thead>
								<tr style="border-left:2px solid green;height:15%;">
									<td colspan="4" id="formattedDate"></td>
								</tr>
								<tr style="height:15%;">
									<td width="300px">09:00 - 18:00</td>
									<td align="right"><button id="work-type-btn" class="btn btn-sm btn-default">${att.leaveType}</button></td>
									<td align="right" style="width:10px"><button id="status-btn" class="btn btn-sm btn-default">부재중</button></td>
								</tr>
							</thead>
							<tbody>
								<tr style="height:10%;">
									<td>출근</td>
									<td colspan="2" align="right">
										<c:choose>
											<c:when test="${att.onTime eq null}">
												미타각
											</c:when>
											<c:otherwise>
												${att.onTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="height:10%;">
									<td>퇴근</td>
									<td colspan="2" align="right">
										<c:choose>
											<c:when test="${att.offTime eq null}">
												미타각
											</c:when>
											<c:otherwise>
												${att.offTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="height:10%;">
									<td colspan="2">근무노트</td>
									<td align="right"><button class="btn btn-sm btn-default" onclick="insertTodo()">저장</button></td>
								</tr>
								<tr style="height:40%;">
									<td colspan="3"><textarea rows="4" id="todoContent" class="form-control" style="resize: none;padding: 5px;">${att.todoContent }</textarea></td>
								</tr>
							</tbody>
						</table>
					</div>
				
				
					<div class="panel panel-success" id="record-panel">
						<div class="panel-heading">나의근무</div>
						
						<table class="table">
							<thead>
								<tr style="border-left:2px solid green;">
									<td id="formattedDate2" colspan="2"></td>
									<td align="right"><button class="btn btn-sm btn-default">근태사유서신청</button></td>
								</tr>
								<tr class="title">
									<td class="date" colspan="2">근태</td>
									<td class="date" align="right">${att.leaveType }</td>
								</tr>
								<tr class="title">
									<td colspan="2">출근</td>
									<td align="right" id="startTime">
										<c:choose>
											<c:when test="${att.onTime eq null}">
												미타각
											</c:when>
											<c:otherwise>
												${att.onTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr class="title">
									<td colspan="2">퇴근</td>
									<td align="right" id="endTime">
										<c:choose>
											<c:when test="${att.offTime eq null}">
												미타각
											</c:when>
											<c:otherwise>
												${att.offTime}
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr style="height:20px">
									<td class="date" colspan="3"></td>
								</tr>
							</thead>
							<tbody>
								<tr style="border-left:2px solid green;height:40px">
									<td class="date" colspan="2">주간실적</td>
									<td class="date" align="right" style="font-size:13px"><label id="weekStart"></label> - <label id="weekEnd"></label></td>
								</tr>
								<tr>
									<td class="date" colspan="3">
									<div class="progress">
									  <div class="progress-bar" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;">
									    <span class="sr-only">60% Complete</span>
									  </div>
									</div>
									</td>
								</tr>
								<tr style="font-size:13px;">
									<td>계획 40:00</td>
									<td>실적 52:00</td>
									<td>연장 12:00</td>
								</tr>
							</tbody>		
						</table>
					</div>
					
				</div>
				
			</div>
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
			selectHelper 			  : true,
	      	selectMirror			  : true,
	        dayMaxEvents			  : true, 
			views                     : { 
			                              month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
				                              },
			navLinks                  : true,
			timeFormat                : "HH:mm",
			defaultTimedEventDuration : "01:00:00", // 한시간단위
			minTime                   : "09:00:00",
			maxTime                   : "21:00:00",
			slotLabelFormat           : "HH:mm",
			slotDuration			  : "1:00:00", // 시간 슬롯 단위를 1시간으로 설정
			weekends                  : true, // 주말 안보이게
			header                    : {
										center : "prev, title ,next ",
							        	right : "prevYear, today, nextYear ",
							        	left : "agendaWeek, month"
			                            },
			defaultView				  : "agendaWeek",
			views                     : {
										 month : {
								        		titleFormat: "YYYY년 MM월"
								        	},
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
										month: '월간',
										list: '목록'},
			select : function(start, end) { // 화면에서 날짜 선택하면 근무계획 아래에 progress bar띄우기 _ select ajax로 띄워두고 날짜 클릭하면 다른 날짜 조회
				// ajax에서 data를 input display none에 넣어놓고 날짜 선택시 input value 바꾸기 -> onchange 시 select ajax재실행하면서 새로운 날짜 data가져가기
				
				/*나의 근무에서 주간 날짜 변경*/
				
				// 선택한 날짜의 주의 첫 번째 날짜인 월요일
				var startDate = start.clone().startOf('week').format('YYYY-MM-DD');
				/* console.log(start.clone().startOf('week').format('ddd')) */
				// 선택한 날짜의 주의 마지막 날짜인 일요일
				var endDate = start.clone().endOf('week').format('YYYY-MM-DD');
				$("#weekStart").text(startDate);
				$("#weekEnd").text(endDate);
				
					
				    
				    
				 $("#calendar").fullCalendar("unselect"); 
	           },
	           
	         eventClick: function(arg){ // 화면에서 일정 선택하면
	        	 
	        	 /*나의 근무에서 선택일과 출퇴근시간 변경*/
	        	 if(arg.start != null){
		        	 $("#startTime").text(arg.start.format("HH:mm"));
	        	 }else{
	        		 $("#startTime").text("미타각");
	        	 }
	         
	        	 if(arg.end != null){
	        		 $("#endTime").text(arg.end.format("HH:mm"));
	        	 }else{
	        		 $("#endTime").text("미타각");
	        	 }
	         	 
		        $("#formattedDate2").text(arg.start.format("YYYY-MM-DD"));
		        
		        
		        
		       },
	           
	        events: function(start, end, timezone, callback) {
	        	// 선택한 날짜의 주의 첫 번째 날짜인 월요일
				var startDate = start.clone().startOf('week').format('YYYY-MM-DD');
				
				// 선택한 날짜의 주의 마지막 날짜인 일요일
				var endDate = start.clone().endOf('week').format('YYYY-MM-DD');
				$("#weekStart").text(startDate);
				$("#weekEnd").text(endDate);
	        
		        	  $.ajax({
		        	   url : "attList.at",
		        	   type : "POST",
		        	   data : {userNo : ${loginUser.userNo}},
		        	   beforeSend : function(xhr){
	                       xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                   },
		        	   success : function(list) {
		        		   var events = [];
		        		  $.each(list, function(index, attendance) {
		        			
		        			  var event =  {
		        					  id: attendance.attRecordNo,
		        					  userNo : attendance.userNo,
		        					  title : attendance.leaveType,
		        					  start : attendance.currDate + "T" + attendance.onTime,
		        					  end : attendance.currDate + "T" + attendance.offTime,
		        					  day : attendance.currDate,
		        					  onTime : attendance.onTime,
		        					  offTime : attendance.offTime
		        			  }
		        			  
		        			  events.push(event);
		        		});
		        		  callback(events);
		        	   },
		        	   error: function() {
		        	   		console.log('통신 오류 ');
		        	   }
		        	 });
        	   },
	           eventRender: function(event, element) {
		        	 element.css({
		        		 "border": "1px solid #E0E0E0",
		        		 "color": "#616161",
		        		 "margin":"0px"
		        		});
	        	   if(event.onTime!="" && event.offTime==null){ // 출근이나 퇴근 등록을 하지 않으면 색 변경
	        		   element.css("background-color", "#FCCCD4");
	        	   }else{
	        		   element.css("background-color", "#8EB695");
	        	   }
	        	}
			});
		});

		// 오늘날짜 형식 바꾸기
		$(function(){
			var date = new Date();

			var year = date.getFullYear().toString();
			var month = (date.getMonth() + 1).toString().padStart(2, '0');
			var day = date.getDate().toString().padStart(2, '0');

			var formattedDate = year + '-' + month + '-' + day;

			$("#formattedDate").text(formattedDate);
			$("#formattedDate2").text(formattedDate);
			
			selectTodo(); // 노트 불러오기 함수 호출
			
		});
		
		function insertTodo(){
			
			$.ajax({
				url : "insert.at",
				data : {
					userNo : "${loginUser.userNo}",
					todoContent : $("#todoContent").val(),
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			if(result == "success"){
	    			
	    				alert("메모 작성 완료");
	    			}
		    			selectTodo();
	    		},
	            error : function(){
	            	console.log("통신오류");
	            }
			});
		}
		
		function selectTodo(){
			
			$.ajax({
				url : "select.at",
				data : {
					userNo : "${loginUser.userNo}",
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			$("#todoContent").val(result);
	    		},
	            error : function(){
	            	console.log("통신오류");
	            }
			});
		}
		
		$(function(){ // 근무 상태 $("#status-btn") 띄우기
			// ontime not null 이고 offtime null이면 근무중
			if("${att.onTime}"!="" && "${att.offTime}"==""){
				$("#status-btn").text("근무중");
				$("#status-btn").addClass("btn-info");
			}
			// ontime not null 이고 offtime not null이면 퇴근
			if("${att.onTime}"!="" && "${att.offTime}"!=""){
				$("#status-btn").text("퇴근");
				$("#status-btn").addClass("btn-danger");
			}
		});
		
		
		
		
		
			
 	
  </script>
   


</body>
</html>