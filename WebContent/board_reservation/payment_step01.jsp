<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="hippe.member.dto.MemberDto" %>
<%@ page import="hippe.member.dao.MemberDao" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=no">
<link href="/Hippe/resources/css/payment.css" rel="stylesheet" type="text/css">
<title>| Hippe | 티켓 예매페이지</title>
</head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
	window.onload = function(){
		/* 부모창의 값 받아오기 */
		member_id = opener.document.getElementById("member_id").value;
		festival_num = opener.document.getElementById("festival_num").value;
		festival_name = opener.document.getElementById("festival_name").value;
		festival_content = opener.document.getElementById("festival_content").value;
		festival_location = opener.document.getElementById("festival_location").value;
		festival_start = opener.document.getElementById("festival_start").value;
		festival_end = opener.document.getElementById("festival_end").value;
		festival_price = parseInt(opener.document.getElementById("festival_price").value);
		festival_imgsrc = opener.document.getElementById("festival_imgsrc").value;
		festival_totalprice = festival_price;
		
		
		/* 페이지 요소 셋팅 */
		$('#member_id').val(member_id);
		$('#title').text(festival_name);
		$('#date').text(festival_start + " ~ " + festival_end);
		$('#location').text(festival_location);
		$('#price').text(festival_price);
		$('#total-price').text(festival_totalprice);
		$('#festival_imgsrc').attr("src",festival_imgsrc);
		
		$('#btn_purchase').click(function(){
			purchaseProcess();
		});
	}
	
	
	function purchaseProcess(){
		total_price = $('#total-price').text();
		var IMP = window.IMP; 
        IMP.init('imp70049115'); 
        $("#btn_purchase").click(function() {
            IMP.request_pay({
            pg : 'kakaopay', 
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : "[입장권]"+festival_name ,
            amount : total_price,
            buyer_email : "",
            buyer_name : member_id,
            buyer_tel : '',
            buyer_addr : '',
            buyer_postcode : '35016',
            m_redirect_url : 'url'
        },function(rsp) {
            if (rsp.success) {
            	var msg = '결제가 완료되었습니다.';
            	alert(msg);
                window.close();
				
            } else {
 				alert('결제가 완료되지 못하고 종료하였습니다');
            }
        } );
    });
	}
	
	function add(){
		quantity = parseInt($('input[name=quantity]').val());
		if(quantity < 11){
			$('input[name=quantity]').val(quantity+1);
			$('#total-price').text(festival_price * quantity);
		}else{
			$('input[name=quantity]').val('10');
			$('#msg-quantity').text('최대 구매수량은 10개입니다.');
		}
	}
	
	function del(){
		quantity = parseInt($('input[name=quantity]').val());	
		if(quantity > 1){
			$('input[name=quantity]').val(quantity-1);
			$('#total-price').text(festival_price * quantity);
		} else{
			$('input[name=quantity]').val('1');
			$('#msg-quantity').text('수량은 1보다 작을수 없습니다.');
		}	
	}
</script>
<body>
	<!-- 부모창에서 받을 값 -->
	<input type="hidden" id="member_id" value="">
	<input type="hidden" id="festival_num" value="">
	
	<a href="#" id="logo">Hippe</a>
	
	<br/><br/><br/><br/>
	<form id="orderInfo" action="/Hippe/" method="post">
		<input type="hidden" name="">
		
	</form>
	
	<div id="center">
		<div class="top-balloon"> 
		<div class="step-first" style="width: 200px; height: 42px; line-height: 2.3em;
		color: rgb(255, 255, 255); border-radius: 5px;">관람일/회차선택
		</div>
		<div id="div1" class="step-second" style="width: 200px; height: 42px; line-height: 2.3em;
		color: rgb(255, 255, 255); border-radius: 5px;" >배송지/주문자 확인
		</div>
		<div id="div2" class="step-third" style="width: 200px; height: 42px; line-height: 2.3em;
		color: rgb(255, 255, 255); border-radius: 5px;">결제완료</div>
		</div>
		
		<br/><br/><br/><br/>
		<!-- 이미지 -->
		<label id="title"></label>
		<div class="div-step"><img alt="" id="festival_imgsrc" src=""></div>
		<div class="div-step" id="div3">
			<table >
				<tr class="label-description"><td>축제 일시</td></tr>
				<tr><td id="date"></td></tr>
				<tr class="label-description"><td>축제 개최장소</td></tr>
				<tr><td id="location"></td></tr>
				<tr class="label-description"><td>티켓가격</td></tr>
				<tr><td id="price"></td></tr>
			</table>
		</div>
		<input type="hidden" name="#" id="member_id" value="">
		<div class="div-step" id="div4" >
			<div id="quantity-check">
				<label>수량선택</label>
				<input type="button" value=" - " onclick="del();">	
				<input type="text" name="quantity" value="1" style="width:25px">
				<input type="button" value=" + " onclick="add();">
				<button id="btn_purchase">결제완료</button>
			</div>
			<label id="msg-quantity"></label>
			<hr>
			<p>결제금액</p>
			<label id="total-price"></label>
		</div>
		<div id="notify_law" >
			<div id="div5" data-text-content="true" style="font-size:16px;" >유의사항</div>
			<div id="notify_content" style="overflow: scroll;">Hippe(이하 히페)가 회원에게 제공하는 서비스는 기본적으로 무료입니다. 단, 히페가 유료로 책정한 서비스나 제3자와의 업무제휴를 통해 제공하는 별도의 유료정보를 이용하기 위해서는 회원이 해당 정보에 명시된 요금을 먼저 회사가 정한 방법으로 지불하여야 하며 이는 회원의 동의를 전제로 합니다.
이용요금은 히페 회원에게 제공되는 서비스 중 유료 서비스를 이용하기 위해 지불하는 요금으로 회원의 종류에 따라 차등 적용할 수 있으며, 서비스에 준하여 산정된 금액은 회원에게 사전에 고지합니다. 이를 위해 히페는 유료서비스 이용과 관련하여 다음 각 호의 사항을 해당 유료서비스의 소개화면이나 그 포장, FAQ 등에 회원이 알기 쉽게 표시합니다. 변경 시에는 변경 7일 전에 고지합니다.
"유료서비스"의 명칭 또는 제호
"유료서비스" 제작자의 성명(법인인 경우에는 법인의 명칭), 주소, 전화번호
"유료서비스"의 내용, 이용방법, 이용료 기타 이용조건
히페는 결제의 이행을 위하여 반드시 필요한 회원의 개인정보를 추가적으로 요구할 수 있으며, 회원은 히페가 요구하는 개인정보를 정확하게 제공하여야 합니다. 히페는 회원이 허위로 또는 부정확하게 제공한 개인정보로 인하여 회원에게 발생하는 손해에 대하여 히페의 고의⋅과실이 없는 한 회원의 손해를 배상할 책임을 부담하지 않습니다
유료 서비스를 이용한 회원이 본 약관에서 정한 사유가 발생하여 회원가입을 취소하고 환불을 요구하거나, 히페의 귀책사유로 서비스를 지속할 수 없을 경우 히페는 잔여 이용요금을 이용자가 지정하는 구좌로 환불 합니다.</div>
			</div>
	</div>
</body>
</html>