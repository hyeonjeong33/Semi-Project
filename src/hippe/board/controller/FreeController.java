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

@WebServlet("/freeController.do")
public class FreeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	BoardDao dao = new BoardDao();

	public FreeController() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		BoardDao dao = new BoardDao();
		PrintWriter out = response.getWriter();
		
		String command = request.getParameter("command");
		System.out.printf("[FreeBoard] - %s\n", command);

		if (command.equals("list")) {
			response.sendRedirect("board_free/free_selectlist.jsp");
			
		/*------------- 자유게시판 검색 ---------------*/	
		} else if (command.equals("search")) {
			
			String field = request.getParameter("field");
			String keyword = request.getParameter("keyword");
			
			System.out.println("컨트롤러 keyword : " + keyword);
			
			List<BoardDto> list = dao.searchlist1(field,keyword);
			System.out.println(list.size());
			JSONArray arr = new JSONArray();
			JSONObject total = new JSONObject();
			
			for(int i=0; i < list.size(); i++) {
			
			JSONObject obj = new JSONObject();
			obj.put("board_postnum", list.get(i).getBoard_postnum()+"");
			obj.put("board_title", list.get(i).getBoard_title());
			obj.put("writer", list.get(i).getWriter());
			obj.put("board_regdate", list.get(i).getBoard_regdate()+"");
			obj.put("board_views", list.get(i).getBoard_views()+"");
			arr.add(obj);
			}
			for(int j=0 ; j<arr.size() ; j++) {
				System.out.println(arr.get(j));
			}
			total.put("data", arr);
			out.print(total);
			
			
		}else if(command.equals("selectone")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			System.out.println("게시글번호"+board_postnum);
			BoardDto dto = dao.selectone(board_postnum);
			request.setAttribute("dto", dto);
			dispatch(request,response,"board_free/free_detail.jsp");
			
		}else if(command.equals("insertform")) {
			response.sendRedirect("board_free/free_insert.jsp");
			
		}else if(command.equals("insert")) {
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
				
			BoardDto dto = new BoardDto();
			dto.setWriter("스마트에디터");
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content);
			
			int res = dao.insert(dto);
			
			 if(res >0 ) {
		            jsResponse("글 작성 성공", "/Hippe/freeController.do?command=selectlist", response);
		         }else {
		            jsResponse("글 작성 실패", "/Hippe/freeController.do?command=insertform", response);
		         }
			 
			 
		}else if(command.equals("delete")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			int res = dao.delete(board_postnum);
			
			 if(res >0 ) {
		            jsResponse("삭제 완료", "/Hippe/freeController.do?command=list", response);
		         }else {
		            jsResponse("삭제 실패", "/Hippe/freeController.do?command=list", response);
		         }
			 
			 
		}else if(command.equals("updateform")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			System.out.println(board_postnum);
			
			BoardDto dto = dao.selectone(board_postnum);
			
			request.setAttribute("dto", dto);
			dispatch(request,response,"board_free/free_update.jsp");
			
			
		}else if(command.equals("update")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			String board_title = request.getParameter("board_title");
			String board_content = request.getParameter("board_content");
			System.out.println(board_postnum+" "+board_title+" "+" "+board_content);
			
			BoardDto dto = new BoardDto();
			
			dto.setBoard_postnum(board_postnum);
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content);
			
			int res = dao.update(dto);
			 if(res >0 ) {
		            jsResponse("수정 성공", "/Hippe/freeController.do?command=list", response);
		         }else {
		            jsResponse("수정 실패", "/Hippe/freeController.do?command=list", response);
		         }
			 
			 
		}else if(command.equals("answerform")) {
			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			BoardDto dto = dao.selectone(board_postnum);
			System.out.println(board_postnum+"포스트넘 확인");
			request.setAttribute("dto", dto);
			System.out.println(board_postnum +"포스트넘 확인1");
			dispatch(request,response,"board_free/free_answer.jsp");
			
			
		}else if(command.equals("answer")) {

			int board_postnum = Integer.parseInt(request.getParameter("board_postnum"));
			String board_title = request.getParameter("board_title");
			String writer = request.getParameter("writer");
			String board_content = request.getParameter("board_content");
				
			BoardDto dto = new BoardDto();
			
			dto.setWriter(writer);
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content);
			dto.setBoard_postnum(board_postnum);
			
			int res = dao.answer(dto);
			if(res > 0) {
			jsResponse("작성되었습니다", "freeController.do?command=selectlist", response);
			}else {
			jsResponse("실패 했습니다", "freeController.do?command=selectone&board_postnum="+board_postnum, response);
			}
			
			
		} else if(command.equals("review")) {
			response.sendRedirect("board_review/board_review.jsp");
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

}
