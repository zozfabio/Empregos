<%@page import="br.edu.unidavi.empregabilidade.util.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.edu.unidavi.empregabilidade.model.Pessoa"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("login") != null){
        try{
            Pessoa pessoa = new Pessoa(request.getParameter("nome"), request.getParameter("cpf_cnpj"), request.getParameter("telefone"), request.getParameter("celular"), 
                    request.getParameter("whatsapp"), request.getParameter("email"), request.getParameter("endereco"), request.getParameter("login"), request.getParameter("senha"), 
                    request.getParameter("cidade"), request.getParameter("fisicaJuridica"));
            pessoa.inserePessoa();
        }catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empregos Alto Vale - Criar Usuário</title>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css" />
        <!--Import jQuery before materialize.js-->
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
        <script type="text/javascript" src="js/materialize.min.js"></script>
    </head>
    <body style="background-color: #cfd8dc;">
        <div class="container">
            <div class="col l12 s12 center"> 
                <img src="img/temos.png" width="300">
                <h1 style="font-size: 36px;">Criar Usuário</h1>
            </div>
            <form name="CadastroUsuario" method="post">
                <b>Pessoa Física ou Jurídica?: </b>
                <select name='fisicaJuridica' class="browser-default blue-grey lighten-5">
                    <option value='FISICA'>FISICA</option>
                    <option value='JURIDICA'>JURIDICA</option>
                </select>
                <br />
                <b>Nome:</b> <input class="blue-grey lighten-5" type="text" name="nome" maxlength="100" size="80" />
                <br />
                <b>Login:</b> <input class="blue-grey lighten-5" type="text" name="login" maxlength="100" size="80" />
                <br />
                <b>Senha:</b> <input class="blue-grey lighten-5" type="password" name="senha" maxlength="100" size="80" />
                <br />
                <b>CPF ou CNPJ:</b> <input class="blue-grey lighten-5" type="text" name="cpf_cnpj" maxlength="100" size="80" />
                <br />
                <b>Telefone:</b> <input class="blue-grey lighten-5" type="text" name="telefone" maxlength="100" size="80" />
                <br />
                <b>Celular:</b> <input class="blue-grey lighten-5" type="text" name="celular" maxlength="100" size="80" />
                <br />
                <b>WhatsApp:</b> <input class="blue-grey lighten-5" type="text" name="whatsapp" maxlength="100" size="80" />
                <br />
                <b>Email:</b> <input class="blue-grey lighten-5" type="text" name="email" maxlength="100" size="80" />
                <br />
                <b>Endereço:</b> <input class="blue-grey lighten-5" type="text" name="endereco" maxlength="200" size="80" />
                <br />
                <b>Cidade:</b> 
                <select name='cidade' class="browser-default blue-grey lighten-5">
                    <%
                        try{
                            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                            while (rs.next()) {
                                out.println("<option value='"+rs.getString("nome")+"'>"+rs.getString("nome")+"</option>");
                            }
                        }catch(Exception e){}
                    %>
                </select>
                <br />
                <br />
                <div>
                    <input type="submit" class="btn btn-success" name="BtnCadastra" value="Cadastrar"  />
                    <a href="index.jsp" target="_parent">
                        <button class="btn red darken-4" type="button" >Cancelar</button>
                    </a>
                </div>
            </form>
        </div>
                
        <br />
        <%@include file="templates/footer.html" %>

    </body>
</html>
