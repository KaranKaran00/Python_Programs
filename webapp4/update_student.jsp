<%@ page import="java.sql.*" %>
<% 
     Connection connection = null; 
     try {
          String dbUrl = "jdbc:mysql://localhost:3306/db1";
          String dbUser = "root";
          String dbPassword = "";
          Class.forName("com.mysql.cj.jdbc.Driver");
          connection = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
     } catch(Exception e) {
          
     }
     int id = Integer.parseInt(request.getParameter("id"));

     String sql = "SELECT * FROM student WHERE id = ?";
     PreparedStatement ps = connection.prepareStatement(sql);
     ps.setInt(1, id);

     ResultSet rs = ps.executeQuery();
     rs.next();
     String name = rs.getString(2);
     String course = rs.getString(3);
     int semester = rs.getInt(4);
     String division = rs.getString(5);
%>

<form action="update_student_process.jsp" method="post">
     <input type="text" name="name" placeholder="Enter Name" value="<%= name%>"/>
     <input type="text" name="course" placeholder="Enter Course" value="<%= course%>"/>
     <input type="number" name="semester" placeholder="Enter Semester" value="<%= semester%>"/>
     <input type="text" name="division" placeholder="Enter Division" value="<%= division%>"/>
     <input type="hidden" name="id" value="<%= id%>"/>
     <input type="submit" value="Update Student">
</form>
