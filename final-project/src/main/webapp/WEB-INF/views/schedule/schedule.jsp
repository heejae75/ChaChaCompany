<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서 스케줄</title>
</head>
<style>
	.content{
        width: 1570px;
        margin-left : 30px;
    }
    
    /* modal style */
    .modal-body label{
    	margin-top: 10px;
    }
    
    
</style>

<%@ include file="../common/menubar.jsp"  %> 
<div class="content">
	<div id="title-area">
		<h1 id="title"> SCHEDULE </h1>
		
		<div id="select-area">
			<select id="schedule-category" class="form-control" style="width:100px; margin-bottom: 15px; float:left;">
				<option value="deptSchedule"> 부서 일정 </option>
				<option value="S1">개인 일정 </option>
			</select>
			<button type=button class="btn btn-sencondary" id="change-schedule" style="margin-left: 5px;"> 확인 </button>
		</div>
	</div>
	
	<!-- 캘린더 영역 -->
	<div id="calendar-container">
		<div id="calendar"></div>
		<div id="userCalendar"></div>
	</div>
	
	
	<div class="modal fade" id="schedule-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel" style="padding-top: 20px;">인사팀 일정<!-- 로그인 회원 부서로 바꿔줄것  --></h3>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                    	<label>등록자</label>
                    	<input type="text" class="form-control" id="userName" name="userName" value = "${loginUser.userName}" readonly 
                    		   style="background-color:white;">
                        <label>제목</label>
                        <input type="text" class="form-control" id="scheduleTitle" name="scheduleTitle">
                        <label>시작 날짜</label>
                        <input type="date" class="form-control" id="startDate" name="startDate">
                        <label>종료 날짜</label>
                        <input type="date" class="form-control" id="endDate" name="endDate">
                        <label>메모</label>
                        <textarea class="form-control" name="scheduleContent" style="resize:none;" rows="6"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-warning" id="addSchedule" data-dismiss="modal"
                        id="sprintSettingModalClose" >추가</button>
                    <button type="button" class="btn btn-secondary" data-dismiss="modal"
                        id="sprintSettingModalClose">취소</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
		
	$(function(){
		deptSchedule(); //부서 스케줄 함수 호출 

		function deptSchedule(){
			
			$("#calendar").fullCalendar({
				
				plugins : ['interaction','dayGrid'],
				
				locale: 'ko',
				defaultDate : new Date(),
		        firstDay : 1, // 월요일이 먼저 오게 하기  
				fixedWeekCount : false, // 해당 월만 보이도록 하기 
		      	navLinks: true,
		      	selectable: true,
		      	selectMirror: true,
		        dayMaxEvents: true, 
				editable: true,
		      	height : 800,
						        
		      	header : {
		        	left : "",
		        	center : "prev, title ,next ",
		        	right : "addEventButton, today, prevYear, nextYear "
		        },
		        
		        views : {
		        	month : {
		        		titleFormat: "YYYY년 MM월"
		        	}
		        },
				
		        //등록된 일정 조회 
		        events: function(start, end, timezone, callback){

		        	$.ajax({
						url : "getSchedule.sc",
						
						data : {deptCode : '${loginUser.deptCode}'},
						
			            success : function(schedule){
			            	var events = [];
			            	
			            	for(var i = 0 ; i<schedule.length ; i++){
			            		
			            		var event ={
			            			no: schedule[i].deptSchedule_No,
			            			title : schedule[i].scheduleTitle,
			            			content : schedule[i].scheduleContent,
			            			start : schedule[i].startDate,
			            			end : schedule[i].endDate,
			            			
			            		};
			            		events.push(event);
			            		console.log(events)
;							}
			            	
			            	callback(events);
			            },
			            
			            error : function(){
			            	alert("이벤트 조회 실패 ");
			            }
					
					});
		        	
		        },
		        	
		        //날짜 클릭 이벤트 
		        dayClick : function(start, end, jsEvent){
		        	$("#schedule-modal").modal("show");
		        		var startDate = moment(start).format('YYYY-MM-DD');
		        		console.log(startDate);	
		        		
		        		var endDate = moment(end).format('YYYY-MM-DD');
		        		
		        		$startDate = $("#startDate").val(startDate); // 선택한 날짜 value에 담아서 보여주기 
						$("#addSchedule").on("click", function(){
							//날짜 포맷 바꿔주기 
	
				        	var $title = $("#scheduleTitle").val();
	
							var $content = $("#scheduleContent").val();
							
							var $endDate = $("#endDate").val();
							
							var jobCode = '${loginUser.jobCode}';
							
							var deptCode = '${loginUser.deptCode}';
							
							if($title == ""){
								alert("일정 제목을 입력해주세요");
								
							}else if($startDate == "" || $endDate == ""){
								alert("날짜를 입력해주세요");
								
							}else if(new Date($endDate) - new Date($startDate) < 0){
								alert("종료일이 시작일보다 빠를 수 없습니다.");
								
							}else{
								//정상 입력시 전송할 객체 생성  
								//ajax로 DB연동 하기 
								$.ajax({
									
									url: "addSchedule.sc",
									
									data : {
										scheduleTitle : $title,
										scheduleContent : $content,
										startDate : $startDate.val(),
										endDate : $endDate,
										jobCode : jobCode,
										deptCode : deptCode
									},
									
						            success : function(result){
										console.log(result);
										if(result == "YYYY"){
											alert("일정 등록 완료 ")

										}else{
											alert("일정 등록에 실패하였습니다. ")
										}
										
									},
									
									error : function(){
										console.log("실패");
									}
									
								});
								
							}
						}); // 추가 버튼 클릭 이벤트 
							
					},
		        
		        //상단에 위치한 일정 추가 버튼 클릭시 발생할 이벤트 
				customButtons:{
					
					addEventButton : {
						text : "일정 추가",
	
						click : function(){
							$("#schedule-modal").modal("show");
								var today = new Date();
								console.log(today);
								var year = today.getFullYear();
								var month = ("0" + (today.getMonth() + 1)).slice(-2);
								var day = ("0" + (today.getDate())).slice(-2);
											
								var todayString = year + "-" + month +"-" + day;
								
								var $startDate = $("#startDate").val(todayString); // 오늘 날짜로 미리 보여 주기 
							
							$("#addSchedule").on("click", function(){
								
								var $title = $("#scheduleTitle").val();
								
								var $content = $("#scheduleContent").val();
								
								var $endDate = $("#endDate").val();
								
								var jobCode = '${loginUser.jobCode}';
								
								var deptCode = '${loginUser.deptCode}';
								
								if($title == ""){
									alert("일정 제목을 입력해주세요");
									
								}else if($startDate == "" || $endDate == ""){
									alert("날짜를 입력해주세요");
									
								}else if(new Date($endDate) - new Date($startDate) < 0){
									alert("종료일이 시작일보다 빠를 수 없습니다.");
									
								}else{
									//정상 입력시 전송할 객체 생성  
									var schedule = {
										
										scheduleTitle : $title,
										scheduleContent : $content,
										startDate : $startDate.val(),
										endDate : $endDate,
										jobCode : jobCode,
										deptCode : deptCode
									}
									console.log(schedule);
									//ajax로 DB연동 하기 
								}
									
							})
							
						}
					}
				}, //일정 추가 버튼  이벤트 끝  
				
			}); //부서 일정 
		}
	
		//개인 일정 
		$("#change-schedule").on("click", function(){
			if($("#schedule-category").val()=='S1'){
				
				$("#calendar").fullCalendar('destroy');
				
				$("#userCalendar").fullCalendar({
					plugins : ['interaction','dayGrid'],
					
					locale: 'ko',
				 	slotMinTime: '09:00',
			      	slotMaxTime: '18:00',
			        firstDay : 1, 
			      	navLinks: true,
			      	selectable: true,
			      	selectMirror: true,
			        dayMaxEvents: true, 
					editable: true,
					fixedWeekCount : false, //다음달 첫 주 지우기 
			      	height : 800,
			      	
			        header : {
			        	
			        	left : "",
			        	center : "prev, title ,next ",
			        	right : "addEventButton, today, prevYear, nextYear "
			        },
			        
			        views : {
			        	month : {
			        		titleFormat: "YYYY년 MM월"
			        	}
			        },
			     
				});
				
			}else{
				$("#userCalendar").fullCalendar('destroy');
				
				deptSchedule(); //부서 일정 호출 
			
			}

		});
		
	});// 전체 함수 끝

</script>	
</body>
</html>