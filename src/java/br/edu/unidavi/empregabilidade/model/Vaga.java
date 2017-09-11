
package br.edu.unidavi.empregabilidade.model;
import br.edu.unidavi.empregabilidade.util.ConexaoBanco;
import java.sql.Connection;
/**
 *
 * @author G1745 IRON
 */
public class Vaga {
    private int idVaga = 1;
    private String nome = "";
    private String descricao = "";
    private String atividades = "";
    private String requisitos = "";
    private String horario = "";
    private String salario = "";
    private String beneficios = "";
    private int idCidade = 1;
    private String nomeCidade = "";
    private Pessoa pessoa = null;
    
    public Vaga(){
        idVaga = 1;
        nome = "";
        descricao = "";
        atividades = "";
        requisitos = "";
        horario = "";
        salario = "";
        beneficios = "";
        idCidade = 1;
        nomeCidade = "";
        pessoa = null;
    }
    
    public Vaga(String nomeVaga,String desc,String atividads,String requisito,String horari,String salari,String beneficio,String nomeCid,int pesso){
        this.nome = nomeVaga;
        this.descricao = desc;
        this.atividades = atividads;
        this.requisitos = requisito;
        this.horario = horari;
        this.salario = salari;
        this.beneficios = beneficio;
        this.nomeCidade = nomeCid;
        Pessoa pes = new Pessoa();
        pes.setPessoa(pesso);
        this.pessoa = pes;
        
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados("SELECT id_cidade FROM cidade WHERE nome = '"+nomeCidade+"'");
            rs.next();
            this.idCidade = rs.getInt(1);
        }catch(Exception e){}
    }
    
    public void setIdVaga(int idVag){
        this.idVaga = idVag;
    }
    public void setNomeVaga(String nomeVa){
        this.nome = nomeVa;
    }
    public void setDescricao(String desc){
        this.descricao = desc;
    }
    public void setAtividades(String ativ){
        this.atividades = ativ;
    }
    public void setRequisitos(String requisit){
        this.requisitos = requisit;
    }
    public void setHorario(String horari){
        this.horario = horari;
    }
    public void setSalario(String salari){
        this.salario = salari;
    }
    public void setBeneficios(String benefi){
        this.beneficios = benefi;
    }
    public void setIdCidade(int idCid){
        this.idCidade = idCid;
    }
    public void setNomeCidade(String nomeCid){
        this.nomeCidade = nomeCid;
    }
    public void setPessoa(Pessoa pesso){
        this.pessoa = pesso;
    }
    
    public int getIdVaga(){
        return idVaga;
    }
    public String getNomeVaga(){
        return nome;
    }
    public String getDescricao(){
        return descricao;
    }
    public String getAtividades(){
        return atividades;
    }
    public String getRequisitos(){
        return requisitos;
    }
    public String getHorario(){
        return horario;
    }
    public String getSalario(){
        return salario;
    }
    public String getBeneficios(){
        return beneficios;
    }
    public int getIdCidade(){
        return idCidade;
    }
    public String getNomeCidade(){
        return nomeCidade;
    }
    public Pessoa getPessoa(){
        return pessoa;
    }
    
    public void insereVaga(){
        try{
            ConexaoBanco.getConect().setDados("INSERT INTO vaga(nome_vaga,descricao,atividades,requisitos,horario,salario,beneficios,id_pessoa,id_cidade) "
            +"VALUES('"+nome+"','"+descricao+"','"+atividades+"','"+requisitos+"','"+horario+"','"+salario+"','"+beneficios+"',"+pessoa.getidPessoa()+","+idCidade+")");
        }catch(Exception e){}
    }
    
    public void updateVaga(){
        try{
            ConexaoBanco.getConect().setDados("UPDATE vaga SET nome_vaga = '"+nome+"',descricao = '"+descricao+"',atividades = '"+atividades+"',requisitos = '"+requisitos+"',"
                    + "horario = '"+horario+"',salario = '"+salario+"',beneficios = '"+beneficios+"',id_cidade = "+idCidade+" "
                    + "WHERE id_vaga = "+idVaga);
        }catch(Exception e){}
    }
    
    public void setVaga(int idVag){
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados(""
                    + "SELECT * "
                    + "FROM vaga "
                    + "WHERE id_vaga = "+idVag+"");
            rs.next();
            
            this.idVaga = idVag;
            this.nome = rs.getString("nome_vaga");
            this.descricao = rs.getString("descricao");
            this.atividades = rs.getString("atividades");
            this.requisitos = rs.getString("requisitos");
            this.horario = rs.getString("horario");
            this.salario = rs.getString("salario");
            this.beneficios = rs.getString("beneficios");
            this.idCidade = rs.getInt("id_cidade");
            
            Pessoa pes = new Pessoa();
            pes.setPessoa(rs.getInt("id_pessoa"));
            this.pessoa = pes;

            java.sql.ResultSet rs2 = ConexaoBanco.getConect().getDados("SELECT * FROM cidade WHERE id_cidade = "+idCidade+"");
            rs2.next();
            this.nomeCidade = rs2.getString("nome");

            
        }catch(Exception e){}
    }
    
}