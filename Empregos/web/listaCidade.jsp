
<%@page import="java.util.ArrayList"%>
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
        <title>Cidades</title>
    </head>
    <body style="background-color: #cfd8dc;">
        <div class="row" style="width: 1024px; ">
            <div class="row" style="width: 1024px;text-align: center;">
                <br />
                <img src="img/EmpregosAltoVale2.png" width="300">
                <h1>Cidades</h1>
            </div>
            <div class="input-field col s6" style="width: 1024px; text-align: center;">
                <a class="btn waves-effect blue darken-4" href="insereCidade.jsp" target="_parent">Inserir</a>
                <a class="btn waves-effect blue darken-4" href="agenda.html" target="_parent">Voltar</a>
            </div>
        <br />
        <br />
        <br />
        <% 
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT * FROM cidade");
            
            out.println("<table class='bordered centered striped grey lighten-2' border=\"1\">");
            out.println("<thead>");
            out.println("<tr>");
            out.println("<th>Nome</th>");   
            out.println("<th>Estado</th>"); 
            out.println("<th>Opções</th>");
            out.println("</tr>");
            out.println("</thead>");
            while(rs.next()){
                out.println("<tr>");
                out.println("<td>" + rs.getString("nome") + "</td>");
                out.println("<td>" + rs.getString("sigla_estado") + "</td>");
                out.println("<td>");
                out.println("<a class='btn waves-effect blue darken-4' href='removeCidade.jsp?sigla=" + rs.getString("cod_cidade") + "'>Remover</a>");
                out.println("<a class='btn waves-effect blue darken-4' href='alteraCidade.jsp?sigla=" + rs.getString("cod_cidade") + "'>Alterar</a>");
                out.println("</td>");
                out.println("</tr>");
            }
            out.println("</table>");
        %>
        </div>
    </body>
</html>
