package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;


@WebServlet("/html/FindId")
public class FindId extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// post 방식 요청 파라미터 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		 PotUsers findid = new PotUsers(null, null, user_name, null, user_phone, null, null, null);
		
		MemberDAO dao = new MemberDAO();
		
		PotUsers res = dao.findid(findid);
		
		if(res == null) {
			response.sendRedirect("../jsp/findid_result.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("member", res);
			response.sendRedirect("../jsp/findid_result.jsp");
	}

	}
	
}
