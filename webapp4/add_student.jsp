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
     String name = request.getParameter("name");
     String course = request.getParameter("course");
     int semester = Integer.parseInt(request.getParameter("semester"));
     String division = request.getParameter("division");

     String sql = "INSERT INTO student (name, course, semester, division) VALUES(?, ?, ?, ?)";

     PreparedStatement ps = connection.prepareStatement(sql);

     ps.setString(1, name);
     ps.setString(2, course);
     ps.setInt(3, semester);
     ps.setString(4, division);

     ps.executeUpdate();

     response.sendRedirect("index.jsp");
%>