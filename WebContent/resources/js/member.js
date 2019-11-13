/****************************** 헤더 - 세션 로그인/로그아웃 ******************** */

	

/******************************* MEMBER SIGNUP (회원가입) *********************************/
	
	/* ONLOAD FUNCTION */
	$(function() {
		
		var confId = $('#id_chk_res');
		var confEmail = $('#email_ver_res');
		var idchkWin = null;
		
		/* 아이디 중복확인 */
		$("#idChkBtn").click(function(){
			var member_id = $("input[name=member_id]").val();
			
			alert(member_id + "중복체크");
			url = '/Hippe/resources/popup/id_validation.jsp';
			$.ajax({
				type: 'post',
				url: '/Hippe/loginController.do?command=idChk',
				data : { "member_id" : member_id },
				success : function(msg){
					if(msg == "s" || msg == "S"){
						confId.val(true);
						alert('사용하실 수 있는 아이디입니다');
						$('#member_id').attr("readonly","readonly");
//						var idchkWin = window.open(url, "아이디 중복확인", "width=200px, height=200px, toolbar=no, resizable=no");
//						idchkWin.document.getElementById('msg').text("사용할 수 있는 아이디입니다");
					}else if(msg == "f" || msg == "F"){
						confId.val(false);
						alert('사용중인 아이디입니다');
//						var idchkWin = window.open(url, "아이디 중복확인", "width=200px, height=200px, toolbar=no, resizable=no");
//						idchkWin.document.getElementById('msg').text("사용할 수 있는 아이디입니다");
					}
				}, error: function(){
					alert('아이디 중복확인 실패');
					confId.val(false);
				}
			});
		});
		
		/* 전체동의 액션 */
		$("#allChk").click(function() {
			//전체선택
			if ($("#allChk").prop("checked")) {
				$("input[type=checkbox]").prop("checked", true);
				//전체선택 해제
			} else {
				$("input[type=checkbox]").prop("checked", false);
			}
		});

		/* 비밀번호 재확인 */
		$("#pwChk").change(function(){
			if($("#pwChk").val() != $("input[name=member_pw]").val()){
				$("#msgPW").html("비밀번호가 일치하지 않습니다.");
			}else{
				$("#msgPW").html("");
			}
		});
	
		
		$(".member_address").click(function(){
			goPopupDoro();
		});

		
		
		
		
		
	});// end  onload
	
	/* SUBMIT 버튼액션 */
	function sumbitForm() {
		if($('#id_chk_res').val()){
			if($('#email_ver_res').val()){
				if(($("#SignLawChk").is(":checked")&&$("#PersonalInfowChk").is(":checked")) == true){
					$("#welcomeMember").submit();
				}else{
					alert("약관동의를 확인해주세요.");					
					$("#SignLawChk").focus();
				}
			}else{
				alert("이메일 인증을 해주세요.");
				$("input[name=email_id]").focus();
			}
		}else{
			alert("아이디 중복확인을 해주세요");
			$("#member_id").focus();
		}
	}
	
//		if ($('#id_chk_res').val() == true) {
//			if(($('#id_email_res').val() == true){
//				if(($("#SignLawChk").is(":checked")&&$("#PersonalInfowChk").is(":checked")) == true){
//					$("#welcomeMember").submit();
//				}else{
//					alert("약관동의를 확인해주세요.");					
//					$("#SignLawChk").focus();
//				}
//			}else{
//				alert("이메일 인증을 해주세요.");
//				$("input[name=email_id]").focus();
//			}
//		}else {
//			alert("아이디 중복확인을 해주세요");
//			$("#member_id").focus();
//		}
	
	
	
	/* CANCLE 버튼액션 */
	function cancleJoin() {
		var conf = confirm("정말로 돌아가시겠습니까? 입력하신 정보는 저장되지 않습니다.");
		if (conf) {
			location.href = '/Hippe/memberController.do?command=main';
		}
	}
	
	
	
	/* 도로명주소 팝업창 오픈 */
	function goPopupDoro(){
		var url = "http://localhost:8787/Hippe/resources/popup/jusoPopup.jsp";
		var pop = window.open(url,"pop","width=570px, height=420px, scrollbars=yes, resizable=yes");
	}
	
	
	/* 이메일 인증코드 전송 */
	function sendVerifyCode(){
		var userEmail = $("input[name=email]").val();
		var confEmail =  $('#email_ver_res');
		//alert("전송할 주소 : " + userEmail);
		if(userEmail!=""){
			alert("인증메일이 발송되었습니다! \n최대 1~3분이 소요될 수 있습니다.");
			$.ajax({
				type : "POST",
				url : "/Hippe/mailController.do?command=sendEmail&email=" + userEmail,
				success : function(result){
					$("input[name=emailCode]").change(function(){
						if(result == $("input[name=emailCode]").val()){
							$("#msg-emailVerify").attr("color", "blue");
							$("#msg-emailVerify").html("인증확인");
							confEmail.val(true);
						}else{
							$("#msg-emailVerify").html("인증번호 오류");
							confEmail.val(false);
						}
					});
				},error : function(){
					alert('이메일 인증실패');
				}
			});
		}else{
			alert('이메일을 입력해주세요');
		}
	}

	
	
	
	
