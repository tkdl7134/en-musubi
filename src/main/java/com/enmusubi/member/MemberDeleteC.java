package com.enmusubi.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/MemberDeleteC")
public class MemberDeleteC extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서 로그인 정보 가져오기
		HttpSession session = request.getSession();
		String m_id = (String) session.getAttribute("m_id");

		if (m_id == null) {
			// 로그인되지 않은 경우 로그인 페이지로 이동
			response.sendRedirect("loginPage/login.jsp");
			return;
		}

		MemberDAO dao = new MemberDAO();
		try {
			int result = dao.deleteMember(m_id);
			if (result == 1) {
				// 탈퇴 성공 처리
				session.invalidate(); // 세션 무효화
				response.sendRedirect("main.jsp"); // 메인 페이지로 이동
			} else {
				// 탈퇴 실패 처리
				request.setAttribute("error", "탈퇴 실패");
				request.getRequestDispatcher("myPage/mypage.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			// 에러 페이지로 이동 등 예외 처리
		}

		doGet(request, response);
	}

}
