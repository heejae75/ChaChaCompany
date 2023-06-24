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
        <h1>급여 명세서 작성</h1>
        <div id ="payment_search_area">
            <button type="button" class="btn btn-secondary" > 전체 조회 </button>
            <button type="button" id="entryPayment" class="btn btn-primary" > 작성 완료 </button>
        </div>
        <div id="payment_list">
            <table  class="table table" id="payment_table">
               	<thead>
	                <tr>
	                    <td colspan="2" style="font-weight:700; text-align:center;" >사번
	                    <td style="text-align:center;" >${mInfo.userNo}</td>
	                    <td colspan="2" style="font-weight:700; text-align:center; ">성명</td>
	                    <td style="text-align:center;">${mInfo.userName}</td>
	                    <td colspan="2" style="font-weight:700; text-align:center; ">부서</td>
	                    <td style="text-align:center;">${mInfo.deptName}</td> 
	                    <td colspan="2" style="font-weight:700; text-align:center; ">직급</td>
	                    <td style="text-align:center;">${mInfo.jobName}</td> 
	                </tr>
	                <tr>
	                	<td colspan ="2" style="font-weight:700; text-align:center; ">입사일</td>
	                    <td style="text-align:center;">${mInfo.empolymentDate}</td>
	                    <td colspan ="2" style="font-weight:700; text-align:center; ">급여 지급월 </td>
	                    <td style="text-align:center;"><input type="date" class="form-control" id="monthly" name="monthly"></td>
	                    <td colspan ="2" style="font-weight:700; text-align:center; ">계좌번호</td>
	                    <td style="text-align:center;" >${mInfo.bank}</td>
	                    <td colspan ="3" style="text-align:center;" >${mInfo.accountNumber}</td>
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
	                    <td colspan="3"><input type="number" name="salary" id="salary" class="form-control" ></td>
	                    <th colspan="3">국민연금</th>
	                    <td colspan="3"><input type="number" name="nationalPension" id="nationalPension"  class="form-control"></td>
	                    
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;" >식대</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="meals" id="meals" class="form-control" ></td>
	                    <th colspan="3" style="border-top:0px;">건강보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="healthInsurance" id="healthInsurance"  class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">추가근로수당</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="overtimePay" id="overtimePay" class="form-control"></td>
	                    <th colspan="3" style="border-top:0px;">고용보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="empInsurance" id="empInsurance" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan="3" style="border-top:0px;">휴일근로수당</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="holidayPay" id="holidayPay" class="form-control"></td>
	                    <th colspan="3" style="border-top:0px;">장기요양보험</th>
	                    <td colspan="3" style="border-top:0px;"><input type="number" name="lngInsurance" id="lngInsurance" class="form-control"></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-top:0px;" >연차수당</th>
	                    <td colspan ="3" style="border-top:0px;"><input type="number" name="annualLeavePay" id="annualLeavePay" class="form-control"></td>
	                    <th colspan ="3" style="border-top:0px;"></th>
	                    <td colspan ="3" style="border-top:0px;"></td>
	               </tr>
	               <tr>
	               		<th colspan ="3" style="border-bottom:3px solid #ddd;">그외수당</th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd;"><input type="number" name="otherPay" id="otherPay" class="form-control"></td>
	                    <th colspan ="3" style="border-bottom:3px solid #ddd;"></th>
	                    <td colspan ="3" style="border-bottom:3px solid #ddd;"></td>
	               </tr>
                </tbody>
            </table>
        </div>
        <!-- 해당 유저 급여 목록 영역 (토글로 띄워주기)  -->
        <div id="userPaymentList">
        </div>
    </div>
</div>
	<script>
		$(function(){
			$("#entryPayment").on("click",function(){
				var bank = '${mInfo.bank}';
				var account = '${mInfo.accountNumber}';
				
				if(bank == '' || account ==''){
					alert("계좌 미등록 상태입니다. 계좌 정보를 업데이트 해주세요 ")
				}else{
					//급여 등록 요청 
					$.ajax({
						url : "insertPayment.ad",
						
						type: "post",
						
						beforeSend : function(xhr)
			            {
			                xhr.setRequestHeader("${_csrf.headerName}", "${_csrf.token}");
			            },
			            
			            data : {
			            	
			            	userNo : '${mInfo.userNo}',
			            	accountNumber : account,
			            	bank : bank,
			            	monthly : $("#monthly").val(),
			            	salary : $("#salary").val(),
			            	meals : $("#meals").val(),
			            	overtimePay : $("#overtimePay").val(),
			            	holidayPay : $("#holidayPay").val(),
			            	annualLeavePay : $("annualLeavPay").val(),
			            	otherPay : $("otherPay").val(),
			            	nationalPension : $("#nationalPension").val(),
			            	healthInsurance : $("#healthInsurance").val(),
			            	empInsurance :$("#empInsurance").val(),
			            	lngInsurance : $("#lngInsurance").val()
			            	
			            },
			            
			            success : function(result){
			            	if(result == 'YYYY'){
			            		alert("급여 등록이 완료되었습니다.")
			            	}else{
			            		alert("급여 등록에 실패하였습니다. 다시 시도해주세요");
			            	}
		            		location.reload();
			            },
			            
			            error : function(){
			            	console.log("통신실패");
			            }
					})
				}
			});
		})
	
	</script>
</body>
</html>