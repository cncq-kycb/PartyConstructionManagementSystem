package cn.edu.cqu.Model;

public class vStudentMaterial {

	private String student_num;
	private String student_name;
	private String student_status;
	private String mean;
	private String branch_id;
	private String branch_name;
	private int material_type_id;
	private String material_type_name;
	private String material_date;
	private String material_url;
	private String material_type_from;
	private int student_status_limite;

	public int getStudent_status_limite() {
		return student_status_limite;
	}

	public void setStudent_status_limite(int student_status_limite) {
		this.student_status_limite = student_status_limite;
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

	public String getStudent_status() {
		return student_status;
	}

	public void setStudent_status(String student_status) {
		this.student_status = student_status;
	}

	public String getMean() {
		return mean;
	}

	public void setMean(String mean) {
		this.mean = mean;
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

	public int getMaterial_type_id() {
		return material_type_id;
	}

	public void setMaterial_type_id(int material_type_id) {
		this.material_type_id = material_type_id;
	}

	public String getMaterial_type_name() {
		return material_type_name;
	}

	public void setMaterial_type_name(String material_type_name) {
		this.material_type_name = material_type_name;
	}

	public String getMaterial_date() {
		return material_date;
	}

	public void setMaterial_date(String material_date) {
		this.material_date = material_date;
	}

	public String getMaterial_url() {
		return material_url;
	}

	public void setMaterial_url(String material_url) {
		this.material_url = material_url;
	}

	public String getMaterial_type_from() {
		return material_type_from;
	}

	public void setMaterial_type_from(String material_type_from) {
		this.material_type_from = material_type_from;
	}

	@Override
	public String toString() {
		return "vStudentMaterial [student_num=" + student_num + ", student_name=" + student_name + ", student_status="
				+ student_status + ", mean=" + mean + ", branch_id=" + branch_id + ", branch_name=" + branch_name
				+ ", material_type_id=" + material_type_id + ", material_type_name=" + material_type_name
				+ ", material_date=" + material_date + ", material_url=" + material_url + ", material_type_from="
				+ material_type_from + ", student_status_limite=" + student_status_limite + "]";
	}
}
