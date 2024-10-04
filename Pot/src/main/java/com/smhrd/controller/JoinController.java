package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;


@WebServlet("/html/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 받기 (아이디, 비밀번호, 닉네임 -> 한글(인코딩))
		request.setCharacterEncoding("UTF-8");
		
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
		String user_name = request.getParameter("user_name");
		String user_nick = request.getParameter("user_nick");
		String user_phone = request.getParameter("user_phone");
		String user_post = request.getParameter("user_post");
		String user_addr1 = request.getParameter("user_addr1");
		String user_addr2 = request.getParameter("user_addr2");
		
		// MyBatis에는 하나로 묶어서 전달해야 함
		PotUsers joinMember = new PotUsers(user_id, user_pw, user_name, user_nick, user_phone, user_post, user_addr1, user_addr2);
		
		
		// MyBatis DB연동 프레임워크 사용해서 데이블에 값 저장
		// => 3가지 방법: DAO(*), @(Annotation), Mapper Interface
		MemberDAO dao = new MemberDAO();
		int res = dao.join(joinMember);
		
		System.out.println(res);
		
		// 회원가입 성공(res>0) => index.jsp / 실패 => join.html
		if(res>0) {
			response.sendRedirect("main.html");
		}else {
			response.sendRedirect("join.html");
		}
		
		
	}

}
