<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="hippe.board.dto.BoardDto" %>
<%@ page import="hippe.board.dao.BoardDao" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="../resources/css/member_adjust.css" rel="stylesheet" type="text/css">
<title>Insert title here</title>

<style type="text/css">
   #center{
      margin-left: 37%;
   }
   #button1{
      position: relative;
      margin-left: 12%;
   }
   #button2{
      position: relative;
      margin-left: 28%;
   }
   
input[type=text], select , type=[email] {
   padding: 12px 20px;
   margin: 8px 0;
   display: inline-block;
   border: 1px solid #ccc;
   border-radius: 8px;
   box-sizing: border-box;   
   
}   
</style>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
function updateSubmit(){
   $('#updateForm').submit();
}
</script>

</head>
<body>
   
   <%@include file="../common/hippe_header.jsp" %>
   
   <div id="center">
   <br/><br/><br/>
   
   <c:choose>
   <c:when test="${empty dto.member_id}">
         <script type="text/javascript">
            alert('로그인이 필요한 페이지입니다');
            location.href='/Hippe/loginController.do?command=loginBtn';
         </script>
   </c:when>
   
   <c:otherwise>
   <form action="/Hippe/memberController.do" method="post" id="updateForm">
   <input type="hidden" name="command" value="add">
   <table style="margin-top: 15%;">
      <tr>
         <td style="font-size: 16px;">아이디</td>
      </tr>
      <tr>
      <td><input type="text" style="height: 44px; width: 345px; font-size: 20px;" size="35" value="${dto.member_id} " name="member_id" readonly="readonly"/></td>
      </tr> 
      <tr>
         <td style="font-size: 16px;">비밀번호</td>
      </tr>
      <tr>
         <td>
         <input style=" width: 345px;height: 44px; font-size: 16px;" size="35" type="password" value="" name="member_pw"/>
         </td>
      </tr>
      <tr>
         <td style="font-size: 16px;">비밀번호 확인</td>
      </tr>
      <tr>
         <td>
         <input style=" width: 345px;height: 44px; font-size: 16px; " size="35" type="password" value="" name="member_pw_chk"/>
         </td>
      </tr>
      <tr>
         <td style="font-size: 16px;">이름</td>
      </tr>
      <tr>
         <td><input style=" width: 345px;height: 44px; font-size: 16px;" size="35" type="text" value="${dto.member_name}" readonly="readonly" name="member_name"/></td>
      </tr>
      <tr>
         <td colspan="1" style="font-size: 16px;">휴대폰 번호</td>
      </tr>
      <tr>
         <td>
         <input value="${dto.member_phone } " type="hidden">
         <select id="phonelist" name="phone_start" style="width: 100px; height: 44px;">
            <option value="010">010</option> <option value="011">011</option>
               <option value="016">016</option> <option value="017">017</option>
             <option value="018">018</option> <option value="019">019</option>
         </select> - <input type="text" name="phone_mid" placeholder="1234" style=" width:100px; height:44px; font-size: 16px;"  size="2.5"> - <input type="text" name="phone_end" placeholder="5678" style="width:100px; height: 44px; font-size: 16px;"  size="2.5">
         </td>
      </tr>
      <tr>
         <td style="font-size: 16px;">주소</td>
      </tr>
      <tr>
         <td><input style=" width: 345px;height: 44px; font-size: 16px;" size="35" type="text" value="${dto.member_address }" name="member_address"></td>
      </tr>
      <tr>
         <td style="font-size: 16px;">이메일</td>
      </tr>
      <tr>
         <td><input style=" width: 345px;height: 44px; font-size: 16px;" type="email" size="16" value="${dto.member_email } " name="member_email"></td>
      </tr>
   </table>
   </form>
   </c:otherwise>
</c:choose>
   
   <div  id="button1" class="btnDiv" style="font-size: 14px; color: rgb(255, 255, 255); text-align: center; line-height: 2.3em; border-radius: 4px;
      background-color: rgb(89, 202, 183); width: 70px; height: 35px; top: 21px; " onclick="updateSubmit()">수   정</div>
   <div  id="button2" class="btnDiv" style="font-size: 14px; color: rgb(255, 255, 255); text-align: center; line-height: 2.3em; border-radius: 4px;
      background-color: rgb(89, 202, 183); width: 70px; height: 35px; top: -13px;" onclick="location.href='../Hippe/board_member/member_mypage.jsp'">취   소</div>
   </div>

</body>
</html>