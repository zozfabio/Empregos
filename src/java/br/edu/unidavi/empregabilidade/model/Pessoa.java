/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.edu.unidavi.empregabilidade.model;
import br.edu.unidavi.empregabilidade.util.ConexaoBanco;
import java.sql.Connection;
/**
 *
 * @author G1745 IRON
 */
public class Pessoa {
    private int idPessoa = 1;
    private String nome = "";
    private String cpfCnpj = "";
    private String telefone = "";
    private String celular = "";
    private String whatsapp = "";
    private String email = "";
    private String endereco = "";
    private String usuario = "";
    private String senha = "";
    private int idCidade = 1;
    private String nomeCidade = "";
    private String fisicaJuridica = "";
    
    public Pessoa(){
        idPessoa = 1;
        nome = "";
        cpfCnpj = "";
        telefone = "";
        celular = "";
        whatsapp = "";
        email = "";
        endereco = "";
        usuario = "";
        senha = "";
        idCidade = 1;
        nomeCidade = "";
        fisicaJuridica = "";
    }
    
    public Pessoa(String nomePessoa,String cpf,String tel,String cel,String whats,String emai,String end,String usu,String senh,String nomeCid,String fisic){
        this.nome = nomePessoa;
        this.cpfCnpj = cpf;
        this.telefone = tel;
        this.celular = cel;
        this.whatsapp = whats;
        this.email = emai;
        this.endereco = end;
        this.usuario = usu;
        this.senha = senh;
        this.nomeCidade = nomeCid;
        this.fisicaJuridica = fisic;
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+nomeCidade+"'");
            rs.next();
            this.idCidade = rs.getInt(1);
        }catch(Exception e){}
    }
    
    public void setIdPessoa(int idPess){
        this.idPessoa = idPess;
    }
    public void setNomePessoa(String nomePessoa){
        this.nome = nomePessoa;
    }
    public void setCpfCnpj(String cpf){
        this.cpfCnpj = cpf;
    }
    public void setTelefone(String tel){
        this.telefone = tel;
    }
    public void setCelular(String cel){
        this.celular = cel;
    }
    public void setWhatsapp(String whats){
        this.whatsapp = whats;
    }
    public void setEmail(String emai){
        this.email = emai;
    }
    public void setEndereco(String end){
        this.endereco = end;
    }
    public void setUsuario(String usu){
        this.usuario = usu;
    }
    public void setSenha(String senh){
        this.senha = senh;
    }
    public void setIdCidade(int idCid){
        this.idCidade = idCid;
    }
    public void setNomeCidade(String nomeCid){
        this.nomeCidade = nomeCid;
    }
    public void setFisicaJuridica(String fisic){
        this.fisicaJuridica = fisic;
    }
    
    public int getidPessoa(){
        return this.idPessoa;
    }
    public String getNomePessoa(){
        return this.nome;
    }
    public String getCpfCnpj(){
        return this.cpfCnpj;
    }
    public String getTelefone(){
        return this.telefone;
    }
    public String getCelular(){
        return this.celular;
    }
    public String getWhatsapp(){
        return this.whatsapp;
    }
    public String getEmail(){
        return this.email;
    }
    public String getEndereco(){
        return this.endereco;
    }
    public String getUsuario(){
        return this.usuario;
    }
    public String getSenha(){
        return this.senha;
    }
    public int getIdCidade(){
        return this.idCidade;
    }
    public String getNomeCidade(){
        return this.nomeCidade;
    }
    public String getFisicaJuridica(){
        return this.fisicaJuridica;
    }
    
    public void inserePessoa(){
        try{
            ConexaoBanco.getConect().setDados("INSERT INTO usuario(login,senha) VALUES('"+usuario+"','"+senha+"')");
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT id_usuario FROM usuario WHERE login = '"+usuario+"'");
            rs.next();
            this.idPessoa = rs.getInt(1);
            ConexaoBanco.getConect().setDados("INSERT INTO pessoa(id_pessoa,nome,cpf_cnpj,telefone,celular,whatsapp,email,endereco,id_cidade,pessoa_fisica,endereco_imagem) "
            +"VALUES("+idPessoa+",'"+nome+"','"+cpfCnpj+"','"+telefone+"','"+celular+"','"+whatsapp+"','"+email+"','"+endereco+"',"+idCidade+",'"+fisicaJuridica+"','pessoa.jpg')");
        }catch(Exception e){}
    }
    
    public void updatePessoa(){
        try{
            ConexaoBanco.getConect().setDados("UPDATE pessoa SET nome = '"+nome+"',cpf_cnpj = '"+cpfCnpj+"',telefone = '"+telefone+"',celular = '"+celular+"',"
                    + "whatsapp = '"+whatsapp+"',email = '"+email+"',endereco = '"+endereco+"',id_cidade = "+idCidade+",pessoa_fisica = '"+fisicaJuridica+"' "
                    + "WHERE id_pessoa = "+idPessoa);
        }catch(Exception e){}
    }
    
    public void setPessoa(int IdPessoaa){
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados(""
                    + "SELECT pes.nome,cpf_cnpj,telefone,celular,whatsapp,email,endereco,pes.id_cidade,pessoa_fisica,login,senha,cid.nome "
                    + "FROM pessoa pes "
                    + "JOIN usuario usu on (usu.id_usuario = pes.id_pessoa) "
                    + "JOIN cidade cid ON (cid.id_cidade = pes.id_cidade) "
                    + "WHERE id_pessoa = "+IdPessoaa+"");
            rs.next();
            
            this.idPessoa = IdPessoaa;
            this.nome = rs.getString("pes.nome");
            this.cpfCnpj = rs.getString("cpf_cnpj");
            this.telefone = rs.getString("telefone");
            this.celular = rs.getString("celular");
            this.whatsapp = rs.getString("whatsapp");
            this.email = rs.getString("email");
            this.endereco = rs.getString("endereco");
            this.idCidade = rs.getInt("pes.id_cidade");
            this.usuario = rs.getString("login");
            this.senha = rs.getString("senha");
            this.nomeCidade = rs.getString("cid.nome");
            this.fisicaJuridica = rs.getString("pessoa_fisica");
            
        }catch(Exception e){}
    }
    
}