<%@ page import="java.sql.*" %>
<%@ page import="com.student.Config" %>

<%
    String message = "";

    if (request.getMethod().equalsIgnoreCase("POST")) {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        Connection con = Config.getConnection();

        String sql = "INSERT INTO students (name, email, course) VALUES (?, ?, ?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, course);

        ps.executeUpdate();

        message = "Student added successfully!";

        ps.close();
        con.close();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
</head>

<body>

<h2>Add Student</h2>

<%
    if (!message.equals("")) {
%>

<script>
    alert("<%= message %>");
</script>

<%
    }
%>

<form method="post">

    <label>Name:</label>
    <input type="text" name="name" required>
    <br><br>

    <label>Email:</label>
    <input type="email" name="email" required>
    <br><br>

    <label>Course:</label>
    <input type="text" name="course" required>
    <br><br>

    <input type="submit" value="Add Student">

</form>

<br>

<a href="viewstudent.jsp">View Students</a>

</body>
</html>

