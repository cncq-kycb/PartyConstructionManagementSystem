package cn.edu.cqu.Dao;

import java.util.ArrayList;

import cn.edu.cqu.Model.MaterialTypeMap;
import cn.edu.cqu.Model.StudentPermissionMap;
import cn.edu.cqu.Model.StudentStatusMap;
import cn.edu.cqu.Model.StudyStatusMap;

public interface MapMapper {

	ArrayList<StudentStatusMap> select_student_status_map();

	ArrayList<StudentPermissionMap> select_student_permission_map();

	ArrayList<StudyStatusMap> select_study_status_map();

	ArrayList<MaterialTypeMap> select_material_type_map();

	int select_material_type_map_length();

	ArrayList<MaterialTypeMap> select_material_type_map_to_upload_stu(String student_id);

	ArrayList<MaterialTypeMap> select_material_type_map_to_upload_admin(String student_id);
}
