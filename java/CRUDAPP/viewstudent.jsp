<%@ page import="java.sql.*" %>
<%@ page import="com.student.Config" %>

<!DOCTYPE html>
<html>

<head>
    <title>View Students</title>
</head>

<body>

<h2>Student List</h2>

<table border="1" cellpadding="10">

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Course</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {

        con = Config.getConnection();

        String sql = "SELECT * FROM students";

        ps = con.prepareStatement(sql);

        rs = ps.executeQuery();

        while (rs.next()) {
%>

    <tr>

        <td><%= rs.getInt("id") %></td>

        <td><%= rs.getString("name") %></td>

        <td><%= rs.getString("email") %></td>

        <td><%= rs.getString("course") %></td>

        <td>
            <a href="updatestudent.jsp?id=<%= rs.getInt("id") %>">
            Edit
            </a>
            
        </td>
        <td>
            <a href="deletestudent.jsp?id=<%= rs.getInt("id") %>"
               onclick="return confirm('Are you sure you want to delete this student?');">
                Delete
            </a>
        </td>

    </tr>

<%
        }

    } catch (Exception e) {

        out.println("<p>Error: " + e.getMessage() + "</p>");

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

</table>

<br>

<a href="addstudent.jsp">Add Student</a>

</body>

</html>