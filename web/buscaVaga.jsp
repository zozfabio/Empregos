
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
        <title>Empregos Alto Vale - Buscar Vaga</title>
        
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
                <h1 style="font-size: 36px;">Buscar Vaga</h1>
            </div>
            <br />
            <form name="BuscarVaga" method="post">
                <b>Cidade:</b>  <br /> 
                <select name='cidade' class="browser-default blue-grey lighten-5">
                    <%
                        java.sql.ResultSet rs2 = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                        while(rs2.next()){
                            out.println("<option value='"+rs2.getString(1)+"'>"+rs2.getString(1)+"</option>");
                        }
                    %>
                </select>
                <input type="submit" class="btn btn-success" name="BtnFiltra" value="Filtrar"  />
            </form>
            <br />
            <br />
            <%
                    try{
                        out.println("<table class='striped'>");
                        out.println("<thead>");
                        out.println("<tr>");
                        out.println("<th>ID</th>");
                        out.println("<th>Cargo</th>");
                        out.println("<th>Salário</th>");
                        out.println("<th>Cidade</th>");
                        out.println("<th>Ver Vaga</th>");
                        out.println("</tr>");
                        out.println("</thead>");

                        out.println("<tbody>");

                        Vaga vaga = new Vaga();
                        String cidade = "RIO DO SUL";
                        if(request.getParameter("cidade") == null){
                            cidade = "RIO DO SUL";
                        }else{
                            cidade = request.getParameter("cidade");
                        }
                        Cidade cid = new Cidade();
                        cid.setCidadePorNome(cidade);
                        java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT * FROM vaga WHERE id_cidade = "+cid.getIdCidade());
                        while(rs.next()){
                            vaga.setVaga(rs.getInt("id_vaga"));
                            out.println("<tr>");
                            out.println("<th>"+vaga.getIdVaga()+"</th>");
                            out.println("<th>"+vaga.getNomeVaga()+"</th>");
                            out.println("<th>"+vaga.getSalario()+"</th>");
                            out.println("<th>"+vaga.getNomeCidade()+"</th>");
                            out.println("<th>");
                                out.println("<a href='verVaga.jsp' target='_parent'>");
                                    out.println("<button class='btn' type='button'>Ver Mais</button>");
                                out.println("</a>");
                            out.println("</th>");
                            out.println("</tr>");
                        }
                        out.println("</tbody>");


                        out.println("</table>");
                    }catch(Exception e){}
                
            %>
            <br /><br />
            
        </div>
                <br />
                <%@include file="templates/footer.html" %>
    </body>
</html>
