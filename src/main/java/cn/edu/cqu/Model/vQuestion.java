package cn.edu.cqu.Model;

public class vQuestion {
	private String test_id;
	private String test_name;
	private String test_date_start;
	private String test_date_end;
	private String question_id;
	private String question_problem;
	private String question_option_a;
	private String question_option_b;
	private String question_option_c;
	private String question_option_d;

	public String getTest_id() {
		return test_id;
	}

	public void setTest_id(String test_id) {
		this.test_id = test_id;
	}

	public String getTest_name() {
		return test_name;
	}

	public String getQuestion_id() {
		return question_id;
	}

	public void setQuestion_id(String question_id) {
		this.question_id = question_id;
	}

	public void setTest_name(String test_name) {
		this.test_name = test_name;
	}

	public String getTest_date_start() {
		return test_date_start;
	}

	public void setTest_date_start(String test_date_start) {
		this.test_date_start = test_date_start;
	}

	public String getTest_date_end() {
		return test_date_end;
	}

	public void setTest_date_end(String test_date_end) {
		this.test_date_end = test_date_end;
	}

	public String getQuestion_problem() {
		return question_problem;
	}

	public void setQuestion_problem(String question_problem) {
		this.question_problem = question_problem;
	}

	public String getQuestion_option_a() {
		return question_option_a;
	}

	public void setQuestion_option_a(String question_option_a) {
		this.question_option_a = question_option_a;
	}

	public String getQuestion_option_b() {
		return question_option_b;
	}

	public void setQuestion_option_b(String question_option_b) {
		this.question_option_b = question_option_b;
	}

	public String getQuestion_option_c() {
		return question_option_c;
	}

	public void setQuestion_option_c(String question_option_c) {
		this.question_option_c = question_option_c;
	}

	public String getQuestion_option_d() {
		return question_option_d;
	}

	public void setQuestion_option_d(String question_option_d) {
		this.question_option_d = question_option_d;
	}

	@Override
	public String toString() {
		return "vQuestion [test_name=" + test_name + ", test_date_start=" + test_date_start + ", test_date_end="
				+ test_date_end + ", question_problem=" + question_problem + ", question_option_a=" + question_option_a
				+ ", question_option_b=" + question_option_b + ", question_option_c=" + question_option_c
				+ ", question_option_d=" + question_option_d + "]";
	}
}
