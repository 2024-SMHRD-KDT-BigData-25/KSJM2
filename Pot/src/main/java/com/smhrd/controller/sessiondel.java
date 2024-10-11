package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/jsp/sessiondel")
public class sessiondel extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		session.invalidate();
		
		 response.setContentType("text/html;charset=UTF-8");
         response.getWriter().println("<html>");
         response.getWriter().println("<head><title>로그인 실패</title></head>");
         response.getWriter().println("<body>");
         response.getWriter().println("<script type='text/javascript'>");
         response.getWriter().println("window.close();"); // 이전 페이지로 돌아가기
         response.getWriter().println("</script>");
         response.getWriter().println("</body>");
         response.getWriter().println("</html>");
	}

}
