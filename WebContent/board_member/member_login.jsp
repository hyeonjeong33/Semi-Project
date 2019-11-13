<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="viewport" content="height=device-height, initial-scale=1">
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: 로그인 ::</title>
<style type="text/css">
	#naverIdLogin{
    position: inherit;
    margin: 15px; }
</style>
<link href="/Hippe/resources/css/member_login.css" rel="stylesheet" type="text/css">
<!--booststrap-->
<link href="/Hippe/resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
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
<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript" ></script>
<script  src="/Hippe/resources/js/member.js" type="text/javascript"></script>
<script src="//developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<body>
<jsp:include page="../common/hippe_header.jsp"></jsp:include>

<div class="div_loginfield">
	<form action="/Hippe/loginController.do?" method="get" class="loginform">
	 	<input type="hidden" name="command" value="login">
        <div class="div_IdPw_input">
            <p><input type="text" placeholder="아이디" name="member_id"></p>
            <p><input type="password" placeholder="영문, 숫자입력" name="member_pw"></p> 
        </div>
        <span class="btn_login" onclick="loginForm()">LOGIN</span>
     </form>
    <p><input type="checkbox" id="registID">&nbsp;아이디 저장</p>
	<div class="div_findAccout">
	     <span class="find"><a href="/Hippe/memberController.do?command=findMine">아이디/비밀번호 찾기</a></span> &nbsp;
	     <span class="join"><a href="/Hippe/memberController.do?command=signupBtn">회원가입</a></span><br/>
     </div>    
     <div class="div_loginApi">
	     <div class="btn_loginAPI with_kakao" id="btn_KakaoLogin">카카오 로그인</div>
    
    <!-- 네이버아이디로로그인 버튼 노출 영역 -->
		<div id="naverIdLogin"></div>
	<!-- //네이버아이디로로그인 버튼 노출 영역 -->
		
	<!-- 네이버아디디로로그인 초기화 Script -->
		<script type="text/javascript">
			var naverLogin = new naver.LoginWithNaverId(
				{
					clientId: "GbXfIGCTzGF3gSp5jJQ2",
					callbackUrl: "http://localhost:8787/Hippe/board_member/callback.jsp",
					isPopup: false, /* 팝업을 통한 연동처리 여부 */
					loginButton: {color: "green", type: 3, height: 49, width: 222} /* 로그인 버튼의 타입을 지정 */
				}
			);
			
			/* 설정정보를 초기화하고 연동을 준비 */
			naverLogin.init();
			
		</script>
		<!-- // 네이버아이디로로그인 초기화 Script -->
    
     </div>
 </div>
</body>
</html>
