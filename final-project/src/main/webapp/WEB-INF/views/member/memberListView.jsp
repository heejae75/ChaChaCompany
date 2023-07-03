<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임직원 조회</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<style>
    .table-responsive{
        width: 1000px;
        margin : auto;
    }
    .table-responsive th{
        text-align: center;
    }
    #paging{
    	width:fit-content;
    	margin:auto;
    }
    #title{
    	text-align:center;
    }
    .btn-outline-secondary{
    	float:right;
    }
    .form-control-plaintext{
    	border : 2px solid black;
    	width : 200px;
    	float : right;
    	margin-bottom : 20px;
    }
    #searchMember{
    	float : right;
    }
    #searchMember input{
    	height : 27px;
    	font-size:15px;
    }
    .table>tbody>tr:hover{
    	background-color : rgb(198, 247, 190);
    }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
	    <div id="empInquiry">
	    	<h1 id="title">임직원 조회</h1> <br><br><br>
	        <div class="table-responsive">
		    	<button type="button" id="job_button" class="btn btn-outline-secondary" onclick="orderByJob();">직책</button>
		        <button type="button" id="all_button" class="btn btn-outline-secondary" onclick="memberAll();">전체</button>
		    	<br><br>
		    	<div id="searchMember">
		    		<form action="/final3/${role}/list.me" method="get">
			    		<select name="category">
			    			<option value="name">이름</option>
			    			<option value="dept">부서</option>
			    			<option value="job">직책</option>
			    		</select>
			    		<input type="text" class="form-control-plaintext" name="searchWord">
		    		</form>
		    	</div>
	            <table class="table">
	                <thead>
	                    <tr>
	                        <th>사번</th>
	                        <th>이름</th>
	                        <th>전화번호</th>
	                        <th>이메일</th>
	                        <th>부서</th>
	                        <th>직책</th>
	                    </tr>
	                </thead>
	                <tbody>
						<c:forEach var="m" items="${list}">
							<tr>
								<th>${m.userNo}</th>
								<th>${m.userName}</th>
								<th>${m.phone}</th>
								<th>${m.email}</th>
								<th>${m.deptName}</th>
								<th>${m.jobName}</th>
							</tr>
						</c:forEach>
	                </tbody>
	            </table>
	            <br><br>
	            <div id="paging">
	            	<ul class="pagination">
	            		<c:choose>
	            			<c:when test="${pi.currentPage eq 1}">
			            		<li class="page-item disabled">
			            			<a class="page-link">Previous</a>
			            		</li>	            				
	            			</c:when>
	            			<c:otherwise>
	            				<li class="page-item">
	            					<a class="page-link" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${pi.currentPage-1}&&category=${map['category']}&&searchWord=${map['searchWord']}">Previous</a>
	            				</li>
	            			</c:otherwise>
	            		</c:choose>
	            		
	            		<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
							<li class="page-item">
								<a class="page-link" onclick="pageColor()" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${p}&&category=${map['category']}&&searchWord=${map['searchWord']}">${p}</a>
							</li>	            			
	            		</c:forEach>
	            		
	            		<c:choose>
	            			<c:when test="${pi.currentPage eq pi.maxPage}">
								<li class="page-item disabled">
									<a class="page-link">Next</a>
								</li>	            				
	            			</c:when>
	            			<c:otherwise>
								<li class="page-item">
									<a class="page-link" href="/final3/${role}/list.me?currentStatus=${map['currentStatus']}&&currentPage=${pi.currentPage+1}&&category=${map['category']}&&searchWord=${map['searchWord']}">Next</a>
								</li>	            			
	            			</c:otherwise>
	            		</c:choose>
	            	</ul>
	            </div>
	        </div>
	    </div>
	    <br><br>
	</div>
	<div class="modal" id="myModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	
	      <!-- Modal Header -->
	      <div class="modal-header">
	        <h4 class="modal-title">Modal Heading</h4>
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	      </div>
	
	      <!-- Modal body -->
	      <div class="modal-body">
	        Modal body..
	      </div>
	
	      <!-- Modal footer -->
	      <div class="modal-footer">
	        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	      </div>
	
	    </div>
	  </div>
	</div>
	
	<script>
		$(function(){
			$(".page-link").eq(${pi.currentPage}).css('color', 'red');
			if("${map['category']}" != ''){
				$("#searchMember input").val("${map['searchWord']}");
				$("#searchMember select").val("${map['category']}");
			}
		});
		
		if("${role}" == 'admin'){
			$(".table>tbody>tr").click(function(){
				var dv = event.currentTarget;
				var userNo = dv.children[0].innerText;
				location.href = "/final3/admin/detailList.me?userNo=" + userNo;
			});
		}
		
		function orderByJob(){
			location.href='/final3/${role}/list.me?currentStatus=JOB_CODE';
		}
		
		function memberAll(){
			location.href='/final3/${role}/list.me';
		}
		
		$(function(){
			if("${currentStatus}" == 'JOB_CODE'){
				$("#job_button").css({"background-color":"rgb(198, 247, 190)"});
			}else{
				$("#all_button").css({"background-color":"rgb(198, 247, 190)"});
			}
		});
	</script>
</body>
</html>