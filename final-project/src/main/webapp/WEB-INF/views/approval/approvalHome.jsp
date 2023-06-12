<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Document</title>
    <style>
        div{
            box-sizing: border-box;
        }
        .approval-home{
            width: 1000px;
            height: 800px;
            margin: auto;
        }
        .approval-home>div{
            width: 100%;
        }
        #approval-home_1{
            height: 30%;
        }
        #approval-home_2{
            height: 40%;
        }
        #approval-home_3{
            height: 30%;
        }
        #approval-home_1>div{
            height: 100%;
            float: left;
        }
        #lately-area{
            float: right;
            font-size: 20px;
            padding-top: 25px;
            padding-right: 100px;
        }
        #approval_short_list{
        	width: 100%;
        	text-align : center;
        }
        #approval_short_list>tbody>tr:hover{
		    background-color: rgb(209, 207, 207);
		    cursor: pointer;
		}
       

    </style>
</head>
<style>
	div{
	    box-sizing: border-box;
	}
	.approval-home{
	    width: 1000px;
	    height: 1000px;
	    margin: auto;
	}
	.approval-home>div{
	    width: 100%;
	}
	#approval-home_1{
	    height: 30%;
	}
	#approval-home_2{
	    height: 40%;
	}
	#approval-home_3{
	    height: 30%;
	}
	#approval-home_1>div{
	    height: 100%;
	    float: left;
	}
	#lately-area{
	    float: right;
	    font-size: 20px;
	    padding-top: 25px;
	    padding-right: 100px;
	}
	.table{
		table-layout: fixed;
        
	}
	.table>thead{
		text-align : center;
	}
	.table>tbody>tr>td {
		text-align: center;
		word-break:break-all;
	}
    .table>tbody>tr:hover{
	    background-color: rgb(209, 207, 207);
	    cursor: pointer;
	}
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
        <br><br><br><br>
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
                    <li class="nav-item">
                      <button class="nav-link" onclick="approvalList('T');">임시함</button>
                    </li>
                </ul>

            </div>
            <table class="table table-hover" align="center">
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
<<<<<<< HEAD

            
=======
			<h1>그래프 넣기</h1>
>>>>>>> refs/remotes/origin/main
        </div>
    </div>
<<<<<<< HEAD
=======
    <script>
    	$(function(){
        	approvalList();

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
    						 + "<td colspan='2'>"+list[i].docTitle+"</td>"
    						 + "<td>"+list[i].createDate+"</td>"
    						 + "</tr>"
    				}
    				
    				$(".table>tbody").html(str);
    			},
    			error : function(){
    				console.log("통신오류");
    			}
    		});
    	}
    </script>
   
>>>>>>> refs/remotes/origin/main
</body>
</html>