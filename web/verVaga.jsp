
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.unidavi.empregabilidade.model.Vaga"%>
<%@page import="br.edu.unidavi.empregabilidade.model.Cidade"%>
<%
    if(request.getParameter("BtnFiltra") != null){
        try{
            
        }catch(Exception e){}
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Empregos Alto Vale - Ver Vaga</title>
        
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
                <h1 style="font-size: 36px;">Ver Vaga</h1>
            </div>
            <%
                    try{
                        Vaga vaga = new Vaga();
                        java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT * FROM vaga WHERE id_vaga = 4");//ALTERAR AQUI PARA PEGAR O ID DA VAGA
                        while(rs.next()){
                            vaga.setVaga(rs.getInt("id_vaga"));
                            out.println("<br /><b>Número da Vaga:</b> "+vaga.getIdVaga()+"<br />");
                            out.println("<br /><b>Cargo:</b> "+vaga.getNomeVaga()+" <br />");
                            out.println("<br /><b>Descrição:</b> <br />");
                            out.println("<textarea class='materialize-textarea blue-grey lighten-5' style='height: 200px;'>"+vaga.getDescricao()+"</textarea>");
                            out.println("<br /><b>Atividades:</b>  <br />");
                            out.println("<textarea class='materialize-textarea blue-grey lighten-5' style='height: 150px;'>"+vaga.getAtividades()+"</textarea>");
                            out.println("<br /><b>Requisitos:</b>  <br />");
                            out.println("<textarea class='materialize-textarea blue-grey lighten-5' style='height: 150px;'>"+vaga.getRequisitos()+"</textarea>");
                            out.println("<br /><b>Horário:</b> "+vaga.getHorario()+" <br />");
                            out.println("<br /><b>Salário:</b> "+vaga.getSalario()+" <br />");
                            out.println("<br /><b>Benefícios:</b>  <br />");
                            out.println("<textarea class='materialize-textarea blue-grey lighten-5' style='height: 150px;'>"+vaga.getBeneficios()+"</textarea>");
                            out.println("<br /><b>Cidade:</b> "+vaga.getNomeCidade()+" <br />");
                        }
                    }catch(Exception e){}
            %>
            <br /><br />
            
        </div>
                <br />
                <%@include file="templates/footer.html" %>
    </body>
</html>
