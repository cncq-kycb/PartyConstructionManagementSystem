package cn.edu.cqu.Model;

public class vStudent {
	private String student_id;
	private String student_num;
	private String student_name;
	private String student_tel;
	private String student_email;
	private String student_status;
	private String student_permission;
	private String branch_name;
	private String student_gender;

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_num() {
		return student_num;
	}

	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_tel() {
		return student_tel;
	}

	public void setStudent_tel(String student_tel) {
		this.student_tel = student_tel;
	}

	public String getStudent_email() {
		return student_email;
	}

	public void setStudent_email(String student_email) {
		this.student_email = student_email;
	}

	public String getStudent_status() {
		return student_status;
	}

	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	public String getStudent_permission() {
		return student_permission;
	}

	public void setStudent_permission(String student_permission) {
		this.student_permission = student_permission;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	public String getStudent_gender() {
		return student_gender;
	}

	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
	}

	@Override
	public String toString() {
		return "vStudent [student_id=" + student_id + ", student_num=" + student_num + ", student_name=" + student_name
				+ ", student_tel=" + student_tel + ", student_email=" + student_email + ", student_status="
				+ student_status + ", student_permission=" + student_permission + ", branch_name=" + branch_name
				+ ", student_gender=" + student_gender + "]";
	}

}
