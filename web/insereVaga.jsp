
<%@page import="fontes.ConexaoBanco"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    if(request.getParameter("nome") != null){
        String nome = request.getParameter("nome");
        String descricao = request.getParameter("descricao");
        String atividades = request.getParameter("atividades");
        String requisitos = request.getParameter("requisitos");
        String horario = request.getParameter("horario");
        String salario = request.getParameter("salario");
        String beneficios = request.getParameter("beneficios");
        String cidade = request.getParameter("cidade");
        
        java.sql.ResultSet rs3 = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+cidade+"'");
        rs3.next();
        int idCidade = rs3.getInt(1);
        try{
            
            ConexaoBanco.getConect().setDados("INSERT INTO vaga(nome_vaga,descricao,atividades,requisitos,horario,salario,beneficios,id_pessoa,id_cidade) "
             + "VALUES('"+nome+"','"+descricao+"','"+atividades+"','"+requisitos+"','"+horario+"','"+salario+"','"+beneficios+"',1,"+idCidade+")");
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
        <title>Inserir Vaga</title>
    </head>
    <body style="background-color: #cfd8dc;">
    <!body style="background-image: url('img/fundoAzul.jpg');">
        <br />
        <div>
            <div>
                <br />
                <img src="img/EmpregosAltoVale2.png" width="500">
                <h1 style="font-size: 36px;">Inserir Vaga</h1>
            </div>
            <form name="CadastroUsuario" method="post">
                
                <br />
                Nome Vaga: <br />  <input type="text" name="nome" maxlength="100" size="100" />
                <br />
                Descrição: <br /> <textarea name="descricao" rows="10" cols="100"></textarea>
                <br />
                Atividades: <br /> <textarea name="atividades" rows="10" cols="100"></textarea>
                <br />
                Requisitos: <br /> <textarea name="requisitos" rows="5" cols="100"></textarea>
                <br />
                Horário: <br />  <input type="text" name="horario" maxlength="100" size="100" />
                <br />
                Salário:  <br /> <input type="text" name="salario" maxlength="100" size="100" />
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
                Benefícios: <br /> <textarea name="beneficios" rows="5" cols="100"></textarea>
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
