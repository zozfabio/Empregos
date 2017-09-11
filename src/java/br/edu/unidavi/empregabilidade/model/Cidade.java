
package br.edu.unidavi.empregabilidade.model;
import br.edu.unidavi.empregabilidade.util.ConexaoBanco;
import java.sql.Connection;
/**
 *
 * @author G1745 IRON
 */
public class Cidade {
    private int idCidade = 1;
    private String nome = "";
    private String siglaEstado = "";
    
    public Cidade(){
        idCidade = 1;
        nome = "";
        siglaEstado = "";
    }
    
    public Cidade(String nomeCidad,String siglaEstad){
        this.nome = nomeCidad;
        this.siglaEstado = siglaEstad;
    }
    
    public void setIdCidade(int idCid){
        this.idCidade = idCid;
    }
    public void setNomeCidade(String nomeCid){
        this.nome = nomeCid;
    }
    public void setSiglaEstado(String sigla){
        this.siglaEstado = sigla;
    }
    
    
    public int getIdCidade(){
        return idCidade;
    }
    public String getNomeCidade(){
        return nome;
    }
    public String getSiglaEstado(){
        return siglaEstado;
    }
   
    
    public void insereCidade(){
        try{
            ConexaoBanco.getConect().setDados("INSERT INTO cidade(nome,sigla_estado) "
            +"VALUES('"+nome+"','"+siglaEstado+"')");
        }catch(Exception e){}
    }
    
    public void updateCidade(){
        try{
            ConexaoBanco.getConect().setDados("UPDATE cidade SET nome = '"+nome+"',sigla_estado = '"+siglaEstado+"' "
                    + "WHERE id_cidade = "+idCidade);
        }catch(Exception e){}
    }
    
    public void setCidadePorID(int idCidad){
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados(""
                    + "SELECT * "
                    + "FROM cidade "
                    + "WHERE id_cidade = "+idCidad+"");
            rs.next();
            
            this.idCidade = idCidad;
            this.nome = rs.getString("nome");
            this.siglaEstado = rs.getString("sigla_estado");
            
        }catch(Exception e){}
    }
    
    public void setCidadePorNome(String nomeCidad){
        try{
            java.sql.ResultSet rs = ConexaoBanco.getConect().getDados(""
                    + "SELECT * "
                    + "FROM cidade "
                    + "WHERE nome = "+nomeCidad+"");
            rs.next();
            
            this.idCidade = rs.getInt("id_cidade");
            this.nome = nomeCidad;
            this.siglaEstado = rs.getString("sigla_estado");
            
        }catch(Exception e){}
    }
    
}