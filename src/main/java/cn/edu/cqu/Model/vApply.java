package cn.edu.cqu.Model;

public class vApply {

	private String student_id;
	private String student_status;
	private String apply_status;
	private String permission;

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getStudent_status() {
		return student_status;
	}

	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	public String getApply_status() {
		return apply_status;
	}

	public void setApply_status(String apply_status) {
		this.apply_status = apply_status;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
	}

	@Override
	public String toString() {
		return "vApply [student_id=" + student_id + ", student_status=" + student_status + ", apply_status="
				+ apply_status + ", permission=" + permission + "]";
	}
}
