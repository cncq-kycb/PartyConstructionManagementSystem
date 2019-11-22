package cn.edu.cqu.Controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import cn.edu.cqu.Model.User;
import cn.edu.cqu.Service.UserService;
import cn.edu.cqu.Utils.Utils;

@Controller
public class UserController {

	@Autowired
	private UserService userService;

	/*
	 * 登录退出
	 */
	// 用户登录
	@RequestMapping(value = "/login")
	public String login(String user_account, String user_password, HttpSession session) {
		User user = new User(user_account, user_password);
		int type = userService.login(user, session);
		if (type != 0) {
			return "main_page_" + type;
		}
		return "loginFail";
	}

	// 用户退出
	@RequestMapping(value = "/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

	// 用户下载
	@RequestMapping(value = "/download")
	public static void downFile(HttpServletRequest request, HttpServletResponse response, String filename, String url)
			throws IOException {
		// 文件存在才下载
		File file = new File(url);
		if (file.exists()) {
			OutputStream out = null;
			FileInputStream in = null;
			try {
				// 1.读取要下载的内容
				in = new FileInputStream(file);

				// 2. 告诉浏览器下载的方式以及一些设置
				// 解决文件名乱码问题，获取浏览器类型，转换对应文件名编码格式，IE要求文件名必须是utf-8, firefo要求是iso-8859-1编码
				String agent = request.getHeader("user-agent");
				if (agent.contains("FireFox")) {
					filename = new String(filename.getBytes("UTF-8"), "iso-8859-1");
				} else {
					filename = URLEncoder.encode(filename, "UTF-8");
				}
				// 设置下载文件的mineType，告诉浏览器下载文件类型
				String mineType = request.getServletContext().getMimeType(filename);
				response.setContentType(mineType);
				// 设置一个响应头，无论是否被浏览器解析，都下载
				response.setHeader("Content-disposition", "attachment; filename=" + filename);
				// 将要下载的文件内容通过输出流写到浏览器
				out = response.getOutputStream();
				int len = 0;
				byte[] buffer = new byte[1024];
				while ((len = in.read(buffer)) > 0) {
					out.write(buffer, 0, len);
				}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				if (out != null) {
					out.close();
				}
				if (in != null) {
					in.close();
				}
			}
		}
	}

	// 修改密码
	@RequestMapping(value = "/updatePsw")
	public String updatePsw(String psw_old, String psw_new, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String user_account = user.getUser_account();
		if (Utils.security_coding(psw_old).equals(userService.select_psw(user_account))) {
			if (userService.update_password(user_account, Utils.security_coding(psw_new))) {
				session.setAttribute("message", "1");
				return "index";
			} else {
				session.setAttribute("message", "3");
			}
		} else {
			session.setAttribute("message", "2");
		}
		return "index";
	}

}