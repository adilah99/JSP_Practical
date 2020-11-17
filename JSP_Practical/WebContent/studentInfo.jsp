<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StudentInfo</title>
</head>
<body>
<h1>Student Information System</h1>
<p>
      <%
      boolean login=false;
      String driverName="com.mysql.jdbc.Driver";
      String connectionURL="jdbc:mysql://localhost:3306/";
      String dbName="db1";
      String userId="root";
      String password="1234";

      Connection connection=null;
      Statement statement=null;
      
      try{
        Class.forName(driverName);
        connection=DriverManager.getConnection(connectionURL+dbName,userId,password);
        PreparedStatement stmt=connection.prepareStatement("select name from student where id=? and password=?");
        stmt.setString(1,request.getParameter("id"));
        stmt.setString(2,request.getParameter("password"));
        System.out.println(stmt);
        ResultSet rs=stmt.executeQuery();
        	if(rs.next()){
        		login=true;
        	}
      } catch(Exception e){
    	  out.println(e.getMessage());
      }
      if(login){
      %>
      <%out.println("Hello");%>
      <%=request.getParameter("id")%>
      
      
      <%
      try{
      	statement=connection.createStatement();
      	ResultSet rs=statement.executeQuery("select id, name, department from student");
      %>
      
      <table border="1">
      <tr>
      	<th>ID</th>
      	<th>Name</th>
      	<th>Department</th>
      </tr>
      
      <%
      while(rs.next()){
      %>
      
      <tr>
      	<td><%=rs.getString("id")%></td>
      	<td><%=rs.getString("name")%></td>
      	<td><%=rs.getString("department")%></td>
      </tr>
      
      <%
      }
      %>
      </table>
      
      <p>
      <a href="addStudent.html"><button type='addStudent'>Add Student</button></a>
      <a href="studentMark.jsp?<%=request.getParameter("id")%>"><button type='marks'>View Marks</button></a>
      </p>
      
      <%
      } catch(Exception e){
      out.println(e.getMessage());
      }
      }else{
      %>
      <p>login failed</p>	
      <%
      }
      %>
</p>
</body>
</html>