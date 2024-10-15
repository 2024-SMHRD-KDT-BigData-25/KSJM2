package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ChatDAO;
import com.smhrd.model.PotChat;

/**
 * Servlet implementation class makechatroom
 */
@WebServlet("/jsp/makechatroom")
public class makechatroom extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		request.setCharacterEncoding("UTF-8");
		
		int sale_idx = Integer.parseInt(request.getParameter("sale_idx"));
		String sale_id = request.getParameter("sale_id");
		String user_id = request.getParameter("user_id");
		
		PotChat chat = new PotChat(sale_idx, sale_id, user_id);
		
		ChatDAO dao = new ChatDAO();
		
		int res = dao.makeChatRoom(chat);
		
		PotChat room =  dao.getchat(chat);
		
		
		if(room != null) {
			HttpSession session = request.getSession();
			session.setAttribute("chatroom", room);
		response.sendRedirect("chat.jsp?chat_idx=" + room.getChat_idx());
		}
		
		
		
		
	}

}
