<%@ page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:include page="test.html"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body><h3 class="text-success">Hi
<%=session.getAttribute("name1")


%>

</h3>

<%
  try {
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
   // out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String sql;String s3=(String)session.getAttribute("contest");
    sql = "SELECT * from CONTEST2 where ID1='"+s3+"'";
    ResultSet rs = stmt.executeQuery(sql);
    int count=0;
    
    %>
         
    
    <% 
  while(rs.next()){
	  

	  String id=rs.getString(2);
	  
	  if(rs.getString(7).equalsIgnoreCase(request.getParameter(id))){count++;}
  
  
  %> 
  <%
}%>
  <%  
  String s6=(String)session.getAttribute("name1");
  if(s6!=null&&s6!=""){
  int f=0; String s1=(String)session.getAttribute("name1");
  String s2=(String)session.getAttribute("contest");
  sql = "SELECT * from PROFILE where ID='"+s1+"'";
  ResultSet rs2 = stmt.executeQuery(sql);
  while(rs2.next()){
	  if(rs2.getString(2).equalsIgnoreCase(s2)){
		  f=1;
		  count=rs2.getInt(3);
		  out.println("You have already given the test");
		  break;
	  }
	  
  }
  
 
 if(f==0){
 String query = " insert into PROFILE (ID,CONTEST,MARKS)"
        + " values (?, ?, ?)";

      // create the mysql insert preparedstatement
      PreparedStatement preparedStmt = con.prepareStatement(query);
      preparedStmt.setString (1,s1);
      preparedStmt.setString (2, s2);
      preparedStmt.setInt(3, count);  
     

      // execute the preparedstatement
      preparedStmt.execute(); 
  
 } } else{ out.println("it seems you have not logged in");  }%>
      
  
  	

<h2> Your result is<%=count %></h2>


<%
 
con.close();
} catch (Exception e) {
	out.print(e);
e.printStackTrace();
}
%></body>
</html>