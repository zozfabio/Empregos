
<%@page import="java.util.ArrayList"%>
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.servlet.http.HttpSession"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
        <title>Pessoas</title>
    </head>
    <body style="background-color: #cfd8dc;">
        <div class="row" style="width: 1336px; ">
            <div class="row" style="width: 1336px;text-align: center;">
                <br />
                <img src="img/EmpregosAltoVale2.png" width="300">
                <h1>Pessoas</h1>
            </div>
            <div class="input-field col s6" style="width: 1336px; text-align: center;">
                <a class="btn waves-effect blue darken-4" href="inserePessoa.jsp" target="_parent">Inserir</a>
                <a class="btn waves-effect blue darken-4" href="agenda.html" target="_parent">Voltar</a>
            </div>
        <br />
        <br />
        <br />
        <% 
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT * FROM pessoa WHERE cod_usuario = "+session.getAttribute("codUsuario"));
            
            out.println("<table class='bordered centered striped grey lighten-2' border=\"2\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nome</th>");  
            out.println("<th>Endereço</th>"); 
            out.println("<th>Telefone 1</th>");
            out.println("<th>Telefone 2</th>");
            out.println("<th>Opções</th>");
            out.println("</tr>");
            out.println("</thead>");
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>" + rs.getString("nome") + "</td>");
                out.println("<td>" + rs.getString("endereco") + "</td>");
                out.println("<td>" + rs.getString("telefone1") + "</td>");
                out.println("<td>" + rs.getString("telefone2") + "</td>");
                out.println("<td>");
                out.println("<a class='btn waves-effect blue darken-4' href='removePessoa.jsp?sigla=" + rs.getString("cod_pessoa") + "'>Remover</a>");
                out.println("<a class='btn waves-effect blue darken-4' href='alteraPessoa.jsp?sigla=" + rs.getString("cod_pessoa") + "'>Alterar</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        %>
        </div>
    </body>
</html>
