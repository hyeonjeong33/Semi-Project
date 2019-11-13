<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="hippe.ticket.dao.ReservationDao"%>
<%@page import="hippe.ticket.dto.ReservationDto"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="../resources/css/member_adjust.css" rel="stylesheet" type="text/css">
<%	request.setCharacterEncoding("UTF-8");%>
<%	response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>

	<%@ include file="../common/hippe_header.jsp"%>

	<div id="center">

		<div id="div1"
			style="width: 200px; height: 150px; background-color: rgb(244, 244, 244); text-align: center;">
			<br />
			<div style="color: red; font-size: 20px;">마이페이지</div>
			<img id="img1" alt="img" src="./img/wnf.png"
				style="width: 180px; height: 5px;"> <br />
			<div style="font-size: 16px;">${name }님의 현재등급은<br/>
				<c:choose>
					<c:when test="${id eq 'admin'}">관리자입니다.</c:when>
					<c:otherwise>FAMILY입니다.</c:otherwise>
				</c:choose>
			</div>
			<button style="width: 60px; height: 20px; background-color: gray; color: rgb(255, 255, 255); text-align: center; border-radius: 4px; line-height: 1.5em; font-size: 12px;">내정보</button>
			<button style="width: 100px; height: 20px; background-color: rgb(89, 202, 183); color: rgb(255, 255, 255); text-align: center; border-radius: 4px; line-height: 1.5em; font-size: 12px;">비밀번호변경</button>
		</div>
		<div id="div2"
			style="width: 200px; height: 250px; background-color: rgb(244, 244, 244); text-align: center;">
			<div style="font-size: 16px;" style="margin-top: 5%;">
				<div style="margin-top: 5%;">예매·확인·취소</div>
				<div style="margin-top: 5%;">예매확인</div>
				<div style="margin-top: 5%;">예매취소</div>
				<img id="img1" alt="img" src="./img/wnf.png"
					style="width: 180px; height: 5px;"><br />
				<div style="margin-top: 5%;">즐겨찾기</div>
				<div style="margin-top: 5%;">수정·목록·삭제</div>
				<img id="img1" alt="img" src="./img/wnf.png"
					style="width: 180px; height: 5px;"><br />
				<div style="margin-top: 5%;">회원탈퇴</div>
			</div>
		</div>


		<div
			style="background-color: rgb(255, 255, 255); border-width: 1px; border-style: dotted; border-color: rgb(51, 51, 51); height: 60px; width: 1100px; text-align: center; vertical-align: center;">

			<div style="font-size: 16px; margin: auto;">
				조회기간선택
				<button id="button">7일</button>
				<button id="button">15일</button>
				<button id="button">1개월</button>
				<button id="button">3개월</button>

				<label>주문일자별</label> 
				<input id="search_start_date" type="date"> 
				<input id="search_end_date" type="date"> 

				<button id="button btnOk"
					style="font-size: 14px; color: rgb(255, 255, 255); text-align: center; background-color: rgb(240, 123, 125); width: 60px; height: 26px;">확인</button>

			</div>
		</div>

		<br /> <input id="radio" type="radio"
			style="width: 20px; height: 20px;"> 전체 <input type="radio"
			style="width: 20px; height: 20px;"> 예약 <input type="radio"
			style="width: 20px; height: 20px;"> 취소

		<table>
			<col width="80">
			<col width="100">
			<col width="250">
			<col width="235">
			<col width="100">
			<col width="80">
			<col width="130">
			<col width="100">

			<tr align="center" style="background-color: skyblue;">
				<th>예매번호</th>
				<th>예매일</th>
				<th>상품명</th>
				<th>이용일</th>
				<th>매수</th>
				<th>취소가능</th>
				<th>현재상태</th>
				<th>취소</th>
			</tr>
			<c:choose>
				<c:when test="${empty ticketlist}">
					<tr>
						<td colspan="7" align="center">---------- 예약목록이 존재하지 않습니다.
							----------</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${ticketlist}" var="dto" varStatus="status">
						<tr align="center" class="tra${dto.reservation_num }">
							<td>${dto.reservation_num }
								<%-- <fmt:formatDate pattern="yyyy-MM-dd"
									value="${dto.reservation_date }" /></td>
							<td class="tda">${dto.reservation_num } --%></td>
							<td>${dto.reservation_date }</td>
							<td>${dto.festival_name}</td>
							<td>${dto.festival_start } ~ ${dto.festival_end }
								<%-- <fmt:formatDate pattern="yyyy-MM-dd"
									value="${dto.festival_start }" /> ~ <fmt:formatDate
									pattern="yyyy-MM-dd" value="${dto.festival_end }" />< --%>${dto.festival_end }</td>
							<td>${dto.reservation_quantity }</td>
							<td>${dto.reservation_cancellabel}</td>
							<td>${dto.reservation_status}</td>
							<td>
							<c:choose>
									<c:when test="${dto.reservation_cancellabel eq 'Y' }">
										<input type="button" value="취소" class="btn" required="required"/>
									</c:when>
									<c:otherwise>
										<button class="btn2">취소불가</button>
									</c:otherwise>
							</c:choose>
							</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>
</body>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$(".btn").click(function() {

			var num = $(this).parent().parent().find("td[class=tda]").text();
			var yesorno = confirm("정말 예매를 취소하시겠습니까?");
			if(yesorno==true){
				$.ajax({
					type : 'post',
					url : "ReservationController.do?command=cancel&yesorno=yes",
					data : {"num" : num	},
					success : function(msg) {
						if (msg == 'yes') {
							alert("예매취소에 성공하였습니다.");
							$(".tra" + num).remove();
						} else if (msg == "no") {
							alert("예매취소에 실패하였습니다.");
						}
					},
					error : function() {
						alert("예매취소 실패(통신에러)");
					}
				});
			} else if(yesorno == false){
				$.ajax({
					type : 'post',
					url : "ReservationController.do?command=cancel&yesorno=no",
					data : {"num" : 0},
					success : function(msg) {
						if (msg == 'yes') {
							alert("예매취소에 성공하였습니다.");
							$(".tra" + num).remove();
						} else if (msg == "no") {
							alert("예매취소에 실패하였습니다.");
						}
					},
					error : function() {
						alert("예매취소 실패(통신에러)");
					}
				});
			}
		});

		$('#btnOk').click(function(){
			var search_start_date = $('#search_start_date').val();
			var search_end_date = $('#search_end_date').val();
			
			if(search_start_date!=null && search_end_date!=null){
				if(search_start_date<search_end_date){
					alert(search_start_date + "부터 " + search_end_date + "까지 조회하기");
				}else{
					alert('검색 마지막 날짜가 검색 시작일보다 작습니다.\n조회 검색날짜를 다시 확인해주세요.');
				}				
			}
		});
	});
</script>
</html>

