package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.vApply;
import cn.edu.cqu.Model.vStudentMaterial;

public interface ApplyMapper {

	vApply select_vApply_by_student_id(String student_id);

	void insert_apply(String student_id);

	void update_apply_status(@Param("student_id") String student_id, @Param("apply_status") String apply_status);

	ArrayList<vStudentMaterial> stu_select_vStudentMaterial_by_student_id(String student_id);

	void insert_material(@Param("student_id") String student_id, @Param("material_type_id") int material_type_id);

	void update_student_status_material(@Param("student_id") String student_id,
			@Param("material_type_id") String material_type_id, @Param("material_url") String material_url);

	ArrayList<vStudentMaterial> stu_select_vStudentMaterial_by_student_id_all(String student_id);

	ArrayList<vStudentMaterial> select_vStudentMaterial_by_student_num_for_admin(String student_id);

	void update_student_status_material_offline(@Param("material_type_id") String material_type_id,
			@Param("student_id") String student_id);

}
