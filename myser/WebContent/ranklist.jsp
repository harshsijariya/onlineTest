<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% String s5= (String)request.getParameter("button1"); %>
<%session.setAttribute("contes",s5);%>
<%
  try {
	  
	 String s9= (String)session.getAttribute("contes");
	String name1=  (String)session.getAttribute("name1");
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
   //out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String sql;
    sql = "SELECT * from PROFILE where CONTEST='"+s9+"'";
    ResultSet rs = stmt.executeQuery(sql);%>
       <table class="table table-hover" border = "1" width = "100%">
     <thead>
     <tr><th> Rank</th>
            <th>Contest</th>
            <th>Marks</th>
     </tr>
   </thead>
    
    
    <% int rank=1;
  while(rs.next()){%>
 
  <tbody>
  <tr><td><%=rank %></td>
  <td ><%=  rs.getString(1)%></td>
  
  <td><%=rs.getInt(3)%></td>
	</tr></tbody>
	<%
	rank++;
}%>
</table>

<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}%>
</body>
</html>