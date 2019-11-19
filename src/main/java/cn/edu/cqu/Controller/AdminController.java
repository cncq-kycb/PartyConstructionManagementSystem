package cn.edu.cqu.Controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Model.Activity;
import cn.edu.cqu.Model.ActivityStatusMap;
import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.StudentPermissionMap;
import cn.edu.cqu.Model.StudentStatusMap;
import cn.edu.cqu.Model.vActivity;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Service.AdminService;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Controller
@RequestMapping(value = "/admin")
public class AdminController {

	@Autowired
	private AdminService adminService;

	// 主页
	@RequestMapping(value = "/main_page_1")
	public String main_page_1() {
		return "main_page_1";
	}

	// 党员管理页面模糊查询
	@RequestMapping(value = "/manageMemberPageFinder")
	public String manageMemberPageFinder(String student_num_input, String student_name_input,
			String student_status_input, String branch_name_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		return "admin/manageMemberPage";
	}

	// 修改信息
	@RequestMapping(value = "/updateMember")
	public String updateMember(String student_num_check, String student_name_check, String student_gender_check,
			String student_tel_check, String student_email_check, HttpSession session) {
		if (adminService.update_student_info(student_num_check, student_name_check, student_gender_check,
				student_tel_check, student_email_check)) {
			session.setAttribute("message", "1");
			String student_num_input = (String) session.getAttribute("student_num_input");
			String student_name_input = (String) session.getAttribute("student_name_input");
			String student_status_input = (String) session.getAttribute("student_status_input");
			String branch_name_input = (String) session.getAttribute("branch_name_input");
			ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
					student_status_input, branch_name_input);
			PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
			session.setAttribute("student_num_input", student_num_input);
			session.setAttribute("student_name_input", student_name_input);
			session.setAttribute("student_status_input", student_status_input);
			session.setAttribute("branch_name_input", branch_name_input);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/manageMemberPage";
	}

	// 成员级别管理页面
	@RequestMapping(value = "/updateStatusPage")
	public String updateStatusPage(HttpSession session) {
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>();
		session.setAttribute("pageInfo", pageInfo);
		return "admin/updateStatusPage";
	}

	// 成员级别管理查找
	@RequestMapping(value = "/distributionPageFinder")
	public String distributionPageFinder(String student_num_input, String student_name_input,
			String student_status_input, String branch_name_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		return "admin/updateStatusPage";
	}

	// 提升等级阶段
	@RequestMapping(value = "/updateLevel")
	public String updateLevel(String student_num_check, HttpSession session) {
		ArrayList<StudentPermissionMap> spm = (ArrayList<StudentPermissionMap>) session.getAttribute("spm");
		if (adminService.is_able_to_level_up(student_num_check)) {
			if (adminService.update_student_status(student_num_check)) {
				session.setAttribute("message", "1");
				String student_num_input = (String) session.getAttribute("student_num_input");
				String student_name_input = (String) session.getAttribute("student_name_input");
				String student_status_input = (String) session.getAttribute("student_status_input");
				String branch_name_input = (String) session.getAttribute("branch_name_input");
				ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
						student_status_input, branch_name_input);
				PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
				session.setAttribute("pageInfo", pageInfo);
				return "admin/updateStatusPage";
			}
			session.setAttribute("message", "3");
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/updateStatusPage";
	}

	/*
	 * 权限管理部分
	 */

	// 跳转到权限管理
	@RequestMapping(value = "/authorityPage")
	public String permission_manage_page(HttpSession session) {
		session.setAttribute("student_num_input", "");
		session.setAttribute("student_name_input", "");
		session.setAttribute("student_status_input", "");
		session.setAttribute("branch_name_input", "");
		session.setAttribute("message", "");
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		ArrayList<StudentPermissionMap> spm = adminService.select_student_permission_map();
		session.setAttribute("ssm", ssm);
		session.setAttribute("spm", spm);
		ArrayList<vStudent> vStudents = new ArrayList<vStudent>();
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
		session.setAttribute("pageInfo", pageInfo);
		return "admin/authorityPage";
	}

	// 查找用户
	@RequestMapping(value = "/authorityPageFinder")
	public String authorityPageFinder(String student_num_input, String student_name_input, String student_status_input,
			String branch_name_input, @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("message", "");
		return "admin/authorityPage";
	}

	// 修改权限
	@RequestMapping(value = "/updatePermission")
	public String permission_update(String student_num_check, String student_permission, HttpSession session) {
		ArrayList<StudentPermissionMap> spm = (ArrayList<StudentPermissionMap>) session.getAttribute("spm");
		String student_permission_update = null;
		for (StudentPermissionMap item : spm) {
			if (item.getMeans().equals(student_permission)) {
				student_permission_update = item.getStudent_permission();
				break;
			}
		}
		if (adminService.update_permission(student_num_check, student_permission_update)) {
			session.setAttribute("message", "1");
			String student_num_input = (String) session.getAttribute("student_num_input");
			String student_name_input = (String) session.getAttribute("student_name_input");
			String student_status_input = (String) session.getAttribute("student_status_input");
			String branch_name_input = (String) session.getAttribute("branch_name_input");
			ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
					student_status_input, branch_name_input);
			PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
			session.setAttribute("student_num_input", student_num_input);
			session.setAttribute("student_name_input", student_name_input);
			session.setAttribute("student_status_input", student_status_input);
			session.setAttribute("branch_name_input", branch_name_input);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/authorityPage";
	}

