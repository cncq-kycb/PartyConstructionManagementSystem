package cn.edu.cqu.Service;

import javax.servlet.http.HttpSession;

import cn.edu.cqu.Model.User;

public interface UserService {

	// 用户登录
	public int login(User user, HttpSession session);

	public String select_psw(String user_account);

	public boolean update_password(String user_account, String user_password);

	public boolean permission(String user_account);

//	// 新增党支部
//	public boolean branch_insert(Branch branch);
//
//	// 按条件查询党支部
//	public ArrayList<Branch> select_branch(String branch_name);
//
//	// 删除党支部
//	public boolean branch_delete(String branch_id);
//
//	// 修改党支部
//	public boolean branch_update(Branch branch);
//
//	// 修改学生权限
//	public boolean update_permission(Student student);
//
//	// 按条件查找学生党员
//	public ArrayList<Student> select_student(String student_num, String student_name, String branch_name,
//			int student_status);
//
//	// 按测验id查找试题
//	public Test test_select(String test_id);
}
