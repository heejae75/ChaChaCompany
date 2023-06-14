<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>
<!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script> -->
  <style>
	.content{
        width: 1570px;
    }
	/*navibar*/
	#board-tap-area{
		width: 80%;
		margin: auto;
	}
	
	#board-tap-area>ul{
		width:100%;
		height : 42px;
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
        margin: auto;
        margin-bottom: 20px;
    }
    
    /* 게시글 목록영역 */
    #board-list-area{
        width: 80%;
        margin: auto;
    }
    
    #board-list{
        text-align:center;
    }

    #pagingArea {
        width:fit-content; 
        margin:auto;
    }
    /* 캘린더 스타일 */
    #calendar{
    	width: 100%;
    	height: 100%;
    	margin-top: 50px;
    	margin-left: 0;
    }
    .fc-agendaWeek-view .fc-time-grid .fc-slats td {
	  	height: 50px; 
	}

	.fc-agendaMonth-view .fc-day-grid .fc-row .fc-content-skeleton td  {
	}

    /* 캘린더구역 */
    #calendar-container{
   		margin-left: 100px;
   		width: 80%;
    	height: 100%
    }
    /* 예약폼스타일 */
    #reserve-table{
    	width : 100%;
    	height : 100%;
    	margin : auto;
    }
    #reserve-table td, #reserve-table th{
    	padding: 5px
    }
    /* 모달창 */
    #update-btn #delete-btn{
    	
    	float: left;
    }
    #status-modal-footer{
    	position: relative;
    }

    </style>
