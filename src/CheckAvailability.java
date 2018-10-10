
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CheckAvailability
 */
@WebServlet("/CheckAvailability")
public class CheckAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckAvailability() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		PrintWriter out = response.getWriter();
        try {
        	  Connection con=null;  
               
                  Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");  
                  con=DriverManager.getConnection("jdbc:sqlserver://sandy\\sqlexpress;databaseName=Userinfo;user=superuser;password=muppet123");  
            
              
            String uname = request.getParameter("uname");
            PreparedStatement ps = con.prepareStatement("select uname from hr where uname=?");
            ps.setString(1,uname);
            ResultSet rs = ps.executeQuery();
             
            if (!rs.next()) {
                out.println(""+uname+" is avaliable");
            }
            else{
            out.println(""+uname+" is already in use");
            }
            out.println();

        } catch (Exception ex) {
            out.println("Error ->" + ex.getMessage());
        } finally {
            out.close();
        }
	
	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
