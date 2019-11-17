package cn.edu.cqu.ServiceImpl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.Dao.ApplyMapper;
import cn.edu.cqu.Dao.AttendanceMapper;
import cn.edu.cqu.Dao.BranchMapper;
import cn.edu.cqu.Dao.StudentMapper;
import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Service.StudentService;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	StudentMapper studentMapper;
	@Autowired
	ApplyMapper applyMapper;
	@Autowired
	AttendanceMapper attendanceMapper;
	@Autowired
	BranchMapper branchMapper;

	@Override
	public vStudent select_vstudent_by_student_id(String student_id) {
		vStudent v = new vStudent();
		v = studentMapper.select_vStudent_by_student_id(student_id);
		if (v != null) {
			return v;
		}
		System.err.println("select_vstudent_by_student_id err");
		return null;
	}

	@Override
	public boolean update_info(String student_id, String student_tel, String student_email) {
		// TODO Auto-generated method stub
		try {
			studentMapper.update_info_stu(student_id, student_tel, student_email);
			return true;
		} catch (Exception e) {
			System.err.println("update_info err");
			return false;
		}
	}

	@Override
	public vApply select_vapply_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		try {
			vApply v = applyMapper.select_vApply_by_student_id(student_id);
			if (v == null) {
				v = new vApply();
			}
			return v;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("select_vapply_by_student_id err");
			return null;
		}
	}

	@Override
	public boolean submit_apply(String student_id) {
		// TODO Auto-generated method stub
		try {
			applyMapper.insert_apply(student_id);
			return true;
		} catch (Exception e) {
			System.err.println("submit_apply err");
			return false;
		}
	}

	@Override
	public String attendance_total_time(String student_id) {
		// TODO Auto-generated method stub
		String total_time = attendanceMapper.total_time_by_student_id(student_id);
		if (total_time != null) {
			return total_time;
		}
		return "0";
	}

	@Override
	public String attendance_total_duration(String student_id) {
		// TODO Auto-generated method stub
		String total_duration = attendanceMapper.total_duration_by_student_id(student_id);
		if (total_duration != null) {
			return total_duration;
		}
		return "0";
	}

	@Override
	public ArrayList<vAttendance> select_attendance_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		try {
			return attendanceMapper.select_all_by_student_id(student_id);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	public boolean is_member(String student_id) {
		// TODO Auto-generated method stub
		String student_status = studentMapper.select_status_mean_by_student_id(student_id);
		if (student_status.equals("正式党员")) {
			return true;
		}
		return false;
	}

	@Override
	public String select_branch_id_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		return studentMapper.select_branch_id_by_student_id(student_id);
	}

	@Override
	public String attendance_total_duration_by_branch(String branch_id) {
		// TODO Auto-generated method stub
		String total_duration = attendanceMapper.total_duration_by_branch_id(branch_id);
		if (total_duration != null) {
			return total_duration;
		}
		return "0";
	}

	@Override
	public String attendance_total_time_by_branch(String branch_id) {
		// TODO Auto-generated method stub
		String total_time = attendanceMapper.total_time_by_branch_id(branch_id);
		if (total_time != null) {
			return total_time;
		}
		return "0";
	}

	@Override
	public ArrayList<vAttendance> select_attendance_by_branch_id(String branch_id) {
		// TODO Auto-generated method stub
		try {
			return attendanceMapper.select_all_by_branch_id(branch_id);
		} catch (Exception e) {
			// TODO: handle exception
			return null;
		}
	}

	@Override
	public String select_branch_name_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		String branch_id = studentMapper.select_branch_id_by_student_id(student_id);
		return branchMapper.select_name_by_id(branch_id);
	}

	@Override
	public ArrayList<vAttendance> select_attendance_now_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		try {
			return attendanceMapper.select_now_by_student_id(student_id);
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("select_attendance_now_by_student_id err");
			return null;
		}
	}

}