/******************************* MEMBER LOGIN (로그인) *********************************/
	
	function loginForm(){
		var inputId = $("input[type=text]").val();
		var inputPw = $("input[type=password]").val();
		
		if(inputId!= ""){
			if(inputPw != ""){
				$.ajax({
					type: 'post',
					url: '/Hippe/loginController.do?command=idChk',
					data : { "member_id" : inputId} ,
					success: function(msg){
						if(msg == "F"){
							$(".loginform").submit();
						}else{
							alert('존재하지 않는 아이디입니다');
						}
					},
					error : function(){
						alert('zero result: 알수없는 에러');
					}
				});
			}else{
				alert("비밀번호를 입력하세요.");
				$("input[type=password]").focus();
			}
		}else{
			alert("아이디를 입력하세요.");
			$("input[type=text]").focus();
		}
	}
	

	/* 카카오톡으로 로그인 */
	$(function(){
		// 사용할 앱의 JavaScript 키를 설정해 주세요.
		Kakao.init('88a53644a53d27e2c5d35f83330acdac');
		// 카카오 로그인 버튼을 생성합니다.
		Kakao.Auth.createLoginButton({
			container: '#btn_KakaoLogin',
			success: function getKakaotalkUserProfile(){
				// 이름과 아이디를 요청합니다.
				Kakao.API.request({
					url: '/v1/user/me',
					success: function(res) {
						console.log("이름 : " + res.properties.nickname);
						console.log("아이디 : " + res.id);
						
						var kakaoid = res.id;
						var kakaoname = res.properties.nickname;
						
						document.write('<form action="loginController.do" id="sub_form" method="get">'+
								'<input type="hidden" name="command" value="kakao">'+
								'<input type="hidden" name="kakaoid" value="'+kakaoid+'">'+
								'<input type="hidden" name="kakaoname" value="'+kakaoname+'">'+
						'</form>');
						document.getElementById("sub_form").submit();
					},
					fail: function(error) {
						console.log(error);
					}
				});
			},
			fail: function(err) {
				alert(JSON.stringify(err));
			}
		});
	});

	/******************************* MEMBER MYPAGE *********************************/
	
	
	/* 회원탈퇴 */
	function popupWithdraw(){
		open("/Hippe/resources/popup/confirm_withdraw.jsp", "비밀번호 확인", "width=300px, height=300px, scrollbars=no, resizable=no");
	}
	
	function withdrawMy(){
		id = $('input[name=member_id]').val();
		input_pw = $("input[name=input_pw]").val();
		if(confirm('정말로 탈퇴하시겠습니까?')){
			$.ajax({		
				type: 'post',	
				url : '/Hippe/memberController.do?command=disable' , 
				data : { "id" : id, "pw" : input_pw },
				success : function(msg){
					switch(msg){
					case "S":
						alert('성공적으로 탈퇴되었습니다.');
						opener.withdrawCallback(msg);
						window.close();
						break;
					case "E":
						alert('비밀번호가 옳지 않습니다.');
						break;
					case "F":
						alert('탈퇴에 실패했습니다. 다음에 다시 시도해주세요');
						window.close();
					}
				}, error : function(){
					alert('탈퇴에 실패했습니다. 다음에 다시 시도해주세요');
					window.close();
				}
			});
		}
	}
	
	/******************************* 아이디/비밀번호 찾기 *********************************/
	
	function findMyId(){
		var myName = $("input[name=myName]").val();
		var myEmail = $("input[type=email]").val();
		
		if(myName!= ""){
			if(myEmail != ""){
				$.ajax({
					type : 'post',
					url : '../memberController.do?command=find-id',
					data : { "myName" : myName, "myEmail" : myEmail },
					success : function(msg){
						var Obj = JSON.parse(msg);
						
						switch(Obj.res){
							case "S":
								alert(Obj.myId);
								break;
							case "D":
								alert("일치하는 계정이 없습니다.");
								break;
							case "F":
								alert("이메일이 존재하지 않습니다");
								break;
						}
					}, error : function(){
						alert('오류! 잠시후에 다시 시도해주세요.');
					}
				});
			}else{
				alert("이메일을 입력하세요");
			}	
		}else{
			alert("이름을 입력하세요");
		}
	}
		
	function findMyPw(){
		var myId = $("input[name=myId]").val();
		var myEmail = $("input[name=myEmail-pw]").val();

		if(myId!= ""){
			if(myEmail != ""){
				$.ajax({
					type: 'post',
					url : '../memberController.do?command=find-pw',
					data : { "myId" : myId, "myEmail" : myEmail },
					success : function(data){
						var Obj = JSON.parse(data);
						switch(Obj.res){
						case "S":
							$.ajax({
								type: 'post',
								url: '../mailController.do?command=sendNewPw',
								data: {
									"myId" : myId,
									"myEmail" : myEmail
								},
								success : function(data){
									alert(data);
									switch(data){
									case "Send":
										alert('사용하시는 이메일로 임시비밀번호를 발송하였습니다.');
										break;
									case "Fail":
										alert('알수없는 오류!잠시 후 에 다시 시도해주세요');
										break;
									}
								},error : function(){
									alert('비밀번호찾기에 실패했습니다! 잠시후 다시 시도해주세요');
								}
							});
							break;
						case "D":
							alert("입력하신 이메일이 일치하지 않습니다.");
							break;
						case "F":
							alert("계정이 존재하지 않습니다");
							break;
					}
					}, error : function(){
						alert('오류! 잠시후에 다시 시도해주세요.');
					}
				});
			}else{
				alert("이메일을 입력하세요");
			}	
		}else{
			alert("아이디를 입력하세요");
		}
	}	
	
	
	
	
	
	
	