	// 党支部增删改查
	@RequestMapping(value = "/branch_insert_page")
	public String branch_insert_page(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/branch_insert_page";
	}

	@RequestMapping(value = "/branch_insert")
	public String branch_insert(Branch branch, HttpSession session) {
		if (adminService.branch_insert(branch)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/branch_insert_page";
	}

	@RequestMapping(value = "/manageBranchPage")
	public String manageBranchPage(HttpSession session) {
		session.setAttribute("message", "");
		ArrayList<Branch> branch = adminService.select_all_branch();
		session.setAttribute("branch", branch);
		ArrayList<vStudent> list = new ArrayList<vStudent>();
		session.setAttribute("list", list);
		return "admin/manageBranchPage";
	}

	// 支部成员管理查找
	@RequestMapping(value = "/manageBranchPageFinder")
	public String manageBranchPageFinder(String branch_name_input, HttpSession session) {
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("list", list);
		return "admin/manageBranchPage";
	}

	@RequestMapping(value = "/branch_delete")
	public String branch_delete(String branch_id, HttpSession session) {
		if (adminService.branch_delete(branch_id)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/manageBranchPage";
	}

	@RequestMapping(value = "/branch_update")
	public String branch_update(Branch branch, HttpSession session) {
		if (adminService.branch_update(branch)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/manageBranchPage";
	}

	// 添加支部成员页面
	@RequestMapping(value = "/addMemberPage")
	public String addMemberPage(HttpSession session) {
		session.setAttribute("message", "");
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>();
		session.setAttribute("pageInfo", pageInfo);
		return "admin/addMemberPage";
	}

	// 添加支部成员查找
	@RequestMapping(value = "/addMemberPageFinder")
	public String addMemberPageFinder(String student_num_input, String student_name_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		String student_status_input = null;
		String branch_name_input = null;
		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		Iterator<vStudent> iterator = vStudents.iterator();
		while (iterator.hasNext()) {
			vStudent next = iterator.next();
			if (!(next.getBranch_name().equals("无"))) {
				iterator.remove();
			}
		}
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
		ArrayList<Branch> branch = adminService.select_all_branch();
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("branch", branch);
		return "admin/addMemberPage";
	}

	// 添加支部成员
	@RequestMapping(value = "/addMember")
	public String addMember(String student_num_check, String branch_name, HttpSession session) {
		ArrayList<Branch> branch = (ArrayList<Branch>) session.getAttribute("branch");
		String branch_id = null;
		for (Branch item : branch) {
			if (item.getBranch_name().equals(branch_name)) {
				branch_id = item.getBranch_id();
				break;
			}
		}
		if (adminService.add_member_to_branch(student_num_check, branch_id)) {
			session.setAttribute("message", "1");
			String student_num_input = (String) session.getAttribute("student_num_input");
			String student_name_input = (String) session.getAttribute("student_name_input");
			String student_status_input = (String) session.getAttribute("student_status_input");
			String branch_name_input = (String) session.getAttribute("branch_name_input");
			ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
					student_status_input, branch_name_input);
			Iterator<vStudent> iterator = vStudents.iterator();
			while (iterator.hasNext()) {
				vStudent next = iterator.next();
				if (!(next.getBranch_name().equals("无"))) {
					iterator.remove();
				}
			}
			PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 10);
			branch = adminService.select_all_branch();
			session.setAttribute("pageInfo", pageInfo);
			session.setAttribute("branch", branch);
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/addMemberPage";
	}

	// 成员管理页面
	@RequestMapping(value = "/manageMemberPage")
	public String manageMemberPage(HttpSession session) {
		session.setAttribute("message", "");
		session.setAttribute("student_num_input", "");
		session.setAttribute("student_name_input", "");
		session.setAttribute("branch_name_input", "");
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("ssm", ssm);
		return "admin/manageMemberPage";
	}

	// 从支部移除
	@RequestMapping(value = "/deleteFromBranch")
	public String deleteFromBranch(String student_num, HttpSession session) {
		List<String> student_nums = Utils.splitByComma(student_num);
		for (String s : student_nums) {
			if (adminService.delete_branch_by_student_num(s)) {
				session.setAttribute("message", "1");
			} else {
				session.setAttribute("message", "2");
				return "admin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "admin/manageBranchPage";
	}

	// 设为支部管理
	@RequestMapping(value = "/passFromBranch")
	public String passFromBranch(String student_num, HttpSession session) {
		List<String> student_nums = Utils.splitByComma(student_num);
		for (String s : student_nums) {
			if (adminService.pass_branch_by_student_num(s)) {
				session.setAttribute("message", "3");
			} else {
				session.setAttribute("message", "4");
				return "admin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "admin/manageBranchPage";
	}

	// 取消支部管理
	@RequestMapping(value = "/unpassFromBranch")
	public String unpassFromBranch(String student_num, HttpSession session) {
		List<String> student_nums = Utils.splitByComma(student_num);
		for (String s : student_nums) {
			if (adminService.unpass_branch_by_student_num(s)) {
				session.setAttribute("message", "5");
			} else {
				session.setAttribute("message", "6");
				return "admin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "admin/manageBranchPage";
	}

	@RequestMapping(value = "/addActivityPage")
	public String addActivityPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/addActivityPage";
	}

	// 组织生活签到管理页面
	@RequestMapping(value = "/manageSignInPage")
	public String manageSignInPage(HttpSession session) {
		session.setAttribute("message", "");
		ArrayList<ActivityStatusMap> asm = adminService.select_activity_status_map();
		session.setAttribute("asm", asm);
		ArrayList<vActivity> activities = new ArrayList<vActivity>();
		PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 10);
		session.setAttribute("pageInfo", pageInfo);
		return "admin/manageSignInPage";
	}

	// 组织生活签到查询结果
	@RequestMapping(value = "/manageSignInPageFinder")
	public String manageSignInPageFinder(String activity_name_input, String activity_status_input,
			String activity_date_input, String activity_location_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		ArrayList<vActivity> activities = adminService.select_vactivity(activity_name_input, activity_status_input,
				activity_date_input, activity_location_input);
		PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 10);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("activity_name_input", activity_name_input);
		session.setAttribute("activity_status_input", activity_status_input);
		session.setAttribute("activity_date_input", activity_date_input);
		session.setAttribute("activity_location_input", activity_location_input);
		session.setAttribute("message", "");
		return "admin/manageSignInPage";
	}

	// 组织生活签到审核与查看
	@RequestMapping(value = "/attendanceCheckPage")
	public String attendanceCheckPage(String activity_name_signIn, String activity_date_signIn,
			String branch_name_signIn, String activity_id_signIn, HttpSession session) {
		session.setAttribute("activity_date", activity_date_signIn);
		session.setAttribute("activity_name", activity_name_signIn);
		session.setAttribute("branch_name", branch_name_signIn);
		ArrayList<vAttendance> vAttendances = adminService.select_vAttendance_by_activity_id(activity_id_signIn);
		session.setAttribute("list", vAttendances);
		int signInNum = adminService.count_sign_in_num_by_activity_id(activity_id_signIn);
		int totalMemberNum = adminService.count_total_num_by_activity_id(activity_id_signIn);
		session.setAttribute("signInNum", signInNum);
		session.setAttribute("totalMemberNum", totalMemberNum);
		session.setAttribute("message", "");
		return "admin/attendanceCheckPage";
	}

	// 修改活动状态
	@RequestMapping(value = "/updateActivityStatus")
	public String updateActivityStatus(String activity_id_update, String new_activity_status, HttpSession session) {
		ArrayList<ActivityStatusMap> asm = adminService.select_activity_status_map();
		String activity_status = null;
		for (ActivityStatusMap item : asm) {
			if (item.getMeans().equals(new_activity_status)) {
				activity_status = item.getActivity_status();
				break;
			}
		}
		if (adminService.update_activity_status(activity_id_update, activity_status)) {
			session.setAttribute("message", "1");
			String activity_name_input = (String) session.getAttribute("activity_name_input");
			String activity_status_input = (String) session.getAttribute("activity_status_input");
			String activity_date_input = (String) session.getAttribute("activity_date_input");
			String activity_location_input = (String) session.getAttribute("activity_location_input");
			ArrayList<vActivity> activities = adminService.select_vactivity(activity_name_input, activity_status_input,
					activity_date_input, activity_location_input);
			PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 10);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return "admin/manageSignInPage";
	}

	// 发布学习内容
	@RequestMapping(value = "/insertStudyPage")
	public String insertStudyPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/insertStudyPage";
	}

	// 管理学习内容
	@RequestMapping(value = "/manageStudyPage")
	public String manageStudyPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/manageStudyPage";
	}

	// 知识竞答编辑
	@RequestMapping(value = "/editCompetitionPage")
	public String editCompetitionPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/editCompetitionPage";
	}

	// 知识竞答结果
	@RequestMapping(value = "/resultByTestPage")
	public String resultByTestPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/resultByTestPage";
	}

	// 按学生查询知识竞答结果
	@RequestMapping(value = "/resultByStudentPage")
	public String resultByStudentPage(HttpSession session) {
		session.setAttribute("message", "");
		return "admin/resultByStudentPage";
	}

}
