<%@ page import="java.io.*,java.util.*,java.sql.*" %>

<!DOCTYPE html>
<html>
  <head>
    <title>Student Marks</title>
  </head>
  <body>
  <h1>Student Average marks</h1>
    
    <p>

    <%
	    boolean login=false;
	    //check uesrname and password in the database
	    //to connect to the database server
	    String driverName = "com.mysql.jdbc.Driver";
	    String connectionUrl = "jdbc:mysql://localhost:3306/";
	    String dbName = "db1?useSSL=false";
	    String userId = "root";
	    String password = "1234";
	    
	    Connection connection = null;
    	Statement statement = null;
    	
	    try {
	    	//load the jdbc driver
	    	Class.forName(driverName);
			//connect to the database server	   
		    connection = DriverManager.getConnection(connectionUrl + dbName, userId, password);
		    login = true;
		 
	    } catch(Exception e) {
	    	out.println(e.getMessage());
	    }
		    
	    if(login) {
	    try {
		    statement = connection.createStatement();
		    ResultSet rs = statement.executeQuery("select * from marks ");    
	%>
	 <table border="1">
          <tr>
          	<th>Student ID</th>
          	<th>Science</th>
          	<th>Mathematics</th>
          	<th>English</th>
          	<th>Average</th>
          </tr>
          
          <%
          while(rs.next()){
        	  String science="";
        	  String math="";
        	  String english="";
        	  int average=0;  
          %>
  
          <tr>
          	<td><%=rs.getString("id")%></td>
          	<td><%=science=rs.getString("science")%></td>
          	<td><%=english=rs.getString("math")%></td>
          	<td><%=math=rs.getString("english")%></td>
          	<td><%=average=(Integer.parseInt(science)+ Integer.parseInt(math)+ Integer.parseInt(english))/3%></td>
          </tr>
          
          <%
          }
          %>
          </table>
	  	<p> <a href="addMark.html"><button type='addMark'>Add New Student Marks</button></a></p>
	  	
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
    
   
  </body>
</html>