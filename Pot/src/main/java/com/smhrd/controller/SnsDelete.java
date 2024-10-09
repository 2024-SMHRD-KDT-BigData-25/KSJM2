package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.SnsDAO;

@WebServlet("/jsp/SnsDelete")
public class SnsDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
		
		System.out.println("sns_idx: " + sns_idx);
		
		SnsDAO dao = new SnsDAO();
		
		int res = dao.delete(sns_idx);
	
		if(res>0) {
			System.out.println("삭제 성공");
			response.sendRedirect("snslist.jsp");
		} else {
			System.out.println("삭제 실패");
			response.sendRedirect("snslist.jsp");
		}
	
	
	}

}
