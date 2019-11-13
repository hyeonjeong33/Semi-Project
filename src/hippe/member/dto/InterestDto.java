package hippe.member.dto;

public class InterestDto {

	private String interest_id;
	private int interest_f_num;
	
	public InterestDto() {}

	public InterestDto(String interest_id, int interest_f_num) {
		super();
		this.interest_id = interest_id;
		this.interest_f_num = interest_f_num;
	}

	public String getInterest_id() {
		return interest_id;
	}

	public void setInterest_id(String interest_id) {
		this.interest_id = interest_id;
	}

	public int getInterest_f_num() {
		return interest_f_num;
	}

	public void setInterest_f_num(int interest_f_num) {
		this.interest_f_num = interest_f_num;
	}
	
}
