/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;

import fontes.ConexaoBanco;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Ricardo Fronza
 */
public class Deslogar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        try (PrintWriter out = response.getWriter()) {
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Agenda</title>");    
            out.println("<meta name='viewport' content='width=device-width, initial-scale=1.0'>");
            out.println("<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css'>");
            out.println("</head>");
            out.println("<body style='background-color: #DFDFDF;'>");
            out.println("<br/>");
            out.println("<div class='row' style='width: 600px; text-align: center;'>");
            out.println("<div class='row' style='width: 620px;'>");
            
            HttpSession session = request.getSession();
            session.invalidate();
            out.println("<script language= 'JavaScript'>");
            out.println("location.href='index.html'");
            out.println("</script>");
                    
            out.println("    </div>");
            out.println("</div>");
            out.println("<div class='row' style='width: 600px; text-align: center;'>");
            out.println("    <div class='input-field col s12'>");
            out.println("        <a href='index.html' target='_parent'>");
            out.println("            <button class='btn waves-effect waves-light' type='button' >Voltar</button>");
            out.println("        </a>");
            out.println("    </div>");
            out.println("</div>");
                            
            out.println("</body>");
            out.println("</html>");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
