package cn.edu.cqu.Model;

public class vAttendance {
	private String student_id;
	private String activity_id;
	private String activity_name;
	private String activity_date;
	private String activity_item;
	private String activity_duration;
	private String means;
	private String attendance_status;
	private String branch_id;
	private String branch_name;

	public String getStudent_id() {
		return student_id;
	}

	public void setStudent_id(String student_id) {
		this.student_id = student_id;
	}

	public String getActivity_id() {
		return activity_id;
	}

	public void setActivity_id(String activity_id) {
		this.activity_id = activity_id;
	}

	public String getActivity_name() {
		return activity_name;
	}

	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}

	public String getActivity_date() {
		return activity_date;
	}

	public void setActivity_date(String activity_date) {
		this.activity_date = activity_date;
	}

	public String getActivity_item() {
		return activity_item;
	}

	public void setActivity_item(String activity_item) {
		this.activity_item = activity_item;
	}

	public String getActivity_duration() {
		return activity_duration;
	}

	public void setActivity_duration(String activity_duration) {
		this.activity_duration = activity_duration;
	}

	public String getMeans() {
		return means;
	}

	public void setMeans(String means) {
		this.means = means;
	}

	public String getAttendance_status() {
		return attendance_status;
	}

	public void setAttendance_status(String attendance_status) {
		this.attendance_status = attendance_status;
	}

	public String getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}

	public String getBranch_name() {
		return branch_name;
	}

	public void setBranch_name(String branch_name) {
		this.branch_name = branch_name;
	}

	@Override
	public String toString() {
		return "vAttendance [student_id=" + student_id + ", activity_id=" + activity_id + ", activity_name="
				+ activity_name + ", activity_date=" + activity_date + ", activity_item=" + activity_item
				+ ", activity_duration=" + activity_duration + ", means=" + means + ", attendance_status="
				+ attendance_status + ", branch_id=" + branch_id + ", branch_name=" + branch_name + "]";
	}

}
