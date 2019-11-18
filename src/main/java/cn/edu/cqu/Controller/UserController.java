package cn.edu.cqu.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.edu.cqu.Model.User;
import cn.edu.cqu.Service.UserService;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/*
	 * 登录退出
	 */
	// 用户登录
	@RequestMapping(value = "/login")
	public String login(String user_account, String user_password, HttpSession session) {
		User user = new User(user_account, user_password);
		int type = userService.login(user, session);
		if (type != 0) {
			return "main_page_" + type;
		}
		return "loginFail";
	}

	// 用户退出
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

}