package hippe.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;

import hippe.func.lock.Sha256Encryption;
import hippe.member.dao.MemberDao;
import hippe.member.dto.MemberDto;


@WebServlet("/loginController.do")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	MemberDao dao = new MemberDao();
       
    public LoginController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		ServletContext application = getServletContext();
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		System.out.println("[Login] - " + command);
		
		/*--------------- 로그인 --------------*/
		if(command.equals("loginBtn")) {
			dispatch("board_member/member_login.jsp", request, response);
		} else if(command.equals("login")) {
			String member_id = request.getParameter("member_id");
			String member_pw = Sha256Encryption.LockPassword(request.getParameter("member_pw"));
			
			MemberDto user = dao.selectMyInfo(member_id);
			
			if(user == null) {
				jsResponse("존재하지 않는 계정입니다. 아이디를 확인해주세요!", "hippe_main/hippe_main.jsp", response);
			}else {
				if(!member_pw.equals(user.getMember_pw())) {
					jsResponse("비밀번호가 틀렸습니다! 확인후 다시 시도해주세요", "hippe_main/hippe_main.jsp", response);
				}else {
					System.out.println("로그인성공! Welcome " + member_id + "님");
					//request.getSession().setAttribute("id", member_id);
					application.setAttribute("id", member_id);
					application.setAttribute("name", user.getMember_name());
					jsResponse(member_id + "님 환영합니다!" , "hippe_main/hippe_main.jsp",response);
				}
			}
		/*--------------- 카카오 로그인 --------------*/	
		} else if(command.equals("kakao")) {
			
			String kakaoId = request.getParameter("kakaoid");
			String kakaoName = request.getParameter("kakaoname");
			System.out.println(kakaoName + "(" + kakaoId +")님이 <카카오> 로그인하셨습니다");
			
			application.setAttribute("id",kakaoId);
			application.setAttribute("name", kakaoName);
			
			if(application!=null) {
				dispatch("memberController.do?command=main", request, response);
			}
		/*--------------- 아이디 체크 --------------*/	
		} else if(command.equals("idChk")) {
			String member_id = request.getParameter("member_id");
			System.out.println("입력된 id : " + member_id);
			boolean res = dao.checkID(member_id);
			System.out.println("idChk res : " + res);
			if(res) {
				System.out.println("S");
				out.write("S");
			}else {
				System.out.println("F");
				out.write("F");
			}
		/*--------------- 로그아웃 --------------*/	
		} else if(command.equals("logout")) {
			System.out.println(application.getAttribute("id"));
			application.removeAttribute("id");
			dispatch("memberController.do?command=main", request, response);
			
		/*-------------네이버로그인------------*/
		} else if(command.equals("naver")) {
		
		/*
		String email = request.getParameter("email");
		application.setAttribute("email", email);
		*/
		
		String member_id = request.getParameter("member_id");
		
		String member_name = request.getParameter("member_name");

		System.out.println("로그인성공! Welcome " + member_id + "님");
		application.setAttribute("id", member_id);
		application.setAttribute("name", member_name);
		jsResponse(member_id + "님 환영합니다!" , "hippe_main/hippe_main.jsp",response);
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
