package cn.edu.cqu.Service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import cn.edu.cqu.Model.MaterialTypeMap;
import cn.edu.cqu.Model.Study;
import cn.edu.cqu.Model.StudyStatusMap;
import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vAttendance;
import cn.edu.cqu.Model.vQuestion;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Model.vStudentMaterial;
import cn.edu.cqu.Model.vStudy;

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

	ArrayList<StudyStatusMap> select_study_status_map();

	ArrayList<vStudy> select_study_list(String study_title, String study_status);

	void jump_study_page(String study_title, HttpSession session, String study_status_name);

	vStudy select_study_by_study_id(String study_id);

	ArrayList<vQuestion> select_exam(String student_id);

	boolean answer_question(String test_id, String question_id, String student_id, String answer_option);

	ArrayList<vStudentMaterial> stu_select_vStudentMaterial_by_student_id(String student_id);

	boolean insert_material(String student_id);

	ArrayList<MaterialTypeMap> select_material_type_map();

	ArrayList<MaterialTypeMap> select_material_type_map_to_upload(String student_id);

	boolean add_material_for_join(String student_id, String material_type_id, String material_url);

}
