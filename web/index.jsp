<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="br.edu.unidavi.empregabilidade.util.ConexaoBanco"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Empregos Alto Vale</title>
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
    <body style="background-image: url('img/fundo22.png');">
        <div class="row" style="width: 100%;"> <!DIV Página Inteira >
            <div class="row" style="width: 100%; height: 85px; background-color: #cfd8dc">
                <div class="row" style="width: 1200px; height: 85px;">
                    <div class="col s4"> <!DIV Imagem Logo >
                    </div>

                    <div class="col s4" style="text-align: center; position: relative;transform: translateY(10%);"> <!DIV Imagem Logo >
                        <img src="img/temos.png" width="100" style="">
                    </div>

                    <form class="col s4" name="form1" method="post" action="Login" style="text-align: center; position: relative;transform: translateY(-10%);">
                        <div class="input-field col s4">
                            Login: <input id="first_name" type="text" name="login" class="validate blue-grey lighten-5" style="height: 25px;width: 120px;">
                        </div>
                        <div class="input-field col s4" >
                            Senha: <input id="last_name" type="password" name="senha" class="validate blue-grey lighten-5" style="height: 25px;width: 120px;">
                        </div>
                        <div class="input-field col s4">
                             <button class="btn waves-effect light-blue" type="submit" name="botao" style="transform: translateY(-30%);">Entrar
                                <i class="material-icons right">send</i>
                            </button>
                            <div class="input-field col s12" style="text-align: center; position: relative;transform: translateY(-80%);">
                                <a href="insereUsuario.jsp" target="_parent">
                                    <h6 style="color: #000000">Registrar-se</h6>
                                </a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>


            <div class="row" style="text-align: center; position: relative;transform: translateY(-6.4%);">
                <div class="col s12" style="width: 100%;height: 500px; text-align: center;background-image: url('img/fundo2.jpg');background-size: 100%;">
                    <div class="col s6" style="width: 500;height:300px;text-align:center;position:absolute;left:50%;top:50%;margin-left:-500px; margin-top:-150px;background-color:#FFFFFF;opacity:0.65;">
                        <div class="col s12">
                            <div class="row" >
                                <p style="font-size: 36px;transform:translateY(10%);">Encontre sua vaga</p> 
                                <p style="font-size: 20px;transform: translateY(-100%);">Digite o cargo ou palavra-chave e escolha a cidade</p>   
                            </div>
                            <div class="row">
                                <form class="col s12" name="form2" method="post" action="buscaVaga.jsp" style="text-align: center; position: absolute;left: 5%;transform: translateY(-60%);">
                                    <div class="input-field col s4" style="font-size: 12px;color: grey;transform: translateY(5%);">
                                        Cargo: <input id="first_name" type="text" name="cargo" class="validate grey lighten-3">
                                    </div>
                                    <div class="col s4" style="transform: translateY(23%); position: relative; left: 2%;">
                                        <label>Cidade:</label> <!input id="last_name" type="password" name="senha" class="validate grey lighten-5">
                                        <select name='cidade' class="browser-default grey lighten-3">
                                            <option value="todas">Todas as Cidades</option>
                                        <%
                                            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                                            while(rs.next()){
                                                out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                                            }
                                        %>
                                        </select>
                                    </div>
                                    <div class="input-field col s3" style="transform: translateY(55%);">
                                         <button class="btn waves-effect light-blue" type="submit" name="botao" style="transform: translateY(15%);">Buscar
                                            <i class="material-icons right">send</i>
                                        </button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            


            <div class="row" style="height: 300px;text-align: center; position: relative;transform: translateY(-17.5%);text-align: center;background-color: #eeeeee;">
                <div class="col s6" style="">
                    <p style="font-size: 36px;color: #616161;transform:translateY(10%);">Cadastre seu Currículo:</p>
                    <p class="col s2"></p>
                    <p class="col s8" style="font-size: 18px;color: #616161;transform:translateY(-30%);">Cadastre seu Currículo online e seja visto pelas empresas da região do Alto Vale
                        do Itajaí, temos mais de 100 emoresas parceiras que consultam regularmente nosso banco de currículos em busca de profissionais.</p>
                    <div class="input-field col s12" style="transform: translateY(-90%);">
                        <a href="insereCurriculo.jsp">
                            <button class="btn waves-effect light-blue" type="submit" name="botao" style="transform: translateY(15%);">Cadastrar
                                <i class="material-icons right">send</i>
                            </button>
                        </a>
                    </div>
                </div>
                <div class="col s6" style="">
                    <p style="font-size: 36px;color: #616161;transform:translateY(10%);">Empresa, cadastre sua vaga:</p>
                    <p class="col s2"></p>
                    <p class="col s8" style="font-size: 18px;color: #616161;transform:translateY(-30%);">Cadastre a vaga que sua empresa necessita, temos mais de 5 mil currículos cadastrados
                        em nosso site, aqui você vai encontrar o profissional certo que sua empresa estava procurando.</p>
                    <div class="input-field col s12" style="transform: translateY(-90%);">
                        <a href="insereVaga.jsp">
                            <button class="btn waves-effect light-blue" type="submit" name="botao" style="transform: translateY(15%);">Cadastrar
                                <i class="material-icons right">send</i>
                            </button>
                        </a>
                    </div>
                </div>
            </div>

        </div>
        <br />
        <br />
        <%@include file="templates/footer.html" %>
    </body>

</html>
