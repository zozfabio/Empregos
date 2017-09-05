package br.edu.unidavi.empregabilidade.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ConexaoBanco {
    
    private Statement stmt;
    private ResultSet rs;
    private static Connection con;  
    private static boolean conectado;
    private static String usuario = "marcondes";
    private static String senha = "socdconde";
    private static String banco = "empregos";
    private static String host = "localhost";
    private static String driver = "com.mysql.jdbc.Driver";
    private String user;
    private static String url = "jdbc:mysql://"+host+":3307/"+banco;
    private static ConexaoBanco conect = null;
    
    public ConexaoBanco(String Url, String Usuario, String Senha) {
        conectado = false;
        url = Url;
        usuario = Usuario;
        senha = Senha;
        user = null;
    }
    
    private static void conectar() {
        Connection conexao = null;
        try{
            Class.forName(driver);
            conexao = DriverManager.getConnection(url, usuario, senha);            
        }
        catch(ClassNotFoundException erro){
            System.out.println("Erro de driver!");
        }
        catch(SQLException erro){
            System.out.println("Erro de conexão!");
        }
        finally{
            con = conexao;
        }
    }
    
    public ResultSet getDados(String comando) throws Exception{       
        rs = null;
            if(!conectado)
                conectar();

            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery( comando );
        return rs;
    }
    
    public boolean setDados(String comando) {
        if(!conectado)
            conectar();
        try {
            Statement stmt = con.createStatement();
            stmt.executeUpdate( comando );
            return true;
        } 
        catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
    /**
     *Retorna a conexao com o banco de dados
     */
    public static Connection getConexao() {
       if(!conectado) {
           conectar();
       }
       return con;
    }
    
    public static ConexaoBanco getConect() {
        if(conect == null){
            conectarPrimeiraVez();
        }
        return conect;
    }
    
    public static void conectarPrimeiraVez() {
        conect = new ConexaoBanco("jdbc:mysql://localhost:3307/empregos", "marcondes", "socdconde");
        conect.conectar();
    }
    
            
    protected void sairTela() {
        if(conectado) {
            try {
                stmt.close();
                con.close();
            }
            catch(Exception e) {
                e.printStackTrace();
            }
        }
    }
    
}