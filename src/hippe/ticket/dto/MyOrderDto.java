package hippe.ticket.dto;


public class MyOrderDto {

	private String reservation_id;
	private int reservation_f_num;
	private int reservation_num;
	private String reservation_date;
	private int reservation_quantity;
	private int reservation_totalprice;
	private String reservation_String;
	private String reservation_status;
	private String reservation_cancellabel;
	private int festival_num;
	private String festival_name;
	private String festival_content;
	private String festival_start;
	private String festival_end;
	private String festival_location;
	private String festival_ticket;
	private int festival_price;
	private String festival_imgsrc;

	public MyOrderDto() {

	}

	public MyOrderDto(String reservation_id, int reservation_f_num, int reservation_num, int reservation_quantity,
			int reservation_totalprice, String reservation_String, String reservation_status,
			String reservation_cancellabel, int festival_num, String festival_name, String festival_content,
			String festival_start, String festival_end, String festival_location, String festival_ticket,
			int festival_price, String festival_imgsrc, String reservation_date) {
		this.reservation_id = reservation_id;
		this.reservation_f_num = reservation_f_num;
		this.reservation_num = reservation_num;
		this.reservation_quantity = reservation_quantity;
		this.reservation_totalprice = reservation_totalprice;
		this.reservation_String = reservation_String;
		this.reservation_status = reservation_status;
		this.reservation_cancellabel = reservation_cancellabel;
		this.reservation_date = reservation_date;
		this.festival_num = festival_num;
		this.festival_name = festival_name;
		this.festival_content = festival_content;
		this.festival_start = festival_start;
		this.festival_end = festival_end;
		this.festival_location = festival_location;
		this.festival_ticket = festival_ticket;
		this.festival_price = festival_price;
		this.festival_imgsrc = festival_imgsrc;
	}

	public String getReservation_id() {
		return reservation_id;
	}

	public void setReservation_id(String reservation_id) {
		this.reservation_id = reservation_id;
	}

	public int getReservation_f_num() {
		return reservation_f_num;
	}

	public void setReservation_f_num(int reservation_f_num) {
		this.reservation_f_num = reservation_f_num;
	}

	public int getReservation_num() {
		return reservation_num;
	}

	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
	}

	public int getReservation_quantity() {
		return reservation_quantity;
	}

	public void setReservation_quantity(int reservation_quantity) {
		this.reservation_quantity = reservation_quantity;
	}

	public int getReservation_totalprice() {
		return reservation_totalprice;
	}

	public void setReservation_totalprice(int reservation_totalprice) {
		this.reservation_totalprice = reservation_totalprice;
	}

	public String getReservation_String() {
		return reservation_String;
	}

	public void setReservation_String(String reservation_String) {
		this.reservation_String = reservation_String;
	}

	public String getReservation_status() {
		return reservation_status;
	}

	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}

	public String getReservation_cancellabel() {
		return reservation_cancellabel;
	}

	public void setReservation_cancellabel(String reservation_cancellabel) {
		this.reservation_cancellabel = reservation_cancellabel;
	}
	

	public String getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(String reservation_date) {
		this.reservation_date = reservation_date;
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
