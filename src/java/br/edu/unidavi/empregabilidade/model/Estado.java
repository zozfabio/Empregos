package br.edu.unidavi.empregabilidade.model;

public class Estado {

    private String est_sigla;
    private String nome;

    public Estado(String est_sigla, String nome) {
        this.est_sigla = est_sigla;
        this.nome = nome;
    }

    public String getEst_sigla() {
        return est_sigla;
    }

    public void setEst_sigla(String est_sigla) {
        this.est_sigla = est_sigla;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

}
