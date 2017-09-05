<%@page import="br.edu.unidavi.empregabilidade.util.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <div>
                <br />
                <img src="img/EmpregosAltoVale2.png" width="500">
                <h1 style="font-size: 36px;">Criar Usuário</h1>
            </div>
            <form name="CadastroUsuario" method="post">
                Pessoa Física ou Jurídica?: 
                <select name='fisicaJuridica'>
                    <option value='FISICA'>FISICA</option>
                    <option value='JURIDICA'>JURIDICA</option>
                </select>
                <br />
                Nome: <input type="text" name="nome" maxlength="100" size="80" />
                <br />
                Login: <input type="text" name="login" maxlength="100" size="80" />
                <br />
                Senha: <input type="password" name="senha" maxlength="100" size="80" />
                <br />
                CPF ou CNPJ: <input type="text" name="cpf_cnpj" maxlength="100" size="80" />
                <br />
                Telefone: <input type="text" name="telefone" maxlength="100" size="80" />
                <br />
                Celular: <input type="text" name="celular" maxlength="100" size="80" />
                <br />
                WhatsApp: <input type="text" name="whatsapp" maxlength="100" size="80" />
                <br />
                Email: <input type="text" name="email" maxlength="100" size="80" />
                <br />
                Endereço: <input type="text" name="endereco" maxlength="200" size="80" />
                <br />
                Cidade: 
                <select name='cidade'>
                    <%
                        java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                        while (rs.next()) {
                            out.println("<option value='" + rs.getString(1) + "'>" + rs.getString(1) + "</option>");
                        }
                    %>
                </select>
                <br />
                <div  >
                    <input type="submit" class="btn btn-success" name="BtnCadastra" value="Cadastrar"  />
                    <a href="index.html" target="_parent">
                        <button class="btn red darken-4" type="button" >Cancelar</button>
                    </a>
                </div>
            </form>
        </div>
                
        <br />
        <%@include file="templates/footer.html" %>

    </body>
</html>
