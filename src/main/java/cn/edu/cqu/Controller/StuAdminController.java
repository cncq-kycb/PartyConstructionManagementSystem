package cn.edu.cqu.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Model.Activity;
import cn.edu.cqu.Model.ActivityStatusMap;
import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.Question;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.StudentPermissionMap;
import cn.edu.cqu.Model.StudentStatusMap;
import cn.edu.cqu.Model.Study;
import cn.edu.cqu.Model.StudyStatusMap;
import cn.edu.cqu.Model.Test;
import cn.edu.cqu.Model.vActivity;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Model.vStudentMaterial;
import cn.edu.cqu.Model.vStudy;
import cn.edu.cqu.Model.vTest;
import cn.edu.cqu.Service.AdminService;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Controller
@RequestMapping(value = "/stuAdmin")
public class StuAdminController {

	@Autowired
	private AdminService adminService;

	// 主页
	@RequestMapping(value = "/main_page_3")
	public String main_page_3() {
		return "main_page_3";
	}

	/*
	 * // 党员管理页面模糊查询
	 * 
	 * @RequestMapping(value = "/manageMemberPageFinder") public String
	 * manageMemberPageFinder(String student_num_input, String student_name_input,
	 * String student_status_input, String branch_name_input,
	 * 
	 * @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession
	 * session) { ArrayList<vStudent> vStudents =
	 * adminService.select_vstudent(student_num_input, student_name_input,
	 * student_status_input, branch_name_input); PageInfo<vStudent> pageInfo = new
	 * PageInfo<vStudent>(vStudents, 10); ArrayList<StudentStatusMap> ssm =
	 * adminService.select_student_status_map(); session.setAttribute("pageInfo",
	 * pageInfo); session.setAttribute("student_num_input", student_num_input);
	 * session.setAttribute("student_name_input", student_name_input);
	 * session.setAttribute("student_status_input", student_status_input);
	 * session.setAttribute("branch_name_input", branch_name_input);
	 * session.setAttribute("ssm", ssm); session.setAttribute("message", ""); return
	 * "stuAdmin/manageMemberPage"; }
	 */
	// 党员管理页面模糊查询
	@RequestMapping(value = "/manageMemberPageFinder")
	public ModelAndView manageMemberPageFinder(HttpSession session, String student_num_input, String student_name_input,
			String student_status_input, String branch_name_input,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		// pageInfo.setPages((int)Math.ceil(vStudents.size()/8.0));//总页数
		// pageInfo.setTotal(vStudents.size());//总条数
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		return new ModelAndView("stuAdmin/manageMemberPage");

	}

	// 修改信息
	// 修改信息
	@RequestMapping(value = "/updateMember")
	public ModelAndView updateMember(HttpSession session, String student_num_check, String student_name_check,
			String student_gender_check, String student_tel_check, String student_email_check,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);

