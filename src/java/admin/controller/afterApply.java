package admin.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException; 
import java.sql.Statement;
import java.util.LinkedList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;


public class afterApply extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException, SQLException, ClassNotFoundException {
    response.setContentType("text/html;charset=UTF-8");
        
    int APP_ID = Integer.parseInt(request.getParameter("APP_ID"));
    int AD_ID = Integer.parseInt(request.getParameter("AD_ID"));
    int AP_ID = Integer.parseInt(request.getParameter("AP_ID"));
    int JOB_ID = Integer.parseInt(request.getParameter("JOB_ID"));
    String APP_STATUS = request.getParameter("APP_STATUS");
   
    PrintWriter out = response.getWriter();
    Connection con = null;
    List errorMsgs = new LinkedList();
  
    try {
         Statement statement = null;
         con = DBConnection.createConnection();
        statement = con.createStatement();
        String sql = "INSERT INTO APPLICATION (APP_ID,AD_ID,AP_ID,JOB_ID,APP_STATUS) VALUES (?,?,?,?,?)";
        PreparedStatement st = con.prepareStatement(sql);
                    st.setInt(1,APP_ID);
                    st.setInt(2,AD_ID);
                    st.setInt(3,AP_ID);
                    st.setInt(4,JOB_ID);
                    st.setString(5,APP_STATUS);
                    st.execute();
                    /*out.println("<script type=\"text/javascript\">");
                    out.println("alert('Has been submitted');");
                    out.println("location='success.jsp';");
                    out.println("</script>");*/
                    response.sendRedirect("Techie/index.jsp");
                    //response.sendRedirect(request.getContextPath() + "Techie/index.jsp");

        }
        catch(RuntimeException e){
               request.setAttribute("Error",errorMsgs);
               RequestDispatcher view = request.getRequestDispatcher("error.jsp");
               view.forward(request, response);

    }
    }
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(afterApply.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException | ClassNotFoundException ex) {
            Logger.getLogger(afterApply.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

} 
