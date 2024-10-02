package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.PotUsers;

@WebServlet("/idCheckCon")
public class idCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		
		
		MemberDAO dao = new MemberDAO();
		
		int res = dao.confirmID(id);
		
		
		
		System.out.println(res);
		
		
		request.setAttribute("id", id);
		request.setAttribute("res", res);
		
		RequestDispatcher rd = request.getRequestDispatcher("idCheck.jsp");
		rd.forward(request,response);	
	}

}
