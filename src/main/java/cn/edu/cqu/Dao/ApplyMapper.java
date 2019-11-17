package cn.edu.cqu.Dao;

import cn.edu.cqu.Model.vApply;

public interface ApplyMapper {

	vApply select_vApply_by_student_id(String student_id);

	void insert_apply(String student_id);

}
