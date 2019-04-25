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
</head><h2 id='op'></h2>
<body><h3 class="text-success">Hi<% String s4= (String)request.getParameter("button1"); %>
<%session.setAttribute("contest",s4);


%>

</h3>

<% out.println(session.getAttribute("contest"));
  try {
    java.sql.Connection con;
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
    //out.println ( "database successfully opened.");
    Statement stmt = con.createStatement();
    String sql;
    String s3=(String)session.getAttribute("contest");
    sql = "SELECT * from CONTEST2 where ID1='"+s3+"'";
    ResultSet rs = stmt.executeQuery(sql);%>
         
 <form action="result.jsp" method="post" name="form1" id="form2">   
    <% 
  while(rs.next()){%>
 
 <h>Q</h> <h><%=  rs.getString(1)%></h>
 <select name="<%=rs.getString(2)%>">
        <option name=one value=one><%=rs.getString(3) %>  </option>
        <option name=two value=two> <%=rs.getString(4) %> </option>
        <option name=three value=three><%=rs.getString(5) %>  </option>
        <option name=four value=four> <%=rs.getString(6) %> </option>
        
      </select>
  
  	<%
}%>
<button class="btn btn-success" type="submit" id="fo2" name="for2" value="Submit">Submit</button>
</form>



<%
con.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
<script>
var myVar = setInterval(setColor, 1000);
var i=0;var j=0;var k=0;
function setColor() {i++
	document.getElementById('op').innerHTML=k+" :"+j+" :"+i;
	if(i==59){
	j++;
	i=0;
		
	}
	if(j==59&&i==58){
		j==0;
		k++;
		
	}
	if(i==10){
		
	document.getElementById('form2').submit();
	
	}
	}
 


</script>



</body>
</html>