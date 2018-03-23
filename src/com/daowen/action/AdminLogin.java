package com.daowen.action;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.daowen.bll.SystemParam;
import com.daowen.dal.DALBase;
import com.daowen.entity.*;

@Controller
public class AdminLogin  {

	@RequestMapping("/admin/login.do")
	public void execute(HttpServletRequest request,HttpServletResponse response) {
		
		
		String actiontype = request.getParameter("actiontype");
		System.out.println("actiontype=" + actiontype);

		// 登录
		if (actiontype.equals("login")) {
			login(request, response);
		}

		
	}

	private void login(HttpServletRequest request, HttpServletResponse response) {

		String usertype = request.getParameter("usertype");

		String validcode = (String) request.getSession().getAttribute(
				"validcode");

		String inputvalidcode = request.getParameter("validcode");

		if (validcode != null && !validcode.equals(inputvalidcode)) {

			System.out.println("系统验证错误");
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>系统验证码错误");

			// 分发请求参数
			dispatchParams(request, response);
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return;

		}

		System.out.println("验证码=" + validcode);

		if (usertype != null && usertype.equals("0")) {
			adminLogin(request, response);

		}

		
		

	}

	private void adminLogin(HttpServletRequest request,
			HttpServletResponse response) {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");

		

		Users u = (Users) DALBase.load("users", " where username='" + username
				+ "' and password='" + password + "'");

		if (u != null) {

			HttpSession session = request.getSession();
			u.setLogtimes(u.getLogtimes() + 1);
			DALBase.update(u);
			session.setAttribute("users", u);

			try {
				response.sendRedirect(SystemParam.getSiteRoot()
						+ "/admin/index.jsp");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {

			// 分发
			dispatchParams(request, response);
			request.setAttribute("errmsg",
					"<img src=\"images/error.gif\"/>用户与密码不匹配");

			System.out.println("系统用户登录失败");
			try {
				request.getRequestDispatcher("/admin/login.jsp").forward(
						request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}
	
  

	public void dispatchParams(HttpServletRequest request,
			HttpServletResponse response) {
		Enumeration params = request.getParameterNames();
		while (params.hasMoreElements()) {
			String paramname = params.nextElement().toString();
			String value = request.getParameter(paramname);
			request.setAttribute(paramname, value);

		}
	}

}
