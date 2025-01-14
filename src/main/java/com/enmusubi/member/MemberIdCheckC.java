package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/MemberIdCheckC")
public class MemberIdCheckC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDAO.MemberIdCheckCDoGet(request, response);
		
		request.getRequestDispatcher("regPage/idCheck.jsp").forward(request, response); // 결과 페이지로 포워딩
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		MemberDAO.MemberIdCheckCDoPost(request, response);
		

	}
}