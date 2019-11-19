package cn.edu.cqu.ServiceImpl;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.edu.cqu.Dao.UserMapper;
import cn.edu.cqu.Model.Activity;
import cn.edu.cqu.Model.Admin;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.User;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	// 用户登录
	@Override
	public int login(User user, HttpSession session) {
		System.out.println("login");
		String password = userMapper.select_password_by_account(user.getUser_account());
		if (password.equals(Utils.security_coding(user.getUser_password()))) {
			session.setAttribute("user", user);
			int user_type = userMapper.select_type_by_account(user.getUser_account());
			switch (user_type) {
			case 1:
				Admin admin = userMapper.select_admin_by_account(user.getUser_account());
				session.setAttribute("admin_name", admin.getAdmin_name());
				session.setAttribute("admin", admin);
				return 1;
			case 2:
				Student student = userMapper.select_student_by_account(user.getUser_account());
				session.setAttribute("student_name", student.getStudent_name());
				session.setAttribute("student", student);
				return 2;
			default:
				return 0;
			}
		}
		return 0;
	}
	



}
