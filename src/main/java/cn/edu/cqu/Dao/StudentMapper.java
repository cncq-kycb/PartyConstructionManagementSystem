package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.vStudent;

public interface StudentMapper {

	void update_permission(String student_id, int student_permission);

	ArrayList<Student> select(@Param("student_num") String student_num, @Param("student_name") String student_name,
			@Param("branch_name") String branch_name, @Param("student_status") int student_status);

	vStudent select_vStudent_by_student_id(@Param("student_id") String student_id);

	void update_info_stu(@Param("student_id") String student_id, @Param("student_tel") String student_tel,
			@Param("student_email") String student_email);

	String select_status_mean_by_student_id(String student_id);

	String select_branch_id_by_student_id(String student_id);

}