</head>
<body id="body-pd">
  <%@ include file="../../common/menubar.jsp" %>  
 
 <script>
   $(document).ready(function() {
	   
		$('#calendar').fullCalendar({
			locale 					  : 'ko',    
			timezone                  : "local", 
			nextDayThreshold          : "09:00:00",
			allDaySlot                : true,
			displayEventTime          : true,
			displayEventEnd           : true,
			firstDay                  : 1, //월요일이 먼저 오게 하려면 1
			weekNumbers               : false,
			selectable                : true,
			weekNumberCalculation     : "ISO",
			eventLimit                : true,
			views                     : { 
			                              month : { eventLimit : 12 } // 한 날짜에 최대 이벤트 12개, 나머지는 + 처리됨
				                              },
			eventLimitClick           : 'week', //popover
			navLinks                  : true,
			timeFormat                : 'HH:mm',
			defaultTimedEventDuration : '01:00:00', // 한시간단위
			minTime                   : '09:00:00',
			maxTime                   : '19:00:00',
			slotLabelFormat           : 'HH:mm',
			slotDuration			  : '1:00:00', // 시간 슬롯 단위를 1시간으로 설정
			weekends                  : false, // 주말 안보이게
			nowIndicator              : true,
			dayPopoverFormat          : 'MM/DD dddd',
			header                    : {
			                              left   : 'today, prevYear, nextYear',
			                              center : 'prev, title, next',
			                              right  : 'month, agendaWeek, listWeek'
			                            },
			defaultView				  : 'agendaWeek',
			views                     : {
			                              month : {
			                                columnFormat : 'dddd'
			                              },
			                              agendaWeek : {
				  	                          columnFormat : 'M/D ddd',
					                          titleFormat  : 'YYYY년 M월 D일',
					                          eventLimit   : false
				                          },
				                          agendaDay : {
					                          columnFormat : 'dddd',
					                          eventLimit   : false
				                          },
				                          listWeek : {
				                          columnFormat : ''
				                          }
				                              },
			customButtons             : { 
			                             
				                         },
			selectHelper : true,
			select : 
				 function(start, end, jsEvent) { // 화면에서 날짜 선택하면
	                // 시간
	                var starttime = $.fullCalendar.moment(start).format('HH:mm');
	                var endtime = $.fullCalendar.moment(end).format('HH:mm');
					// 날짜 
	                var start = moment(start).format('YYYY-MM-DD');
	                var end = moment(end).format('YYYY-MM-DD');
	                
	                //console.log(jsEvent.target); // 클릭한 div를 가리킴
	                
	                $('#meetingRoom-reservation #startTime').val(starttime);
	                $('#meetingRoom-reservation #endTime').val(endtime);
	                $('#meetingRoom-reservation #revDate').val(start);
	                $('#meetingRoom-reservation').modal('toggle');
	                
	           },
	           events: function(start, end, timezone, callback) { // 화면에 이벤트 출력
	        	      $.ajax({
	        	        url: 'mrrevList.re', // 예약 정보를 가져올 컨트롤러 URL
	        	        beforeSend : function(xhr){
	                        xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	                    },
	        	        success: function(list) {
	        	        	var events = [];

	        	        	list.forEach(function(reservation) {
	        	              var event = {
	        	                id: reservation.reservationNo,
	        	                userNo : reservation.userNo,
	        	                userName: reservation.userName,
	        	                title: reservation.roomCode + '회의실(' + reservation.userName + ')',
	        	                start: reservation.revDate + 'T' + reservation.startTime,
	        	                end: reservation.revDate + 'T' + reservation.endTime,
	        	                roomCode : reservation.roomCode
	        	                
	        	              };

	        	              events.push(event);
	        	            });

	        	            callback(events);
	        	          
	        	        },
	        	        error: function() {
	        	        	console.log('예약 정보를 가져오는 데 실패했습니다.');
	        	        }
	        	      });
	        	    },
	        	 
	        	eventClick: 
	        		
	        		function(arg){ // 화면에서 일정 선택하면
		        		//console.log(arg.userNo);
		        		var reservationNo = arg.id;
		        		var userNo = arg.userNo;
		        		var revDate = arg.start.format('YYYY-MM-DD');
		        		var starttime = arg.start.format('HH:mm');
			            var endtime = arg.end.format('HH:mm');
		        		
		        		$('#meetingRoom-reservation-status #status-userName').val(arg.userName);
		        		$('#meetingRoom-reservation-status #status-startTime').val(starttime);
			            $('#meetingRoom-reservation-status #status-endTime').val(endtime);
			            $('#meetingRoom-reservation-status #status-revDate').val(revDate);
			            $('#meetingRoom-reservation-status #status-roomCode').val(arg.roomCode);
			            $('#meetingRoom-reservation-status #status-userNo').val(userNo);
			            $('#meetingRoom-reservation-status #status-reservationNo').val(reservationNo);
			            
		        		$('#meetingRoom-reservation-status').modal('toggle');
		        		
		        		 // 회원 조건에 따라 수정삭제 버튼 보이게
		        		var updateBtn = document.getElementById('update-btn');
		        		var deleteBtn = document.getElementById('delete-btn');
		        		
		        		if (userNo == ${loginUser.userNo}) {
		        		    updateBtn.style.display = 'block';
		        		    deleteBtn.style.display = 'block';
		        		  }
		        	},
	        	  
	        	    
	        	eventRender: function(event, element) {
	        	   // 회의실 코드에 따라 예약 창의 색상 설정
	        	      switch (event.roomCode) {
	        	        case 'A':
	        	          	element.css('background-color', 'green'); break;
	        	        case 'B':
	        	          	element.css('background-color', 'lightblue'); break;
	        	        case 'C':
	        				element.css('background-color', 'red'); break;
	        	        case 'D':
		        	        element.css('background-color', 'pink'); break;
	        	        case 'E':
		        	        element.css('background-color', 'gray'); break;
	        	        default:
	        	            element.css('background-color', 'gray');
	        	       }
	        	 	},

				/* dayRender : function(date, cell) {
					var today = $.fullCalendar.moment(); // 오늘날짜
					if (date.get('date') == today.get('date')) {
						cell.css("background", "pink");
					}
				} */
			});
		});
	</script> 

    <div class="content" >
        <div id="board">
            <div id="board-tap-area">
                <ul id="nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="list.no">공지사항</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="list.dc">자료실</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link active" aria-current="page" href="list.re">대여</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">자유게시판</a>
                    </li>
                </ul>
            </div>
          <div>
          
	        <!-- 캘린더구역 -->
	        <div class="container" id="calendar-container">
				<div id="calendar"></div>
			</div>
			<!-- 캘린더구역 끝 -->
      </div>
    
   
			
            <br><br>
  <!-- 회의실 예약 현황 모달시작 -->
   	<div class="modal fade" id="meetingRoom-reservation-status" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
				
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">회의실 예약 현황</h4>
				    </div>
				    <div class="modal-body">
				      <table id=reserve-table>
				    		<tr>
				    			<th>신청인</th>
				    			<td colspan="2"><input type="text" id="status-userName" class="form-control" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>날짜 </th><!-- 조건넣어서 날짜값 불러오기 -->
				    			<td colspan="2"><input type="date" id="status-revDate" name="revDate" class="form-control"></td>
				    		</tr>
				    		<tr>
				    			<th>이용시간</th>
				    			<td><select id="status-startTime" name="startTime" class="form-control">
							    		<option value="09:00">09:00</option>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
						    		</select>
				    			</td>
				    			<td><select id="status-endTime" name="endTime" class="form-control">
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
							    		<option value="19:00">19:00</option>
						    		</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<th>회의실</th>
				    			<td colspan="2"><select name="roomCode" id="status-roomCode" class="form-control">
							    		<option value="A">A</option>
							    		<option value="B">B</option>
							    		<option value="C">C</option>
							    		<option value="D">D</option>
							    		<option value="E">E</option>
						    		</select>
						    	</td>
				    		</tr>
				    	</table>
				    	<input type="text" id="status-userNo" style="display:none;">
				    	<input type="text" id="status-reservationNo" style="display:none;">
				    </div>
				    <div class="modal-footer" id="status-modal-footer"  style="justify-content: flex-end;">
					    <button type="button" class="btn btn-default" id="update-btn" data-dismiss="modal" onclick="updateReservation()" style="display:none;">예약수정</button>
					    <button type="button" class="btn btn-default" id="delete-btn" data-dismiss="modal" onclick="deleteReservation()" style="display:none;">예약삭제</button>
				      	<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				    </div>
				    
			  </div>
			  
		</div>
	</div>
  <!-- 회의실 예약 현황 모달 끝 -->
  
 
  
  <!-- 회의실 예약하기 모달시작 -->
   	<div class="modal fade" id="meetingRoom-reservation" role="dialog">
		<div class="modal-dialog">
			    
			<!-- Modal content-->
			<div class="modal-content">
					
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">회의실 예약하기</h4>
				    </div>
				    <div class="modal-body">
				    	<table id=reserve-table>
				    		<tr>
				    			<th>신청인</th>
				    			<td colspan="2"><input type="text" class="form-control" value="${loginUser.userName }" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>날짜 </th><!-- 조건넣어서 날짜값 불러오기 -->
				    			<td colspan="2"><input type="text" id="revDate" name="revDate" class="form-control" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>이용시간</th>
				    			<td><select id="startTime" name="startTime" class="form-control" readonly>
							    		<option value="09:00">09:00</option>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
						    		</select>
				    			</td>
				    			<td><select id="endTime" name="endTime" class="form-control" readonly>
							    		<option value="10:00">10:00</option>
							    		<option value="11:00">11:00</option>
							    		<option value="12:00">12:00</option>
							    		<option value="13:00">13:00</option>
							    		<option value="14:00">14:00</option>
							    		<option value="15:00">15:00</option>
							    		<option value="16:00">16:00</option>
							    		<option value="17:00">17:00</option>
							    		<option value="18:00">18:00</option>
							    		<option value="19:00">19:00</option>
						    		</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<th>회의실</th>
				    			<td colspan="2"><select name="roomCode" id="roomCode" class="form-control">
							    		<option value="A">A</option>
							    		<option value="B">B</option>
							    		<option value="C">C</option>
							    		<option value="D">D</option>
							    		<option value="E">E</option>
						    		</select>
						    	</td>
				    		</tr>
				    	</table>
				    
				    </div>
				    <div class="modal-footer">
				      <button type="button" class="btn btn-default" onclick="confirmReservation()">예약</button>
				      <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
				    </div>
			  </div>
		</div>
	</div>
  <!-- 회의실 예약하기 모달 끝 -->
  <script>
 
		  
	 
	  
 
	// 회의실 예약시 confirm메세지와 비동기로 DB에 데이터 넣기
	function confirmReservation(){
		
		if(window.confirm("이대로 예약을 하시겠습니까?")){
			
			$.ajax({
				url : "mrrev.re",
				data : {
					userNo : "${loginUser.userNo}",
					revDate : $("#revDate").val(),
					startTime : $("#startTime").val(),
					endTime : $("#endTime").val(),
					reserveCategory : 'M',
					roomCode : $("#roomCode").val()
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			if(result == "success"){
	    				alert("예약이 완료되었습니다.");
	    			}
	    			location.reload();
	    		},
	            error : function(){
	            	console.log("통신오류");
	            }
			});
		}
	}
	
	// 회의실 예약 수정하기
	function updateReservation(){
		
		if(window.confirm("이대로 예약을 수정하시겠습니까?")){
			
			$.ajax({
				url : "updatemrrev.re",
				data : {
					reservationNo : $("#status-reservationNo").val(),
					revDate : $("#status-revDate").val(),
					startTime : $("#status-startTime").val(),
					endTime : $("#status-endTime").val(),
					roomCode : $("#status-roomCode").val()
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			if(result == "success"){
	    				alert("예약수정이 완료되었습니다.");
	    			}
	    			location.reload();
	    		},
	            error : function(){
	            	console.log("통신오류");
	            }
			});
		}
		
	}	
	
	// 회의실 예약 삭제하기
	function deleteReservation(){
		
		if(window.confirm("정말 예약을 삭제하시겠습니끼?")){
			
			$.ajax({
				url : "deletemrrev.re",
				data : {
					reservationNo : $("#status-reservationNo").val()
				},
				beforeSend : function(xhr){
	                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	            },
	            success : function(result){
	    			if(result == "success"){
	    				alert("예약내역이 삭제되었습니다.");
	    			}
	    			location.reload();
	    		},
	            error : function(){
	            	console.log("통신오류");
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



