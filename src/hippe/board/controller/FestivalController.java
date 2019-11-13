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

import hippe.board.dao.FestivalDao;
import hippe.board.dto.FestivalDto;

@WebServlet("/festivalController.do")
public class FestivalController extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    public FestivalController() {
    }

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      request.setCharacterEncoding("UTF-8");
      response.setContentType("text/html; charset=UTF-8");
      doPost(request, response);
   }

      protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            FestivalDao dao = new FestivalDao();
            
            
            String command = request.getParameter("command");
            System.out.println("[Festival] - " + command);
            
            /* 축제 게시판으로 이동 */
            if(command.equals("list")) {
               
               response.sendRedirect("board_festival/festival_choose.jsp");
            /* 축제정보 리스트업 */
            }else if(command.equals("regional")){

               response.sendRedirect("board_festival/festival_regional.jsp");

            }else if(command.equals("seasonal")){
               
               response.sendRedirect("board_festival/festival_seasonal.jsp");
            
            }else if(command.equals("monthly")){
               
               response.sendRedirect("board_festival/festival_monthly.jsp");
            
            }else if(command.equals("listup")) {
            
               String region = request.getParameter("region");
               System.out.println(region);

               List<FestivalDto> list = dao.selectRegional(region);
               System.out.println("지역목록 : " + list.size());
               
               JSONObject description = new JSONObject();   //{}
               JSONArray arr = new JSONArray();   //[]
               JSONObject total = new JSONObject();   //{}

               description.put("FESTIVAL_NAME", "축제명");
               description.put("FESTIVAL_LOCATION", "장소");
               description.put("FESTIVAL_START", "축제 시작 일자");
               description.put("FESTIVAL_END", "축제 종료 일자");
               description.put("FESTIVAL_CONTENT", "축제내용");
               description.put("FESTIVAL_ADDRESS", "주소");
               description.put("FESTIVAL_TICKET", "티켓여부");
               description.put("FESTIVAL_PRICE", "티켓가격");
               
               total.put("DESCRIPTION", description);

               JSONArray arr2 = new JSONArray();   //[]
               for (int i = 0; i < list.size(); i++) {
                  JSONObject obj = new JSONObject();   //{}
                  obj.put("festival_num", list.get(i).getFestival_num() + "");
                  obj.put("festival_name", list.get(i).getFestival_name());
                  obj.put("festival_location", list.get(i).getFestival_location());
                  obj.put("festival_start", list.get(i).getFestival_start());
                  obj.put("festival_end", list.get(i).getFestival_end());
                  obj.put("festival_content", list.get(i).getFestival_content());
                  obj.put("festival_address", list.get(i).getFestival_address());
                  obj.put("festival_ticket", list.get(i).getFestival_ticket());
                  obj.put("festival_price", list.get(i).getFestival_price());
                  arr2.add(obj);
               }

               total.put("DATA", arr2);

               out.print(total);
            }else if(command.equals("seasonUp")) {
               
               String season = request.getParameter("season");
               
               List<FestivalDto> list = dao.selectFestival("season",season);
               JSONObject description = new JSONObject();
               JSONObject total = new JSONObject();
               JSONArray arr = new JSONArray();
               
               description.put("FESTIVAL_NAME", "축제명");
               description.put("FESTIVAL_LOCATION", "장소");
               description.put("FESTIVAL_START", "축제 시작 일자");
               description.put("FESTIVAL_END", "축제 종료 일자");
               description.put("FESTIVAL_CONTENT", "축제내용");
               description.put("FESTIVAL_ADDRESS", "주소");
               description.put("FESTIVAL_TICKET",  "티켓여부");
               description.put("FESTIVAL_PRICE",  "티켓가격");
               total.put("DESCRIPTION", description );
               
               for(int i = 0 ; i < list.size(); i++) {
                  JSONObject obj = new JSONObject();
                  obj.put("festival_num", list.get(i).getFestival_num() + "");
                  obj.put("festival_name", list.get(i).getFestival_name());
                  obj.put("festival_location", list.get(i).getFestival_location());
                  obj.put("festival_start", list.get(i).getFestival_start());
                  obj.put("festival_end", list.get(i).getFestival_end());
                  obj.put("festival_content", list.get(i).getFestival_content());
                  obj.put("festival_address", list.get(i).getFestival_address());
                  obj.put("festival_ticket", list.get(i).getFestival_ticket());
                  obj.put("festival_price", list.get(i).getFestival_price());
                  arr.add(obj);
               }
               
               for(int j=0 ; j<arr.size() ; j++) {
                  System.out.println(arr.get(j));
               }
               total.put("data", arr);
               
               out.print(total);
               
            }else if(command.equals("monthUp")) {
               
               String monthly = request.getParameter("month");
               
               List<FestivalDto> list = dao.selectMonthly("monthly",monthly);
               JSONObject description = new JSONObject();
               JSONObject total = new JSONObject();
               JSONArray arr = new JSONArray();
               
               description.put("FESTIVAL_NAME", "축제명");
               description.put("FESTIVAL_LOCATION", "장소");
               description.put("FESTIVAL_START", "축제 시작 일자");
               description.put("FESTIVAL_END", "축제 종료 일자");
               description.put("FESTIVAL_CONTENT", "축제내용");
               description.put("FESTIVAL_ADDRESS", "주소");
               description.put("FESTIVAL_TICKET",  "티켓여부");
               description.put("FESTIVAL_PRICE",  "티켓가격");
               total.put("DESCRIPTION", description );
               
               for(int i = 0 ; i < list.size(); i++) {
                  JSONObject obj = new JSONObject();
                  obj.put("festival_num", list.get(i).getFestival_num() + "");
                  obj.put("festival_name", list.get(i).getFestival_name());
                  obj.put("festival_location", list.get(i).getFestival_location());
                  obj.put("festival_start", list.get(i).getFestival_start());
                  obj.put("festival_end", list.get(i).getFestival_end());
                  obj.put("festival_content", list.get(i).getFestival_content());
                  obj.put("festival_address", list.get(i).getFestival_address());
                  obj.put("festival_ticket", list.get(i).getFestival_ticket());
                  obj.put("festival_price", list.get(i).getFestival_price());
                  arr.add(obj);
               }
               
               for(int j=0 ; j<arr.size() ; j++) {
                  System.out.println(arr.get(j));
               }
               total.put("data", arr);
               
               out.print(total);
               
         
      /* 축제정보 리스트업 */   
      }else if(command.equals("ticketbox")) {
         List<FestivalDto> list = dao.selectList();
         request.setAttribute("list", list);
         System.out.println("list의 사이즈 : " + list.size());
         dispatch("board_reservation/ticket_list.jsp",request, response);
      /* 축제정보 상세보기 */
      } else if(command.equals("ticketdetail")) {
         int festival_num = Integer.parseInt(request.getParameter("festival_num"));
         FestivalDto dto = dao.selectOne(festival_num);
         request.setAttribute("dto", dto);
         dispatch("board_reservation/ticket_detail.jsp", request, response);
      
      }       
      
   
   }

   public void dispatch(String url, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      RequestDispatcher dispatch = request.getRequestDispatcher(url);
      dispatch.forward(request, response);
   }
   
}