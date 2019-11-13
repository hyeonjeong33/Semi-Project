package hippe.board.dto;

import java.sql.Date;

public class FestivalDto {

	private int festival_num;
	private String festival_name;
	private String festival_content;
	private String festival_start;
	private String festival_end;
	private String festival_location;
	private String festival_address;
	private String festival_ticket;
	private int festival_price;
	private String festival_imgsrc;
	
	public FestivalDto() {}

	

	public FestivalDto(int festival_num, String festival_name, String festival_content, String festival_start,
			String festival_end, String festival_location, String festival_ticket, int festival_price,
			String festival_imgsrc, String festival_address) {
		super();
		this.festival_num = festival_num;
		this.festival_name = festival_name;
		this.festival_content = festival_content;
		this.festival_start = festival_start;
		this.festival_end = festival_end;
		this.festival_location = festival_location;
		this.festival_ticket = festival_ticket;
		this.festival_price = festival_price;
		this.festival_imgsrc = festival_imgsrc;
		this.festival_address = festival_address;
	}



	public int getFestival_num() {
		return festival_num;
	}

	public void setFestival_num(int festival_num) {
		this.festival_num = festival_num;
	}

	public String getFestival_name() {
		return festival_name;
	}

	public void setFestival_name(String festival_name) {
		this.festival_name = festival_name;
	}

	public String getFestival_content() {
		return festival_content;
	}

	public void setFestival_content(String festival_content) {
		this.festival_content = festival_content;
	}
	
	public String getFestival_start() {
		return festival_start;
	}

	public void setFestival_start(String festival_start) {
		this.festival_start = festival_start;
	}

	public String getFestival_end() {
		return festival_end;
	}

	public void setFestival_end(String festival_end) {
		this.festival_end = festival_end;
	}

	public String getFestival_location() {
		return festival_location;
	}

	public void setFestival_location(String festival_location) {
		this.festival_location = festival_location;
	}

	
	public String getFestival_address() {
		return festival_address;
	}

	public void setFestival_address(String festival_address) {
		this.festival_address = festival_address;
	}

	public String getFestival_ticket() {
		return festival_ticket;
	}

	public void setFestival_ticket(String festival_ticket) {
		this.festival_ticket = festival_ticket;
	}

	public int getFestival_price() {
		return festival_price;
	}

	public void setFestival_price(int festival_price) {
		this.festival_price = festival_price;
	}

	public String getFestival_imgsrc() {
		return festival_imgsrc;
	}

	public void setFestival_imgsrc(String festival_imgsrc) {
		this.festival_imgsrc = festival_imgsrc;
	}
	
}
