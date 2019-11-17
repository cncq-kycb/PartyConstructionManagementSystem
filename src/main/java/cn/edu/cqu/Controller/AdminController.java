package cn.edu.cqu.Controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.edu.cqu.Service.AdminService;

@Controller
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 跳转到党员管理
	@RequestMapping(value = "/manageMemberPage")
	public String member_query_page(HttpSession session) {
		session.setAttribute("message", "");
		return "manageMemberPage";
	}
}
