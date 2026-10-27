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
     String sql = "SELECT * FROM student";
     PreparedStatement ps = connection.prepareStatement(sql);
     ResultSet rs = ps.executeQuery();   
%>
<form action="add_student.jsp" method="post">
     <input type="text" name="name" placeholder="Enter Name"/>
     <input type="text" name="course" placeholder="Enter Course"/>
     <input type="number" name="semester" placeholder="Enter Semester"/>
     <input type="text" name="division" placeholder="Enter Division"/>
     <input type="submit" value="Add Student">
</form>
<table border="1" width="75%">
     <thead>
          <tr>
               <th>ID</th>
               <th>NAME</th>
               <th>COURSE</th>
               <th>SEMESTER</th>
               <th>DIVISION</th>
               <th>ACTION</th>
          </tr>
     </thead>
     <tbody>
          <%
               while(rs.next()) {
          %>
          <tr>
               <td><%= rs.getInt(1) %></td>
               <td><%= rs.getString(2) %></td>
               <td><%= rs.getString(3) %></td>
               <td><%= rs.getInt(4) %></td>
               <td><%= rs.getString(5) %></td>
               <td>
                    <a href="delete_student.jsp?id=<%= rs.getInt(1) %>">DELETE</a>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="update_student.jsp?id=<%= rs.getInt(1) %>">UPDATE</a>
               </td>
          </tr>
          <%
               }
          %>
     </tbody>
</table>