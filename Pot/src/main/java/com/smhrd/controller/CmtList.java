package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.CmtDAO;
import com.smhrd.model.PotCmt;


@WebServlet("/jsp/CmtList")
public class CmtList extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
			
			CmtDAO dao = new CmtDAO();
			List<PotCmt> list = dao.getList(sns_idx);
			
			Gson gson = new Gson();
			String json = gson.toJson(list);
			
			
	}

}
