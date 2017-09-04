
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
        <title>Remover Pessoa</title>
    </head>
    <body style="background-image: url('img/fundoAzul.jpg');">
        <div class="row" style="width: 600px; ">
            <div class="row" style="width: 620px;text-align: center;">
                <br />
                <img src="img/logoAgenda2.png">
                <h1>Remover Pessoa</h1>
            </div>
            <%
                String sigla = request.getParameter("sigla");  
                java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM pessoa WHERE cod_pessoa = "+sigla);
                rs.next();
                String nome = rs.getString(1);
                if(request.getParameter("BtnRemove") != null){

                    try{
                        ConexaoBanco.getConect().setDados("DELETE FROM pessoa WHERE cod_pessoa = '"+sigla+"'");
                        out.println("<script language= 'JavaScript'>");
                            out.println("location.href='listaPessoas.jsp'");
                        out.println("</script>");
                    }catch(Exception e){
                        out.println("Erro ao excluir Pessoa!");
                    }
                }
            %>
            <div class="input-field col s12" style="width: 600px; text-align: center;">
                Deseja realmente excluir a Conta <b><%=nome%></b> ?
                <br />
                <br />
                <form name="RemoveEstado" method="post">
                    <input type="hidden" name="sigla" value="<%=nome%>" />
                    <input class="btn waves-effect blue darken-4" type="submit" name="BtnRemove" value="Remover" />
                    <a class="btn waves-effect blue darken-4" href="listaPessoas.jsp" target="_parent">Voltar</a>
                </form>
            </div>
        </div>
    </body>
</html>
