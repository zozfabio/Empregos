
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/0.97.7/css/materialize.min.css">
        <title>Alterar Pessoa</title>
    </head>
    <%         
            String sigla = request.getParameter("sigla");   
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT * FROM pessoa WHERE cod_pessoa = "+sigla+"");
            rs.next();
            if(request.getParameter("BtnAltera") != null){
                String nome = request.getParameter("nome");
                String endereco = request.getParameter("endereco");
                String telefone1 = request.getParameter("telefone1");
                String telefone2 = request.getParameter("telefone2");
                String nomeCidade = request.getParameter("cidade");
                try{
                    java.sql.ResultSet rs3 = ConexaoBanco.getConect().getDados("SELECT * FROM cidade WHERE nome = '"+nomeCidade+"'");
                    rs3.next();
                    int codCidade = rs3.getInt("cod_cidade");
                    ConexaoBanco.getConect().setDados("UPDATE pessoa SET nome = '"+nome+"',endereco = '"+endereco+"',"
                            + "telefone1 = '"+telefone1+"',telefone2='"+telefone2+"',cod_cidade = "+codCidade+" WHERE cod_pessoa = "+sigla+"");
                    out.println("<script language= 'JavaScript'>");
                        out.println("location.href='listaPessoas.jsp'");
                    out.println("</script>");
                }catch(Exception e){
                    out.println("Erro ao alterar Pessoa!");
                    e.printStackTrace();
                }
            }
        %>
    <body style="background-image: url('img/fundoAzul.jpg');">
        <div class="row" style="width: 600px; ">
            <div class="row" style="width: 620px;text-align: center;">
                <br />
                <img src="img/logoAgenda2.png">
                <h1>Altera Pessoa</h1>
            </div>
            <form name="AlteraEstado" method="post">
                Nome: <input class="light-blue lighten-3" type="text" name="nome" maxlength="100" size="80" value="<%=rs.getString("nome")%>"/>
                <br />
                Endereço: <input class="light-blue lighten-3" type="text" name="endereco" maxlength="100" size="80" value="<%=rs.getString("endereco")%>"/>
                <br />
                Telefone 1: <input class="light-blue lighten-3" type="text" name="telefone1" maxlength="100" size="80" value="<%=rs.getString("telefone1")%>"/>
                <br />
                Telefone 2: <input class="light-blue lighten-3" type="text" name="telefone2" maxlength="100" size="80" value="<%=rs.getString("telefone2")%>"/>
                <br />
                Cidade:
                <%
                    out.println("<select class='browser-default light-blue lighten-3' name='cidade'>");
                    java.sql.ResultSet rs2 = ConexaoBanco.getConect().getDados("SELECT * FROM cidade");
                    while(rs2.next()){
                        if(rs2.getString("cod_cidade").equalsIgnoreCase(rs.getString("cod_cidade"))){
                            out.println("<option selected='selected' value='"+rs2.getString("nome")+"'>"+rs2.getString("nome")+"</option>");
                        }else{
                            out.println("<option value='"+rs2.getString("nome")+"'>"+rs2.getString("nome")+"</option>");
                        }
                    }
                    out.println("</select>");
                %>
                <br />
                <br />
                <div class="input-field col s12" style="width: 600px; text-align: center;">
                    <input class="btn waves-effect blue darken-4" type="submit" name="BtnAltera" value="Alterar" />
                    <a class="btn waves-effect blue darken-4" href="listaPessoas.jsp" target="_parent">Voltar</a>
                </div>
            </form>
        </div>
    </body>
</html>
