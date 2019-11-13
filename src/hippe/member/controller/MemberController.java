package hippe.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import hippe.board.dao.FestivalDao;
import hippe.func.lock.Sha256Encryption;
import hippe.member.dao.InterestDao;
import hippe.member.dao.MemberDao;
import hippe.member.dto.InterestDto;
import hippe.member.dto.MemberDto;

@WebServlet("/memberController.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDao dao = new MemberDao();
       
    public MemberController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ServletContext application = getServletContext();
		PrintWriter out = response.getWriter();
		
		MemberDao dao = new MemberDao();
		InterestDao idao = new InterestDao();
		FestivalDao fdao = new FestivalDao();
		
		String command = request.getParameter("command");
		System.out.println("[Member] - " +command);
		
		/*--------------- 메인화면 --------------*/
		if(command.equals("main")) {			
			response.sendRedirect("hippe_main/hippe_main.jsp");
		} else if(command.equals("signupBtn")) {
			dispatch("board_member/member_signup.jsp", request, response);
		/*---------------- 회원 가입 ----------------*/
		} else if(command.equals("signUp")) {
			String member_id = request.getParameter("member_id");
			String member_pw = Sha256Encryption.LockPassword(request.getParameter("member_pw"));
			String member_name = request.getParameter("member_name");
			String member_phone = request.getParameter("phone_start") + request.getParameter("phone_mid") + request.getParameter("phone_end");
			String member_address = request.getParameter("member_addr_doro") + request.getParameter("member_addr_detail");
			String member_email = request.getParameter("email");
			
			MemberDto dto = new MemberDto();
			dto.setMember_id(member_id);
			dto.setMember_pw(member_pw);
			dto.setMember_name(member_name);
			dto.setMember_phone(member_phone);
			dto.setMember_address(member_address);
			dto.setMember_email(member_email);

			int result = dao.insertMember(dto);
			System.out.println("result : " + result);
			if(result>0) {
				System.out.println("(유저)" + dto.getMember_id() + " 님 회원가입 성공");
				response.sendRedirect("board_member/member_completion.jsp");
			}else {
				System.out.println("회원가입 실패");
			}
		} else if(command.equals("idChk")) {
			String input_id = request.getParameter("member_id");
			MemberDto dto = dao.selectMyInfo(input_id);
			if(dto==null) {	
				out.println("S");
			}else {
				out.println("F");
			}
			
		} else if(command.equals("backToMain")) {
			response.sendRedirect("hippe_main/hippe_main.jsp");
		/*---------------- 마이페이지 ---------------*/
		} else if(command.equals("mypage")) {
			response.sendRedirect("board_member/member_mypage.jsp");
		/*---------------- 회원 탈퇴 ----------------*/
		} else if(command.equals("disable")) {
			String id = request.getParameter("id");
			String pw = Sha256Encryption.LockPassword(request.getParameter("pw"));
			
			System.out.println("탈퇴할 아이디: " + id + "/pw: " + pw);
			MemberDto my = dao.selectMyInfo(id);
		
			if(pw.equals(my.getMember_pw())) {
				int res = dao.disableMember(id);
				if(res>0) {
					application.removeAttribute("id");
					out.write("S");					//회원탈퇴성공
				}else {
					out.write("F");					//실패
				}
			}else {
				out.write("E");						//실패 (비밀번호 오류)
			}		
			/*--------------- 회원정보 수정 --------------*/
		} else if(command.equals("adjust")){
			
			// 로그인 되어있는 값 가져오기
			String member_id = (String) application.getAttribute("id");			
			MemberDto dto = dao.selectMyInfo(member_id);
			request.setAttribute("dto",  dto);
			dispatch("board_member/member_adjust.jsp", request, response);
			
		}else if(command.equals("add")){
									
			String member_id = request.getParameter("member_id").trim();
			String member_pw = Sha256Encryption.LockPassword(request.getParameter("member_pw"));
			String member_name = request.getParameter("member_name");
			String member_phone = request.getParameter("phone_start") + request.getParameter("phone_mid") + request.getParameter("phone_end");
			String member_address = request.getParameter("member_address");
			String member_email = request.getParameter("member_email");
			
			System.out.println(member_id + " : " + member_pw + " : " + member_name + " : " + member_phone + " : " + member_address + " : " + member_email);
						
			MemberDto dto = new MemberDto();
			
			dto.setMember_id(member_id.trim());
			dto.setMember_pw(member_pw.trim());
			dto.setMember_name(member_name.trim());
			dto.setMember_phone(member_phone.trim());
			dto.setMember_address(member_address.trim());
			dto.setMember_email(member_email.trim());
			
			int res= dao.updateMyInfo(dto);
			
			System.out.println("res2: "+res);
			if(res>0) {
				jsResponse("수정완료", "board_member/member_mypage.jsp", response);
			}else {
				jsResponse("수정실패", "board_member/member_mypage.jsp", response);
			}
			
		/*-------------- 아이디 찾기 --------------*/
		} else if(command.equals("findMine")) {
			response.sendRedirect("board_member/member_findAccount.jsp");
		} else if(command.equals("find-id")) {
			String myName = request.getParameter("myName");
			String myEmail = request.getParameter("myEmail");
			
			//res : 1)회원아이디(S) 2)None(이메일불일치) 3)Diff(이름불일치) 
			MemberDto myAccount = dao.findMyId(myEmail);
			Map<String,String> map = new HashMap<String, String>();
			
			if(myAccount!=null) {							//계정 있음
				if(myAccount.getMember_name().equals(myName)) {	
					map.put("res", "S");
					map.put("myId", myAccount.getMember_id());
				}else {										//계정이름 불일치
					map.put("res", "D");
					map.put("myId", "none");
				}
			}else {											//계정 없음
				map.put("res", "F");
				map.put("myId", "none");
			}
			
			System.out.println("MAP: " + map.get("res") + "/" + map.get("myId"));
			JSONObject obj = new JSONObject();
			obj.putAll(map);
			out.print(obj);
		/*------------- 비밀번호 찾기(임시번호 발급) --------------*/	
		} else if(command.equals("find-pw")) {
			String myId = request.getParameter("myId");
			String myEmail = request.getParameter("myEmail");
			
			Map<String, String> map = new HashMap<String, String>();
			MemberDto myAccount = dao.selectMyInfo(myId);
			if(myAccount!=null) {
				if(myEmail.equals(myAccount.getMember_email())) {
					map.put("res", "S");
				}else {							//아이디는있고 계정에 설정된 이메일은 틀림
					map.put("res", "D");
				}
			}else {								//해당 아이디없음
				map.put("res", "F");
			}
			JSONObject obj = new JSONObject();
			obj.putAll(map);
			out.print(obj);
		/*------------- 비밀번호 찾기(임시번호 발급) --------------*/	
		} else if(command.equals("myInterest")) {
			String myId = request.getParameter("myId");
			List<InterestDto> list = idao.selectInterestList(myId);
			request.setAttribute("list", list);
			dispatch("board_detail/ticket_detail.jsp", request, response);
		} else if(command.equals("like")) {
			String id = request.getParameter("id");
			int number = Integer.parseInt(request.getParameter("festival_num"));
			//String name = request.getParameter("festival_name");
			System.out.println("관심상품등록 :: id: " + id + "/num: " + number);
			
			int res = idao.insert(id, number);
			if (res > 0) {
				out.write("s");
			} else {
				out.write("f");
			}
		} else if(command.equals("unlike")) {
			String id = request.getParameter("id");
			int number = Integer.parseInt(request.getParameter("festival_num"));
			//String name = request.getParameter("festival_name");
			System.out.println("관심상품해제 :: id: " + id + "/num: " + number);
			int res = idao.delete(id, number);
			if (res > 0) {
				out.write("y");
			} else {
				out.write("n");
			}
		} else if(command.equals("idChk")) {
			String member_id = request.getParameter("member_id");
			
			MemberDto temp = dao.selectMyInfo(member_id);
			System.out.println("아이디 중복체크 : " + temp);
			if(temp==null) {
				out.write("s");
			}else {
				out.write("f");
			}
			
			
		}
		
			
		
	}

	public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}
	
	 public void jsResponse(String msg , String url, HttpServletResponse response) throws IOException {
	      
	      String res = "<script type = 'text/javascript'>"
	      +"alert('"+msg+"');"
	      +"location.href='"
	      +url+"';"
	      +"</script>";
	      
	      PrintWriter out = response.getWriter();
	      out.println(res);
	 }
}





