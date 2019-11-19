package cn.edu.cqu.Dao;

import org.apache.ibatis.annotations.Param;

import cn.edu.cqu.Model.Admin;
import cn.edu.cqu.Model.Student;

public interface UserMapper {

	String select_password_by_account(@Param("user_account") String user_account);

	int select_type_by_account(@Param("user_account") String user_account);

	Admin select_admin_by_account(@Param("user_account") String user_account);

	Student select_student_by_account(@Param("user_account") String user_account);

}
