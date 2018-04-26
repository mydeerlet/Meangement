package login;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jms.Session;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.UserRegister;

public class LoginService extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoginService() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	
		// 重写doGet方法
				String username = new String(request.getParameter("username"));
				String password = new String(request.getParameter("password"));

				UserRegister ur = new UserRegister();
				UserBean ub = new UserBean();
				ub.setUserid(username);
				ub.setPassword(password);
				
				boolean b = ur.LonginCheck(username, password);
		
				response.setContentType("text/html;charset=utf-8");
				response.setCharacterEncoding("UTF-8");
				// 返回html页面
				if (b) {
					request.getSession().setAttribute("userName", ub.getUserid());
					response.sendRedirect("/Car66Management/index_home.jsp");  
				} else {
					response.getWriter().println("登陆失败,用户名或密码错误!");
				}
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doGet(request, response);

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
