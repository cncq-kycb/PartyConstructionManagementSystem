package cn.edu.cqu.Controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.Student;
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

	/*
	 * 权限管理部分
	 */
	// 跳转到权限管理
	@RequestMapping(value = "/authorityPage")
	public String permission_manage_page(HttpSession session) {
		return "permission_manage_page";
	}

//	@RequestMapping(value = "/permission_update")
//	public String permission_update(Student student, HttpSession session) {
//		if (userService.update_permission(student)) {
//			session.setAttribute("message", "1");
//		} else {
//			session.setAttribute("message", "2");
//		}
//		return "permission_manage_page";
//	}
//
//	// 党支部增删改查
//	@RequestMapping(value = "/branch_insert_page")
//	public String branch_insert_page(HttpSession session) {
//		session.setAttribute("message", "");
//		return "branch_insert_page";
//	}
//
//	@RequestMapping(value = "/branch_insert")
//	public String branch_insert(Branch branch, HttpSession session) {
//		if (userService.branch_insert(branch)) {
//			session.setAttribute("message", "1");
//		} else {
//			session.setAttribute("message", "2");
//		}
//		return "branch_insert_page";
//	}
//
//	@RequestMapping(value = "/branch_query_page")
//	public String branch_query_page(HttpSession session) {
//		return "branch_query_page";
//	}
//
//	@RequestMapping(value = "/branch_delete")
//	public String branch_delete(String branch_id, HttpSession session) {
//		if (userService.branch_delete(branch_id)) {
//			session.setAttribute("message", "1");
//		} else {
//			session.setAttribute("message", "2");
//		}
//		return "branch_query_page";
//	}
//
//	@RequestMapping(value = "/branch_update")
//	public String branch_update(Branch branch, HttpSession session) {
//		if (userService.branch_update(branch)) {
//			session.setAttribute("message", "1");
//		} else {
//			session.setAttribute("message", "2");
//		}
//		return "branch_query_page";
//	}
//
//	@RequestMapping(value = "/branch_query")
//	public String branch_query(String branch_name, HttpSession session) {
//		ArrayList<Branch> branch_list = userService.select_branch(branch_name);
//		if (branch_list != null) {
//			session.setAttribute("branch_list", branch_list);
//		}
//		return "branch_query_page";
//	}
//
//	/*
//	 * 党员管理部分
//	 */
//
//	// 查找党员
//	@RequestMapping(value = "/manageMemberPageFinder")
//	public ModelAndView member_query(Student student, String branch_name, HttpSession session,
//			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
//			Map<String, Object> map) {
//		PageHelper.startPage(currentPage, 8);
//		ArrayList<Student> student_list = userService.select_student(student.getStudent_num(),
//				student.getStudent_name(), branch_name, student.getStudent_status());
//		if (student_list != null) {
//			PageInfo<Student> pageInfo = new PageInfo<Student>(student_list, 8);
//			map.put("pageInfo", pageInfo);
//			session.setAttribute("message", "0");
//		}
//		return new ModelAndView("/manageMemberPage");
//	}
}