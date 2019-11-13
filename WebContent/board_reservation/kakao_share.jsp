<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width" />
<title>KakaoLink v2 Demo(Default / Feed) - Kakao JavaScript SDK</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<%-- <script type="text/javascript">
var title = "<%=session.getAttribute("title")%>";
var imgurl = "<%=session.getAttribute("imgurl")%>";
var festival_url = window.location.href;
</script> --%>

</head>
<body>

<%-- 
<%
	String title = "<script>document.writeln(title)</script>";
	out.println("title : " + title);
	String imgurl = "<script>document.writeln(imgurl)</script>";
	out.println("imgurl : " + imgurl);
    String url = "<script>document.writeln(url)</script>";
    out.println("url: " + url);
%> --%>

	<a id="kakao-link-btn" href="javascript:sendLink()"> 
	<img src="//developers.kakao.com/assets/img/about/logos/kakaolink/kakaolink_btn_medium.png" />
	</a>
	<script type='text/javascript'>
  //<![CDATA[
    // // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a9ef9a318deb5784906e6e394fb3c4e1');
    // // 카카오링크 버튼을 생성합니다. 처음 한번만 호출하면 됩니다.
    function sendLink() {
      Kakao.Link.sendDefault({
        objectType: 'feed',
        content: {
          title: '${title}',
          description: '${festival_location}',
          imageUrl: '${festival_imgsrc}',
          link: {
            mobileWebUrl: '${festival_url}',
            webUrl: '${festival_url}'
          }
        },
        social: {
          likeCount: 286,
          commentCount: 45,
          sharedCount: 845
        },
        buttons: [
          {
            title: '웹으로 보기',
            link: {
              mobileWebUrl: '${festival_url}',
              webUrl: '${festival_url}'
            }
          }
          
        ]
      });
    }
  //]]>
</script>

</body>
</html>