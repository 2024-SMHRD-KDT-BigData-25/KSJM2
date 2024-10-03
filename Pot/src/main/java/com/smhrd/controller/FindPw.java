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

@WebServlet("/FindPw")
public class FindPw extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// post 방식 요청 파라미터 인코딩
		request.setCharacterEncoding("UTF-8");
		
		
		// 사용자의 아이디, 이름, 연락처 정보 받기
		String user_id = request.getParameter("user_id");
		String user_name = request.getParameter("user_name");
		String user_phone = request.getParameter("user_phone");
		
		PotUsers findwd = new PotUsers(user_id, null, user_name, null, user_phone, null, null, null);
		
		MemberDAO dao = new MemberDAO();
		
		PotUsers res = dao.findpw(findwd);
		
		if(res == null) {
			response.sendRedirect("findpw_result.jsp");
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("member", res);
			response.sendRedirect("findpw_result.jsp");
		}
		
		
	}

}
