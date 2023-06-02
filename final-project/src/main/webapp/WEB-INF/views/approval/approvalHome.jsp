<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="resources/css/Approval_main.css" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Document</title>
</head>
<style>
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
    
    li button:hover{
    	border-top: 1px solid #dee2e6;
		border-left: 1px solid #dee2e6;
		border-right: 1px solid #dee2e6;
		border-top-left-radius:0.25rem;
		border-top-right-radius:0.25rem; 
    }
</style>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="approval-home">
        <div id="approval-home_1">
        <br><br>
                <table id="lately-area">
                <tr>
                    <th>최근사용내역</th>
                </tr>
                <tr>
                    <td><a href="">양식1</a></td>
                </tr>
                <tr>
                    <td><a href="">양식1</a></td>
                </tr>
                <tr>
                    <td><a href="">양식1</a></td>
                </tr>
                <tr>
                    <td><a href="">양식1</a></td>
                </tr>
            </table>
        </div>
        <div id="approval-home_2">
            <div id="board-tap-area">
                <ul class="nav-tabs">
                	<li class="nav-item">
                      <button class="nav-link">전체</button>
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
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('T');">임시함</button>
                    </li>
                </ul>

            </div>
            <table border=1 id="approval_short_list">
                <thead>
                    <tr>
                        <th width="70px">문서번호</th>
                        <th width="100px">부서</th>
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
			<h1>그래프 넣기</h1>
        </div>
    </div>
    <script>
    $(function(){
    	approvalList(status);

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
    						 + "<td>"+list[i].docNo+"</td>"
    						 + "<td>"+list[i].deptCode+"</td>"
    						 + "<td>"+list[i].docType+"</td>"
    						 + "<td>"+list[i].docTitle+"</td>"
    						 + "<td>"+list[i].createDate+"</td>"
    						 + "</tr>"
    				}
    				
    				$("#approval_short_list>tbody").html(str);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    </script>
   
</body>
</html>