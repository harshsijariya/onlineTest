<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>  <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String s4= (String)request.getParameter("button2"); %>
<%session.setAttribute("contest",s4);%>
<%
  try {
	  String s8=(String)session.getAttribute("contest");
	String name1=  (String)session.getAttribute("name1");
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
   // out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String sql;
    sql = "SELECT * from PROFILE where contest='"+s8+"' order by marks desc";
    ResultSet rs = stmt.executeQuery(sql);%>
       <table class="table table-hover" border = "1" width = "100%">
     <thead>
     <tr><th>Rank</th>
            <th>Contest</th>
            <th>Marks</th>
     </tr>
   </thead>
    
    
    <% int r=1;
  while(rs.next()){%>
 
  <tbody>
  <tr>
  <td> <%=r %></td>
  <td ><%=  rs.getString(1).toUpperCase()%></td>
  
  <td><%=rs.getInt(3)%></td>
	</tr></tbody>
	<%
	r++;
}%>
</table>

<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}%>



</body>
</html>