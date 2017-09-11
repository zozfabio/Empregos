
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.unidavi.empregabilidade.model.Vaga"%>
<%
    if(request.getParameter("nome") != null){
        try{
            Vaga vaga = new Vaga(request.getParameter("nome"), request.getParameter("descricao"), request.getParameter("atividades"), request.getParameter("requisitos"), 
                    request.getParameter("horario"), request.getParameter("salario"), request.getParameter("beneficios"), request.getParameter("cidade"), 
                    1);//ALTERAR AQUI PARA PEGAR O ID DA PESSOA QUE ESTÁ LOGADO
            vaga.insereVaga();
        }catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empregos Alto Vale - Inserir Vaga</title>
        
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
                <h1 style="font-size: 36px;">Inserir Vaga</h1>
            </div>
            <form name="CadastroVaga" method="post">
                
                <br />
                <b>Cargo:</b> <br />  <input class="blue-grey lighten-5" type="text" name="nome" maxlength="100" size="100" />
                <br />
                <b>Descrição:</b> <br /> <textarea name="descricao" class="materialize-textarea blue-grey lighten-5" style="height: 100px;"></textarea>
                <br />
                <b>Atividades:</b> <br /> <textarea name="atividades" class="materialize-textarea blue-grey lighten-5" style="height: 100px;"></textarea>
                <br />
                <b>Requisitos:</b> <br /> <textarea name="requisitos" class="materialize-textarea blue-grey lighten-5" style="height: 100px;"></textarea>
                <br />
                <b>Horário:</b> <br />  <input class="blue-grey lighten-5" type="text" name="horario" maxlength="100" size="100" />
                <br />
                <b>Salário:</b>  <br /> <input class="blue-grey lighten-5" type="text" name="salario" maxlength="100" size="100" />
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
                <b>Benefícios:</b> <br /> <textarea name="beneficios" class="materialize-textarea blue-grey lighten-5" style="height: 100px;"></textarea>
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
