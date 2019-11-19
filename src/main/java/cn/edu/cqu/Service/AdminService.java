package cn.edu.cqu.Service;

import java.util.ArrayList;

import cn.edu.cqu.Model.ActivityStatusMap;
import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.StudentPermissionMap;
import cn.edu.cqu.Model.StudentStatusMap;
import cn.edu.cqu.Model.vActivity;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;

public interface AdminService {

	ArrayList<Student> select(String student_num_input, String student_name_input, String branch_name_input,
			int student_status_input);

	boolean update_permission(String student_num, String student_permission);

	boolean branch_insert(Branch branch);

	boolean branch_delete(String branch_id);

	boolean branch_update(Branch branch);

	Branch select_branch(String branch_name);

	ArrayList<vStudent> select_vstudent(String student_num, String student_name, String student_status,
			String branch_name);

	ArrayList<StudentStatusMap> select_student_status_map();

	ArrayList<StudentPermissionMap> select_student_permission_map();

	boolean update_student_info(String student_num, String student_name, String student_gender, String student_tel,
			String student_email);

	boolean is_able_to_level_up(String student_num);

	boolean update_student_status(String student_num);

	ArrayList<Branch> select_all_branch();

	boolean add_member_to_branch(String student_num, String branch_id);

	ArrayList<vStudent> select_vstudent_by_branch_name(String branch_name);

	boolean delete_branch_by_student_num(String student_num);

	boolean pass_branch_by_student_num(String student_num);

	boolean unpass_branch_by_student_num(String student_num);

	ArrayList<ActivityStatusMap> select_activity_status_map();

	ArrayList<vActivity> select_vactivity(String activity_name, String activity_date, String activity_status,
			String activity_location);

	ArrayList<vAttendance> select_vAttendance_by_activity_id(String activity_id);

	int count_sign_in_num_by_activity_id(String activity_id);

	int count_total_num_by_activity_id(String activity_id);

	boolean update_activity_status(String activity_id, String activity_status);

}
