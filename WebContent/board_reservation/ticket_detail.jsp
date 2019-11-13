<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="hippe.board.dto.FestivalDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 티켓 상세보기 ::</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="/Hippe/resources/js/ticket.js"></script>
<script type="text/javascript">
function orderTicket(){
	var member_id = $('input[name=id]').val();
	if(member_id != null){
		url = '/Hippe/board_reservation/payment_step01.jsp';
		open(url, "| Hippe | 티켓 예매페이지", "width=900px, height=650px, toolbar=no, resizable=no, location=no");
		/* orderWin.document.getElementById('member_id').value() = $('input[name=id]').val();
		orderWin.document.getElementById('festival_num').value() = $('input[name=festival_num]').val();
		orderWin.document.getElementById('festival_name').value() = $('input[name=name]').val();
		orderWin.document.getElementById('festival_start').value() = $('input[name=start]').val();
		orderWin.document.getElementById('festival_end').value() = $('input[name=end]').val();
		orderWin.document.getElementById('festival_price').value() = $('input[name=price]').val();
		orderWin.document.getElementById('festival_imgsrc').value() = $('input[name=imgsrc]').val(); */
	}else{
		conf = confirm('로그인이 필요한 페이지입니다. 로그인 페이지로 이동하시겠습니까?');
		if(conf){
			location.href = '/Hippe/loginController.do?command=loginBtn';
		}
	}	
}

