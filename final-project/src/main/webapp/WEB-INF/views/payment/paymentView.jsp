<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>급여 명세서 조회 </title>
<style>
	.content{
        width: 1570px;
    }
    
    .payment_content{
		width:100%;
        height:100%;
        margin:auto;
        padding:2%;
        background-color:white;
    }
    
    .payment_content>h1{
    	margin : 0;
    }
    
    .payment_content #payment_search_area{
		margin-top: 20px;
		margin-bottom : 20px;		    	
    }
    
    #payment_search_area>input{
    	width : 10%;
    	float: left;
    	margin-right:5px;
    }
    
    .payment_content #payment_list{
    	width : 100%;
    
    }
    
    #payment_table th{
    	width: 8%;
    	text-align:center;
    
    }
	
	#payment_table input{
		background-color : white;
	}
	
	#payment_table>thead td, #payment_table>thead th{
		border-bottom : 3px solid #ddd;
	}

</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<div class="content">
	<div class="payment_content">
        <h1>급여 명세서 조회</h1>
      
        <div id ="payment_search_area">
            <input type="month" id="monthly" name="monthly" class="form-control"> <button type="button" id="search-btn" class="btn btn-secondary" > 조회 </button>
           	<button type="button" class="btn btn-secondary" > 전체조회 </button>
            <button type="button" class="btn btn-seconary" data-toggle="modal" data-target="#account"> 계좌등록/변경 </button>
        </div>
        <div id="payment_list">
            <table  class="table table" id="payment_table">
               	<thead>
	                <tr>
	                    <td style="font-weight:700; text-align:center;" >사번</td>
	                    <td style="text-align:center;">${mInfo.userNo}</td>
	                    <td style="font-weight:700; text-align:center; ">성명</td>
	                    <td colspan="2" style="text-align:center;">${mInfo.userName}</td>
	                    <td style="font-weight:700; text-align:center; ">부서</td>
	                    <td style="text-align:center;">${mInfo.deptName}</td> 
	                    <td style="font-weight:700; text-align:center; ">직급</td>
	                    <td style="text-align:center;">${mInfo.jobName}</td> 
	                    <td style="text-align:center;" colspan="2"></td>
	                </tr>
	                 <tr>
	                    <th colspan="3">지급내역</th>
	                    <th colspan="3">지급액</th>
	                    <th colspan="3">공제내역</th>
	                    <th colspan="3">공제액</th>
	                </tr>
                </thead>
                <tbody>
	               
	                <tr >
	                	<th colspan="3">기본급</th>
	                    <td colspan="3"><input type="text" name="salary" id="salary" class="form-control" readonly ></td>
	                    <th colspan="3">국민연금</th>
	                    <td colspan="3"><input type="text" name="nationalPension" id="nationalPension" class="form-control" readonly></td>
	                    
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;" >식대</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="meals" id="meals" value="" class="form-control" readonly ></td>
	                    <th colspan="3" style="border-top:0px;">건강보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="healthInsurance" id="healthInsurance" value="" class="form-control" readonly></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">추가근로수당</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="overtimePay" id="overtimePay" value="" class="form-control" readonly></td>
	                    <th colspan="3" style="border-top:0px;">고용보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="empInsurance" id="empInsurance" value="" class="form-control" readonly></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">휴일근로수당</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="holidayPay" id="holidayPay" value="" class="form-control" readonly></td>
	                    <th colspan="3" style="border-top:0px;">장기요양보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="text" name="lngInsurance" id="lngInsurance" value="" class="form-control" readonly></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-top:0px;" >연차수당</th>
	                    <td colspan ="3" style="border-top:0px;"><input type="text" name="annualLeavePay" id="annualLeavePay" value="" class="form-control" readonly></td>
	                    <th colspan ="3" style="border-top:0px;"></th>
	                    <td colspan ="3" style="border-top:0px;"></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-top:0px;">그외수당</th>
	                    <td colspan ="3" style="border-top:0px;"><input type="text" name="otherPay" id="otherPay" value="" class="form-control" readonly></td>
	                    <th colspan ="3" style="border-top:0px;"></th>
	                    <td colspan ="3" style="border-top:0px;"></td>
	               </tr>
	               <tr>
	                    <th colspan ="3" ></th>
	                    <td colspan ="3" ></td>
	               		<th colspan ="3">공제계액</th>
	                    <td colspan ="3"><input type="text" id="deductionSum" class="form-control" readonly></td>
	               </tr>
	               <tr>
	                    <th colspan ="3" style="border-bottom:3px solid #ddd;">지급계액</th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd;"><input type="text" id="originTotal" class="form-control" readonly></td>
	               		<th colspan ="3" style="border-bottom:3px solid #ddd;">차인지급액</th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd;"><input type="text" id="totalPay" class="form-control" readonly></td>
	               </tr>
                </tbody>
            </table>
        </div>
        <!-- 전체 목록 영역 -->
        <div id ="payment-allList">
        	<table class="table table-hover">
	        	<thead>
	        		<tr>
	        			<th>NO.</th>
	        			<th>사번</th>
	        			<th>이름</th>
	        			<th>부서</th>
	        			<th>직급</th>
	        			<th>발행일</th>
	        		</tr>
	        	</thead>	
	        	<tbody>
	        		<!-- 조회 결과 영역  -->
	        	</tbody>
        	</table>
        </div>
        <div id = "account-area">
        	<!--  계좌 신청 모달 --> 
        	<div class="modal fade" id="account" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
			  <div class="modal-dialog">
			    <div class="modal-content">
			      <div class="modal-header">
			      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
			        <h2 class="modal-title fs-5" id="staticBackdropLabel">계좌변경/신청</h2>
			      </div>
			      <div class="modal-body">
			      	<!-- 계좌정보 -->
			      	<select name="bank" id="bankName" class="form-control" style="width:20%; float:left; margin-right:5px;">
			      		<option >은행명</option>
			      		<option value="국민은행">국민은행</option>
			      		<option value="신한은행">신한은행</option>
			      		<option value="하나은행">하나은행</option>
			      		<option value="농협은행">농협은행</option>
			      		<option value="기업은행">기업은행</option>
			      		<option value="sc제일은행">sc제일은행</option>
			      		<option value="저축은행">저축은행</option>
			      		<option value="새마을금고">새마을금고</option>
			      		<option value="우체국">우체국</option>
			      		<option value="신협">신협</option>
			      		<option value="수협">수협</option>
			      	</select>
			      	<input type="text"  class="form-control" id="accountNumber" style="width: 50%; float:left; margin-right:5px;" required>
			      	<button type="button"id="submit-account" class="btn btn-success"> 등록 </button>
			      	<button type="button" id="change-account" class="btn btn-primary">변경</button>
			      </div>
			      
			      <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal" aria-label="Close" >취소</button>
			        
			      </div>
			    </div>
			  </div>
			</div>
        </div>
        <!-- 계좌 등록/변경 script -->
        <script>
        	$(function(){
        		//$("#payment_list").css("display:none");
        		//계좌 변경 신청
        		$("#change-account").on("click",function(){
        			if($("#accountNumber").val()==""){
        				alert("계좌번호를 입력해주세요");
        			}else if($("#bankName").val()== "은행명"){
        				alert("은행명을 선택해주세요")
        			}else{
        				if(confirm("계좌 변경을 신청하시겠습니까?")){
        					$.ajax({
        						
	        					url : "account.pa",
	        					type : "post",
	        					beforeSend : function(xhr){
	        			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
	        			        },
	        					data : {
	        						userNo : '${loginUser.userNo}',
	        						bank : $("#bankName").val(),
	        						accountNumber : $("#accountNumber").val()
	        					},
	        					success : function(result){
	        						if(result == "YYYY"){
	        							 alert("급여 계좌 변경 신청이 완료되었습니다.")
	        						}else{
	        							alert("급여 계좌 변경 신청에 실패하였습니다. 다시 시도해주세요")
	        						}
	        						location.reload();
	        					},	
	        					error : function(){
	        						console.log("통신실패");
	        					}
        				
        					});
        					
        				}
        			}
        		});
        	})
        	
        	//월별 조회 
        	$(function(){
        		$("#search-btn").on("click",function(){
        			if($("#monthly").val()==""){
        				alert("원하는 조회달을 선택해주세요")
        				$("#monthly").focus()
        			}else{
        				
        				$.ajax({
	        				url : "monthPayment.me",
	        				type : "post",
	        				beforeSend : function(xhr){
				                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
				        	},
	        				data : { 
	        					userNo : '${loginUser.userNo}',
	        					monthly : $("#monthly").val()
	        				},
	        				
	        				success : function(pay){
	        					if(pay != null){
	        						
		        					$("#salary").val(pay.salary); //급여
		        					$("#nationalPension").val(pay.nationalPension); //국민연금
		        					$("#meals").val(pay.meals); //식대
		        					$("#healthInsurance").val(pay.healthInsurance); //건강보험
		        					$("#overtimePay").val(pay.overtimePay); //추가근무수당
		        					$("#empInsurance").val(pay.empInsurance); //고용보험
		        					$("#holidayPay").val(pay.holidayPay); //휴일근무수당
		        					$("#lngInsurance").val(pay.lngInsurance); //장기요양보험
		        					$("#annualLeavePay").val(pay.annualLeavePay); //연차수당
		        					$("#otherPay").val(pay.otherPay); //그외수당 
		        					
		        					//세금합계 
		        					var deduction = pay.nationalPension + pay.healthInsurance + pay.empInsurance + pay.lngInsurance ;
									
		        					//급여 합계 
		        					var originTotal = pay.salary + pay.meals + pay.overtimePay + pay.holidayPay +pay.annualLeavePay +pay.otherPay;
		        					
		        					//총급여 
		        					var totalPay = originTotal-deduction;
		        					console.log(deduction);
		        					console.log(originTotal);
		        					console.log(totalPay);
		        					
		        					$("#deductionSum").val(deduction) // 공제합계 
		        					$("#originTotal").val(originTotal) //지급계액 
		        					$("#totalPay").val(totalPay) //차인지급액 
	        					}else{
	        						alert("조회된 내역이 없습니다.");
	        					}
	        				},
	        				
	        				error : function(){
	        					console.log("통신실패");
	        				}
        				
        				});
        			}
        			
        		});
        	});
        </script>
    </div>
</div>
</body>
</html>