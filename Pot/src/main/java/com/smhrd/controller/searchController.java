package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.PlantDAO;
import com.smhrd.model.PotPlant;

/**
 * Servlet implementation class searchController
 */
@WebServlet("/jsp/searchController")
public class searchController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String pl_search = request.getParameter("pl_search");
		
		PlantDAO dao = new PlantDAO();
		
		List<PotPlant> list = dao.search(pl_search);
		
		HttpSession session = request.getSession();
		session.setAttribute("search", list);
		response.sendRedirect("searchList.jsp");
		
		
	}

}
