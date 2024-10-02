package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;


@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 받기 post 방식 (아이디, 비밀번호, 닉네임 -> 한글(인코딩))
				request.setCharacterEncoding("UTF-8");
						
				String user_id = request.getParameter("user_id");
				String user_pw = request.getParameter("user_pw");
				
				PotUsers loginMember = new PotUsers(user_id, user_pw);
				
				MemberDAO dao = new MemberDAO();
				
				PotUsers res = dao.login(loginMember);
				
				if(res == null) {
					System.out.println("실패");
					response.sendRedirect("index.jsp");
				}else {
					System.out.println("성공");
					HttpSession session = request.getSession();
					session.setAttribute("member", res);
					response.sendRedirect("index.jsp");
				}

	}

}
