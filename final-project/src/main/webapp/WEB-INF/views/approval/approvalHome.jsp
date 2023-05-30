<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.9.1/dist/chart.min.js"></script>
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
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="approval-home">
        <div id="approval-home_1">
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
            <button>예고함</button>
            <button>미결함</button>
            <button>진행함</button>
            <button>완료함</button>
            <button>반려함</button>
            <button>임시함</button>
            <table border="1" id="approval_short_list">
                <thead>
                    <tr>
                        <th>구분</th>
                        <th width="100px">기안부서</th>
                        <th colspan="2">제목</th>
                        <th>기안자</th>
                        <th>파일</th>
                    </tr>
                </thead>
                <tbody>
                	<tr>
						<td>구분</td>
						<td>영업부</td>
						<td colspan="2">지출품의서</td>
						<td>김유진</td>
						<td></td>
					</tr>	
                </tbody>
            </table>
        </div>
        <div id="approval-home_3">

            
        </div>
    </div>
</body>
</html>