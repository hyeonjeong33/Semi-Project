package hippe.ticket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import hippe.ticket.dao.ReservationDao;
import hippe.ticket.dto.MyOrderDto;
import hippe.ticket.dto.ReservationDto;


@WebServlet("/ReservationController.do")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public ReservationController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		ReservationDao dao = new ReservationDao();
		
		String command = request.getParameter("command");
		System.out.println("[Reservation] - " + command);
		
		if(command.equals("buy_ticket")) {
			
		/* 축제예매확인/취소 */	
		} else if(command.equals("ticket-check")) {
			String myId = request.getParameter("id");
			List<MyOrderDto> ticketlist = dao.selectList(myId);
			System.out.println(myId + "의 예약내역 : " + ticketlist.size());

			request.setAttribute("ticketlist", ticketlist);
			dispatch("board_member/member_ticket_check.jsp", request, response);
		} else if(command.equals("cancel")) {
			int num = Integer.parseInt(request.getParameter("num"));
			
			System.out.println(request.getParameter("yesorno"));
			if(request.getParameter("yesorno").equals("yes")) {
				System.out.println("num : " + num);
				int res = dao.delete(num);
				if(res > 0) {
					out.write("yes");
				} else {
					out.write("no");				
				}
			} else {
				out.write("no");
			}
		} else if(command.equals("paynow")) {
			String member_id = request.getParameter("member_id");
			int festival_f_num = Integer.parseInt(request.getParameter("festival_f_num"));
			int festival_quantity = Integer.parseInt(request.getParameter("festival_quantity"));
			int festival_totalprice = Integer.parseInt(request.getParameter("festival_totalprice"));
			
			ReservationDto dto = new ReservationDto();
			dto.setReservation_id(member_id);
			dto.setReservation_f_num(festival_f_num);
			dto.setReservation_quantity(festival_quantity);
			dto.setReservation_totalprice(festival_totalprice);
			
			int res = dao.insertReservation(dto);
			System.out.println("예약테이블에 추가: " + res);
			
			if(res>0) {
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
