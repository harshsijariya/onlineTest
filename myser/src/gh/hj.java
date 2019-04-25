package gh;
import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.activation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import com.sun.xml.internal.messaging.saaj.packaging.mime.MessagingException;

import sun.rmi.transport.Transport;

/**
 * Servlet implementation class hj
 */
@WebServlet("/hj")
public class hj extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public hj() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter pw=response.getWriter();
		String name=request.getParameter("name");
		String pass=request.getParameter("pass");
		String email=request.getParameter("email");
		
		
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr", "harsh");
			Statement st=con.createStatement();
			  
			  

			  String sql = "INSERT INTO sign(name,pass,email) VALUES(?,?,?)";
			  
		        try (
		                PreparedStatement pstmt = con.prepareStatement(sql)) {
		            pstmt.setString(1, name);
		            pstmt.setString(2, pass);
		            pstmt.setString(3, email);
		            pstmt.executeUpdate();
		        } catch (SQLException e) {
		            System.out.println(e.getMessage());
		        }
		       
			con.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e);
		}
		
		
		
		
		
		pw.println("you have Successfully loged in...");
		response.sendRedirect("http://localhost:8085/myser/login.jsp");
			   
       
	}

}
