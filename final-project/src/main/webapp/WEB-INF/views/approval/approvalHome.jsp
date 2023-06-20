<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/final3/resources/css/Approval_Main.css" >
    <title>Document</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="approval-home">
        <div id="approval-home_1">
        
              
        </div>
        <div id="approval-home_2">
            <div id="approval-tap-area">
                <ul class="nav-tabs">
                	<li class="nav-item">
                      <button class="nav-link" onclick="approvalList();">전체</button>
                    </li>
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('N');">예고함</button>
                    </li>
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('P');">진행함</button>
                    </li>
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('Y');">완료함</button>
                    </li>
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('R');">반려함</button>
                    </li>
                </ul>

            </div>
            <table id="approval-main-list" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th width="100px">문서번호</th>
                        <th width="110px">부서</th>
                        <th>문서종류</th>
                        <th colspan="2">제목</th>
                        <th>작성일</th>
                    </tr>
                </thead>
                <tbody>
                	
                </tbody>
            </table>
        </div>
        <div id="approval-home_3">
			<h1>승인/반려 통계 그래프</h1>
			<canvas id="graph-area"></canvas>
        </div>
    </div>
    
    <script>
    $(function(){
    	approvalList();
    	monthData();
    });
	function approvalList(status){
		$.ajax({
			url :"approvalMainList.ap",
			data : {
				status : status
			},
			success : function(list){
				var str ="";
				for(var i=0; i<list.length; i++){
					str += "<tr>"
						 + "<td width='100px'>"+list[i].docNo+"</td>"
						 + "<td width='110px'>"+list[i].deptCode+"</td>"
						 + "<td>"+list[i].docType+"</td>"
						 + "<td colspan='2'>"
						 if(list[i].emergency == 'Y' && list[i].status == 'P'){
					str	+= "<button type='button' class='btn btn-danger btn-sm' disabled style='background-color: #c42d2d'>긴급</button>"
						 }	 
					str	+= list[i].docTitle
						 + "</td>"
						 + "<td>"+list[i].createDate+"</td>"
						 + "</tr>"
				}
				
				$("#approval-main-list>tbody").html(str);
				
				$("#approval-main-list>tbody>tr").click(function(){
					var docNo = $(this).children().eq(0).text();
					var docType = $(this).children().eq(2).text();
					location.href = "detail.ap?docNo="+docNo+"&docType="+docType;
				});
			},
			error : function(){
				console.log("통신오류");
			}
		});
	}
	function monthData(){
		docWriter = "${loginUser.userNo}"
		console.log(docWriter);
		$.ajax({
			url : "monthData.ap",
			type : "POST",
			data : {docWriter : docWriter},
			beforeSend : function(xhr)
            {   /*데이터를 전송하기 전에 헤더에 csrf값을 설정한다*/
                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
            },
			success : function(list){
				var jsonData = list
				var jsonObject = JSON.stringify(jsonData);
				var jData = JSON.parse(jsonObject);
				var dateList = new Array(); 
				var approvalList = new Array();
				var rejectList = new Array();
				
				for(var i = 0; i<list.length;i++){
					var d = list[i];
					dateList.push(d.createDate);
					approvalList.push(d.approval);
					rejectList.push(d.reject);
				}
				console.log(dateList);
				console.log(approvalList);
				console.log(rejectList);
				
				const data = {
					labels: dateList,
					datasets:[{
						type : 'bar',
						label : '승인',
						data:approvalList,
						backgroundColor : '#cdf8cd',
						order : 1
					},{
						type : 'bar',
						label : '반려',
						data:rejectList,
						backgroundColor : '#fad2d2',
						order : 2
					}],	
				};
				var ctx1 = document.getElementById('graph-area').getContext('2d');
				const myChart = new Chart(ctx1,{
					type:'bar',
					data: data,
					options: {
					    scales: {
					      yAxes: [{
					    	  ticks:{
					    		  beginAtZero : true, // 0부터 시작하게 합니다.
									stepSize: 1   // 1 씩 증가하도록 설정합니다.
					    	  }
					      }]
					    }
					  }
				});
			},
			error : function(){
				console.log("통신오류")
			}
		});
	}
	
    </script>
</body>
</html>