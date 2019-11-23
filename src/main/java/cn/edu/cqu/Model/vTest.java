package cn.edu.cqu.Model;

public class vTest {

	private Integer total_num;
	private String test_id;
	private String student_num;
	private String test_name;
	private String student_name;
	private String answer_date;
	private Integer correct_num;

	public Integer getTotal_num() {
		return total_num;
	}

	public void setTotal_num(Integer total_num) {
		this.total_num = total_num;
	}

	public String getTest_id() {
		return test_id;
	}

	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}

	public String getStudent_num() {
		return student_num;
	}

	public void setStudent_num(String student_num) {
		this.student_num = student_num;
	}

	public String getTest_name() {
		return test_name;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public String getStudent_name() {
		return student_name;
	}

	public void setStudent_name(String student_name) {
		this.student_name = student_name;
	}

	public String getAnswer_date() {
		return answer_date;
	}

	public void setAnswer_date(String answer_date) {
		this.answer_date = answer_date;
	}

	public Integer getCorrect_num() {
		return correct_num;
	}

	public void setCorrect_num(Integer correct_num) {
		this.correct_num = correct_num;
	}

	@Override
	public String toString() {
		return "vTest [total_num=" + total_num + ", test_id=" + test_id + ", student_num=" + student_num
				+ ", test_name=" + test_name + ", student_name=" + student_name + ", answer_date=" + answer_date
				+ ", correct_num=" + correct_num + "]";
	}

}
