package cn.edu.cqu.Controller;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Service.StudentService;

@Controller
@RequestMapping(value = "/stu")
public class StudentController {
	@Autowired
	private StudentService studentService;
	@Autowired
	private HttpServletRequest request;

	// 活动签到页面
	@RequestMapping(value = "/attendence_page")
	public String attendence_page(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (!studentService.is_member(student_id)) {
			return "stu/no_permission";
		}
		session.setAttribute("message", "");
		ArrayList<vAttendance> vattendances = studentService.select_attendance_now_by_student_id(student_id);
		PageInfo<vAttendance> pageInfo = new PageInfo<vAttendance>(vattendances, 5);
		session.setAttribute("pageInfo", pageInfo);
		return "stu/attendence_page";
	}

	// 提交照片
	@RequestMapping(value = "/upload_file")
	public String upload_file(String student_num_submit, String activity_id_submit,
			@RequestParam("file") MultipartFile file, HttpSession session) {
		try {
			String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/"
					+ file.getOriginalFilename();
			file.transferTo(new File(filePath));
			session.setAttribute("message", "1");
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("message", "2");
		}
		return "stu/attendence_page";
	}

	// 组织生活记录页面
	@RequestMapping(value = "/life_record_page")
	public String life_record_page(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (!studentService.is_member(student_id)) {
			return "stu/no_permission";
		}
		String branch_id = studentService.select_branch_id_by_student_id(student_id);
		String total_time = studentService.attendance_total_time_by_branch(branch_id);
		String total_duration = studentService.attendance_total_duration_by_branch(branch_id);
		String branch_name = studentService.select_branch_name_by_student_id(student_id);
		ArrayList<vAttendance> vattendances = studentService.select_attendance_by_branch_id(branch_id);
		PageInfo<vAttendance> pageInfo = new PageInfo<vAttendance>(vattendances, 5);
		session.setAttribute("total_time", total_time);
		session.setAttribute("total_duration", total_duration);
		session.setAttribute("branch_name", branch_name);
		session.setAttribute("pageInfo", pageInfo);
		return "stu/life_record_page";
	}

	// 个人信息页面
	@RequestMapping(value = "/info_page")
	public String info_page(HttpSession session) {
		session.setAttribute("message", "");
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		vStudent vStudent = studentService.select_vstudent_by_student_id(student_id);
		session.setAttribute("vstudent", vStudent);
		return "stu/info_page";
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
		if (!(((Student) session.getAttribute("student")).getStudent_status().equals("4"))) {
			String student_id = ((Student) session.getAttribute("student")).getStudent_id();
			vApply vapply = studentService.select_vapply_by_student_id(student_id);
			if (vapply != null) {
				if (vapply.getPermission() == null || vapply.getPermission().equals("")) {
					vapply.setPermission("1");
					vapply.setStudent_status("非党员");
					vapply.setApply_status("未提交");
				}
				session.setAttribute("vapply", vapply);
				return "stu/apply_page";
			}
			return "stu/no_permission";
		} else {
			return "stu/no_permission";
		}
	}

	// 提交入党申请
	@RequestMapping(value = "/applyJoin")
	public String applyJoin(HttpSession session) {
		String student_id = ((Student) session.getAttribute("student")).getStudent_id();
		if (studentService.submit_apply(student_id)) {
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

}
