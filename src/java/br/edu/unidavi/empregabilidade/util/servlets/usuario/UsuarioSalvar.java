package br.edu.unidavi.empregabilidade.util.servlets.usuario;

import br.edu.unidavi.empregabilidade.util.ConexaoBanco;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author marcondesmacaneiro
 */
@WebServlet(name = "UsuarioSalvar", urlPatterns = {"/UsuarioSalvar"})
public class UsuarioSalvar extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet UsuarioSalvar</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet UsuarioSalvar at " + request.getContextPath() + "</h1>");
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
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getParameter("login") != null) {
                String nome = request.getParameter("nome");
                System.out.println("Nome: "+nome);
                String cpfCnpj = request.getParameter("cpf_cnpj");
                String telefone = request.getParameter("telefone");
                String celular = request.getParameter("celular");
                String whatsapp = request.getParameter("whatsapp");
                String email = request.getParameter("email");
                String endereco = request.getParameter("endereco");
                String usuario = request.getParameter("login");
                String senha = request.getParameter("senha");
                String cidade = request.getParameter("cidade");
                String fisicaJuridica = request.getParameter("fisicaJuridica");
                if (fisicaJuridica.equalsIgnoreCase("FISICA")) {
                    fisicaJuridica = "FISICA";
                } else {
                    fisicaJuridica = "JURIDICA";
                }
                java.sql.ResultSet rs3 = null;
                Integer idCidade = 0;
                try {
                    rs3 = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE id_cidade = '" + cidade + "'");
                    rs3.next();
                    idCidade = rs3.getInt(1);
                } catch (Exception ex) {
                    Logger.getLogger(UsuarioSalvar.class.getName()).log(Level.SEVERE, null, ex);
                }
                try {
                    System.out.println("Usuario = "+usuario);
                    java.sql.ResultSet rs4 = ConexaoBanco.getConect().getDados("SELECT id_usuario FROM usuario WHERE login = '" + usuario + "'");
                    
                    int idUsuario = 0;
                    try {
                        rs4.next();
                        idUsuario = rs4.getInt(1);   
                    } catch(Exception e) {
                        System.out.println("Usuário não localizado");
                    }
                    
                    System.out.println("idUsuario = "+idUsuario);
                    if (idUsuario > 0) {
                        System.out.println("IF");
                        String nextJSP = "/insereUsuario.jsp";
                        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
                        request.setAttribute("erro", "Login já existe");
                        dispatcher.forward(request,response);
                    } else {
                        System.out.println("ELSE");
                        ConexaoBanco.getConect().setDados("INSERT INTO usuario (login,senha) VALUES('" + usuario + "','" + senha + "')");
                        rs4 = ConexaoBanco.getConect().getDados("SELECT id_usuario FROM usuario WHERE login = '" + usuario + "'");
                        rs4.next();
                        idUsuario = rs4.getInt(1);
                    }
                    
                    ConexaoBanco.getConect().setDados("INSERT INTO pessoa (id_pessoa,nome,cpf_cnpj,telefone,celular,whatsapp,email,endereco,id_cidade,pessoa_fisica,endereco_imagem) "
                            + "VALUES(" + idUsuario + ",'" + nome + "','" + cpfCnpj + "','" + telefone + "','" + celular + "','" + whatsapp + "','" + email + "','" + endereco + "'," + idCidade + ",'" + fisicaJuridica + "','pessoa.jpg')");
                    out.println("<script language= 'JavaScript'>");
                    out.println("alert('registro realizado com sucesso!')");
                    out.println("location.href='index.html'");
                    out.println("</script>");
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("Erro ao incluir Usuário!");
                }
            }
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
