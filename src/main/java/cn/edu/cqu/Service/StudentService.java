package cn.edu.cqu.Service;

import java.util.ArrayList;

import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;

public interface StudentService {

	vStudent select_vstudent_by_student_id(String student_id);

	boolean update_info(String student_id, String student_tel, String student_email);

	vApply select_vapply_by_student_id(String student_id);

	boolean submit_apply(String student_id);

	String attendance_total_time(String student_id);

	String attendance_total_duration(String student_id);

	ArrayList<vAttendance> select_attendance_by_student_id(String student_id);

	boolean is_member(String student_id);

	String select_branch_id_by_student_id(String student_id);

	String attendance_total_duration_by_branch(String branch_id);

	ArrayList<vAttendance> select_attendance_by_branch_id(String branch_id);

	String attendance_total_time_by_branch(String branch_id);

	String select_branch_name_by_student_id(String student_id);

	ArrayList<vAttendance> select_attendance_now_by_student_id(String student_id);

	boolean add_pic_for_attendance(String student_id, String activity_id, String attendance_pic);

	boolean absent_for_attendance(String student_id, String activity_id);

}
