	
$(function(){
	/************************* 티켓상세보기 ****************************/
	$(".heart-img").click(function(){
		var id = $('input[name=id]').val();
		var festival_name = $('#title').text();
		var festival_num = $('#festival_num').val();
		var toggle = $(this).parent().find("input[name=toggle]");
		
		if(id=="" || id==null){
			alert("로그인이 필요한 페이지입니다");
			location.href="/Hippe/loginController.do?command=loginBtn";
		}else{
			if(toggle.val() == 1){
				$.ajax({
					type : 'post',
					url : "/Hippe/memberController.do?command=like",
					data : {
						"id" : id,
						"festival_num" :festival_num
					},
					success : function(msg) {
						if (msg == "s") {
							alert("관싱상품 추가");
							toggle.parent().find("input[name=toggle]").attr("value","-1");
							toggle.parent().find(".heart-img").attr("src","/Hippe/resources/images/likeheart.png");
						} else if (msg == "f") {
							alert("관싱상품 등록 실패");
						} 
					},error : function() {
						alert('관심상품등록 실패(통신에러)');
					}
				});	
			} else if(toggle.val() == -1){
				$.ajax({
					type : 'post',
					url : "/Hippe/memberController.do?command=unlike",
					data : {	
						"id" : id,
						"festival_num" : festival_num
					},
					success : function(msg) {
						if (msg == "y") {
							alert("관싱상품 해제");
							toggle.parent().find("input[name=toggle]").attr("value","1");
							toggle.parent().find(".heart-img").attr("src","/Hippe/resources/images/unlikeheart.png");
						} else if (msg == "n") {
							alert("관싱상품 해제 실패");
						} 
					},error : function() {
						alert('관심상품해제 실패(통신에러)');
					}
				});	
			}
		}
	});
});
		
		