package cn.edu.cqu.ServiceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.Dao.ActivityMapper;
import cn.edu.cqu.Dao.ApplyMapper;
import cn.edu.cqu.Dao.AttendanceMapper;
import cn.edu.cqu.Dao.BranchMapper;
import cn.edu.cqu.Dao.MapMapper;
import cn.edu.cqu.Dao.StudentMapper;
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

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	BranchMapper branchMapper;
	@Autowired
	MapMapper mapMapper;
	@Autowired
	ApplyMapper applyMapper;
	@Autowired
	ActivityMapper activityMapper;
	@Autowired
	AttendanceMapper attendanceMapper;

	@Override
	public ArrayList<Student> select(String student_num, String student_name, String branch_name, int student_status) {
		// TODO Auto-generated method stub
		return studentMapper.select(student_num, student_name, branch_name, student_status);
	}

	@Override
	public boolean update_permission(String student_num, String student_permission) {
		// TODO Auto-generated method stub
		try {
			studentMapper.update_permission(student_num, student_permission);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("update_permission err");
			return false;
		}
	}

	@Override
	public boolean branch_insert(Branch branch) {
		// TODO Auto-generated method stub
		try {
			branchMapper.insert(branch);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean branch_delete(String branch_id) {
		try {
			branchMapper.delete(branch_id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean branch_update(Branch branch) {
		// TODO Auto-generated method stub
		try {
			branchMapper.update(branch);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public Branch select_branch(String branch_name) {
		// TODO Auto-generated method stub
		return branchMapper.select(branch_name);
	}

	@Override
	public ArrayList<vStudent> select_vstudent(String student_num, String student_name, String student_status,
			String branch_name) {
		// TODO Auto-generated method stub
		return studentMapper.select_vstudent(student_num, student_name, branch_name, student_status);
	}

	@Override
	public ArrayList<StudentStatusMap> select_student_status_map() {
		// TODO Auto-generated method stub
		return mapMapper.select_student_status_map();
	}

	@Override
	public ArrayList<StudentPermissionMap> select_student_permission_map() {
		// TODO Auto-generated method stub
		return mapMapper.select_student_permission_map();
	}

	@Override
	public boolean update_student_info(String student_num, String student_name, String student_gender,
			String student_tel, String student_email) {
		// TODO Auto-generated method stub
		try {
			studentMapper.update_student_info(student_num, student_name, student_gender, student_tel, student_email);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("update_student_info err");
			return false;
		}
	}

	@Override
	public boolean is_able_to_level_up(String student_num) {
		int student_status = studentMapper.select_status_by_student_num(student_num);
		if (student_status >= 1 && student_status <= 4) {
			if (student_status == 2) {
				// 非党员提升为积极分子需通过apply审核
				String student_id = studentMapper.select_student_id_by_student_num(student_num);
				applyMapper.update_apply_status(student_id, "3");
			}
			return true;
		}
		return false;
	}

	@Override
	public boolean update_student_status(String student_num) {
		// TODO Auto-generated method stub
		try {
			studentMapper.student_status_level_up(student_num);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("update_student_status err");
			return false;
		}
	}

	@Override
	public ArrayList<Branch> select_all_branch() {
		return branchMapper.select_all();
	}

	@Override
	public boolean add_member_to_branch(String student_num, String branch_id) {
		try {
			studentMapper.update_branch(student_num, branch_id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public ArrayList<vStudent> select_vstudent_by_branch_name(String branch_name) {
		return studentMapper.select_vstudent_by_branch_name(branch_name);
	}

	@Override
	public boolean delete_branch_by_student_num(String student_num) {
		try {
			studentMapper.delete_branch_by_student_num(student_num);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean pass_branch_by_student_num(String student_num) {
		// TODO Auto-generated method stub
		try {
			studentMapper.pass_branch_by_student_num(student_num);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public boolean unpass_branch_by_student_num(String student_num) {
		// TODO Auto-generated method stub
		try {
			studentMapper.unpass_branch_by_student_num(student_num);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public ArrayList<ActivityStatusMap> select_activity_status_map() {
		return activityMapper.select_activity_status_map();
	}

	@Override
	public ArrayList<vActivity> select_vactivity(String activity_name, String activity_status, String activity_date,
			String activity_location) {
		// TODO Auto-generated method stub
		return activityMapper.select_vactivity(activity_name, activity_status, activity_date, activity_location);
	}

	@Override
	public ArrayList<vAttendance> select_vAttendance_by_activity_id(String activity_id) {
		// TODO Auto-generated method stub
		return attendanceMapper.select_all_by_activity_id(activity_id);
	}

	@Override
	public int count_sign_in_num_by_activity_id(String activity_id) {
		// TODO Auto-generated method stub
		return attendanceMapper.count_sign_in_num_by_activity_id(activity_id);
	}

	@Override
	public int count_total_num_by_activity_id(String activity_id) {
		// TODO Auto-generated method stub
		return attendanceMapper.count_total_num_by_activity_id(activity_id);
	}

	@Override
	public boolean update_activity_status(String activity_id, String activity_status) {
		// TODO Auto-generated method stub
		try {
			activityMapper.update_activity_status(activity_id, activity_status);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

}
