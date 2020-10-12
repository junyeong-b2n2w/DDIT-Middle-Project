package mukgo.vo;

public class ReviewVO {
	private int rev_num;
	private int rev_mem_num;
	private int rev_ord_num;
	private int rev_parentrev_num;
	private int rev_delete_gb;
	private int rev_star;
	public int getRev_num() {
		return rev_num;
	}
	public void setRev_num(int rev_num) {
		this.rev_num = rev_num;
	}
	public int getRev_mem_num() {
		return rev_mem_num;
	}
	public void setRev_mem_num(int rev_mem_num) {
		this.rev_mem_num = rev_mem_num;
	}
	public int getRev_ord_num() {
		return rev_ord_num;
	}
	public void setRev_ord_num(int rev_ord_num) {
		this.rev_ord_num = rev_ord_num;
	}
	public int getRev_parentrev_num() {
		return rev_parentrev_num;
	}
	public void setRev_parentrev_num(int rev_parentrev_num) {
		this.rev_parentrev_num = rev_parentrev_num;
	}
	public int getRev_delete_gb() {
		return rev_delete_gb;
	}
	public void setRev_delete_gb(int rev_delete_gb) {
		this.rev_delete_gb = rev_delete_gb;
	}
	public int getRev_star() {
		return rev_star;
	}
	public void setRev_star(int rev_star) {
		this.rev_star = rev_star;
	}
	public String getRev_date() {
		return rev_date;
	}
	public void setRev_date(String rev_date) {
		this.rev_date = rev_date;
	}
	public String getRev_content() {
		return rev_content;
	}
	public void setRev_content(String rev_content) {
		this.rev_content = rev_content;
	}
	private String rev_date;
	private String rev_content;
}
