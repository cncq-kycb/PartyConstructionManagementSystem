package cn.edu.cqu.Dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.vStudent;

public interface StudentMapper {

	void update_permission(@Param("student_num") String student_num,
			@Param("student_permission") String student_permission);

	ArrayList<Student> select(@Param("student_num") String student_num, @Param("student_name") String student_name,
			@Param("branch_name") String branch_name, @Param("student_status") int student_status);

	ArrayList<vStudent> select_vstudent(@Param("student_num") String student_num,
			@Param("student_name") String student_name, @Param("branch_name") String branch_name,
			@Param("student_status") String student_status);

	vStudent select_vStudent_by_student_id(@Param("student_id") String student_id);

	void update_info_stu(@Param("student_id") String student_id, @Param("student_tel") String student_tel,
			@Param("student_email") String student_email);

	String select_status_mean_by_student_id(String student_id);

	String select_branch_id_by_student_id(String student_id);

	void update_student_info(@Param("student_num") String student_num, @Param("student_name") String student_name,
			@Param("student_gender") String student_gender, @Param("student_tel") String student_tel,
			@Param("student_email") String student_email);

	int select_status_by_student_num(String student_num);

	void student_status_level_up(String student_num);

	void update_branch(@Param("student_num") String student_num, @Param("branch_id") String branch_id);

	ArrayList<vStudent> select_vstudent_by_branch_name(@Param("branch_name") String branch_name);

	void delete_branch_by_student_num(@Param("student_num") String student_num);

	void pass_branch_by_student_num(@Param("student_num") String student_num);

	void unpass_branch_by_student_num(@Param("student_num") String student_num);

	String select_student_id_by_student_num(@Param("student_num") String student_num);

	ArrayList<Student> select_student_by_branch_id(String branch_id);

	vStudent select_vStudent_by_student_num(String student_num);

}
