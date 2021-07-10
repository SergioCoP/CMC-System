package com.mx.cmc.CMCSystem.model.users;

public class BeanUser {
    private int iduser;
    private int idempleado;
    private String name;
    private String lastnames;
    private String role;

    public BeanUser(){

    }

    public BeanUser(int iduser, int idempleado, String name, String lastnames, String role){
        this.iduser = iduser;
        this.idempleado = idempleado;
        this.name = name;
        this.lastnames = lastnames;
        this.role = role;

    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdempleado() {
        return idempleado;
    }

    public void setIdempleado(int idempleado) {
        this.idempleado = idempleado;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getLastnames() {
        return lastnames;
    }

    public void setLastnames(String lastnames) {
        this.lastnames = lastnames;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
