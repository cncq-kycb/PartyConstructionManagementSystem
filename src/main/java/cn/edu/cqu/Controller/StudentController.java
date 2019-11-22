package cn.edu.cqu.Controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.MaterialTypeMap;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.User;
import cn.edu.cqu.Model.vActivity;
import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vQuestion;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Model.vStudentMaterial;
import cn.edu.cqu.Model.vStudy;
import cn.edu.cqu.Service.AdminService;
import cn.edu.cqu.Service.StudentService;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private AdminService adminService;

	// 主页
	@RequestMapping(value = "/main_page_2")
	public String mainPage(HttpSession session) {
		session.setAttribute("message", "");
		return "main_page_2";
	}

	// 学习中心页面
	@RequestMapping(value = "/study_center_page")
	public String study_center_page(HttpSession session) {
		return "stu/study_center_page";
	}

	// read_study页面跳转
	@RequestMapping(value = "/choose_page")
	public String choosePage(HttpSession session) {
		String study_status = (String) session.getAttribute("study_status");
		if ("1".equals(study_status)) {
			return "stu/NCCPC_page";
		} else if ("2".equals(study_status)) {
			return "stu/material_page";
		} else if ("3".equals(study_status)) {
			return "stu/member_read_page";
		}
		return "stu/study_center_page";
	}

	// 组织生活页面
	@RequestMapping(value = "/party_life_page")
	public String party_life_page(HttpSession session) {
		return "stu/party_life_page";
	}

	// 推文学习页面
	@RequestMapping(value = "/readStudy")
	public String read_study_page(HttpSession session, String study_id) {
		vStudy study = adminService.select_study_by_id(study_id);
		session.setAttribute("study_title", study.getStudy_title());
		session.setAttribute("study_date", study.getStudy_date());
		session.setAttribute("study_content", study.getStudy_content());
		session.setAttribute("means", study.getMeans());
		session.setAttribute("study_status", study.getStudy_status());
		return "stu/read_study_page";
	}

	// 十九大讲话
	@RequestMapping(value = "/NCCPC_page")
	public String NCCPC_page(HttpSession session) {

		ArrayList<vStudy> study_list = studentService.select_study_list("", "1");
		String temp = "";
		for (int i = 0; i < study_list.size(); i++) {
			temp += "<div class=\"row\"><div ><div class=\"content-text\"><a href=\"/mis/stu/readStudy?study_id="
					+ study_list.get(i).getStudy_id() + "\"><h5>&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_title() + "</h5><p class=\"date\">&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_date()
					+ "<span><i class=\"fas fa-ellipsis-v\"></i>十九大讲话</span></p><div class=\"link-more\">&ensp;&ensp;&ensp;&ensp;Read More <i class=\"fas fa-long-arrow-alt-right\"></i></a></div></div></div></div>";
		}
		session.setAttribute("study_list", study_list);
		session.setAttribute("content", temp);

		return "stu/NCCPC_page";
	}

	// 历史学习资料
	@RequestMapping(value = "/material_page")
	public String material_page(HttpSession session) {
		ArrayList<vStudy> study_list = studentService.select_study_list("", "2");
		String temp = "";
		for (int i = 0; i < study_list.size(); i++) {
			temp += "<div class=\"row\"><div ><div class=\"content-text\"><a href=\"/mis/stu/readStudy?study_id="
					+ study_list.get(i).getStudy_id() + "\"><h5>&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_title() + "</h5><p class=\"date\">&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_date()
					+ "<span><i class=\"fas fa-ellipsis-v\"></i>十九大讲话</span></p><div class=\"link-more\">&ensp;&ensp;&ensp;&ensp;Read More <i class=\"fas fa-long-arrow-alt-right\"></i></a></div></div></div></div>";
		}
		session.setAttribute("study_list", study_list);
		session.setAttribute("content", temp);
		return "stu/material_page";
	}

	// 党员必读
	@RequestMapping(value = "/member_read_page")
	public String member_read_page(HttpSession session) {
		ArrayList<vStudy> study_list = studentService.select_study_list("", "3");
		String temp = "";
		for (int i = 0; i < study_list.size(); i++) {
			temp += "<div class=\"row\"><div ><div class=\"content-text\"><a href=\"/mis/stu/readStudy?study_id="
					+ study_list.get(i).getStudy_id() + "\"><h5>&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_title() + "</h5><p class=\"date\">&ensp;&ensp;&ensp;&ensp;"
					+ study_list.get(i).getStudy_date()
					+ "<span><i class=\"fas fa-ellipsis-v\"></i>十九大讲话</span></p><div class=\"link-more\">&ensp;&ensp;&ensp;&ensp;Read More <i class=\"fas fa-long-arrow-alt-right\"></i></a></div></div></div></div>";
		}
		session.setAttribute("study_list", study_list);
		session.setAttribute("content", temp);
		return "stu/member_read_page";
	}

	// 十九大学习内容查询结果
	@RequestMapping(value = "/NCCPC_pageFinder")
	public String NCCPC_pageFinder(String study_title_input, @RequestParam(value = "pn", defaultValue = "1") Integer pn,
			HttpSession session) {
		studentService.jump_study_page(study_title_input, session, "十九大讲话");
		return "stu/NCCPC_page";
	}

	// 历史学习资料查询结果
	@RequestMapping(value = "/material_pageFinder")
	public String material_pageFinder(String study_title_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		studentService.jump_study_page(study_title_input, session, "历史学习资料");
		return "stu/material_page";
	}

	// 党员必读查询结果
	@RequestMapping(value = "/member_read_pageFinder")
	public String member_read_pageFinder(String study_title_input,
			@RequestParam(value = "pn", defaultValue = "1") Integer pn, HttpSession session) {
		studentService.jump_study_page(study_title_input, session, "党员必读");
		return "stu/member_read_page";
	}

	// 跳转学习内容界面
	@RequestMapping(value = "/study")
	public String studyContentPage(String study_id, HttpSession session) {
		vStudy study = studentService.select_study_by_study_id(study_id);
		session.setAttribute("study", study);
		return "stu/study_page";
	}

	// 每日竞答
	@RequestMapping(value = "/test_page")
	public String test_page(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		ArrayList<vQuestion> question_list = studentService.select_exam(student_id);
		if (question_list == null) {
			session.setAttribute("message", "1");
			return "stu/main_page_2_1";
		}
		String temp = "";
		for (int i = 0; i < question_list.size(); i++) {
			int j = i + 1;
			temp += "<li id=\"qu_0_" + i + "]\"><div class=\"test_content_nr_tt\"><i>" + j
					+ "</i><span>(10分)</span><font>" + question_list.get(i).getQuestion_problem()
					+ "（  ）</font></div><div class=\"test_content_nr_main\"><ul><li class=\"option\"><input type=\"radio\" value=\"A\" class=\"radioOrCheck\" name=\"answer"
					+ j + "\"id=\"0_answer_" + j + "_option_1\" /><label for=\"0_answer_" + j
					+ "_option_1\"><p class=\"ue\" style=\"display: inline;\">"
					+ question_list.get(i).getQuestion_option_a()
					+ "</p></label></li><li class=\"option\"><input type=\"radio\" class=\"radioOrCheck\" value=\"B\" name=\"answer"
					+ j + "\"id=\"0_answer_" + j + "_option_2\" /><label for=\"0_answer_" + j
					+ "_option_2\"><p class=\"ue\" style=\"display: inline;\">"
					+ question_list.get(i).getQuestion_option_b()
					+ "</p></label></li><li class=\"option\"><input type=\"radio\" class=\"radioOrCheck\" value=\"C\" name=\"answer"
					+ j + "\"id=\"0_answer_" + j + "_option_3\" /><label for=\"0_answer_" + j
					+ "_option_3\"><p class=\"ue\" style=\"display: inline;\"> "
					+ question_list.get(i).getQuestion_option_c()
					+ "</p></label></li><li class=\"option\"><input type=\"radio\" class=\"radioOrCheck\"  value=\"D\" name=\"answer"
					+ j + "\"id=\"0_answer_" + j + "_option_4\" /><label for=\"0_answer_" + j
					+ "_option_4\"><p class=\"ue\" style=\"display: inline;\"> "
					+ question_list.get(i).getQuestion_option_d() + "</p></label></li></ul></div></li>";
		}
		session.setAttribute("test_name", question_list.get(0).getTest_name());
		session.setAttribute("test_start_time", question_list.get(0).getTest_date_start());
		session.setAttribute("test_length", question_list.size());
		session.setAttribute("test_total_score", 10 * question_list.size());
		session.setAttribute("question_list", question_list);
		session.setAttribute("content", temp);
		return "stu/test_page";
	}

	// 每日竞答提交答案
	@RequestMapping(value = "/postAnswer")
	public String postAnswer(String answer_list, HttpSession session) {
		List<String> answer = Utils.splitByComma(answer_list);
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		ArrayList<vQuestion> question_list = studentService.select_exam(student_id);
		for (int i = 0; i < answer.size(); i++) {
			String answer_option = answer.get(i);
			String question_id = question_list.get(i).getQuestion_id();
			String test_id = question_list.get(i).getTest_id();
			if (answer_option.equals("0")) {
				answer_option = null;
			}
			if (studentService.answer_question(test_id, question_id, student_id, answer_option)) {
				session.setAttribute("message", "2");
			} else {
				session.setAttribute("message", "2");
				return "stu/test_page";
			}
		}
		return "main_page_2";
	}

	// 活动签到页面
	@RequestMapping(value = "/attendance_page")
	public String attendance_page(HttpSession session, String activity_id) {
		vActivity activity = adminService.select_activity_by_id(activity_id);
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		String branch_name = studentService.select_branch_name_by_student_id(student_id);
		session.setAttribute("message", "");
		session.setAttribute("activity_name", activity.getActivity_name());
		session.setAttribute("activity_item", activity.getActivity_item());
		session.setAttribute("activity_location", activity.getActivity_location());
		session.setAttribute("activity_duration", activity.getActivity_duration());
		session.setAttribute("activity_date", activity.getActivity_date());
		session.setAttribute("activity_date", activity.getActivity_date());
		session.setAttribute("branch_name", branch_name);
		session.setAttribute("activity_id", activity_id);

		return "stu/attendance_page";
	}

	// 提交照片
	@RequestMapping(value = "/upload_file")
	public String upload_file(@RequestParam("file") MultipartFile file, HttpSession session,
			HttpServletRequest request) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		try {
			String activity_id = (String) session.getAttribute("activity_id");
			String newFileName = student_id + "_" + activity_id + ".jpg";
			String filePath = request.getSession().getServletContext().getRealPath("") + "\\upload_attendance_pic\\";
			File dir = new File(filePath);
			if (!dir.exists()) {
				dir.mkdir();
			}
			filePath = filePath + newFileName;
			file.transferTo(new File(filePath));
			if (studentService.add_pic_for_attendance(student_id, activity_id, filePath)) {
				session.setAttribute("message", "1");
			} else {
				session.setAttribute("message", "2");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "2");
		}
		ArrayList<vAttendance> vattendances = studentService.select_attendance_now_by_student_id(student_id);
		String temp = "";
		String start = "<div class=\"row\">";
		String end = "</div>";

		for (int i = 0; i < vattendances.size(); i++) {

			String delta = "<div class=\"col s6\"><div class=\"content\"><div class=\"wrap-head\"><h4>"
					+ vattendances.get(i).getActivity_date()
					+ "</h4></div><div class=\"wrap-price bg-blue\"><h4>进行中</h4></div><div class=\"wrap-list\"><ul><li>"
					+ vattendances.get(i).getActivity_name() + "</li><li>" + vattendances.get(i).getActivity_duration()
					+ "H</li></ul></div><a href=\"/mis/stu/attendance_page?activity_id="
					+ vattendances.get(i).getActivity_id()
					+ "\"><button class=\"button\">查看详情</button></a></div></div>";
			if (i % 2 == 0) {
				if (i != 0) {
					temp += end;
				}
				temp += start;
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			} else {
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			}
		}
		session.setAttribute("content", temp);
		return "stu/view_activity_page";
	}

	// 提交缺席
	@RequestMapping(value = "/absent_attendance")
	public String absent_attendance(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		String activity_id = (String) session.getAttribute("activity_id");
		if (studentService.absent_for_attendance(student_id, activity_id)) {
			session.setAttribute("message", "3");
		} else {
			session.setAttribute("message", "4");
		}
		if (!studentService.is_member(student_id)) {
			return "stu/no_permission";
		}
		session.setAttribute("message", "");
		ArrayList<vAttendance> vattendances = studentService.select_attendance_now_by_student_id(student_id);
		String temp = "";
		String start = "<div class=\"row\">";
		String end = "</div>";

		for (int i = 0; i < vattendances.size(); i++) {

			String delta = "<div class=\"col s6\"><div class=\"content\"><div class=\"wrap-head\"><h4>"
					+ vattendances.get(i).getActivity_date()
					+ "</h4></div><div class=\"wrap-price bg-blue\"><h4>进行中</h4></div><div class=\"wrap-list\"><ul><li>"
					+ vattendances.get(i).getActivity_name() + "</li><li>" + vattendances.get(i).getActivity_duration()
					+ "H</li></ul></div><a href=\"/mis/stu/attendance_page?activity_id="
					+ vattendances.get(i).getActivity_id()
					+ "\"><button class=\"button\">查看详情</button></a></div></div>";
			if (i % 2 == 0) {
				if (i != 0) {
					temp += end;
				}
				temp += start;
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			} else {
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			}
		}
		session.setAttribute("content", temp);
		return "stu/view_activity_page";
	}

	// 个人组织生活记录页面
	@RequestMapping(value = "/life_record_page")
	public String life_record_page(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (!studentService.is_member(student_id)) {
			session.setAttribute("message", "2");
			return "stu/info_page";
		}
		String total_time = studentService.attendance_total_time(student_id);
		String total_duration = studentService.attendance_total_duration(student_id);
		String branch_name = studentService.select_branch_name_by_student_id(student_id);
		ArrayList<vAttendance> vattendances = studentService.select_attendance_by_student_id(student_id);
		String temp = "";
		String start = "<div class=\"row\">";
		String end = "</div>";

		for (int i = 0; i < vattendances.size(); i++) {
			String color = "";
			if ("1".equals(vattendances.get(i).getAttendance_status_id())
					|| "2".equals(vattendances.get(i).getAttendance_status_id())
					|| "4".equals(vattendances.get(i).getAttendance_status_id())) {
				color += "purple";
			} else if ("3".equals(vattendances.get(i).getAttendance_status_id())) {
				color += "blue";
			} else if ("5".equals(vattendances.get(i).getAttendance_status_id())) {
				color += "red";
			} else if ("6".equals(vattendances.get(i).getAttendance_status_id())) {
				color += "orange";
			}
			String delta = "<div class=\"col s6\"><div class=\"content\"><div class=\"wrap-head\"><h4>"
					+ vattendances.get(i).getActivity_date() + "</h4></div><div class=\"wrap-price bg-" + color
					+ "\"><h4>" + vattendances.get(i).getAttendance_status()
					+ "</h4></div><div class=\"wrap-list\"><ul><li>" + vattendances.get(i).getActivity_name()
					+ "</li><li>" + vattendances.get(i).getActivity_duration()
					+ "H</li></ul></div><a href=\"/mis/stu/check_activity_page?activity_id="
					+ vattendances.get(i).getActivity_id()
					+ "\"><button class=\"button\">查看活动</button></a></div></div>";
			if (i % 2 == 0) {
				if (i != 0) {
					temp += end;
				}
				temp += start;
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			} else {
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			}
		}
		System.out.println(temp);
		session.setAttribute("content", temp);
		session.setAttribute("total_time", total_time);
		session.setAttribute("total_duration", total_duration);
		session.setAttribute("branch_name", branch_name);
		return "stu/life_record_page";
	}

	// 活动签到主页面
	@RequestMapping(value = "/view_activity_page")
	public String view_activity_page(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (!studentService.is_member(student_id)) {
			return "stu/no_permission";
		}
		session.setAttribute("message", "");
		ArrayList<vAttendance> vattendances = studentService.select_attendance_now_by_student_id(student_id);
		String branch_name = studentService.select_branch_name_by_student_id(student_id);
		String temp = "";
		String start = "<div class=\"row\">";
		String end = "</div>";

		for (int i = 0; i < vattendances.size(); i++) {

			String delta = "<div class=\"col s6\"><div class=\"content\"><div class=\"wrap-head\"><h4>"
					+ vattendances.get(i).getActivity_date()
					+ "</h4></div><div class=\"wrap-price bg-blue\"><h4>进行中</h4></div><div class=\"wrap-list\"><ul><li>"
					+ vattendances.get(i).getActivity_name() + "</li><li>" + vattendances.get(i).getActivity_duration()
					+ "H</li></ul></div><a href=\"/mis/stu/attendance_page?activity_id="
					+ vattendances.get(i).getActivity_id()
					+ "\"><button class=\"button\">查看详情</button></a></div></div>";
			if (i % 2 == 0) {
				if (i != 0) {
					temp += end;
				}
				temp += start;
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			} else {
				temp += delta;
				if (i == vattendances.size() - 1) {
					temp += end;
				}
			}
		}
		System.out.println(temp);
		session.setAttribute("content", temp);
		return "stu/view_activity_page";
	}

	// 查看活动详情页面
	@RequestMapping(value = "/check_activity_page")
	public String check_activity_page(HttpSession session, String activity_id) {
		vActivity activity = adminService.select_activity_by_id(activity_id);
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
		session.setAttribute("means", activity.getMeans());
		session.setAttribute("activity_duration", activity.getActivity_duration());
		session.setAttribute("branch_name", branch_name);
		return "stu/check_activity_page";
	}

	// 个人信息页面
	@RequestMapping(value = "/info_page")
	public String info_page(HttpSession session) {
		session.setAttribute("message", "");
		Student student = (Student) session.getAttribute("student");
		String student_id = student.getStudent_id();
		vStudent vStudent = studentService.select_vstudent_by_student_id(student_id);
		session.setAttribute("vstudent", vStudent);
		if (student.getStudent_status() == 6) {
			session.setAttribute("message", "1");
		} else {
			session.setAttribute("message", "");
		}
		return "stu/info_page";
	}

	// 个人信息页面
	@RequestMapping(value = "/update_info_page")
	public String update_info_page(HttpSession session) {
		session.setAttribute("message", "");
		return "stu/update_info_page";
	}

	// 修改个人信息
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(String student_tel, String student_email, HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (studentService.update_info(student_id, student_tel, student_email)) {
			vStudent vstudent = studentService.select_vstudent_by_student_id(student_id);
			session.setAttribute("message", "1");
			session.setAttribute("vstudent", vstudent);
		} else {
			session.setAttribute("message", "2");
		}
		return "stu/info_page";
	}

	// 申请入党页面
	@RequestMapping(value = "/apply_page")
	public String apply_page(HttpSession session) {
		session.setAttribute("message", "");
		int student_status = ((Student) session.getAttribute("student")).getStudent_status();
		if (!(student_status == 6)) {
			String student_id = ((Student) session.getAttribute("student")).getStudent_id();
			vApply vapply = studentService.select_vapply_by_student_id(student_id);
			if (vapply != null) {
				if (vapply.getPermission() == null || vapply.getPermission().equals("")) {
					// 未申请入党
					vapply.setPermission("1");
					vapply.setStudent_status("非党员");
					vapply.setApply_status("未提交");
					return "stu/new_apply_page";
				} else {
					// 已申请入党
					ArrayList<vStudentMaterial> vStudentMaterials = studentService
							.stu_select_vStudentMaterial_by_student_id(student_id);
					session.setAttribute("material_list", vStudentMaterials);
					session.setAttribute("student_status",
							studentService.select_vstudent_by_student_id(student_id).getStudent_status());
					ArrayList<MaterialTypeMap> material_all = studentService
							.select_material_type_map_to_upload(student_id);
					// 提交材料查看
					for (vStudentMaterial v : vStudentMaterials) {
						if (v.getMaterial_url().equals("无")) {
							v.setMaterial_url(null);
						}
					}
					// 当前阶段可提交材料
					Iterator<MaterialTypeMap> iterator = material_all.iterator();
					while (iterator.hasNext()) {
						MaterialTypeMap next = iterator.next();
						if (next.getStudent_status() > (student_status + 1)) {
							iterator.remove();
						}
					}
					session.setAttribute("material_all", material_all);
				}
				session.setAttribute("vapply", vapply);
				return "stu/apply_page";
			}
			session.setAttribute("message", 1);
			return "stu/info_page";
		} else {
			session.setAttribute("message", 1);
			return "stu/info_page";
		}
	}

	// 提交入党相关材料
	@RequestMapping(value = "/upload_material")
	public String upload_material(@RequestParam("file") MultipartFile file, HttpServletRequest request,
			String material_type_input, HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		try {
			ArrayList<MaterialTypeMap> material_all = studentService.select_material_type_map_to_upload(student_id);
			String material_type_id = null;
			for (MaterialTypeMap v : material_all) {
				if (v.getMaterial_type_name().equals(material_type_input)) {
					material_type_id = v.getMaterial_type_id();
					break;
				}
			}
			String newFileName = student_id + "_" + material_type_id + ".pdf";
			String filePath = request.getSession().getServletContext().getRealPath("") + "upload_join_material\\";
			File dir = new File(filePath);
			if (!dir.exists()) {
				dir.mkdir();
			}
			filePath = filePath + newFileName;
			file.transferTo(new File(filePath));
			if (studentService.add_material_for_join(student_id, material_type_id, filePath)) {
				session.setAttribute("message", "1");
				ArrayList<vStudentMaterial> vStudentMaterials = studentService
						.stu_select_vStudentMaterial_by_student_id(student_id);
				session.setAttribute("material_list", vStudentMaterials);
				session.setAttribute("student_status",
						studentService.select_vstudent_by_student_id(student_id).getStudent_status());
				material_all = studentService.select_material_type_map_to_upload(student_id);
				// 提交材料查看
				for (vStudentMaterial v : vStudentMaterials) {
					if (v.getMaterial_url().equals("无")) {
						v.setMaterial_url(null);
					}
				}
				// 当前阶段可提交材料
				Iterator<MaterialTypeMap> iterator = material_all.iterator();
				int student_status = ((Student) session.getAttribute("student")).getStudent_status();
				while (iterator.hasNext()) {
					MaterialTypeMap next = iterator.next();
					if (next.getStudent_status() > (student_status + 1)) {
						iterator.remove();
					}
				}
				session.setAttribute("material_all", material_all);
			} else {
				session.setAttribute("message", "2");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "2");
		}
		return "stu/apply_page";
	}

	// 提交入党申请
	@RequestMapping(value = "/applyJoin")
	public String applyJoin(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (studentService.submit_apply(student_id) && studentService.insert_material(student_id)) {
			session.setAttribute("message", "1");
			vApply vapply = studentService.select_vapply_by_student_id(student_id);
			session.setAttribute("vapply", vapply);
		} else {
			session.setAttribute("message", "1");
		}
		return "stu/apply_page";
	}

	// 活动记录页面
	@RequestMapping(value = "/activity_record_page")
	public String activity_record_page(@RequestParam(value = "pn", defaultValue = "1") Integer pn,
			HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		String total_time = studentService.attendance_total_time(student_id);
		String total_duration = studentService.attendance_total_duration(student_id);
		ArrayList<vAttendance> vattendances = studentService.select_attendance_by_student_id(student_id);
		PageInfo<vAttendance> pageInfo = new PageInfo<vAttendance>(vattendances, 5);
		session.setAttribute("total_time", total_time);
		session.setAttribute("total_duration", total_duration);
		session.setAttribute("pageInfo", pageInfo);
		return "stu/activity_record_page";
	}

	// 相关资料上传
	@RequestMapping(value = "/material_upload_page")
	public String material_upload_page(HttpSession session) {
		return "stu/material_upload_page";
	}

	// 修改密码页面
	@RequestMapping(value = "/update_psw_page")
	public String update_psw_page(HttpSession session) {
		return "stu/update_psw_page";
	}
}
