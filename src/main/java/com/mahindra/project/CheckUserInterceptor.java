package com.mahindra.project;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView; 
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.mahindra.project.model.UserDetails;
 

public class CheckUserInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws IOException {

		System.out.println("Intercept handler..");

		HttpSession session = request.getSession();

		String path = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println("path is: " + path);

		if (path.startsWith("/pdf") ) {
			return true;
		}
		
		try {
			String resourcesPath = path.substring(1, 4);
			System.out.println("substring is: " + resourcesPath);

			if (resourcesPath.equalsIgnoreCase("res")) {
				System.out.println("resource req : " + path);

				return true;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}

		if (path.equalsIgnoreCase("/sessionTimeOut") || path.equalsIgnoreCase("/")
				|| path.equalsIgnoreCase("/loginProcess")) {
			
			
			System.out.println("#Login req : " + path);
			return true;
		}else {
			System.out.println("#Other req : " + path);

			UserDetails userObj = null;
			try {

				userObj = (UserDetails) session.getAttribute("userDetail");

			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();

				System.out.println("User Details: " + userObj);
				response.sendRedirect(request.getContextPath() + "/sessionTimeOut");
				return false;
			}

			if(userObj ==null) {
				
				response.sendRedirect(request.getContextPath() + "/sessionTimeOut");
				return false;
			}else {
				
				return true;
			}
			
			/*
			 * try { if(request.getServletPath().equals("/") ||
			 * request.getServletPath().equals("/loginProcess")
			 * ||request.getServletPath().equals("/logout")
			 * ||request.getServletPath().equals("/login")){
			 * //||request.getServletPath().equals("/logout")
			 * System.out.println("Login request"); return true; } else if( userObj == null
			 * ) { System.out.println("Session Expired");
			 * 
			 * // request.setAttribute("emassage", "login failed");
			 * response.sendRedirect(request.getContextPath()+"/sessionTimeOut");
			 * 
			 * return false; }else{ return true; } }catch (Exception e) {
			 * e.printStackTrace();
			 * response.sendRedirect(request.getContextPath()+"/sessionTimeOut");
			 * 
			 * return false; }
			 */

		}

	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

		System.out.println("post intercept hanlder");
		super.postHandle(request, response, handler, modelAndView);
	}

}