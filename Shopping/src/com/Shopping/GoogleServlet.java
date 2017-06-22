package com.Shopping;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

public class GoogleServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.setCharacterEncoding("UTF-8");
		PrintWriter out=resp.getWriter();
		out.println("<HTML><BODY>");
		UserService userService=UserServiceFactory.getUserService();
		User user=userService.getCurrentUser();
		if(user==null){
			String loginURL=userService.createLoginURL("/google");
			out.println("尚未登入");
			out.println("<a href=\""+loginURL+"\">登入Google</a>");
		}else{
			out.println("E-Mail: "+user.getEmail());
			out.println("<a href=\""+userService.createLogoutURL("/google")+"\">登出Google</a>");
		}
		out.println("</HTML></BODY>");
	}

}