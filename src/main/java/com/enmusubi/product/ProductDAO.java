package com.enmusubi.product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
//import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class ProductDAO {
	
	private static ArrayList<ProductDTO> products;

	public static void getAllTemplate(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		String sql = "select * from s_template";
		
		try {
		    con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			
			products = new ArrayList<ProductDTO>();
			ProductDTO p = null;
			while (rs.next()) {
				p = new ProductDTO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5));
				products.add(p);
				System.out.println(rs.getInt(1));
			}
			request.setAttribute("products", products);
			
		} catch (Exception e) {
			    e.printStackTrace();
			    System.out.println("server err...");
			} finally {
			    dbManager.close(con, pstmt, rs);
			}
		
	}

	public static void getTemplateForm(HttpServletRequest request) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
		String sql = "select t_template from s_template where t_pk = ?";
		
		try {
		    con = dbManager.connect();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("templatePK"));
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				System.out.println("템플릿 겟또!");
				request.setAttribute("templateForm", rs.getString("t_template"));
				request.setAttribute("t_pk", request.getParameter("templatePK"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("서버 에-러");
		} finally {
			dbManager.close(con, pstmt, rs);
		}
		
	}
	
	public static void regIvitation(HttpServletRequest request) {
		Connection con = null;
//		PreparedStatement pstmtEventNo = null;
		PreparedStatement pstmtWeddingInfo = null;
		PreparedStatement pstmtWedding = null;
		PreparedStatement pstmtReception = null;
//		ResultSet rs = null;
		DBManager dbManager = DBManager.getInstance();
		
//		create sequence e_no_seq;
																//	e_no
		String sqlWeddingInfo = "insert into s_wedding_info values(e_no_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		String sqlWedding = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		String sqlReception = "insert into s_reception values(s_reception_seq.nextval, e_no_seq.currval, ?, ?, ?, ?, ?)";
		
		try {
			 con = dbManager.connect();
			 
			 pstmtWeddingInfo = con.prepareStatement(sqlWeddingInfo);
			 pstmtWedding = con.prepareStatement(sqlWedding);
			 pstmtReception = con.prepareStatement(sqlReception);
			 
			 
			String path = request.getServletContext().getRealPath("product/imgFolder");
			MultipartRequest mr = new MultipartRequest(
										request, path, 1024*1024*20,
										"utf-8", new DefaultFileRenamePolicy());
			
			// 외래키 유효성 검사 
			
			int templatePK = Integer.parseInt(mr.getParameter("templatePK"));
			if (!isTemplatePKValid(templatePK)) {
				System.out.println("유효 PK 아님");
				return;
			}
			
			
			// s_wedding_info table 삽입
			
//			System.out.println(mr.getParameter("templatePK"));
			System.out.println(mr.getParameter("groomRomaL"));
			String groomName_kanji = mr.getParameter("groomKanjiL") + " " + mr.getParameter("groomKanjiF");
			String groomName_kana = mr.getParameter("groomKanaL")+ " " + mr.getParameter("groomKanaF");
			String groomName_roma = mr.getParameter("groomRomaL")+ " " + mr.getParameter("groomRomaF");
			String brideName_kanji = mr.getParameter("brideKanjiL") + " " + mr.getParameter("brideKanjiF");
			String brideName_kana = mr.getParameter("brideKanaL")+ " " + mr.getParameter("brideKanaF");
			String brideName_roma = mr.getParameter("brideRomaL")+ " " + mr.getParameter("brideRomaF");
			String hello = mr.getParameter("helloMessage");
			String bye = mr.getParameter("byeMessage");
			hello = hello.replaceAll("\r\n", "<br>");
			bye = bye.replaceAll("\r\n", "<br>");
			
			System.out.println(templatePK + " " + groomName_kanji+ " " + groomName_kana + " " + groomName_roma + " " +
					brideName_kanji + " " + brideName_kana + " " + brideName_roma + " " + " " + hello + " "+ bye);
			
			
			pstmtWeddingInfo.setInt(1, templatePK);
			pstmtWeddingInfo.setString(2, groomName_kanji);
			pstmtWeddingInfo.setString(3, groomName_kana);
			pstmtWeddingInfo.setString(4, groomName_roma);
			pstmtWeddingInfo.setString(5, brideName_kanji);
			pstmtWeddingInfo.setString(6, brideName_kana);
			pstmtWeddingInfo.setString(7, brideName_roma);
			pstmtWeddingInfo.setString(8, hello);
			pstmtWeddingInfo.setString(9, bye);
			pstmtWeddingInfo.setString(10, mr.getFilesystemName("photo1"));
			pstmtWeddingInfo.setString(11, mr.getFilesystemName("photo2"));
			pstmtWeddingInfo.setString(12, mr.getFilesystemName("photo3"));
			pstmtWeddingInfo.setString(13, mr.getFilesystemName("photo4"));
			
			
			//s_reception 테이블 삽입 
			String weddingDay = mr.getParameter("weddingDay");
			System.out.println(weddingDay);
			System.out.println(weddingDay.charAt(11));
			
			String day = weddingDay.charAt(11) + ""; // 요일
			String remove = weddingDay.replace(day, "").trim(); // 요일 제거버전
			
			String m_time = mr.getParameter("marriageTime");
			String m_timeA = mr.getParameter("marriageTime_a");
			String r_time = mr.getParameter("receptionTime");
			String r_timeA = mr.getParameter("receptionTime_a");
//			System.out.println(m_time);
			String weddingTime = remove + " " + m_time;
			String receptionTime = remove + " " + r_time;
			String weddingAssemleTime = remove + " " + m_timeA;
			String receptionAssembleTime = remove + " " + r_timeA;
			System.out.println(weddingTime);
			
			
			SimpleDateFormat dateTimeFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
			Date weddingT = dateTimeFormat.parse(weddingTime);
			Date receptionT = dateTimeFormat.parse(receptionTime);
			Date weddingAT = dateTimeFormat.parse(weddingAssemleTime);
			Date receptionAT = dateTimeFormat.parse(receptionAssembleTime);
			java.sql.Timestamp wedding_time = new java.sql.Timestamp(weddingT.getTime());
			java.sql.Timestamp reception_time = new java.sql.Timestamp(receptionT.getTime());
			java.sql.Timestamp wedding_assemble_time = new java.sql.Timestamp(weddingAT.getTime());
			java.sql.Timestamp reception_assemble_time = new java.sql.Timestamp(receptionAT.getTime());
			System.out.println(wedding_time);
			
			
//			SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
//			Date weddingAT = timeFormat.parse(m_timeA);
//			Date receptionAT = timeFormat.parse(r_timeA);
			System.out.println(wedding_assemble_time);

			
					
//			System.out.println("m_time : " + m_timeA);
//			
//			Date weddingAssemble = timeFormat.parse(m_timeA);
//			java.sql.Date weddingA = new java.sql.Date(weddingAssemble.getTime());

			
			
			// 본식
			pstmtWedding.setTimestamp(1, wedding_time);   // weddingday+marriagetime
			pstmtWedding.setString(2, mr.getParameter("marriage_place"));
			pstmtWedding.setString(3, mr.getParameter("marriage_addr"));
			pstmtWedding.setTimestamp(4, wedding_assemble_time);
			pstmtWedding.setString(5, "wedding");
			
			// 본식
			pstmtReception.setTimestamp(1, reception_time);   // weddingday+marriagetime
			pstmtReception.setString(2, mr.getParameter("reception_place"));
			pstmtReception.setString(3, mr.getParameter("reception_addr"));
			pstmtReception.setTimestamp(4, reception_assemble_time);
			pstmtReception.setString(5, "reception");
						
			if (pstmtWeddingInfo.executeUpdate() == 1) {
				System.out.println("weddinginfo - 성공");
			}
			if (pstmtWedding.executeUpdate() == 1) {
				System.out.println("wedding - 성공");
			}
			if (pstmtReception.executeUpdate() == 1) {
				System.out.println("reception - 성공");
			}
			
		} catch (Exception e) {
		    e.printStackTrace();
		    System.out.println("server err...");
		} finally {
		   dbManager.close(null, pstmtReception, null);
		   dbManager.close(null, pstmtWedding, null);
		   dbManager.close(con, pstmtWeddingInfo, null);
		   
		}
		
	}


    private static boolean isTemplatePKValid(int templatePK) {
    	return true; // 항상 유효
    }


}
