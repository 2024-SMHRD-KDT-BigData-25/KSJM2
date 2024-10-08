package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CmtDAO;
import com.smhrd.model.PotCmt;


@WebServlet("/jsp/CmtInsert")
public class CmtInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int sns_idx = Integer.parseInt(request.getParameter("sns_idx")); 
		String user_id = request.getParameter("user_id");
		String cmt_content = request.getParameter("cmt_content");
		
		PotCmt cmtwrite = new PotCmt(sns_idx, user_id, cmt_content);
		
		CmtDAO dao = new CmtDAO();
		int res = dao.writeCmt(cmtwrite);
		
		if(res>0) {
			System.out.println("성공");
			response.sendRedirect("snsview.jsp?sns_idx=" + sns_idx);
		}else {
			System.out.println("실패");
			response.sendRedirect("snsview.jsp?sns_idx=" + sns_idx);
		}
		
		
	}

}
