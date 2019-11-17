package cn.edu.cqu.Model;

public class Student {
	private String student_id;
	private String student_num;
	private String branch_id;
	private String student_permission;
	private String user_id;
	private String user_account;
	private String student_status;
	private String student_name;
	private String student_gender;
	private String student_tel;
	private String student_email;

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

	public String getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}

	public String getStudent_permission() {
		return student_permission;
	}

	public void setStudent_permission(String student_permission) {
		this.student_permission = student_permission;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_account() {
		return user_account;
	}

	public void setUser_account(String user_account) {
		this.user_account = user_account;
	}

	public String getStudent_status() {
		return student_status;
	}

	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getStudent_gender() {
		return student_gender;
	}

	public void setStudent_gender(String student_gender) {
		this.student_gender = student_gender;
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

	@Override
	public String toString() {
		return "Student [student_id=" + student_id + ", student_num=" + student_num + ", branch_id=" + branch_id
				+ ", student_permission=" + student_permission + ", user_id=" + user_id + ", user_account="
				+ user_account + ", student_status=" + student_status + ", student_name=" + student_name
				+ ", student_gender=" + student_gender + ", student_tel=" + student_tel + ", student_email="
				+ student_email + "]";
	}
}
