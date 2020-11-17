<%@ page import="java.io.*,java.util.*,java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>successfully add marks...</title>
</head>
<body>
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
		  
		   PreparedStatement stmt= connection.prepareStatement("insert into marks values (?,?,?,?)");
		   stmt.setString(1, request.getParameter("id"));
		   stmt.setString(2, request.getParameter("science"));
		   stmt.setString(3, request.getParameter("math"));
		   stmt.setString(4, request.getParameter("english"));
		 
		   System.out.println(stmt);
		   
		   int row = stmt.executeUpdate();
		   if(row>0) {
			   out.println(row + " new student marks successfully added");
		   }   else {
			   out.println("Failed to add new marks");
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
   <form method="get" action="addMark.html">
	<p><input type="submit" value="Go Back to Add More Student Marks"></p>
</form>

<form method="get" action="studentMark.jsp">
	<p><input type="submit" value="View Mark"></p>
</form>
  
</body>
</html>