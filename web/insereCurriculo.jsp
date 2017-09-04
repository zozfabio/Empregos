
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("login") != null){
        String nome = request.getParameter("nome");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String whatsapp = request.getParameter("whatsapp");
        String endereco = request.getParameter("endereco");
        String cidade = request.getParameter("cidade");
        String nacionalidade = request.getParameter("nacionalidade");
        String nascimento = request.getParameter("nascimento");
        String civil = request.getParameter("civil");
        String genero = request.getParameter("genero");
        String email = request.getParameter("email");
        String formacao = request.getParameter("formacao");
        String atividades = request.getParameter("atividades");
        String outros = request.getParameter("outros");
        java.sql.ResultSet rs3 = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+cidade+"'");
        rs3.next();
        int idCidade = rs3.getInt(1);
        try{
            
            ConexaoBanco.getConect().setDados("INSERT INTO curriculo(nome_completo,telefone,celular,whatsapp,endereco,id_cidade,nacionalidade,nascimento,civil,genero,email,"
                    + "formacao,atividades_complementares,outras_informacoes,id_pessoa) "
             + "VALUES('"+nome+"','"+telefone+"','"+celular+"','"+whatsapp+"','"+endereco+"',"+idCidade+",'"+nacionalidade+"','"+nascimento+"','"+civil+"','"+genero+"',"
                     + "'"+email+"','"+formacao+"','"+atividades+"','"+outros+"',1)");
            out.println("<script language= 'JavaScript'>");
                out.println("location.href='index.html'");
            out.println("</script>");
        }catch(Exception e){
            out.println("Erro ao incluir Currículo!");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Inserir Currículo</title>
    </head>
    <body style="background-color: #cfd8dc;">
    <!body style="background-image: url('img/fundoAzul.jpg');">
        <br />
        <div>
            <div>
                <br />
                <img src="img/EmpregosAltoVale2.png" width="500">
                <h1 style="font-size: 36px;">Inserir Currículo</h1>
            </div>
            <form name="CadastroUsuario" method="post">
                
                <br />
                Nome Completo: <br />  <input type="text" name="nome" maxlength="100" size="100" />
                <br />
                Telefone: <br />  <input type="text" name="telefone" maxlength="100" size="100" />
                <br />
                Celular:  <br /> <input type="text" name="celular" maxlength="100" size="100" />
                <br />
                WhatsApp: <br />  <input type="text" name="whatsapp" maxlength="100" size="100" />
                <br />
                Endereço:  <br /> <input type="text" name="endereco" maxlength="200" size="100" />
                <br />
                Cidade:  <br /> 
                <select name='cidade'>
                    <%
                        java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade");
                        while(rs.next()){
                            out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                        }
                    %>
                </select>
                <br />
                Nacionalidade:  <br /> <input type="text" name="nacionalidade" maxlength="100" size="100" />
                <br />
                Nascimento: <br />  <input type="text" name="nascimento" maxlength="100" size="100" />
                <br />
                Estado Civil: <br />  <input type="text" name="civil" maxlength="100" size="100" />
                <br />
                Gênero:  <br /> 
                <select name='genero'>
                    <option value='masculino'>Masculino</option>
                    <option value='masculino'>Feminino</option>
                    <option value='masculino'>Outro</option>
                </select>
                <br />
                Email:  <br /> <input type="text" name="email" maxlength="100" size="100" />
                <br />
                Formação/Conhecimentos: <br /> <textarea name="formacao" rows="10" cols="100"></textarea>
                <br />
                Atividades Complementares: <br /> <textarea name="atividades" rows="10" cols="100"></textarea>
                <br />
                Outras Informações: <br /> <textarea name="outros" rows="5" cols="100"></textarea>
                <br />
                <br />
                <div  >
                    <input type="submit" name="BtnCadastra" value="Cadastrar"  />
                    <a href="index.html" target="_parent">
                        <button type="button" >Cancelar</button>
                    </a>
                </div>
            </form>
            
        </div>
    </body>
</html>
