package hippe.ticket.dto;

import java.sql.Date;

public class ReservationDto {

	private int reservation_num;
	private String reservation_id;
	private int reservation_f_num;
	private int reservation_quantity;
	private int reservation_totalprice;
	private Date reservation_date;
	private String reservation_status;
	private String reservation_cancleable;

	public ReservationDto() {}

	public ReservationDto(int reservation_num, String reservation_id, int reservation_f_num, int reservation_quantity,
			int reservation_totalprice, Date reservation_date, String reservation_status,
			String reservation_cancleable) {
		super();
		this.reservation_num = reservation_num;
		this.reservation_id = reservation_id;
		this.reservation_f_num = reservation_f_num;
		this.reservation_quantity = reservation_quantity;
		this.reservation_totalprice = reservation_totalprice;
		this.reservation_date = reservation_date;
		this.reservation_status = reservation_status;
		this.reservation_cancleable = reservation_cancleable;
	}

	public int getReservation_num() {
		return reservation_num;
	}

	public void setReservation_num(int reservation_num) {
		this.reservation_num = reservation_num;
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

	public Date getReservation_date() {
		return reservation_date;
	}

	public void setReservation_date(Date reservation_date) {
		this.reservation_date = reservation_date;
	}

	public String getReservation_status() {
		return reservation_status;
	}

	public void setReservation_status(String reservation_status) {
		this.reservation_status = reservation_status;
	}

	public String getReservation_cancleable() {
		return reservation_cancleable;
	}

	public void setReservation_cancleable(String reservation_cancleable) {
		this.reservation_cancleable = reservation_cancleable;
	}

	
	
	
}
