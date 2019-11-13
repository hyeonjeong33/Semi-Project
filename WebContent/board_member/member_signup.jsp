<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 회원가입 ::</title>
<link href="http://localhost:8787/Hippe/resources/css/member_signup.css" rel="stylesheet" type="text/css">
<!--booststrap-->
<link href="http://localhost:8787/Hippe/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
<!--//booststrap end-->
<!-- font-awesome icons -->

<link href="/Hippe/resources/css/font-awesome.min.css" rel="stylesheet">
<!-- //font-awesome icons -->
<!--stylesheets-->
<link href="/Hippe/resources/css/style.css" rel='stylesheet' type='text/css' media="all">
<!--//stylesheets-->
<link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
<link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://localhost:8787/Hippe/resources/js/member.js" type="text/javascript" ></script>
<script type="text/javascript">
function jusoCallBack(zipNo, roadFulladdr,addrDetail){
	$('#member_addr_postcode').val(zipNo);
	$('#member_addr_doro').val(roadFulladdr);
	$('#member_addr_detail').val(addrDetail);
}
function idValidate(msg){
	if(msg == "success"){
		$('input[name=id_chk_res]').val('S');
	}else{
		$('input[name=id_chk_res]').val('F');
	}
	
}
</script>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>
	
   <div class="div_top_title">
		<h5 class="top-title mb-lg-4 mb-3 text-center">JOIN</h5>
   </div>
   <div id="center">
      <form action="/Hippe/memberController.do" method="post" id="welcomeMember">
         <input type="hidden" name="command" value="signUp">
         <table> 
            <col width="400px">
            <col width="200px">
            <tr>
               <td>아이디</td>
            </tr>
            <tr>
               <td colspan="1"><input type="text" id="member_id" name="member_id" required/></td>
               
               <td>
               		<div id="idChkBtn" class="btnDiv">중복확인</div>
               		<input type="hidden" name="id_chk_res" id="id_chk_res" value="">
               </td>
            <tr>
               <td class="errorMsg" id="msgIdChk"></td>
            </tr>
            <tr>   
               <td colspan="1"></td>
               
            </tr>
            <tr>
               <td>비밀번호</td>
            </tr>
            <tr>
               <td colspan="1"><input type="password" placeholder="8자이상으로 입력해주세요" name="member_pw" required/></td>
            </tr>
            <tr>
               <td>비밀번호 확인</td>
            </tr>
            <tr>   
               <td colspan="1"><input type="password" placeholder="비밀번호를 다시 입력해주세요" id="pwChk" required/></td>
            </tr>
            <tr>
               <td><label class="errorMsg" id="msgPW"></label></td>
            </tr>
            <tr>
               <td>이름</td>
            </tr>
            <tr>   
               <td colspan="1"><input type="text" name="member_name" required="required"></td>
            </tr>
            <tr>
               <td>휴대폰 번호</td>
            </tr>
            <tr>   
               <td colspan="2">
               <div>
               <span><select id="phonelist" name="phone_start">
                     <option value="010">010</option>
                     <option value="011">011</option>
                     <option value="016">016</option>
                     <option value="017">017</option>
                     <option value="018">018</option>
                     <option value="019">019</option>
               </select>
               <label>-</label> 
               <input type="text" name="phone_mid" style="width:120px;">
               <label>-</label>
               <input id="5678" type="text" size="2.5" name="phone_end" style="width:120px;"></span>
               </div>
               </td>
            </tr>
            <tr>
               <td>주소</td>
            </tr>
            <tr>   
               <td colspan="1">
              		<input type="text" class="member_address" id="member_addr_postcode" readonly="readonly" style="width: 100px;">
              		<div class="btnDiv member_address btnAddrSearch">우편번호검색</div> 
               </td>
            </tr>
            <tr>   
               <td colspan="1"><input type="text" class="member_address" id="member_addr_doro" name="member_addr_doro" readonly="readonly" required="required"></td>
            </tr>
            <tr>   
               <td colspan="1"><input type="text" class="member_address" id="member_addr_detail" name="member_addr_detail" readonly="readonly" required="required"></td>
            </tr>
            <tr>
               <td>이메일</td>
            </tr>
            <tr>   
               <td colspan="1">
                 <input type="email" name="email" required="required">
               </td>
               <td colspan="1">
               <div class="btnSendVerify btnDiv" onclick="sendVerifyCode()">인증번호전송</div>
               <input type="hidden" name="email_ver_res" id="email_ver_res" value="">
               </td>
            </tr>
            <tr>
               <td>인증번호 입력</td>
            </tr>
            <tr>
               <td><input type="text" name="emailCode" required="required"></td>
            <tr>
               <td><label class="errorMsg" id="msg-emailVerify"></label></td>
            </tr>
               
         </table>

         <div id="LawOfSignup">
            <input type="checkbox" id="SignLawChk" />&nbsp;이용약관 동의(필수)<br />
            <div class="div_law">하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생</div><br /> <br /> 
            <input type="checkbox" id="PersonalInfowChk" />&nbsp;개인정보 수집 및 이용에 관한 동의(필수)<br />
            <div class="div_law">하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생</div><br /> <br /> 
            <input type="checkbox" id="AdsChk" />&nbsp;광고성 메일수신 정보제공동의(선택)<br />
            <div class="div_law">하여도 가슴이 설레는 말이다 청춘! 너의 두손을 가슴에 대고 물방아 같은 심장의 고동을 들어 보라 청춘의 피는 끓는다 끓는 피에 뛰노는 심장은 거선의 기관과 같이 힘있다 이것이다 인류의 역사를 꾸며 내려온 동력은 바로 이것이다 이성은 투명하되 얼음과 같으며 지혜는 날카로우나 갑 속에 든 칼이다 청춘의 끓는 피가 아니더면 인간이 얼마나 쓸쓸하랴? 얼음에 싸인 만물은 얼음이 있을 뿐이다 그들에게 생명을 불어 넣는 것은 따뜻한 봄바람이다 풀밭에 속잎나고 가지에 싹이 트고 꽃 피고 새 우는 봄날의 천지는 얼마나 기쁘며 얼마나 아름다우냐? 이것을 얼음 속에서 불러 내는 것이 따뜻한 봄바람이다 인생</div><br /> 
            <input type="checkbox" id="allChk"/><label>&nbsp;전체동의</label>
         </div>
         <br>
         <div id="btnCancle" class="btnDiv" onclick="cancleJoin()">CANCLE</div>
         <div id="btnJoin" class="btnDiv" onclick="sumbitForm()">JOIN</div>
      </form>
   </div>
</body>
</html>