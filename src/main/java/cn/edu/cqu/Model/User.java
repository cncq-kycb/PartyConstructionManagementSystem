package cn.edu.cqu.Model;

public class User {
	private String user_id;
	private String user_account;
	private String user_password;
	private String user_wechat;
	private int user_type;

	public User(String user_id, String user_account, String user_password, String user_wechat, int user_type) {
		super();
		this.user_id = user_id;
		this.user_account = user_account;
		this.user_password = user_password;
		this.user_wechat = user_wechat;
		this.user_type = user_type;
	}

	public User(String user_account, String user_password) {
		super();
		this.user_account = user_account;
		this.user_password = user_password;
		this.user_type = -1;
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

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_wechat() {
		return user_wechat;
	}

	public void setUser_wechat(String user_wechat) {
		this.user_wechat = user_wechat;
	}

	public int getUser_type() {
		return user_type;
	}

	public void setUser_type(int user_type) {
		this.user_type = user_type;
	}

	@Override
	public String toString() {
		return "User [user_id=" + user_id + ", user_account=" + user_account + ", user_password=" + user_password
				+ ", user_wechat=" + user_wechat + ", user_type=" + user_type + "]";
	}

}
