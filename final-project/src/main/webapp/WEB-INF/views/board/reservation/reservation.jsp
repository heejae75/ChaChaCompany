<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/> 
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.1/moment.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.4.0/fullcalendar.min.js"></script> 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

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
    	width: 1300px;
    	height: 700px;
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

    </style>
</head>
<body id="body-pd">
<%-- <%@ include file="../../common/menubar.jsp" %>  --%>
 
 <script>
   $(document).ready(function() {
	   
		$('#calendar').fullCalendar({
				selectable : true,
				selectHelper : true,
				select : function() {
					$('#meetingRoom-reservation-status').modal('toggle');
				},
				header : {
					left : 'agendaWeek, month, agendaDay, list',
					center : 'title',
					right : 'prev, today, next'
				},
				buttonText : {
					today : 'Today',
					month : 'Month',
					week : 'Week',
					day : 'Day',
					list : 'List'
				},
				

				dayRender : function(date, cell) {
					var today = $.fullCalendar.moment();
					if (date.get('date') == today.get('date')) {
						cell.css("background", "pink");
					}
				}
			});
		});
	</script> 

<!-- <script>
  document.addEventListener('DOMContentLoaded', function() {
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
    	selectable: true,
        selectHelper: true,
        select: function()
        {
            $('#myModal').modal('toggle');
        },
        header:
        {
        left: 'month, agendaWeek, agendaDay, list',
        center: 'title',
        right: 'prev, today, next'
        },
        buttonText:
        {
        today: 'Today',
        month: 'Month',
        week: 'Week',
        day: 'Day',
        list: 'List'
        }
    });
    calendar.render();
  });
</script> -->

    <div class="content">
        <div id="board">
            <h1>예약</h1>
            <div id="board-tap-area">
                <ul id="nav-tabs">
                    <li class="nav-item">
                      <a class="nav-link" href="list.no">공지사항</a>
                    </li>
                    <li class="nav-item">
                      <a class="nav-link" href="#">자료실</a>
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
             
            </div>
    
    <!-- 캘린더구역 -->
            
            
        <div class="container">
            
			<div id="calendar"></div>
			   
		</div>
			
	<!-- 캘린더구역 끝 -->
			
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
				    
				      <input type="text" class="form-control">
				      
				    </div>
				    <div class="modal-footer">
				      <button type="button" class="btn btn-default" data-dismiss="modal" onclick="openModal()">예약신청</button>
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
				<form action="meetingRoom.re">
					<input type="hidden" name="reserveCategory" value="M"><!-- 히든으로 회의실예약인지 비품예약인지 선택 -->
					
				    <div class="modal-header">
				       <button type="button" class="close" data-dismiss="modal">&times;</button>
				       <h4 class="modal-title">회의실 예약하기</h4>
				    </div>
				    <div class="modal-body">
				    	<table id=reserve-table>
				    		<tr>
				    			<th>신청인</th>
				    			<td colspan="2"><input type="text" class="form-control" value="" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>날짜 </th><!-- 조건넣어서 날짜값 불러오기 -->
				    			<td colspan="2"><input type="text" class="form-control" value="" readonly></td>
				    		</tr>
				    		<tr>
				    			<th>이용시간</th>
				    			<td><select name="startTime" class="form-control">
							    		<option value="0900">09:00</option>
							    		<option value="1000">10:00</option>
							    		<option value="1100">11:00</option>
							    		<option value="1200">12:00</option>
							    		<option value="1300">13:00</option>
							    		<option value="1400">14:00</option>
						    		</select>
				    			</td>
				    			<td><select name="endTime" class="form-control">
							    		<option value="1000">10:00</option>
							    		<option value="1100">11:00</option>
							    		<option value="1200">12:00</option>
							    		<option value="1300">13:00</option>
							    		<option value="1400">14:00</option>
							    		<option value="1500">15:00</option>
						    		</select>
				    			</td>
				    		</tr>
				    		<tr>
				    			<th>회의실 번호</th>
				    			<td colspan="2"><select name="roomCode" class="form-control">
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
				      <button type="submit" class="btn btn-default" onsubmit="timeContraint()">예약</button>
				    </div>
			    
			    </form>
			  </div>
		</div>
	</div>
  <!-- 회의실 예약하기 모달 끝 -->
  
  <script>
  function openModal(){
	  
		$('#meetingRoom-reservation').modal('show');
	};
  
  </script>
          
            
        </div>
        <br><br><br>
    </div>
    
   
</body>
</html>

















