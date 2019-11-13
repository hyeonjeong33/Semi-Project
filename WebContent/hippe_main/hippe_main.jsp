<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="hippe.board.dao.FestivalDao" %>
<%@ page import="hippe.board.dto.FestivalDto" %>
<!DOCTYPE html>
<html>
<head>
<title>Hippe || 대한민국 가장 힙한 페스티벌, 히페 :: Home :: </title>
<!--meta tags -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords" content="Yield Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
  <!--stylesheets-->
  <link href="../resources/css/style.css" rel='stylesheet' type='text/css' media="all">	
  <!--booststrap-->
  <link href="../resources/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all">
  <!-- font-awesome icons -->
  <link href="../resources/css/font-awesome.min.css" rel="stylesheet">
  <!-- Google Web Font -->
  <link href="//fonts.googleapis.com/css?family=Josefin+Sans:400,600,700" rel="stylesheet">
  <link href="//fonts.googleapis.com/css?family=Libre+Franklin:400,500" rel="stylesheet">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
  <style type="text/css">
  .bx_img{
		width:100%;
		height: 800px;
	}
  iframe{
  	width: 27.5em;
    height: 18.5em;
  }
  #crawl-search{
   width: 400px;
    height: 60px;
    border-radius: 10px;
    margin: 10px 10px 50px 10px;
    dis
  }
  #crawl-btn{
    height: 60px;
    width: 100px;
    font-size: 20px;
    line-height: 2em;
    display: inline-block;
  }
  	
  </style>
  <script>
    addEventListener("load", function () {
      setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
    	window.scrollTo(0, 1);
    }

    $(document).ready(function(){
        $('.bxslider').bxSlider({
            auto: true, // 자동으로 애니메이션 시작
            peed: 500,  // 애니메이션 속도
            ause: 2500,  // 애니메이션 유지 시간 (1000은 1초)
            ode: 'horizontal', // 슬라이드 모드 ('fade', 'horizontal', 'vertical' 이 있음)
       /*  */     utoControls: true, // 시작 및 중지버튼 보여짐
            ager: true, // 페이지 표시 보여짐
            aptions: true, // 이미지 위에 텍스트를 넣을 수 있음
        })
    }) 
    
</script>
</head>
<body>
	<!-- Header -->
	<%@include file="../common/hippe_header.jsp" %>
	<%-- <%@include file="../common/hippe_header.jsp" %> --%>
  <!-- Slider -->
   <!-- Slider -->
  <div>
      <div class="bxslider">
          <div><img src="http://mblogthumb4.phinf.naver.net/MjAxOTAxMTRfODMg/MDAxNTQ3NDU3MTMwMDY3.S5UUzsQfp0g5ZwBgKkt8sFh-ZCHYHVrTN34L8XHkSv0g.bC7VbmzfPbEApktQDeoWM5R0mMsh7Uu4it-kG_1qa54g.JPEG.tellt/SE-0a369f6a-8a49-40b6-b207-ce389f304fea.jpg?type=w800" alt="3" class="bx_img"></div>
          <div><img src="https://scontent.ficn6-1.fna.fbcdn.net/v/t1.0-9/41282520_1903536946398947_7999666958653980672_n.jpg?_nc_cat=103&_nc_ht=scontent.ficn6-1.fna&oh=27d4cadc7e55e5dcfd99288fd921d31e&oe=5D78E567" alt="1" class="bx_img"></div>
          <div><img src="https://file2.nocutnews.co.kr/newsroom/image/2017/05/15/20170515092902826577.jpg" alt="2" class="bx_img"></div>
          <div><img src="http://economy.donga.com/IMAGE/2017/06/14/84861634.3.jpg" alt="4" class="bx_img"></div>
          <div><img src="https://res.klook.com/image/upload/fl_lossy.progressive/q_auto/f_auto/c_fill/blogen/image26-2.png" alt="5" class="bx_img"></div>
          <div><img src="https://squirrelofseoul.com/wp-content/uploads/2019/02/YDG05761-1024x683.jpg" alt="6" class="bx_img"></div>
     </div>
  </div> 
  
<section class="blog py-lg-4 py-md-3 py-sm-3 py-3" id="blog">
    <div class="container-fluid py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title mb-lg-5 mb-md-4 mb-sm-4 mb-3 text-center">Festival Of This Year</h3>
      <h5 class="top-title mb-lg-4 mb-3 text-center">2019년, 놓치지말아야 힙~한 축제!</h5>
      <div class="row">
<% 	FestivalDao dao = new FestivalDao();
	List<FestivalDto> recommend_list = dao.selectRecommend(); 	
	int ran =(int)(Math.random()*(recommend_list.size()))-2;
	%>
        <div class="col-lg-6 blog-first-grid">
          <div class="blog-txt text-center">
            <h5>
              <a href="#about"><%=recommend_list.get(ran).getFestival_name() %></a>
            </h5>
          </div>
        </div>
        <div class="col-lg-6 bolg-right-grids">
          <h4 class="pb-3">
            <a href="#about"><%=recommend_list.get(ran).getFestival_start() %> ~ <%=recommend_list.get(ran).getFestival_end() %></a>
          </h4>
          <h5><%=recommend_list.get(ran).getFestival_content() %></h5>
          <!-- <div class="mt-3 blog-date-time">
            <ul>
              <li class="mr-3">Comments
                <a href="#about" class="pl-1">7</a>
              </li>
              <li>Views
                <a href="#about" class="pl-1">5</a>
              </li>
            </ul>
          </div> -->
          <div class="outs_more-buttn mt-md-4 mt-3">
            <a href="#about">자세히 보기</a>
          </div>
        </div>
        <div class="col-lg-6 bolg-right-grids text-md-right">
          <h4 class="pb-3">
            <a href="#about"><%=recommend_list.get(ran+1).getFestival_start() %> ~ <%=recommend_list.get(ran+1).getFestival_end() %></a>
          </h4>
          <h5><%=recommend_list.get(ran+1).getFestival_content() %></h5>
          <div class="mt-3 blog-date-time">
            <!-- <ul>
              <li class="mr-3">Comments
                <a href="#about" class="pl-1">7</a>
              </li>
              <li>Views
                <a href="#about" class="pl-1">5</a>
              </li>
            </ul> -->
          </div>
          <div class="outs_more-buttn mt-md-4 mt-3">
            <a href="#about">자세히 보기</a>
          </div>
        </div>
        <div class="col-lg-6 blog-second-grid">
          <div class="blog-txt text-center">
            <h5>
              <a href="#about"><%=recommend_list.get(ran+1).getFestival_name() %></a>
            </h5>
          </div>
        </div>
         <div class="col-lg-6 blog-third-grid">
          <div class="blog-txt text-center">
            <h5>
              <a href="#about"><%=recommend_list.get(ran+2).getFestival_name() %></a>
            </h5>
          </div>
        </div>
        <div class="col-lg-6 bolg-right-grids">
          <h4 class="pb-3">
            <a href="#about"><%=recommend_list.get(ran+2).getFestival_start() %> ~ <%=recommend_list.get(ran+2).getFestival_end() %></a>
          </h4>
          <h4><%=recommend_list.get(ran+2).getFestival_content() %></h4>
          <!-- <div class="mt-3 blog-date-time">
            <ul>
              <li class="mr-3">Comments
                <a href="#about" class="pl-1">7</a>
              </li>
              <li>Views
                <a href="#about" class="pl-1">5</a>
              </li>
            </ul>
          </div> -->
          <div class="outs_more-buttn mt-md-4 mt-3">
            <a href="#about">자세히 보기</a>
          </div>
        </div>
      </div><!-- end row -->
    </div>
  </section>  

   <!-- Ticket Matter 영역 -->
  <section class="advertise-count py-lg-4 py-md-3 py-sm-3 py-3">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <div class="order-show-w3ls ">
        <h4>거기 어디?<br>날씨도 좋은데 한강으로 모여!</h4>
        <div class="outs_more-buttn mt-md-4 mt-3">
          <a href="/Hippe/board_festival/festival_map.jsp">여행지로 길찾기</a>
        </div>
      </div>
    </div>
  </section>
  <script type="text/javascript">
  		$('#crawl-btn').click({
  			var searchKeyword = $('#crawl-search').text();
  			alert(searchKeyword);
  		});
  </script>
  <section class="gallery py-lg-4 py-md-3 py-sm-3 py-3" id="gallery">
    <div class="container py-lg-5 py-md-4 py-sm-4 py-3">
      <h3 class="title mb-lg-5 mb-md-4 mb-sm-4 mb-3 text-center">Reviews</h3>
      <h3 class="top-title mb-lg-4 mb-3 text-center">여행지의 다양한 소식을 받아보세요!</h3>
      <div style="text-align: center;"><input type="text" id="crawl-search" placeholder="검색어를 입력하세요" style="">
			<div class="outs_more-buttn mt-md-4 mt-3">
          <a href="/Hippe/board_festival/festival_map.jsp" id="crawl-btn" style="display: inline;">검 색</a>
        </div>
      </div>
      <div class="row gallery-info no-gutters">
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid ">
          <div class="gallery-grids">
            <a href="#gal1">
              <img src="../resources/images/g1.jpg" alt="news image" class="img-fluid">
            </a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid ">
          <div class="gallery-grids">
            <a href="#gal2">
              <img src="../resources/images/g6.jpg" alt="news image" class="img-fluid">
            </a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid">
          <div class="gallery-grids">
            <a href="#gal3">
              <img src="../resources/images/g3.jpg" alt="news image" class="img-fluid">
            </a>
          </div>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid">
          <div class="gallery-grids">
            <a href="#gal4">
              <img src="../resources/images/g4.jpg" alt="news image" class="img-fluid">
            </a>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid ">
          <div class="gallery-grids">
            <a href="#gal5">
              <img src="../resources/images/g2.jpg" alt="news image" class="img-fluid">
            </a>
          </div>

        </div>
        <div class="col-lg-4 col-md-6 col-sm-6 gallery-img-grid ">
          <div class="gallery-grids">
            <a href="#gal6">
              <img src="../resources/images/g5.jpg" alt="news image" class="img-fluid">
            </a>
          </div>
        </div>
        <!-- popup-->
        <div id="gal1" class="popup-effect">
          <div class="popup">
            <img src="../resources/images/g1.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal2" class="popup-effect">
          <div class="popup">
            <img src="images/g6.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal3" class="popup-effect">
          <div class="popup">
            <img src="images/g3.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal4" class="popup-effect">
          <div class="popup">
            <img src="images/g4.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal5" class="popup-effect">
          <div class="popup">
            <img src="images/g2.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
        <!-- popup-->
        <div id="gal6" class="popup-effect">
          <div class="popup">
            <img src="images/g5.jpg" alt="Popup Image" class="img-fluid" />
            <a class="close" href="#gallery">&times;</a>
          </div>
        </div>
        <!-- //popup -->
      </div>
    </div>
  </section>
  <!--//Reivew  -->
  
  <jsp:include page="../common/hippe_footer.jsp"></jsp:include>
</body>
</html>