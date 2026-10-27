<%@ page import="java.sql.*" %>
<%@ page import="com.student.Config" %>

<%
    String id = request.getParameter("id");

    String name = "";
    String email = "";
    String course = "";

    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        con = Config.getConnection();

        if (request.getMethod().equalsIgnoreCase("POST")) {

            name = request.getParameter("name");
            email = request.getParameter("email");
            course = request.getParameter("course");

            String sql = "UPDATE students SET name=?, email=?, course=? WHERE id=?";

            ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, course);
            ps.setInt(4, Integer.parseInt(id));

            ps.executeUpdate();

            response.sendRedirect("viewstudent.jsp");

            return;
        }

        String sql = "SELECT * FROM students WHERE id=?";

        ps = con.prepareStatement(sql);

        ps.setInt(1, Integer.parseInt(id));

        rs = ps.executeQuery();

        if (rs.next()) {

            name = rs.getString("name");
            email = rs.getString("email");
            course = rs.getString("course");
        }

    } catch (Exception e) {

        out.println("Error: " + e.getMessage());

    } finally {

        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>

<head>
    <title>Edit Student</title>
</head>

<body>

<h2>Edit Student</h2>

<form method="post">

    <label>Name:</label>
    <input type="text" name="name" value="<%= name %>" required>

    <br><br>

    <label>Email:</label>
    <input type="email" name="email" value="<%= email %>" required>

    <br><br>

    <label>Course:</label>
    <input type="text" name="course" value="<%= course %>" required>

    <br><br>

    <input type="submit" value="Update Student">

</form>

<br>

<a href="viewstudent.jsp">Back to Students</a>

</body>

</html>