		if (adminService.update_student_info(student_num_check, student_name_check, student_gender_check,
				student_tel_check, student_email_check)) {
			session.setAttribute("message", "1");
			String student_num_input = (String) session.getAttribute("student_num_input");
			String student_name_input = (String) session.getAttribute("student_name_input");
			String student_status_input = (String) session.getAttribute("student_status_input");
			String branch_name_input = (String) session.getAttribute("branch_name_input");
			ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
					student_status_input, branch_name_input);
			PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("student_num_input", student_num_input);
			session.setAttribute("student_name_input", student_name_input);
			session.setAttribute("student_status_input", student_status_input);
			session.setAttribute("branch_name_input", branch_name_input);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return new ModelAndView("stuAdmin/manageMemberPage");
	}

	// 成员级别管理页面
	@RequestMapping(value = "/updateStatusPage")
	public ModelAndView updateStatusPage(HttpSession session, @RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request, Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>();
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", "");
		session.setAttribute("student_name_input", "");
		session.setAttribute("student_status_input", "");
		session.setAttribute("branch_name_input", "");
		return new ModelAndView("stuAdmin/updateStatusPage");
	}

	/*
	 * // 成员级别管理查找
	 * 
	 * @RequestMapping(value = "/distributionPageFinder") public String
	 * distributionPageFinder(String student_num_input, String student_name_input,
	 * String student_status_input, String branch_name_input,
	 * 
	 * @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession
	 * session) { ArrayList<vStudent> vStudents =
	 * adminService.select_vstudent(student_num_input, student_name_input,
	 * student_status_input, branch_name_input); PageInfo<vStudent> pageInfo = new
	 * PageInfo<vStudent>(vStudents, 10); ArrayList<StudentStatusMap> ssm =
	 * adminService.select_student_status_map(); session.setAttribute("pageInfo",
	 * pageInfo); session.setAttribute("student_num_input", student_num_input);
	 * session.setAttribute("student_name_input", student_name_input);
	 * session.setAttribute("student_status_input", student_status_input);
	 * session.setAttribute("branch_name_input", branch_name_input);
	 * session.setAttribute("ssm", ssm); session.setAttribute("message", ""); return
	 * "stuAdmin/updateStatusPage"; }
	 */
	// 成员级别管理查找
	@RequestMapping(value = "/distributionPageFinder")
	public ModelAndView distributionPageFinder(HttpSession session, String student_num_input, String student_name_input,
			String student_status_input, String branch_name_input,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);

		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		for (vStudent v : vStudents) {
			String student_id = v.getStudent_id();
			String student_num = v.getStudent_num();
			v.setYijiaocailiaoshu(adminService.select_count_uploaded(student_id));
			v.setZongcailiaoshu(adminService.select_count_upload_all(student_id));

			v.setYicanyuhuodongshu(adminService.select_count_signed_activity(student_id));
			v.setHuodongzongshu(adminService.select_count_activity_all(student_id));

			v.setYicanjiajingdashu(adminService.select_test_num_answerd(student_num));
			v.setJingdazongshu(adminService.select_test_num_total(student_num));
		}
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
		map.put("pageInfo", pageInfo);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("actionURL", "distributionPageFinder");
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		return new ModelAndView("stuAdmin/updateStatusPage");
	}

	// 查看活动资料
	@RequestMapping(value = "/checkMaterialPage")
	public String checkMaterialPage(String student_num_ensure, String student_name_ensure, String student_status_ensure,
			String branch_name_ensure, HttpSession session) {
		vStudent vstudent = adminService.select_vStudent_by_student_num(student_num_ensure);
		ArrayList<vStudentMaterial> vStudentMaterials = adminService
				.select_vStudentMaterial_by_student_num_all(vstudent.getStudent_id());
		for (vStudentMaterial v : vStudentMaterials) {
			if (v.getMaterial_url().equals("无")) {
				v.setMaterial_url(null);
			}
		}
		session.setAttribute("student_num_ensure", student_num_ensure);
		session.setAttribute("material_list", vStudentMaterials);
		session.setAttribute("branch_name", branch_name_ensure);
		session.setAttribute("student_num", student_num_ensure);
		session.setAttribute("student_name", student_name_ensure);
		session.setAttribute("student_status", student_status_ensure);
		session.setAttribute("message", "");
		return "stuAdmin/checkMaterialPage";
	}

	// 查看学生活动记录
	@RequestMapping(value = "/stuActivityPage")
	public String stuActivityPage(String student_num_activity, String student_name_activity,
			String branch_name_activity, String student_status_activity, HttpSession session) {
		vStudent vstudent = adminService.select_vStudent_by_student_num(student_num_activity);
		ArrayList<vAttendance> vAttendances = adminService
				.select_vAttendances_by_student_num_all(vstudent.getStudent_id());
		int total_activity_num = adminService.count_total_activity(vstudent.getStudent_id());
		int total_activity_duration = adminService.count_total_activity_duration(vstudent.getStudent_id());
		session.setAttribute("vattendances_list", vAttendances);
		session.setAttribute("total_activity_num", total_activity_num);
		session.setAttribute("total_activity_duration", total_activity_duration);
		session.setAttribute("branch_name", branch_name_activity);
		session.setAttribute("student_num", student_num_activity);
		session.setAttribute("student_name", student_name_activity);
		session.setAttribute("student_status", student_status_activity);
		session.setAttribute("message", "");
		return "stuAdmin/stuActivityPage";
	}

	// 按答题名查询
	@RequestMapping(value = "/resultByTestPageFinder")
	public String resultByTestPageFinder(String test_name_input, String test_date_input, HttpSession session) {
		ArrayList<vTest> vTests = adminService.select_vTest_by_test_name(test_name_input);
		int total_num = 0;
		for (vTest v : vTests) {
			if (v.getCorrect_num() == null) {
				v.setCorrect_num(0);
				total_num = v.getTotal_num();
			}
		}
		int length = vTests.size();

		session.setAttribute("total_num", total_num);
		session.setAttribute("member_list", vTests);
		session.setAttribute("length", length);
		session.setAttribute("test_date", test_name_input);
		session.setAttribute("branch_name", "");
		return "stuAdmin/resultByTestPage2";
	}

	// 查看学生答题记录
	@RequestMapping(value = "/resultPage")
	public String resultPage(String student_num_result, String student_name_result, String branch_name_result,
			String student_status_result, HttpSession session) {
		// vStudent vstudent =
		// adminService.select_vStudent_by_student_num(student_num_result);
		ArrayList<vTest> test_list = adminService.select_vTest(student_num_result);
		for (vTest v : test_list) {
			if (v.getCorrect_num() == null) {
				v.setCorrect_num(0);
			}
		}
		int total_time = adminService.select_answer_total_num(student_num_result);
		int total_correct = adminService.select_answer_num_correct(student_num_result);
		double score_percent;
		if (total_time == 0) {
			score_percent = 0;
		} else {
			score_percent = Math.round(total_correct * 100.0 / total_time);
		}
		session.setAttribute("test_list", test_list);
		session.setAttribute("score_percent", score_percent);
		session.setAttribute("total_time", total_time);
		session.setAttribute("branch_name", branch_name_result);
		session.setAttribute("student_num", student_num_result);
		session.setAttribute("student_name", student_name_result);
		session.setAttribute("student_status", student_status_result);
		session.setAttribute("message", "");
		return "stuAdmin/resultPage";
	}

	// 通过线下资料审核
	@RequestMapping(value = "/checkOfflineMaterial")
	public String checkOfflineMaterial(String filename, String material_type_id, String student_num,
			HttpSession session) {
		System.out.println(filename);
		String student_id = adminService.select_vStudent_by_student_num(student_num).getStudent_id();
		if (adminService.update_student_status_material_offline(material_type_id, student_id)) {
			session.setAttribute("message", "1");
			String student_num_ensure = (String) session.getAttribute("student_num_ensure");
			vStudent vstudent = adminService.select_vStudent_by_student_num(student_num_ensure);
			ArrayList<vStudentMaterial> vStudentMaterials = adminService
					.select_vStudentMaterial_by_student_num_all(vstudent.getStudent_id());
			for (vStudentMaterial v : vStudentMaterials) {
				if (v.getMaterial_url().equals("无")) {
					v.setMaterial_url(null);
				}
			}
			session.setAttribute("material_list", vStudentMaterials);
			session.setAttribute("message", "");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/checkMaterialPage";
	}

	// 提升等级阶段
	@RequestMapping(value = "/updateLevel")
	public ModelAndView addMemberPageFinder(HttpSession session, String student_num_check,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);

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
				PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
				map.put("pageInfo", pageInfo);
				session.setAttribute("pageInfo", pageInfo);
				return new ModelAndView("stuAdmin/updateStatusPage");

			}
			session.setAttribute("message", "3");
		} else {
			session.setAttribute("message", "2");
		}
		return new ModelAndView("stuAdmin/updateStatusPage");
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
		return "stuAdmin/authorityPage";
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
		return "stuAdmin/authorityPage";
	}

	// 党支部增删改查
	@RequestMapping(value = "/branch_insert_page")
	public String branch_insert_page(HttpSession session) {
		session.setAttribute("message", "");
		return "stuAdmin/branch_insert_page";
	}

	@RequestMapping(value = "/branch_insert")
	public String branch_insert(Branch branch, HttpSession session) {
		if (adminService.branch_insert(branch)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/branch_insert_page";
	}

	@RequestMapping(value = "/manageBranchPage")
	public String manageBranchPage(HttpSession session) {
		session.setAttribute("message", "");
		ArrayList<Branch> branch = adminService.select_all_branch();
		session.setAttribute("branch", branch);
		ArrayList<vStudent> list = new ArrayList<vStudent>();
		session.setAttribute("list", list);
		return "stuAdmin/manageBranchPage";
	}

	// 支部成员管理查找
	@RequestMapping(value = "/manageBranchPageFinder")
	public String manageBranchPageFinder(String branch_name_input, HttpSession session) {
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("list", list);
		return "stuAdmin/manageBranchPage";
	}

	@RequestMapping(value = "/branch_delete")
	public String branch_delete(String branch_id, HttpSession session) {
		if (adminService.branch_delete(branch_id)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/manageBranchPage";
	}

	@RequestMapping(value = "/branch_update")
	public String branch_update(Branch branch, HttpSession session) {
		if (adminService.branch_update(branch)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/manageBranchPage";
	}

	// 添加支部成员页面
	@RequestMapping(value = "/addMemberPage")
	public String addMemberPage(HttpSession session) {
		session.setAttribute("message", "");
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>();
		session.setAttribute("pageInfo", pageInfo);
		return "stuAdmin/addMemberPage";
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
		session.setAttribute("message", "");
		return "stuAdmin/addMemberPage";
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
		return "stuAdmin/addMemberPage";
	}

	// 成员管理页面
	@RequestMapping(value = "/manageMemberPage")
	public ModelAndView manageMemberPage(HttpSession session, @RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request, Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		session.setAttribute("ssm", ssm);
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>();
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("message", "");
		session.setAttribute("student_num_input", "");
		session.setAttribute("student_name_input", "");
		session.setAttribute("student_status_input", "");
		session.setAttribute("branch_name_input", "");
		return new ModelAndView("stuAdmin/manageMemberPage");
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
				return "stuAdmin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "stuAdmin/manageBranchPage";
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
				return "stuAdmin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "stuAdmin/manageBranchPage";
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
				return "stuAdmin/manageBranchPage";
			}
		}
		String branch_name_input = (String) session.getAttribute("branch_name_input");
		ArrayList<vStudent> list = adminService.select_vstudent_by_branch_name(branch_name_input);
		session.setAttribute("list", list);
		return "stuAdmin/manageBranchPage";
	}

	// 活动的创建与发布页面
	@RequestMapping(value = "/addActivityPage")
	public String addActivityPage(HttpSession session) {
		ArrayList<Branch> branch = adminService.select_all_branch();
		branch.remove(0);
		session.setAttribute("branch", branch);
		session.setAttribute("message", "");
		return "stuAdmin/addActivityPage";
	}

	// 发布活动
	@RequestMapping(value = "/insertActivity")
	public String insertActivity(HttpSession session, HttpServletRequest request, String activity_duration,
			String activity_name, String branch_name, String activity_date, String activity_location)
			throws ServletException, IOException {
		// 设置请求和响应的编码统一为UTF-8
		request.setCharacterEncoding("UTF-8");
		// 拿到编辑器的内容
		String activity_item = request.getParameter("editorValue");
		ArrayList<Branch> branch = (ArrayList<Branch>) session.getAttribute("branch");
		String branch_id = null;
		for (Branch item : branch) {
			if (item.getBranch_name().equals(branch_name)) {
				branch_id = item.getBranch_id();
				break;
			}
		}
		int activity_id = adminService.insert_activity(activity_name, branch_id, activity_date, activity_location,
				activity_item, activity_duration);
		if (activity_id != -1) {
			if (adminService.insert_attendance_for_all_student(activity_id, branch_id)) {
				session.setAttribute("message", "1");
			} else {
				session.setAttribute("message", "2");
				return "stuAdmin/addActivityPage";
			}
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/addActivityPage";
	}

	// 查看活动详情页面
	@RequestMapping(value = "/activityItemPage")
	public String activityItemPage(HttpSession session, String activity_id_check) {
		vActivity activity = adminService.select_activity_by_id(activity_id_check);
		String branch_name = null;

		ArrayList<Branch> branch = adminService.select_all_branch();
		for (Branch b : branch) {
			if (b.getBranch_id().equals(activity.getBranch_id())) {
				branch_name = b.getBranch_name();
				break;
			}
		}

		session.setAttribute("activity_item", activity.getActivity_item());
		session.setAttribute("activity_name", activity.getActivity_name());
		session.setAttribute("activity_date", activity.getActivity_date());
		session.setAttribute("activity_location", activity.getActivity_location());
		session.setAttribute("activity_status", activity.getMeans());
		session.setAttribute("activity_duration", activity.getActivity_duration());
		session.setAttribute("branch_name", branch_name);

		session.setAttribute("message", "");
		return "stuAdmin/activityItemPage";
	}

	// 组织生活签到管理页面
	@RequestMapping(value = "/manageSignInPage")
	public ModelAndView manageSignInPage(HttpSession session, @RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request, Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		session.setAttribute("message", "");
		ArrayList<ActivityStatusMap> asm = adminService.select_activity_status_map();
		session.setAttribute("asm", asm);
		ArrayList<vActivity> activities = new ArrayList<vActivity>();
		for (vActivity v : activities) {
			String activity_id = v.getActivity_id();
			v.setHdzrs(adminService.select_count_total_student_num(activity_id));
			v.setYqdrs(adminService.select_count_signed_in_student_num(activity_id));
		}
		PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 8);
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("activity_name_input", "");
		session.setAttribute("activity_status_input", "");
		session.setAttribute("activity_date_input", "");
		session.setAttribute("activity_location_input", "");
		return new ModelAndView("stuAdmin/manageSignInPage");
	}

	// 组织生活签到查询结果
	@RequestMapping(value = "/manageSignInPageFinder")
	public ModelAndView manageSignInPageFinder(HttpSession session, String activity_name_input,
			String activity_status_input, String activity_date_input, String activity_location_input,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		String my_branch_id = (String) session.getAttribute("my_branch_id");
		PageHelper.startPage(currentPage, 8);
		ArrayList<vActivity> activities = adminService.select_vactivity_by_branch_id(activity_name_input,
				activity_status_input, activity_date_input, activity_location_input, my_branch_id);
		for (vActivity v : activities) {
			String activity_id = v.getActivity_id();
			v.setHdzrs(adminService.select_count_total_student_num(activity_id));
			v.setYqdrs(adminService.select_count_signed_in_student_num(activity_id));
		}
		PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 8);
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("activity_name_input", activity_name_input);
		session.setAttribute("activity_status_input", activity_status_input);
		session.setAttribute("activity_date_input", activity_date_input);
		session.setAttribute("activity_location_input", activity_location_input);
		session.setAttribute("message", "");
		return new ModelAndView("stuAdmin/manageSignInPage");
	}

	/*
	 * // 组织生活签到管理页面
	 * 
	 * @RequestMapping(value = "/manageSignInPage") public String
	 * manageSignInPage(HttpSession session) { session.setAttribute("message", "");
	 * ArrayList<ActivityStatusMap> asm = adminService.select_activity_status_map();
	 * session.setAttribute("asm", asm); ArrayList<vActivity> activities = new
	 * ArrayList<vActivity>(); PageInfo<vActivity> pageInfo = new
	 * PageInfo<vActivity>(activities, 10); session.setAttribute("pageInfo",
	 * pageInfo); session.setAttribute("activity_name_input", "");
	 * session.setAttribute("activity_status_input", "");
	 * session.setAttribute("activity_date_input", "");
	 * session.setAttribute("activity_location_input", ""); return
	 * "stuAdmin/manageSignInPage"; }
	 * 
	 * // 组织生活签到查询结果
	 * 
	 * @RequestMapping(value = "/manageSignInPageFinder") public String
	 * manageSignInPageFinder(String activity_name_input, String
	 * activity_status_input, String activity_date_input, String
	 * activity_location_input,
	 * 
	 * @RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession
	 * session) { String my_branch_id=(String)session.getAttribute("my_branch_id");
	 * ArrayList<vActivity> activities =
	 * adminService.select_vactivity_by_branch_id(activity_name_input,
	 * activity_status_input, activity_date_input,
	 * activity_location_input,my_branch_id);
	 * 
	 * PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 10);
	 * session.setAttribute("pageInfo", pageInfo);
	 * session.setAttribute("activity_name_input", activity_name_input);
	 * session.setAttribute("activity_status_input", activity_status_input);
	 * session.setAttribute("activity_date_input", activity_date_input);
	 * session.setAttribute("activity_location_input", activity_location_input);
	 * session.setAttribute("message", ""); return "stuAdmin/manageSignInPage"; }
	 */
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
		return "stuAdmin/attendanceCheckPage";
	}

	// 修改活动状态
	@RequestMapping(value = "/updateActivityStatus")
	public ModelAndView updateActivityStatus(HttpSession session, String activity_id_update, String new_activity_status,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
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
			PageInfo<vActivity> pageInfo = new PageInfo<vActivity>(activities, 8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return new ModelAndView("stuAdmin/manageSignInPage");
	}

	// 发布学习内容页面
	@RequestMapping(value = "/insertStudyPage")
	public String insertStudyPage(HttpSession session) {
		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		session.setAttribute("study_status_map", study_status_map);
		session.setAttribute("message", "");
		return "stuAdmin/insertStudyPage";
	}

	// 发布学习内容
	@RequestMapping(value = "/insertStudy")
	public String insertStudy(HttpSession session, HttpServletRequest request, String study_title, String study_status)
			throws ServletException, IOException {
		// 设置请求和响应的编码统一为UTF-8
		request.setCharacterEncoding("UTF-8");
		// 拿到编辑器的内容
		String study_content = request.getParameter("editorValue");
		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		for (StudyStatusMap item : study_status_map) {
			if (item.getMeans().equals(study_status)) {
				study_status = item.getStudy_status();
				break;
			}
		}

		if (adminService.insert_study(study_title, study_status, study_content)) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/insertStudyPage";
	}

	// 管理学习内容页面
	@RequestMapping(value = "/manageStudyPage")
	public ModelAndView manageStudyPage(HttpSession session, @RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request, Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		ArrayList<vStudy> study_list = new ArrayList<vStudy>();
		PageInfo<vStudy> pageInfo = new PageInfo<vStudy>(study_list, 8);
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("study_status_map", study_status_map);
		session.setAttribute("study_title_input", "");
		session.setAttribute("message", "");
		session.setAttribute("study_status_input", "");
		return new ModelAndView("stuAdmin/manageStudyPage");
	}

	// 删除学习内容
	@RequestMapping(value = "/deleteStudy")
	public ModelAndView deleteStudy(HttpSession session, String study_id_del,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		if (adminService.delete_study(study_id_del)) {
			String study_title_input = (String) session.getAttribute("study_title_input");
			String study_status_input = (String) session.getAttribute("study_status_input");

			ArrayList<vStudy> study_list = adminService.select_study_list(study_title_input, study_status_input);
			PageInfo<vStudy> pageInfo = new PageInfo<vStudy>(study_list, 8);
			map.put("pageInfo", pageInfo);
			session.setAttribute("pageInfo", pageInfo);
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");

		}
		return new ModelAndView("stuAdmin/manageStudyPage");
	}

	// 管理学习内容查询结果
	@RequestMapping(value = "/manageStudyPageFinder")
	public ModelAndView manageStudyPageFinder(HttpSession session, String study_title_input, String study_status_input,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);

		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		for (StudyStatusMap item : study_status_map) {
			if (item.getMeans().equals(study_status_input)) {
				study_status_input = item.getStudy_status();
				break;
			}
		}
		ArrayList<vStudy> study_list = adminService.select_study_list(study_title_input, study_status_input);
		PageInfo<vStudy> pageInfo = new PageInfo<vStudy>(study_list, 8);
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("study_title_input", study_title_input);
		session.setAttribute("study_status_input", study_status_input);
		session.setAttribute("message", "");
		return new ModelAndView("stuAdmin/manageStudyPage");
	}

	// 推文详情页面
	@RequestMapping(value = "/checkStudyPage")
	public String checkStudyPage(HttpSession session, String study_id_check) {
		vStudy study = adminService.select_study_by_id(study_id_check);
		session.setAttribute("study_title", study.getStudy_title());
		session.setAttribute("study_date", study.getStudy_date());
		session.setAttribute("study_content", study.getStudy_content());
		session.setAttribute("study_status", study.getMeans());
		session.setAttribute("message", "");
		return "stuAdmin/checkStudyPage";
	}

	// 编辑推文页面
	@RequestMapping(value = "/updateStudyPage")
	public String update(HttpSession session, String study_id_update) {
		vStudy study = adminService.select_study_by_id(study_id_update);
		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		session.setAttribute("study_status_map", study_status_map);
		session.setAttribute("study_title", study.getStudy_title());
		session.setAttribute("study_date", study.getStudy_date());
		session.setAttribute("study_content", study.getStudy_content());
		session.setAttribute("means", study.getMeans());
		session.setAttribute("study_status", study.getStudy_status());
		session.setAttribute("study_id_update", study_id_update);
		session.setAttribute("message", "");
		return "stuAdmin/updateStudyPage";
	}

	// 重新发布学习内容
	@RequestMapping(value = "/updateStudy")
	public String updateStudy(HttpSession session, HttpServletRequest request, String study_title, String study_status)
			throws ServletException, IOException {
		// 设置请求和响应的编码统一为UTF-8
		request.setCharacterEncoding("UTF-8");
		// 拿到编辑器的内容
		String study_content = request.getParameter("editorValue");
		String study_id = (String) session.getAttribute("study_id_update");
		String study_status_num = null;
		ArrayList<StudyStatusMap> study_status_map = adminService.select_study_status_map();
		for (StudyStatusMap item : study_status_map) {
			if (item.getMeans().equals(study_status)) {
				study_status_num = item.getStudy_status();
				break;
			}
		}

		if (adminService.update_study(study_id, study_title, study_status_num, study_content)) {
			session.setAttribute("message", "1");
			session.setAttribute("study_status_map", study_status_map);
			session.setAttribute("study_title", study_title);
			session.setAttribute("study_content", study_content);
			session.setAttribute("study_status", study_status_num);
			session.setAttribute("means", study_status);
			session.setAttribute("study_id_update", study_id);
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/updateStudyPage";
	}

	// 知识竞答编辑
	@RequestMapping(value = "/editCompetitionPage")
	public String editCompetitionPage(@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		session.setAttribute("message", "");
		ArrayList<Question> questions = adminService.select_all_question();
		for (Question q : questions) {
			String ans = q.getQuestion_answer();
			q.setQuestion_answer(Utils.option_transform(ans));
		}
		PageInfo<Question> pageInfo = new PageInfo<Question>(questions, 10);
		session.setAttribute("pageInfo", pageInfo);
		return "stuAdmin/editCompetitionPage";
	}

	// 添加知识竞答题目
	@RequestMapping(value = "/insertQuestion")
	public String insertQuestion(String qustion_problem_new, String option_A_new, String option_B_new,
			String option_C_new, String option_D_new, String qustion_answer_new, HttpSession session) {
		qustion_answer_new = Utils.option_transform(qustion_answer_new);
		if (adminService.insert_question(qustion_problem_new, option_A_new, option_B_new, option_C_new, option_D_new,
				qustion_answer_new)) {
			session.setAttribute("message", "1");
			ArrayList<Question> questions = adminService.select_all_question();
			for (Question q : questions) {
				String ans = q.getQuestion_answer();
				q.setQuestion_answer(Utils.option_transform(ans));
			}
			PageInfo<Question> pageInfo = new PageInfo<Question>(questions, 10);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "2");
		}
		return "stuAdmin/editCompetitionPage";
	}

	// 修改知识竞答题目
	@RequestMapping(value = "/updateQuestion")
	public String updateQuestion(String question_id_check, String question_problem_check,
			String question_option_A_check, String question_option_B_check, String question_option_C_check,
			String question_option_D_check, String question_answer_check, HttpSession session) {
		question_answer_check = Utils.option_transform(question_answer_check);
		if (adminService.update_question(question_id_check, question_problem_check, question_option_A_check,
				question_option_B_check, question_option_C_check, question_option_D_check, question_answer_check)) {
			session.setAttribute("message", "5");
			ArrayList<Question> questions = adminService.select_all_question();
			for (Question q : questions) {
				String ans = q.getQuestion_answer();
				q.setQuestion_answer(Utils.option_transform(ans));
			}
			PageInfo<Question> pageInfo = new PageInfo<Question>(questions, 10);
			session.setAttribute("pageInfo", pageInfo);
		} else {
			session.setAttribute("message", "6");
		}
		return "stuAdmin/editCompetitionPage";
	}

	// 删除知识竞答题目
	@RequestMapping(value = "/deleteQuestion")
	public String deleteQuestion(String question_id_delete, HttpSession session) {
		List<String> question_ids = Utils.splitByComma(question_id_delete);
		for (String question_id : question_ids) {
			if (adminService.delete_question(question_id)) {
				session.setAttribute("message", "3");
			} else {
				session.setAttribute("message", "4");
				return "stuAdmin/editCompetitionPage";
			}
		}
		ArrayList<Question> questions = adminService.select_all_question();
		for (Question q : questions) {
			String ans = q.getQuestion_answer();
			q.setQuestion_answer(Utils.option_transform(ans));
		}
		PageInfo<Question> pageInfo = new PageInfo<Question>(questions, 10);
		session.setAttribute("pageInfo", pageInfo);
		return "stuAdmin/editCompetitionPage";
	}

	// 手动选择组卷
	@RequestMapping(value = "/createTest")
	public String createTest(String question_id_select, String test_name, String test_date_start, String test_date_end,
			HttpSession session) {
		String test_id = adminService.insert_test(test_name, test_date_start, test_date_end);
		List<String> question_ids = Utils.splitByComma(question_id_select);
		for (String question_id : question_ids) {
			if (question_id.equals("")) {
				continue;
			}
			if (adminService.produceExam(test_id, question_id)) {
				continue;
			} else {
				session.setAttribute("message", "8");
				return "stuAdmin/editCompetitionPage";
			}
		}
		session.setAttribute("message", "7");
		ArrayList<Question> questions = adminService.select_all_question();
		for (Question q : questions) {
			String ans = q.getQuestion_answer();
			q.setQuestion_answer(Utils.option_transform(ans));
		}
		PageInfo<Question> pageInfo = new PageInfo<Question>(questions, 10);
		session.setAttribute("pageInfo", pageInfo);
		return "stuAdmin/editCompetitionPage";
	}

	// 知识竞答结果页面
	@RequestMapping(value = "/resultByTestPage")
	public String resultByTestPage(HttpSession session) {
		ArrayList<Test> Tests = adminService.select_Test_all();
		for (Test t : Tests) {
			t.setYdrs(adminService.select_count_answered(t.getTest_id()));
		}
		session.setAttribute("test_list", Tests);
		return "stuAdmin/resultByTestPage";
	}

	// 按学生查询知识竞答结果
	@RequestMapping(value = "/resultByStudentPage")
	public ModelAndView resultByStudentPage(HttpSession session, @RequestParam(defaultValue = "1") Integer currentPage,
			HttpServletRequest request, Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);
		session.setAttribute("list", "");
		session.setAttribute("score_percent", "");
		session.setAttribute("total_time", "");
		session.setAttribute("student_name", "");
		session.setAttribute("student_num", "");
		session.setAttribute("branch_name", "");
		session.setAttribute("student_status", "");
		session.setAttribute("message", "");
		session.setAttribute("student_num_input", "");
		session.setAttribute("student_name_input", "");
		session.setAttribute("student_status_input", "");
		session.setAttribute("branch_name_input", "");
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		ArrayList<vStudent> vStudents = new ArrayList<vStudent>();
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
		session.setAttribute("ssm", ssm);
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		return new ModelAndView("stuAdmin/resultByStudentPage");
	}

	// 知识竞答结果按学生查询
	@RequestMapping(value = "/resultByStudentPageFinder2")
	public String resultByStudentPageFinder(String student_num_check, HttpSession session) {

		ArrayList<vTest> vTests = adminService.select_vTest(student_num_check);
		for (vTest v : vTests) {
			v.setCorrect_num(adminService.select_correct_num_by_student_per_test(student_num_check, v.getTest_id()));
		}

		int correct_num = 0, total_num = 0;
		for (vTest v : vTests) {
			correct_num += v.getCorrect_num();
			total_num += v.getTotal_num();
		}
		double score_percent;
		if (total_num == 0) {
			score_percent = 0;
		} else {
			score_percent = Math.round(correct_num * 100.0 / total_num);
		}
		vStudent vstudent = adminService.select_vStudent_by_student_num(student_num_check);
		session.setAttribute("list", vTests);
		session.setAttribute("score_percent", score_percent);
		session.setAttribute("total_time", vTests.size());
		session.setAttribute("student_name", vstudent.getStudent_name());
		session.setAttribute("student_num", student_num_check);
		session.setAttribute("branch_name", vstudent.getBranch_name());
		session.setAttribute("student_status", vstudent.getStudent_status());
		session.setAttribute("message", "");
		return "stuAdmin/resultByStudentPage2";
	}

	// 模糊查询
	@RequestMapping(value = "/Finder")

	public ModelAndView Finder(HttpSession session, String student_num_input, String student_name_input,
			String student_status_input, String branch_name_input,
			@RequestParam(defaultValue = "1") Integer currentPage, HttpServletRequest request,
			Map<String, Object> map) {
		PageHelper.startPage(currentPage, 8);

		ArrayList<vStudent> vStudents = adminService.select_vstudent(student_num_input, student_name_input,
				student_status_input, branch_name_input);
		for (vStudent v : vStudents) {
			String student_num = v.getStudent_num();
			int total_test_time_all = adminService.select_test_num_total(student_num);
			int total_test_time = adminService.select_test_num_answerd(student_num);
			int total_answer_num = adminService.select_answer_total_num(student_num);
			int total_correct_answer = adminService.select_answer_num_correct(student_num);
			if (total_test_time == 0) {
				v.setDatizhengquelv(0);
			} else {
				v.setDatizhengquelv(Math.round(total_correct_answer * 100.0 / total_answer_num));
			}
			if (total_test_time_all == 0) {
				v.setDaticanyulv(0);
			} else {
				v.setDaticanyulv(Math.round(total_test_time * 100.0 / total_test_time_all));
			}
		}
		PageInfo<vStudent> pageInfo = new PageInfo<vStudent>(vStudents, 8);
		ArrayList<StudentStatusMap> ssm = adminService.select_student_status_map();
		map.put("pageInfo", pageInfo);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("student_num_input", student_num_input);
		session.setAttribute("student_name_input", student_name_input);
		session.setAttribute("student_status_input", student_status_input);
		session.setAttribute("branch_name_input", branch_name_input);
		session.setAttribute("ssm", ssm);
		session.setAttribute("message", "");
		return new ModelAndView("stuAdmin/resultByStudentPage");

	}
}
