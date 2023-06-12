<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
   <title>자료실 수정페이지 </title>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
	
	 .board-content{
	  	width : 1400px;
	}
  	
  	/* navi */
  	#board-tap-area{
  		width: 100%;	
  		margin:auto;
  	}
  
  
	#board-tap-area>ul{
		padding-top : 50px;
		height : 120px;
		list-style-type : none;
	}
	
	#board-tap-area>h1{
		padding-top : 50px;
		width : 10%;
		float : left;
		
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
	
	#document-detail{
		width : 100%;
		margin-top:40px;
    }
    
    #document-detail div{ /* => document-table-area */
        width: 80%;
        margin: auto;
    }
    
    #document-table{
    	width : 100%;
		
    }
    
    #document-table td{
    	height : 50px;
    	border : 2px solid black;
    }
    
    /* btn-area */
    #board-btn-area{
        text-align: center;
    }

    #board-btn-area>button{
        margin: 20px 10px 20px 10px;
    }
	
	select,input,textarea{
		padding: 0;
		border: 0;
	}

    </style>
    
</head>
<%@ include file="../../common/menubar.jsp" %>
<body id="body-pd">
    <div class="content">
    	<div class="board-content">
 
            <div id="board-tap-area">
            	<h1>자료실</h1>
                <ul id="nav-tabs">
				  	<li class="nav-item">
				    	<a class="nav-link" aria-current="page" href="#">공지사항</a>
				 	</li>
				  	<li class="nav-item">
				    	<a class="nav-link active" id="link_active" href="list.dc">자료실</a>
				  	</li>	
				  	<li class="nav-item">
				    	<a class="nav-link" href="#">대여</a>
				  	</li>
				  	<li class="nav-item">
				    	<a class="nav-link">커뮤니티</a>
				  	</li>
				</ul>
			</div>
            
	       	<div id="document-detail">
				<div id="document-table-area">
	            	<form action="update.dc" method="post" enctype="multipart/form-data">
	            	<input type="hidden" name="boardNo" value="${b.boardNo}">
	                <table id="document-table">
	                    <thead>
	                        <tr>
	                            <td width="10%" style="text-align: center;">
	                            	<select name="importanceLevel" style=" width :100%; height:100%; font-size: 20px; ">
	                            		<c:choose>
	                            			<c:when test="${b.importanceLevel eq 'R'}">
			   	                        		<option value="R">일반</option>
			       	                    		<option value="I">중요</option>
	                            			</c:when>
	                            			<c:otherwise>
			       	                    		<option value="I">중요</option>	                            			
												<option value="R">일반</option>
	                            			</c:otherwise>
	                            		</c:choose>
	           	                	</select>
	                            </td> 
	                            <td width="10%" style="text-align: center;">
	                            	<select name="categoryCode" style=" width :100%; height:100%; font-size: 20px; ">
	       	                    		<c:choose>
	                            			<c:when test="${b.categoryCode eq 'B1'}">
			   	                        		<option value="B1">공지사항</option>
			       	                    		<option value="B2">자료실</option>
			       	                    		<option value="B3">커뮤니티</option>
	                            			</c:when>
	                            			<c:when test="${b.categoryCode eq 'B2'}">
			       	                    		<option value="B2">자료실</option>
			   	                        		<option value="B1">공지사항</option>
			       	                    		<option value="B3">커뮤니티</option>
	                            			</c:when>
	                            			<c:otherwise>
			       	                    		<option value="B3">커뮤니티</option>
			   	                        		<option value="B1">공지사항</option>
			       	                    		<option value="B2">자료실</option>
	                            			</c:otherwise>
	                            		</c:choose>
	           	                	</select>
	                            </td>  
	                            <td style="text-align: center; font-size:20px; font-weight: 800;">제목</td>  
	                            <td><input id="title" name="boardTitle" type="text" style="width :100%; height:100%; font-size: 20px;" value="${b.boardTitle}"></td>      
                        	</tr>
	                    </thead>
	                    <tbody>
	                        <tr>
	                        	<td align="center">업로드 파일</td>
	                        	
	                            <td colspan="3">
                       	 		<c:forEach var="at" items="${atList}">
	                           		${at.originName} <br>
                     			</c:forEach>		
                           		</td>
	                        </tr>
	                        <tr>
		                        <td colspan="4">
		                        	<input type="file" name="upfile" multiple>
		                        </td>
	                        </tr>
	                        <tr>
	                            <td colspan="4"><textarea name ="boardContent" style="resize: none; width: 100%; height: 300px; padding: 0;" required>${b.boardContent}</textarea></td>
	                        </tr>
	                    </tbody>
	                </table>
	                <!-- 임시저장 기능 한번 확인 -->
		            <div id="board-btn-area">
		                <button class="btn btn-secondary" onclick="location.href=list.dc">취소</button> <button type="submit" class="btn btn-success">확인</button>               
		            </div>
		       		</form>
	            </div>
			</div>
        </div>
    </div>
</body>
</html>




