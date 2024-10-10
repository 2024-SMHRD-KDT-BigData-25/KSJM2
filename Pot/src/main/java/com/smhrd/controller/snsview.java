package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.SnsDAO;


@WebServlet("/jsp/snsview")
public class snsview extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
		
		SnsDAO dao = new SnsDAO();
		
		int views = dao.views(sns_idx);
		
		Gson gson = new Gson();
		String json = gson.toJson(views);
		
		response.setCharacterEncoding("UTF-8");
		
		PrintWriter out = response.getWriter();
		
		out.print(json);
	}

}
