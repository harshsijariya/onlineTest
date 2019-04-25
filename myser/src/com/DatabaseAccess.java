package com;
import java.io.*;
import java.sql.*;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class DatabaseAccess
 */
@WebServlet("/DatabaseAccess")
public class DatabaseAccess extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DatabaseAccess() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		
	       String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";  
	       String DB_URL="jdbc:oracle:thin:@localhost:1521:xe";

	      //  Database credentials
	       String USER = "hr";
	      String PASS = "harsh";

	      // Set response content type
	      response.setContentType("text/html");
	      PrintWriter out = response.getWriter();
	      String title = "Database Result";
	      
	      String docType =
	         "<!doctype html public \"-//w3c//dtd html 4.0 " + "transitional//en\">\n";
	      
	      out.println(docType +
	         "<html>\n" +
	         "<head><title>" + title + "</title></head>\n" +
	         "<body bgcolor = \"#f0f0f0\">\n" +
	         "<h1 align = \"center\">" + title + "</h1>\n");
	      try {
	         // Register JDBC driver
	         Class.forName("oracle.jdbc.driver.OracleDriver");

	         // Open a connection
	         Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);

	         // Execute SQL query
	         Statement stmt = conn.createStatement();
	         String sql;
	         sql = "SELECT name, pass,email FROM sign where name='"+name+"' and pass='"+pass+"'";
	         ResultSet rs = stmt.executeQuery(sql);
              int f=0;
	         // Extract data from result set
	         while(rs.next()){
	            //Retrieve by column name
	            String first = rs.getString(1);
	            String last = rs.getString(2);
	            String email= rs.getString(3);
	           
                    	out.println("<h>you have Success fully Loged In...</h><br>");
                       out.println("your email is Successfully Registered..."+email);
                       HttpSession session=request.getSession();  
                       session.setAttribute("name1",first);  
                      
                       RequestDispatcher rd=request.getRequestDispatcher("/dbj.jsp");
              	     rd.forward(request,response);
              	  
                    	f=1;
                    
                    	break;
	            	         }
	         
	       if(f==0) { out.println("<p>invalid user name or pass</p>");
	       out.println("<a href=\"http://localhost:8085/myser/Signup.html  \"> Goto SignUp</a>");
	       out.println("</body>");
	       out.println("</html>");
	       
	       }

	         // Clean-up environment
	         rs.close();
	         stmt.close();
	         conn.close();
	      } catch(SQLException se) {
	         //Handle errors for JDBC
	         se.printStackTrace();
	      } catch(Exception e) {
	         //Handle errors for Class.forName
	         e.printStackTrace();
	      }
	     		
	}

}
