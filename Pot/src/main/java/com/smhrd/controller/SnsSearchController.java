package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PlantDAO;
import com.smhrd.model.PotPlant;
import com.smhrd.model.PotSns;
import com.smhrd.model.SnsDAO;


@WebServlet("/jsp/SnsSearchController")
public class SnsSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String sns_search2 = request.getParameter("search");
		
		SnsDAO dao = new SnsDAO();
		
		List<PotSns> list = dao.search(sns_search2);
		
		HttpSession session = request.getSession();
		RequestDispatcher sns_search = request.getRequestDispatcher("snslist.jsp");
		request.setAttribute("sns_search", list);
		sns_search.forward(request, response);
	}

}
