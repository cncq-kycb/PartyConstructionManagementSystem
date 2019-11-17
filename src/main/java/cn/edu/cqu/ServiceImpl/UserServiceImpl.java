package cn.edu.cqu.ServiceImpl;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import cn.edu.cqu.Dao.BranchMapper;
//import cn.edu.cqu.Dao.StudentMapper;
//import cn.edu.cqu.Dao.TestMapper;
import cn.edu.cqu.Dao.UserMapper;
import cn.edu.cqu.Model.Admin;
import cn.edu.cqu.Model.Branch;
import cn.edu.cqu.Model.Student;
import cn.edu.cqu.Model.User;
import cn.edu.cqu.Model.vStudent;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;
//	@Autowired
//	private BranchMapper branchMapper;
//	@Autowired
//	private StudentMapper studentMapper;
//	@Autowired
//	private TestMapper testMapper;

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
				// Admin admin = userMapper.select_admin_by_account(user.getUser_account());
				// admin.setUser(user);
				// session.setAttribute("admin_name", admin.getAdmin_name());
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

//	// 添加党支部
//	@Override
//	public boolean branch_insert(Branch branch) {
//		System.out.println("branch_insert");
//		try {
//			branchMapper.insert(branch);
//			return true;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("branch_insert fail");
//			return false;
//		}
//	}

//	// 查询党支部
//	@Override
//	public ArrayList<Branch> select_branch(String branch_name) {
//		System.out.println("select_branch");
//		try {
//			return branchMapper.select(branch_name);
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("select_branch fail");
//			return null;
//		}
//	}

//	// 删除党支部
//	@Override
//	public boolean branch_delete(String branch_id) {
//		System.out.println("branch_delete");
//		try {
//			branchMapper.delete(branch_id);
//			return true;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("branch_delete fail");
//			return false;
//		}
//	}

//	// 修改党支部
//	@Override
//	public boolean branch_update(Branch branch) {
//		System.out.println("branch_update");
//		try {
//			branchMapper.update(branch);
//			return true;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("branch_update fail");
//			return false;
//		}
//	}

//	@Override
//	public boolean update_permission(Student student) {
//		// TODO Auto-generated method stub
//		System.out.println("update_permission");
//		try {
//			studentMapper.update_permission(student.getStudent_id(), student.getStudent_permission());
//			return true;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("update_permission fail");
//			return false;
//		}
//	}

//	@Override
//	public ArrayList<Student> select_student(String student_num, String student_name, String branch_name,
//			int student_status) {
//		// TODO Auto-generated method stub
//		System.out.println("select_student");
//		try {
//			ArrayList<String> branch_id_list = branchMapper.select_id_by_name(branch_name);
//			ArrayList<Student> student_list = new ArrayList<Student>();
//			for (String s : branch_id_list) {
//				student_list.addAll(studentMapper.select(student_num, student_name, s, student_status));
//			}
//			return student_list;
//		} catch (Exception e) {
//			// TODO: handle exception
//			System.err.println("select_student fail");
//			return null;
//		}
//	}

//	@Override
//	public Test test_select(String test_id) {
//		// TODO Auto-generated method stub
//		Test test = new Test();
//		test.setTest_id(test_id);
//		test.setQuestions(testMapper.select_question(test_id));
//		test.setTest_date(testMapper.select_date(test_id));
//		return null;
//	}

}
