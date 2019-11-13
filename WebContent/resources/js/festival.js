/* 축제 리스트 보여주기(지역별) */
function listUpFestival(region){
//		alert(region);
		var url = "/Hippe/festivalController.do?command=listup&region=" + region;
		$.ajax({
			type : "GET",
			url : url,
			dataType : "text",
			success : function(data){
				var tmp = $.trim(data);
				var obj = JSON.parse(tmp);
				$("table").attr("border",1);
				$(".div_balloon").html("");
				
				$.each(obj,function(key,val){
					if(key == "DATA"){
						var list = val;
						for(var i = 0 ; i < list.length; i++){
							var str = list[i];
							$(".div_balloon").append(
								"<div>"
								+"<a href='#detail-content' class='festival_name' onclick='detailform("+i+")'>"+str.festival_name+"</a><br>"
								+"<label style='font-size : 11px;'>"+str.festival_start+"~"+str.festival_end+"</label>&nbsp;&nbsp;"
								+"<label style='font-size : 11px;'>"+str.festival_location+"</label>"
								+"<input type = 'hidden' name = 'festival_num' id='festival_num" + i + "' value='"+ str.festival_num + "'>"
								+"<input type = 'hidden' name = 'festival_name' id='festival_name" + i + "' value='"+ str.festival_name + "'>"
								+"<input type = 'hidden' name = 'festival_address' id='festival_address" + i + "' value='"+str.festival_address+"'>"
								+"<input type = 'hidden' name = 'festival_ticket' id='festival_ticket" + i + "' value='"+str.festival_ticket + "'>"
								+"<input type = 'hidden' name = 'festival_start' id='festival_start" + i + "' value='"+str.festival_start + "'>"
								+"<input type = 'hidden' name = 'festival_end' id='festival_end" + i + "' value='"+str.festival_end + "'>"
								+"<input type = 'hidden' name = 'festival_price' id='festival_price" + i + "' value='"+str.festival_price+"'>"
								+"<input type = 'hidden' name = 'festival_imgsrc' value='"+str.festival_imgsrc+"'>"
								+"<input type = 'hidden' name = 'festival_content' id='festival_content" + i + "' value='"+str.festival_content + "'>"
								+"</div>"			
							);
							}				
					} 
				});
			},error : function(){
			alert("죄송합니다! 다시 시도해주세요.");
			}
		});
	}
	
	/* 축제상세보여주기 */
	function detailform(number){
		/* alert("detailform클릭됨"); */
		 
		var name = $('#festival_name'+number).val();
		var content = $('#festival_content'+number).val();
		var ticket = $('#festival_ticket'+number).val();
		var address = $('#festival_address'+number).val();
		var start = $('#festival_start'+number).val();
		var end = $('#festival_end'+number).val();
		var price = $('#festival_price'+number).val();
		
		/* alert(content);
		alert(ticket); */
		$("#detail-content").css("display","block"); 
		$("#detail-content").html(" ");
		
		if(ticket=="N"){
		$("#detail-content").append(
				"<table border='1'>"+
				"<td colspan='2' style='text-align: center;  font-weight: 800;'>"+name+"</td>"+
				"</tr>"
				+
				"<tr>"+
				"<th style='background-color: orange;'>"+"주  소"+"</th>"+
				"<td>"+address+"</td>"+
				"</tr>"
				+
				"<tr>"+
				"<th style='background-color: orange;'>"+"축제설명"+"</th>"+
				"<td width='500'>"+content+"</td>"+
				"</tr>"
				+				
				"<tr>"+
				"<th style='background-color: orange;'>"+"시작일"+"</th>"+
				"<td>"+start+"</td>"+
				"</tr>"
				+
				"<tr>"+
				"<th style='background-color: orange;'>"+"종료일"+"</th>"+
				"<td>"+end+"</td>"+
				"</tr>"+
				"</table>"
				);
		}else{
			$("#detail-content").append(
			"<table border='1'>"+
			"<td colspan='2' style='text-align: center; font-weight: 800;'>"+name+"</td>"+
			"</tr>"
			+
			"<tr>"+
			"<th style='background-color: orange;'>"+"상세주소"+"</th>"+
			"<td>"+address+"</td>"+
			"</tr>"
			+
			"<tr>"+
			"<th style='background-color: orange;'>"+"내용"+"</th>"+
			"<td width='700'>"+content+"</td>"+
			"</tr>"
			+				
			"<tr>"+
			"<th style='background-color: orange;'>"+"시작날짜"+"</th>"+
			"<td>"+start+"</td>"+
			"</tr>"
			+
			"<tr>"+
			"<th style='background-color: orange;'>"+"종료날짜"+"</th>"+
			"<td>"+end+"</td>"+
			"</tr>"
			+
			"<tr>"+
			"<th style='background-color: orange;'>"+"이용요금"+"</th>"+
			"<td>"+price+"원"+"</td>"+
			"</tr>"+
			"</table>"+
				"<input type='button' value='예매하러GO' onclike='gotoTicketbox()'>"
			
			);
		}
	}
	
	
	
	