package cn.edu.cqu.Model;

public class Admin {
	private User user;
	private String admin_id;
	private String admin_name;
	private String admin_tel;
	private String admin_email;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getAdmin_name() {
		return admin_name;
	}

	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}

	public String getAdmin_tel() {
		return admin_tel;
	}

	public void setAdmin_tel(String admin_tel) {
		this.admin_tel = admin_tel;
	}

	public String getAdmin_email() {
		return admin_email;
	}

	public void setAdmin_email(String admin_email) {
		this.admin_email = admin_email;
	}

	@Override
	public String toString() {
		return "Admin [user=" + user + ", admin_id=" + admin_id + ", admin_name=" + admin_name + ", admin_tel="
				+ admin_tel + ", admin_email=" + admin_email + "]";
	}

}
