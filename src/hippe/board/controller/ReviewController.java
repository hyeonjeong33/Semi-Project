package hippe.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import hippe.board.dao.BoardDao;
import hippe.board.dto.BoardDto;


@WebServlet("/reviewController.do")
public class ReviewController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BoardDao dao = new BoardDao();
   
    public ReviewController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		BoardDao dao = new BoardDao();
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		System.out.println("[ReviewBoard] - " + command);
		
		/*------------- 후기 게시판 목록 ---------------*/
		if(command.equals("reviewlist")) {
			
			response.sendRedirect("board_review/board_review.jsp");
			
		/*------------- 후기 게시판 검색 ---------------*/	
		} else if (command.equals("search")) {
			
			String field = request.getParameter("field");
			String keyword = request.getParameter("keyword");
			
			System.out.println("컨트롤러 field : " + field);
			System.out.println("컨트롤러 keyword : " + keyword);
			
			List<BoardDto> list = dao.searchlist2(keyword);
			System.out.println(list.size());
			JSONArray arr = new JSONArray();
			JSONObject total = new JSONObject();
			
			for(int i=0; i < list.size(); i++) {
			
			JSONObject obj = new JSONObject();
			obj.put("board_postnum", list.get(i).getBoard_postnum()+"");
			obj.put("board_title", list.get(i).getBoard_title());
			//obj.put("writer", list.get(i).getWriter());
			//obj.put("board_regdate", list.get(i).getBoard_regdate()+"");
			//obj.put("board_views", list.get(i).getBoard_views()+"");
			obj.put("board_content",  list.get(i).getBoard_content());
			
			arr.add(obj);
			}
			for(int j=0 ; j<arr.size() ; j++) {
				System.out.println(arr.get(j));
			}
			total.put("data", arr);
			out.print(total);
			
		/*------------- 후기 게시판 글상세 ---------------*/
		} else if(command.equals("reviewdetail")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			BoardDto dto = dao.selectone(board_postnum);
			request.setAttribute("dto", dto);
			dispatch(request, response, "board_review/event_boarddetail.jsp");
			
		/*------------- 이벤트 게시판 글작성 ---------------*/
		} else if(command.equals("insertform")) {
			response.sendRedirect("board_review/reiview_boardinsert.jsp");
		} else if(command.equals("insert")) {
			String writer = "관리자";
			String board_title = request.getParameter("title");
			String board_content = request.getParameter("content");
			
			BoardDto dto = new BoardDto();
			dto.setBoard_category(3);
			dto.setWriter(writer);
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content)
			;
			
			int res = dao.insert(dto);
			
			if(res>0) {
				jsResponse("[관리자]이벤트 게시글 추가", "memberController.do?command=main", response);
			}
			
		/*------------- 이벤트 게시판 글수정 ---------------*/	
		} else if(command.equals("")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			BoardDto dto = dao.selectone(board_postnum);
			request.setAttribute("dto", dto);
			dispatch(request, response, "board_review/review_boardupdate.jsp");
			
		/*------------- 이벤트 게시판 글삭제 ---------------*/	
		} else if(command.equals("delete")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			int res = dao.delete(board_postnum);
			if(res>0) {
				jsResponse("정상적으로 삭제되었습니다.", "reviewController.do?command=reviewtlist", response);
			}else {
				jsResponse("삭제에 실패했습니다. ", "reviewController.do?command=reviewlist", response);
			}
		} else if(command.equals("muldel")) {
			
		}
		
		
		
		
	}

	public void dispatch(HttpServletRequest request, HttpServletResponse response, String url)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
	}

	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException { // HttpServletResponse -> printwrite out 쓸거니까
	      String res = "<script type='text/javascript'>"
	               +" alert('" + msg + "');"
	               +" location.href='" + url + "';"
	               +"</script>";
	      
	      PrintWriter out = response.getWriter();
	      out.println(res);
	}
	
	
}//class end



