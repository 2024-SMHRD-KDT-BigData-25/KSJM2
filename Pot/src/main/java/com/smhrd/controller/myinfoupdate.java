package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;


@WebServlet("/jsp/myinfoupdate")
public class myinfoupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_nick = request.getParameter("user_nick");
		String user_post = request.getParameter("user_post");
		String user_addr1 = request.getParameter("user_addr1");
		String user_addr2 = request.getParameter("user_addr2");
		
		PotUsers updateMember = new PotUsers(user_id, user_pw, user_name, user_nick, null, user_post, user_addr1, user_addr2);
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.update(updateMember);
		
		if(res>0) {
			response.sendRedirect("mypage.jsp");
		}else {
			response.sendRedirect("myinfo_modify.jsp");
		}
	}

}
