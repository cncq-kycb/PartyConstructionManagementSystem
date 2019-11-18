package cn.edu.cqu.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.vApply;

public interface ApplyMapper {

	vApply select_vApply_by_student_id(String student_id);

	void insert_apply(String student_id);

	void update_apply_status(@Param("student_id") String student_id, @Param("apply_status") String apply_status);

}
