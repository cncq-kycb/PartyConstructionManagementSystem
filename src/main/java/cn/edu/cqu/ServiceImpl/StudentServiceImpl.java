package cn.edu.cqu.ServiceImpl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;

import cn.edu.cqu.Dao.ApplyMapper;
import cn.edu.cqu.Dao.AttendanceMapper;
import cn.edu.cqu.Dao.BranchMapper;
import cn.edu.cqu.Dao.MapMapper;
import cn.edu.cqu.Dao.StudentMapper;
import cn.edu.cqu.Dao.StudyMapper;
import cn.edu.cqu.Dao.TestMapper;
import cn.edu.cqu.Model.MaterialTypeMap;
import cn.edu.cqu.Model.Study;
import cn.edu.cqu.Model.StudyStatusMap;
import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vQuestion;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Model.vStudentMaterial;
import cn.edu.cqu.Model.vStudy;
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
	@Autowired
	MapMapper mapMapper;
	@Autowired
	StudyMapper studyMapper;
	@Autowired
	TestMapper testMapper;

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

	@Override
	public boolean add_pic_for_attendance(String student_id, String activity_id, String attendance_pic) {
		// TODO Auto-generated method stub
		try {
			System.out.println(student_id+" "+activity_id+" "+attendance_pic);
			attendanceMapper.add_pic_for_attendance(student_id, activity_id, attendance_pic);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("add_pic_for_attendance err");
			return false;
		}
	}

	@Override
	public boolean absent_for_attendance(String student_id, String activity_id) {
		// TODO Auto-generated method stub
		try {
			attendanceMapper.absent_for_attendance(student_id, activity_id);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			System.err.println("absent_for_attendance err");
			return false;
		}
	}

	@Override
	public ArrayList<StudyStatusMap> select_study_status_map() {
		// TODO Auto-generated method stub
		return mapMapper.select_study_status_map();
	}

	@Override
	public ArrayList<vStudy> select_study_list(String study_title, String study_status) {
		// TODO Auto-generated method stub
		return studyMapper.select_study_list(study_title, study_status);
	}

	@Override
	public void jump_study_page(String study_title, HttpSession session, String study_status_name) {
		// TODO Auto-generated method stub
		ArrayList<StudyStatusMap> study_status_map = select_study_status_map();
		String study_status_input = null;
		for (StudyStatusMap item : study_status_map) {
			if (item.getMeans().equals(study_status_name)) {
				study_status_input = item.getStudy_status();
				break;
			}
		}
		ArrayList<vStudy> study_list = select_study_list(study_title, study_status_input);
		PageInfo<vStudy> pageInfo = new PageInfo<vStudy>(study_list, 10);
		session.setAttribute("pageInfo", pageInfo);
		session.setAttribute("study_title_input", study_title);
	}

	@Override
	public vStudy select_study_by_study_id(String study_id) {
		// TODO Auto-generated method stub
		return studyMapper.select_study_by_id(study_id);
	}

	@Override
	public ArrayList<vQuestion> select_exam(String student_id) {
		// TODO Auto-generated method stub
		String test_id = testMapper.select_test_id_now();
		if (test_id == null) {
			return null;
		}
		if (testMapper.answer_result(test_id, student_id) != 0) {
			return null;
		}
		return testMapper.select_exam(test_id);
	}

	@Override
	public boolean answer_question(String test_id, String question_id, String student_id, String answer_option) {
		// TODO Auto-generated method stub
		try {
			testMapper.answer_question(test_id, question_id, student_id, answer_option);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public ArrayList<vStudentMaterial> stu_select_vStudentMaterial_by_student_id(String student_id) {
		// TODO Auto-generated method stub
		return applyMapper.stu_select_vStudentMaterial_by_student_id(student_id);
	}

	@Override
	public boolean insert_material(String student_id) {
		// TODO Auto-generated method stub
		try {
			int length = mapMapper.select_material_type_map_length();
			for (int i = 1; i <= length; i++) {
				applyMapper.insert_material(student_id, i);
			}
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public ArrayList<MaterialTypeMap> select_material_type_map() {
		// TODO Auto-generated method stub
		return mapMapper.select_material_type_map();
	}

	@Override
	public ArrayList<MaterialTypeMap> select_material_type_map_to_upload(String student_id) {
		// TODO Auto-generated method stub
		return mapMapper.select_material_type_map_to_upload_stu(student_id);
	}

	@Override
	public boolean add_material_for_join(String student_id, String material_type_id, String material_url) {
		// TODO Auto-generated method stub
		try {
			applyMapper.update_student_status_material(student_id, material_type_id, material_url);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	@Override
	public int select_test_total_time_all(String student_num) {
		// TODO Auto-generated method stub
		Integer num = testMapper.select_test_total_time_all(student_num);
		if (num == null) {
			return 0;
		}
		return num;
	}

	@Override
	public int select_test_total_correct(String student_num) {
		// TODO Auto-generated method stub
		Integer num = testMapper.select_test_total_correct(student_num);
		if (num == null) {
			return 0;
		}
		return num;
	}

	@Override
	public int select_test_total_time(String student_num) {
		// TODO Auto-generated method stub
		Integer num = testMapper.select_test_total_time(student_num);
		if (num == null) {
			return 0;
		}
		return num;
	}

	@Override
	public int select_total_attendance_time(String student_id) {
		// TODO Auto-generated method stub
		Integer num = attendanceMapper.count_attendance_time(student_id);
		if (num == null) {
			return 0;
		}
		return num;
	}

	@Override
	public int select_total_activity_time_all(String student_num) {
		// TODO Auto-generated method stub
		Integer num = attendanceMapper.count_activity_time_all(student_num);
		if (num == null) {
			return 0;
		}
		return num;
	}

}
