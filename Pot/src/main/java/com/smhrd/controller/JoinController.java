package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;


@WebServlet("/JoinController")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 요청 파라미터 받기 (아이디, 비밀번호, 닉네임 -> 한글(인코딩))
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String phone = request.getParameter("phone");
		String postcode = request.getParameter("postcode");
		String address = request.getParameter("address");
		String addressdetails = request.getParameter("addressdetails");
		
		// MyBatis에는 하나로 묶어서 전달해야 함
		PotUsers joinMember = new PotUsers(id, pw, name, nick, phone, postcode, address, addressdetails);
		
		
		// MyBatis DB연동 프레임워크 사용해서 데이블에 값 저장
		// => 3가지 방법: DAO(*), @(Annotation), Mapper Interface
		MemberDAO dao = new MemberDAO();
		int res = dao.join(joinMember);
		
		System.out.println(res);
		
		// 회원가입 성공(res>0) => index.jsp / 실패 => join.html
		if(res>0) {
			response.sendRedirect("index.jsp");
		}else {
			response.sendRedirect("join.html");
		}
		
		
	}

}