function callbackPay(member_id, festival_num, quantity, total_price){
	alert('돌아와 기가지니');
	$.ajax({
		type : 'post',
		url : '../ReservationController.do?command=paynow',
		data :{
			"member_id" : member_id,
			"festival_f_num" : festival_num,
			"festival_quantity" : quantity,
			"festival_totalprice" : total_price
		},
		success: function(val){
			if(val == "s"){
				if(conf('성공적으로 결제하였습니다. 예매내역을 확인하시겠습니까?')){
					location.href="../ReservationController.do?command=ticket-check";
				}
				window.close();
			}
		},
		error: function() {
        	alert('결제에 실패하였습니다.');
		}
	});
}
</script>
<link href="/Hippe/resources/css/ticket_detail.css" rel="stylesheet" type="text/css" >
</head>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
	<br/><br/><br/>
	
	<div id="center">
		
		
		<div>
			<input type="hidden" id="member_id" name="id" value="${id}">
			<input type="hidden" id="festival_num" name="festival_num" value="${dto.festival_num}">
			<input type="hidden" id="festival_name" name="festival_name" value="${dto.festival_name}">
			<input type="hidden" id="festival_start" name="festival_start" value="${dto.festival_start}">
			<input type="hidden" id="festival_end" name="festival_end" value="${dto.festival_end}">
			<input type="hidden" id="festival_content" name="festival_content" value="${dto.festival_content}">
			<input type="hidden" id="festival_location" name="festival_location" value="${dto.festival_location}">
			<input type="hidden" id="festival_price" name="festival_price" value="${dto.festival_price}">
			<input type="hidden" id="festival_imgsrc" name="festival_imgsrc" value="${dto.festival_imgsrc}">
		</div>
		<h1 id="title">${dto.festival_name}</h1>
		
		<div class="hr">
			<div class="image" id="imgsrc" style="background: url('${dto.festival_imgsrc}'); background-size: cover;">
			
			<table class="div">
			<col width="200px">
			<col width="300px">
				<tr>
					<th>장소</th>
					<td id="location">${dto.festival_location}</td>
				</tr>
				<tr>
					<th>기간</th>
					<td id="date">${dto.festival_start} ~ ${dto.festival_end}</td>
				</tr>
				<tr>
					<th>가격정보</th>
					<td id="price">${dto.festival_price}</td>
				</tr>
				<tr>
					<th>축제 상세내용</th>
					<td id="content">${dto.festival_content }</td>
				</tr>
			</table>
			</div>
		</div>
		
		<%

		FestivalDto dto = (FestivalDto)request.getAttribute("dto");
		
		int festival_num = dto.getFestival_num();
		String name = dto.getFestival_name();
		String festival_imgsrc = dto.getFestival_imgsrc();
		String festival_location = dto.getFestival_location();
		String festival_url = "http://localhost:8787/Hippe/festivalController.do?command=ticketdetail&festival_num=" + festival_num;
		
		session.setAttribute("festival_num", festival_num);
		session.setAttribute("name",name);
		session.setAttribute("festival_imgsrc",festival_imgsrc);
		session.setAttribute("festival_location",festival_location);
		session.setAttribute("festival_url",festival_url); 	
		
 		%>		
		<div class="detail">
			<div class="weather" style="background: url('/Hippe/resources/images/korea.png')"></div>
			
				<div class="button btn_order" onclick="orderTicket()">예매하기</div>
				<div class="allbutton">
					<div class="kakaolink">카카오링크<jsp:include page="/board_reservation/kakao_share.jsp"/></div>
					<div class="heart">찜하기
						<div>
							<input type="hidden" name="toggle" value="1">
							<img class="heart-img" alt="img" src="/Hippe/resources/images/unlikeheart.png" style="width: 35px; height: 35px;">
						</div>
					</div>
				</div>

		<!-- 날씨위젯 -->
		</div>
			<div id="tjdnf1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               String url = "http://www.weather.go.kr/weather/forecast/mid-term-rss3.jsp?stnId=108";
               Document doc = null;

               try {
                  doc = Jsoup.connect(url).get();
               } catch (IOException e) {
                  // TODO Auto-generated catch block
                  e.printStackTrace();
               }
               Elements elements = doc.getElementsByTag("location");
               
               String tjdnfres1 = null;
               String tjdnfres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("서울")) {
                     tjdnfres1 = el.getElementsByTag("wf").get(0).text();
                     tjdnfres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(tjdnfres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="tjdnf2">
                  <%= tjdnfres2 %>
               </div>
            </div>   
            <div id="tjgo1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String tjgores1 = null;
               String tjgores2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("인천")) {
                     tjgores1 = el.getElementsByTag("wf").get(0).text();
                     tjgores2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(tjgores1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="tjgo2">
                  <%= tjgores2 %>
               </div>
            </div>
            <div id="cndska1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String cndskares1 = null;
               String cndskares2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("대전")) {
                     cndskares1 = el.getElementsByTag("wf").get(0).text();
                     cndskares2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(cndskares1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="cndska2">
                  <%= cndskares2 %>
               </div>
            </div>
            <div id="cndqnr1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String cndqnrres1 = null;
               String cndqnrres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("충주")) {
                     cndqnrres1 = el.getElementsByTag("wf").get(0).text();
                     cndqnrres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(cndqnrres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="cndqnr2">
                  <%= cndqnrres2 %>
               </div>
            </div>
            <div id="dudtj1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String dudtjres1 = null;
               String dudtjres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("원주")) {
                     dudtjres1 = el.getElementsByTag("wf").get(0).text();
                     dudtjres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(dudtjres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="dudtj2">
                  <%= dudtjres2 %>
               </div>
            </div>
            <div id="dudehd1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String dudehdres1 = null;
               String dudehdres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("강릉")) {
                     dudehdres1 = el.getElementsByTag("wf").get(0).text();
                     dudehdres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(dudehdres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="dudehd2">
                  <%= dudehdres2 %>
               </div>
            </div>
            <div id="dnffmd1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String dnffmdres1 = null;
               String dnffmdres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("울릉도")) {
                     dnffmdres1 = el.getElementsByTag("wf").get(0).text();
                     dnffmdres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(dnffmdres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="dnffmd2">
                  <%= dnffmdres2 %>
               </div>
            </div>
            <div id="rudqnr1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String rudqnrres1 = null;
               String rudqnrres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("경주")) {
                     rudqnrres1 = el.getElementsByTag("wf").get(0).text();
                     rudqnrres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(rudqnrres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="rudqnr2">
                  <%= rudqnrres2 %>
               </div>
            </div>
            <div id="rudska1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String rudskares1 = null;
               String rudskares2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("부산")) {
                     rudskares1 = el.getElementsByTag("wf").get(0).text();
                     rudskares2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(rudskares1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="rudska2">
                  <%= rudskares2 %>
               </div>
            </div>
            <div id="wjsqnr1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String wjsqnrres1 = null;
               String wjsqnrres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("군산")) {
                     wjsqnrres1 = el.getElementsByTag("wf").get(0).text();
                     wjsqnrres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(wjsqnrres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="wjsqnr2">
                  <%= wjsqnrres2 %>
               </div>
            </div>
            <div id="wjsska1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String wjsskares1 = null;
               String wjsskares2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("광주")) {
                     wjsskares1 = el.getElementsByTag("wf").get(0).text();
                     wjsskares2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(wjsskares1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="wjsska2">
                  <%= wjsskares2 %>
               </div>
            </div>
            <div id="wpwneh1"  style="width: 36px; height: 36px; background-color: rgb(255, 255, 255); font-size: 12px; color: #d64228;">            
            <%
               
               String wpwnehres1 = null;
               String wpwnehres2 = null;
               
               for (Element el : elements) {
                  if (el.getElementsByTag("city").text().equals("제주")) {
                     wpwnehres1 = el.getElementsByTag("wf").get(0).text();
                     wpwnehres2 = el.getElementsByTag("tmn").get(0).text() + "/" + el.getElementsByTag("tmx").get(0).text();
                  }
               }
            %>
            <%         
               switch(wpwnehres1){
               case "맑음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s1.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름조금":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s2.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많음":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s21.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s4.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s6.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "구름많고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s5.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐림":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s11.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s13.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 비/눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈/비":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s15.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               case "흐리고 눈":
                  %>
                     <img alt="img" src="https://ssl.pstatic.net/static/weather/images/w_icon/w_s14.gif" style="width: 36px; height: 26px;">
                  <%
                  break;
               }
               %>
               <div id="wpwneh2">
                  <%= wpwnehres2 %>
               </div>
            </div>                     
         </div>
      <div>
            
      </div>

		
</body>
</html>