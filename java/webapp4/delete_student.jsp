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

     String sql = "DELETE FROM student WHERE id = ?";
     PreparedStatement ps = connection.prepareStatement(sql);
     ps.setInt(1, id);
     ps.executeUpdate();
     response.sendRedirect("index.jsp");
%>