package com.enmusubi.product;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/InvitationUpdateC")
public class InvitationUpdateC extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO.getOneInvitation(request);
		request.setAttribute("settingPage", "jsp/invitationUpdate.jsp");
		request.getRequestDispatcher("product/index.jsp").forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDAO.updateInvitaion(request);
		
		ProductDAO.getInvitation(request); // eno넘겨주기
		request.setAttribute("settingPage", "jsp/invitationPreview.jsp");
		request.getRequestDispatcher("product/index.jsp").forward(request, response);
	}

}