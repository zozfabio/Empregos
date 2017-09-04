
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("login") != null){
        String nome = request.getParameter("nome");
        String cpfCnpj = request.getParameter("cpf_cnpj");
        String telefone = request.getParameter("telefone");
        String celular = request.getParameter("celular");
        String whatsapp = request.getParameter("whatsapp");
        String email = request.getParameter("email");
        String endereco = request.getParameter("endereco");
        String usuario = request.getParameter("login");
        String senha = request.getParameter("senha");
        String cidade = request.getParameter("cidade");
        String fisicaJuridica = request.getParameter("fisicaJuridica");
        if(fisicaJuridica.equalsIgnoreCase("FISICA")){
            fisicaJuridica = "FISICA";
        }else{
            fisicaJuridica = "JURIDICA";
        }
        java.sql.ResultSet rs3 = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+cidade+"'");
        rs3.next();
        int idCidade = rs3.getInt(1);
        try{
            ConexaoBanco.getConect().setDados("INSERT INTO usuario(usuario,senha) VALUES('"+usuario+"','"+senha+"')");
            java.sql.ResultSet rs4 = ConexaoBanco.getConect().getDados("SELECT id_usuario FROM usuario WHERE usuario = '"+usuario+"'");
            rs4.next();
            int idUsuario = rs4.getInt(1);
            ConexaoBanco.getConect().setDados("INSERT INTO pessoa(id_pessoa,nome,cpf_cnpj,telefone,celular,whatsapp,email,endereco,id_cidade,pessoa_fisica,endereco_imagem) "
             + "VALUES("+idUsuario+",'"+nome+"','"+cpfCnpj+"','"+telefone+"','"+celular+"','"+whatsapp+"','"+email+"','"+endereco+"',"+idCidade+",'"+fisicaJuridica+"','pessoa.jpg')");
            out.println("<script language= 'JavaScript'>");
                out.println("location.href='index.html'");
            out.println("</script>");
        }catch(Exception e){
            out.println("Erro ao incluir Usuário!");
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Criar Usuário</title>
    </head>
    <body style="background-color: #cfd8dc;">
    <!body style="background-image: url('img/fundoAzul.jpg');">
        <br />
        <div>
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
                        while(rs.next()){
                            out.println("<option value='"+rs.getString(1)+"'>"+rs.getString(1)+"</option>");
                        }
                    %>
                </select>
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
