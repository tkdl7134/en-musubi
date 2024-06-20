package com.enmusubi.mytemplate;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import com.enmusubi.main.DBManager;

public class mytemplateDAO {

    private static ArrayList<mytemplateDTO> templates;

    // 모든 템플릿을 가져오는 메서드
    public static void getAllTemplate(HttpServletRequest request) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * "
                + "FROM s_wedding_info sw "
                + "LEFT OUTER JOIN s_event se ON se.e_no = sw.e_no "
                + "LEFT OUTER JOIN s_template st ON st.t_pk = sw.t_pk "
                + "WHERE sw.e_no = ?";

        try {
            // 데이터베이스 연결
            con = DBManager.connect();
            System.out.println("Database connected");

            // SQL 쿼리 준비
            pstmt = con.prepareStatement(sql);

            // 쿼리 실행
            rs = pstmt.executeQuery();

            // 템플릿 데이터를 저장할 ArrayList 초기화
            templates = new ArrayList<mytemplateDTO>();
            while (rs.next()) {
                // 결과에서 각 필드를 가져와서 mytemplateDTO 객체를 생성
                String m_id = rs.getString("m_id");
                int e_no = rs.getInt("e_no");
                int t_pk = rs.getInt("t_pk");
                String t_title = rs.getString("t_title");
                String t_preview = rs.getString("t_preview");
                String t_example = rs.getString("t_example");
                String t_template = rs.getString("t_template");
                
                String w_groom = rs.getString("w_groom");
                String w_bride = rs.getString("w_bride");
                String w_img1 = rs.getString("w_img1");
                String w_img2 = rs.getString("w_img2");
                String w_img3 = rs.getString("w_img3");

                // 로그 출력 (디버깅 용도)
                System.out.println("Preview URL: " + t_preview);

                // mytemplateDTO 객체를 생성하여 리스트에 추가
                mytemplateDTO t = new mytemplateDTO(e_no, t_pk, m_id, t_title, t_preview, t_example, t_template, w_groom, w_bride, w_img1, w_img2, w_img3);
                templates.add(t);
            }

            // 만약 templates가 비어 있으면 로그를 출력
            if (templates.isEmpty()) {
                System.out.println("No templates found");
            }

            // 요청 객체에 템플릿 리스트를 속성으로 추가
            request.setAttribute("templates", templates);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SERVER ERROR - get all template");
        } finally {
            // 데이터베이스 자원 닫기
            DBManager.close(con, pstmt, rs);
        }
    }

    // 페이지네이션을 사용하여 템플릿을 가져오는 메서드
    public static void getTemplates(HttpServletRequest request, int page, int itemsPerPage) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int offset = (page - 1) * itemsPerPage;
        int end = page * itemsPerPage;

        String sql = "SELECT * FROM ( "
                + "SELECT sw.e_no, st.t_pk, st.t_title, st.t_preview, st.t_example, st.t_template, se.m_id, "
                + "sw.w_groom, sw.w_bride, sw.w_img1, sw.w_img2, sw.w_img3, "
                + "ROW_NUMBER() OVER (ORDER BY st.t_pk) AS rnum "
                + "FROM s_template st "
                + "JOIN s_wedding_info sw ON sw.t_pk = st.t_pk "
                + "JOIN s_event se ON se.e_no = sw.e_no "
                + "WHERE se.m_id = 'testuser' "
                + ") WHERE rnum BETWEEN ? AND ?";

        try {
            con = DBManager.connect();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, offset + 1); // 1-based offset
            pstmt.setInt(2, end);
            System.out.println("Executing SQL query with params: " + (offset + 1) + ", " + end);
            rs = pstmt.executeQuery();

            templates = new ArrayList<mytemplateDTO>();
            while (rs.next()) {
                String m_id = rs.getString("m_id");
                int e_no = rs.getInt("e_no");
                int t_pk = rs.getInt("t_pk");
                String t_title = rs.getString("t_title");
                String t_preview = rs.getString("t_preview");
                String t_example = rs.getString("t_example");
                String t_template = rs.getString("t_template");
                
                String w_groom = rs.getString("w_groom");
                String w_bride = rs.getString("w_bride");
                String w_img1 = rs.getString("w_img1");
                String w_img2 = rs.getString("w_img2");
                String w_img3 = rs.getString("w_img3");
                
                System.out.println("Preview URL: " + t_preview);

                mytemplateDTO t = new mytemplateDTO(e_no, t_pk, m_id, t_title, t_preview, t_example, t_template, w_groom, w_bride, w_img1, w_img2, w_img3);
                templates.add(t);
            }
            
            request.setAttribute("templates", templates);

            sql = "SELECT COUNT(*) "
                    + "FROM s_template st "
                    + "JOIN s_wedding_info sw ON sw.t_pk = st.t_pk "
                    + "JOIN s_event se ON se.e_no = sw.e_no "
                    + "WHERE se.m_id = 'testuser'";
            
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                int totalItems = rs.getInt(1);
                int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);
                request.setAttribute("totalPages", totalPages);
                request.setAttribute("currentPage", page);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("SERVER ERROR - get templates with pagination");
        } finally {
            DBManager.close(con, pstmt, rs);
        }
    }

}
