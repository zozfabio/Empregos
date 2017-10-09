package br.edu.unidavi.empregabilidade.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexaoBanco {
    
    private static final Logger LOG = Logger.getLogger(ConexaoBanco.class.getName());

    private static final String USUARIO = "root";
    private static final String SENHA = "pu1{n-ENTPoV=Zu";
    private static final String BANCO = "root";
    private static final String HOST = "localhost";
    private static final String DRIVER = "com.mysql.jdbc.Driver";
    private static final String URL = "jdbc:mysql://"+HOST+":3306/"+BANCO;

    private static boolean conectado = false;
    private static Connection con = null;
    private static ConexaoBanco connection = null;
    
    private Statement stmt;
    private ResultSet rs;
    
    private static void conectar() {
        try {
            Class.forName(DRIVER);
            con = DriverManager.getConnection(URL, USUARIO, SENHA);
            connection = new ConexaoBanco();
            conectado = true;
        } catch(ClassNotFoundException ex){
            LOG.log(Level.SEVERE, "Erro de driver!", ex);
        } catch(SQLException ex){
            LOG.log(Level.SEVERE, "Erro de conexão!", ex);
        }
    }
    
    public static Connection getConexao() {
       if (!conectado) {
           conectar();
       }
       return con;
    }

    public static ConexaoBanco getConect() {
        if (connection == null){
            conectarPrimeiraVez();
        }
        return connection;
    }

    public static void conectarPrimeiraVez() {
        ConexaoBanco.conectar();
    }
    
    public ResultSet getDados(String comando) throws Exception {
        if (!conectado) {
            conectar();
        }
        stmt = con.createStatement();
        rs = stmt.executeQuery(comando);
        return rs;
    }
    
    public boolean setDados(String comando) {
        if (!conectado) {
            conectar();
        }
        try {
            stmt = con.createStatement();
            stmt.executeUpdate(comando);
            return true;
        } catch (SQLException ex) {
            LOG.log(Level.SEVERE, "Erro de SQL!", ex);
            return false;
        }
    }

    protected void sairTela() {
        if (conectado) {
            try {
                stmt.close();
                con.close();
            } catch(SQLException ex) {
                LOG.log(Level.SEVERE, "Erro de SQL!", ex);
            }
        }
    }
}
