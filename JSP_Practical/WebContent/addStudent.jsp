<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title> add new student</title>
</head>
<body>
<h1> New Student Information</h1>
<p>

    <%
	    boolean login=false;
	    //check uesrname and password in the database
	    //to connect to the database server
	    String driverName = "com.mysql.jdbc.Driver";
	    String connectionUrl = "jdbc:mysql://localhost:3306/";
	    String dbName = "db1";
	    String userId = "root";
	    String password = "1234";
	    
	    Connection connection = null;
    	Statement statement = null;
    	
	    try {
	    	login=true;
	    	//load the jdbc driver
	    	Class.forName(driverName);
			//connect to the database server	   
		    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
			
	    } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
		       
    if(login) {
	   try {
		   //update password
		   PreparedStatement stmt= connection.prepareStatement("insert into student values (?,?, ?, ?)");
		   stmt.setString(1, request.getParameter("id"));
		   stmt.setString(2, request.getParameter("password"));
		   stmt.setString(3, request.getParameter("name"));
		   stmt.setString(4, request.getParameter("department"));
		 
		   System.out.println(stmt);
		   
		   int row = stmt.executeUpdate();
		   if(row>0) {
			   out.println(row + " new student successfully added");
		   }   else {
			   out.println("Failed to add new student");
		   }
		   
   %>
   
   <% 
	   } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
   } else {
   %>
	    <p>login failed</p>
	    <% 
	    //out.println("login failed");
   }
   %>
   <form method="get" action="addStudent.html">
	<p><input type="submit" value="Go Back to Add More Student"></p>
</form>

<form method="get" action="index.html">
	<p><input type="submit" value="Go to Home Page"></p>
</form>
   

</body>
</html>