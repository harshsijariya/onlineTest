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
    String sql;
    sql = "SELECT * from CONTEST1";
    ResultSet rs = stmt.executeQuery(sql);%>
     <table class="table table" border = "1" width = "100%">
     <thead>
     <tr>
            <th>Contest</th>
            <th>LINK</th>
            <th>CONTEST RANK</th>
     </tr>
   </thead>
    
    
    <% 
  while(rs.next()){%>
 
  <tbody>
  <tr>
  <td> <%=  rs.getString(1)%>     </td>
  <td><form action="test1.jsp" method="post"><button type='submit' class='btn btn-info' name="button1" value="<%=  rs.getString(1)%>"> Click</button></form></td>
	
	<td><form action="ranklist1.jsp" method="post"><button type='submit' class='btn btn-info' name="button2" value="<%=  rs.getString(1)%>">Rank</button></form></td>
	</tr>
	</tbody>
	<%
}%>
</table>

<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%></body>
</html>