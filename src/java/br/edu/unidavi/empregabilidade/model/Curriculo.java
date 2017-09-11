
package br.edu.unidavi.empregabilidade.model;
import br.edu.unidavi.empregabilidade.util.ConexaoBanco;
import java.sql.Connection;
/**
 *
 * @author G1745 IRON
 */
public class Curriculo {
    private int idCurriculo = 1;
    private String nome = "";
    private String telefone = "";
    private String celular = "";
    private String whatsapp = "";
    private String endereco = "";
    private int idCidade = 1;
    private String nomeCidade = "";
    private String nacionalidade = "";
    private int idade = 18;
    private String civil = "";
    private String genero = "";
    private String email = "";
    private String formacao = "";
    private String atividadesComplementares = "";
    private String outrasInformacoes = "";
    private Pessoa pessoa = null;
    
    public Curriculo(){
        idCurriculo = 1;
        nome = "";
        telefone = "";
        celular = "";
        whatsapp = "";
        endereco = "";
        idCidade = 1;
        nomeCidade = "";
        nacionalidade = "";
        idade = 18;
        civil = "";
        genero = "";
        email = "";
        formacao = "";
        atividadesComplementares = "";
        outrasInformacoes = "";
        pessoa = null;
    }
    
    public Curriculo(String nomeCurri,String tel,String cel,String whats,String end,String nomeCid,String nacionalidad,String idad,String civi,
            String gener,String emai,String formaca,String atividades,String outrasInf,int pesso){
        this.nome = nomeCurri;
        this.telefone = tel;
        this.celular = cel;
        this.whatsapp = whats;
        this.endereco = end;
        this.nomeCidade = nomeCid;
        this.nacionalidade = nacionalidad;
        this.idade = Integer.parseInt(idad);
        this.civil = civi;
        this.genero = gener;
        this.email = emai;
        this.formacao = formaca;
        this.atividadesComplementares = atividades;
        this.outrasInformacoes = outrasInf;
        Pessoa pes = new Pessoa();
        pes.setPessoa(pesso);
        this.pessoa = pes;
        
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+nomeCidade+"'");
            rs.next();
            this.idCidade = rs.getInt(1);
        }catch(Exception e){}
    }
    
    public void setIdCurriculo(int idCurricul){
        this.idCurriculo = idCurricul;
    }
    public void setNomePessoa(String nomePessoa){
        this.nome = nomePessoa;
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
    public void setEndereco(String end){
        this.endereco = end;
    }
    public void setIdCidade(int idCid){
        this.idCidade = idCid;
    }
    public void setNomeCidade(String nomeCid){
        this.nomeCidade = nomeCid;
    }
    public void setNacionalidade(String nacionalid){
        this.nacionalidade = nacionalid;
    }
    public void setIdade(int idad){
        this.idade = idad;
    }
    public void setEstadoCivil(String estadoCivi){
        this.civil = estadoCivi;
    }
    public void setGenero(String gener){
        this.genero = gener;
    }
    public void setEmail(String emai){
        this.email = emai;
    }
    public void setFormacao(String formaca){
        this.formacao = formaca;
    }
    public void setAtividadesComplementares(String ativiCompl){
        this.atividadesComplementares = ativiCompl;
    }
    public void setOutrasInformacoes(String outrasInf){
        this.outrasInformacoes = outrasInf;
    }
    public void setPessoa(Pessoa pesso){
        this.pessoa = pesso;
    }
    
    public int getIdCurriculo(){
        return this.idCurriculo;
    }
    public String getNomePessoa(){
        return this.nome;
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
    public String getEndereco(){
        return this.endereco;
    }
    public int getIdCidade(){
        return this.idCidade;
    }
    public String getNomeCidade(){
        return this.nomeCidade;
    }
    public String getNacionalidade(){
        return this.nacionalidade;
    }
    public int getIdade(){
        return this.idade;
    }
    public String getEstadoCivil(){
        return this.civil;
    }
    public String getGenero(){
        return this.genero;
    }
    public String getEmail(){
        return this.email;
    }
    public String getFormacao(){
        return this.formacao;
    }
    public String getAtividadesComplementares(){
        return this.atividadesComplementares;
    }
    public String getOutrasInformacoes(){
        return this.outrasInformacoes;
    }
    public Pessoa getPessoa(){
        return this.pessoa;
    }
    
    public void insereCurriculo(){
        try{
            ConexaoBanco.getConect().setDados("INSERT INTO curriculo(nome_completo,telefone,celular,whatsapp,endereco,id_cidade,nacionalidade,idade,"
                    + "civil,genero,email,formacao,atividades_complementares,outras_informacoes,id_pessoa) "
            +"VALUES('"+nome+"','"+telefone+"','"+celular+"','"+whatsapp+"','"+endereco+"',"+idCidade+",'"+nacionalidade+"',"+idade+","
                    + "'"+civil+"','"+genero+"','"+email+"','"+formacao+"','"+atividadesComplementares+"','"+outrasInformacoes+"',"+pessoa.getidPessoa()+")");
        }catch(Exception e){}
    }
    
    public void updateCurriculo(){
        try{
            ConexaoBanco.getConect().setDados("UPDATE pessoa SET nome_completo = '"+nome+"',telefone = '"+telefone+"',celular = '"+celular+"',whatsapp = '"+whatsapp+"',"
                    + "endereco = '"+endereco+"',id_cidade = "+idCidade+",nacionalidade = '"+nacionalidade+"',idade = "+idade+","
                    + "civil = '"+civil+"',genero = '"+genero+"',email = '"+email+"',formacao = '"+formacao+"',"
                    + "atividades_complementares = '"+atividadesComplementares+"',outras_informacoes = '"+outrasInformacoes+"' "
                    + "WHERE id_curriculo = "+idCurriculo);
        }catch(Exception e){}
    }
    
    public void setCurriculo(int idCurricul){
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados(""
                    + "SELECT * "
                    + "FROM curriculo "
                    + "WHERE id_curriculo = "+idCurricul+"");
            rs.next();
            
            this.idCurriculo = idCurricul;
            this.nome = rs.getString("nome_completo");
            this.telefone = rs.getString("telefone");
            this.celular = rs.getString("celular");
            this.whatsapp = rs.getString("whatsapp");
            this.endereco = rs.getString("endereco");
            this.idCidade = rs.getInt("id_cidade");
            this.nacionalidade = rs.getString("nacionalidade");
            this.idade = rs.getInt("idade");
            this.civil = rs.getString("civil");
            this.genero = rs.getString("genero");
            this.email = rs.getString("email");
            this.formacao = rs.getString("formacao");
            this.atividadesComplementares = rs.getString("atividades_complementares");
            this.outrasInformacoes = rs.getString("outras_informacoes");
            Pessoa pes = new Pessoa();
            pes.setPessoa(rs.getInt("id_pessoa"));
            this.pessoa = pes;
            
            try{
                java.sql.ResultSet rs2 = ConexaoBanco.getConect().getDados("SELECT nome FROM cidade WHERE id_cidade = "+rs.getInt("id_cidade")+"");
                rs2.next();
                this.nomeCidade = rs.getString(1);
            }catch(Exception e){}
            
        }catch(Exception e){}
    }
    
}