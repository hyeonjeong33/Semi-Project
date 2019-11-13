package hippe.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import hippe.board.dao.BoardDao;
import hippe.board.dto.BoardDto;


@WebServlet("/uploadController.do")
public class UploadController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	BoardDao dao = new BoardDao();
	
    public UploadController() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String path = request.getSession().getServletContext().getRealPath("/imageUpload");
		System.out.println(path);
		MultipartRequest multi = new MultipartRequest(request, path, 100000000, "UTF-8",new DefaultFileRenamePolicy());
		
		
		String command = multi.getParameter("command");
		System.out.println("<" + command + ">");
		System.out.println("[Upload] - " + command);
		
		if(command.equals("insertFree")) {
			int board_category = 1;
			String K_category = multi.getParameter("board_category");
			String writer = multi.getParameter("member_id");
			String board_title = multi.getParameter("board_title");
			String board_content = multi.getParameter("board_content");
			
			System.out.println(K_category+"/"+writer+"/"+board_title+"/"+board_content);
			
			switch(K_category) {
			case "free":
				board_category =1;
			break;	
			}
			
			BoardDto dto = new BoardDto();
			
			
			dto.setBoard_category(board_category);
			dto.setWriter(writer);
			dto.setBoard_title(board_title);
			dto.setBoard_content(board_content);
			
			int res = dao.insert(dto);
			System.out.println("글쓰기 : " + res);
			if(res > 0) {
				jsResponse("글작성에 성공했윰", "/Hippe//freeController.do?command=list", response);
			}else {
				jsResponse("글 작성에 실패햇움","uploadController.do?command=insertFree", response);
			}
			
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		doGet(request,response);
		
	}	
	public void jsResponse(String msg, String url, HttpServletResponse response) throws IOException { // HttpServletResponse -> printwrite out 쓸거니까
	      
	      String res = "<script type='text/javascript'>"
	               +" alert('" + msg + "');"
	               +" location.href='" + url + "';"
	               +"</script>";
	      
	      PrintWriter out = response.getWriter();
	      out.println(res);
	}
	public void dispatch(String url, HttpServletResponse response, HttpServletRequest request)
			throws ServletException, IOException {

		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);

	}
	
}
