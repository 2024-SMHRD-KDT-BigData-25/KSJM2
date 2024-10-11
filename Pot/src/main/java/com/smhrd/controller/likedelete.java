package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.LikeDAO;
import com.smhrd.model.PotLike;

@WebServlet("/jsp/likedelete")
public class likedelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int sns_idx = Integer.parseInt(request.getParameter("sns_idx"));
		String user_id = request.getParameter("user_id");
		
		PotLike like = new PotLike(sns_idx, user_id);
		
		LikeDAO dao = new LikeDAO();
		
		int res = dao.delete(like);
		
		if(res>0) {
			
			response.sendRedirect("snsview.jsp?sns_idx=" + sns_idx);
		}
	}

}
