package hippe.board.dto;

import java.util.Date;

public class BoardDto {

	private int board_category;
	private int board_postnum;
	private int board_groupnum;
	private int board_grouporder;
	private int titletab;
	private String writer;
	private String board_title;
	private String board_content;
	private Date board_regdate;
	private int board_views;
	
	public BoardDto() {}

	public BoardDto(int board_category, int board_postnum, int board_groupnum, 
			int board_grouporder, int titletab, String writer, String board_title, 
			String board_content, Date board_regdate, int board_views) {
		super();
		this.board_category = board_category;
		this.board_postnum = board_postnum;
		this.board_groupnum = board_groupnum;
		this.board_grouporder = board_grouporder;
		this.titletab = titletab;
		this.writer = writer;
		this.board_title = board_title;
		this.board_content = board_content;
		this.board_regdate = board_regdate;
		this.board_views = board_views;
	}

	public int getBoard_category() {
		return board_category;
	}

	public void setBoard_category(int board_category) {
		this.board_category = board_category;
	}

	public int getBoard_postnum() {
		return board_postnum;
	}

	public void setBoard_postnum(int board_postnum) {
		this.board_postnum = board_postnum;
	}

	public int getBoard_groupnum() {
		return board_groupnum;
	}

	public void setBoard_groupnum(int board_groupnum) {
		this.board_groupnum = board_groupnum;
	}

	public int getBoard_grouporder() {
		return board_grouporder;
	}

	public void setBoard_grouporder(int board_grouporder) {
		this.board_grouporder = board_grouporder;
	}

	public int getTitletab() {
		return titletab;
	}

	public void setTitletab(int titletab) {
		this.titletab = titletab;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public Date getBoard_regdate() {
		return board_regdate;
	}

	public void setBoard_regdate(Date board_regdate) {
		this.board_regdate = board_regdate;
	}

	public int getBoard_views() {
		return board_views;
	}

	public void setBoard_views(int board_views) {
		this.board_views = board_views;
	}

	
}
