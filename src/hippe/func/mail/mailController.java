package hippe.func.mail;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hippe.func.lock.Sha256Encryption;
import hippe.func.lock.VerifyCode;
import hippe.member.dao.MemberDao;
import hippe.member.dto.MemberDto;

@WebServlet("/mailController.do")
public class mailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public mailController() {
       
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		SMTPMail mail = new SMTPMail();
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		System.out.println("[Email Controller] - " + command);
		
		if(command.equals("sendEmail")) {
			
			String userEmail = request.getParameter("email");
			String verifyCode = VerifyCode.getVerifyCode();
			mail.sendEmailToCustomer(userEmail, "[YATTE] 회원가입을 위한 인증메일입니다!", verifyCode);
			
			response.getWriter().write(verifyCode);
		} else if(command.equals("sendNewPw")) {
			String myId = request.getParameter("myId");
			String myEmail = request.getParameter("myEmail");
			String verifyCode = VerifyCode.getVerifyCode();
			
			MemberDao dao = new MemberDao();
			MemberDto dto = new MemberDto();
			dto.setMember_id(myId);
			dto.setMember_email(myEmail);
			dto.setMember_pw(Sha256Encryption.LockPassword(verifyCode));
			int res = dao.updatePw(dto);
			System.out.println("비밀번호 업데이트: " + res);
			if(res>0) {
				mail.sendEmailToCustomer(myEmail, "[Hippe] 비밀번호찾기 - 임시비밀번호 발급", 
				"[임시비밀번호 :" + verifyCode + "] 이 비밀번호는 임시비밀번호이므로 로그인후 꼭 회원정보를 변경해주세요.");
				out.println("Send");
				System.out.println("Send");
			}else {
				out.println("Failed");
				System.out.println("Failed");
			}
			
		}
	}

}
