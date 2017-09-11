
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page import="br.edu.unidavi.empregabilidade.model.Curriculo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("BtnCadastra") != null){
        try{
            Curriculo curriculo = new Curriculo(request.getParameter("nome"), request.getParameter("telefone"), request.getParameter("celular"), 
                    request.getParameter("whatsapp"), request.getParameter("endereco"), request.getParameter("cidade"), request.getParameter("nacionalidade"), 
                    request.getParameter("idade"),request.getParameter("civil"),request.getParameter("genero"),request.getParameter("email"), 
                    request.getParameter("formacao"), request.getParameter("atividades"), request.getParameter("outros"),
                    1);//ALTERAR AQUI PARA PEGAR O ID DA PESSOA QUE ESTÁ LOGADO
            curriculo.insereCurriculo();
        }catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empregos Alto Vale - Inserir Currículo</title>
        
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
    <!body style="background-image: url('img/fundoAzul.jpg');">
        <br />
        <div class="container">
            <div class="col l12 s12 center"> 
                <img src="img/temos.png" width="300">
                <h1 style="font-size: 36px;">Inserir Currículo</h1>
            </div>
            <form name="CadastroCurriculo" method="post">
                
                <br />
                <b>Nome Completo:</b> <br />  <input class="blue-grey lighten-5" type="text" name="nome" maxlength="100" size="100" />
                <br />
                <b>Telefone:</b> <br />  <input class="blue-grey lighten-5" type="text" name="telefone" maxlength="100" size="100" />
                <br />
                <b>Celular:</b>  <br /> <input class="blue-grey lighten-5" type="text" name="celular" maxlength="100" size="100" />
                <br />
                <b>WhatsApp:</b> <br />  <input class="blue-grey lighten-5" type="text" name="whatsapp" maxlength="100" size="100" />
                <br />
                <b>Endereço:</b>  <br /> <input class="blue-grey lighten-5" type="text" name="endereco" maxlength="200" size="100" />
                <br />
                <b>Cidade:</b>  <br /> 
                <select name='cidade' class="browser-default blue-grey lighten-5">
                    <%
                        java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                        while(rs.next()){
                            out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                        }
                    %>
                </select>
                <br />
                <b>Nacionalidade:</b>  <br /> <input class="blue-grey lighten-5" type="text" name="nacionalidade" maxlength="100" size="100" />
                <br />
                <b>Idade:</b> <br />  <input class="blue-grey lighten-5" type="text" name="idade" maxlength="100" size="100" />
                <br />
                <b>Estado Civil:</b> <br />  <input class="blue-grey lighten-5" type="text" name="civil" maxlength="100" size="100" />
                <br />
                <b>Gênero:</b>  <br /> 
                <select name='genero' class="browser-default blue-grey lighten-5">
                    <option value='Masculino'>Masculino</option>
                    <option value='Feminino'>Feminino</option>
                    <option value='Outro'>Outro</option>
                </select>
                <br />
                <b>Email:</b>  <br /> <input class="blue-grey lighten-5" type="text" name="email" maxlength="100" size="100" />
                <br />
                <br /> 
                
                
                
                <b>Formação/Conhecimentos:</b> <br />  
                <textarea name="formacao" class="materialize-textarea blue-grey lighten-5" style="height: 250px;">
Formação 1: Ensino Médio
Status: Completo
Instituição: UNIDAVI   Cidade: Rio do Sul - SC
Data início: 01/01/2010   Data término: 31/12/2012

Formação 2: Administração
Status: Cursando
Instituição: UNIDAVI   Cidade: Rio do Sul - SC
Data início: 01/01/2015   Data término: -

</textarea>
                <br /><br />
                
                <!-- Será utilizado em outra atualização o trecho de código abaixo
                Nome Formação: <input type="text" name="nome_formacao" maxlength="100" size="50" />
                <br /> 
                Status:  
                <select name='status'>
                    <option value='completo'>Completo</option>
                    <option value='cursando'>Cursando</option>
                    <option value='incompleto'>Incompleto</option>
                </select>
                <br /> 
                Instituição: <input type="text" name="instituicao" maxlength="100" size="50" />
                <br /> 
                Data Início: <input type="text" name="data_inicio_formacao" maxlength="100" size="20" />
                Data Término: <input type="text" name="data_termino_formacao" maxlength="100" size="20" />
                <br />
                <input type="submit" name="BtnCadastraFormacao" value="CadastrarFormacao"  />
                <br /><br />
                -->
                
                
                <b>Atividades Complementares:
                </b> <br /> 
                <textarea name="atividades" class="materialize-textarea blue-grey lighten-5" style="height: 250px;"></textarea>
                <br />
                <b>Outras Informações:
                </b> <br /> 
                <textarea name="outros" class="materialize-textarea blue-grey lighten-5" style="height: 250px;"></textarea>
                <br />
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
