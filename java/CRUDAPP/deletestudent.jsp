<%@ page import="java.sql.*" %>
<%@ page import="com.student.Config" %>

<%
    String id = request.getParameter("id");

    Connection con = null;
    PreparedStatement ps = null;

    try {

        con = Config.getConnection();

        String sql = "DELETE FROM students WHERE id=?";

        ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(id));

        ps.executeUpdate();

        response.sendRedirect("viewstudent.jsp");

    } catch (Exception e) {

        out.println("Error: " + e.getMessage());

    } finally {

        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>