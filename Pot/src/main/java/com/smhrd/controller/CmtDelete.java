package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.CmtDAO;

@WebServlet("/jsp/CmtDelete")
public class CmtDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int cmt_idx = Integer.parseInt(request.getParameter("cmt_idx"));
		
		CmtDAO dao = new CmtDAO();
		
		int res = dao.delete(cmt_idx);
		
		PrintWriter out = response.getWriter();
		out.print(res);
	}

}
