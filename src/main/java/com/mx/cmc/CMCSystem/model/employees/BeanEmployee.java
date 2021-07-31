package com.mx.cmc.CMCSystem.model.employees;

public class BeanEmployee {

    private int idemploye;
    private String name;
    private String lastnames;
    private String role;

    public BeanEmployee() {
    }

    public BeanEmployee(int idemploye, String name, String lastnames, String role) {
        this.idemploye = idemploye;
        this.name = name;
        this.lastnames = lastnames;
        this.role = role;
    }


    public int getIdemploye() {
        return idemploye;
    }

    public void setIdemploye(int idemploye) {
        this.idemploye = idemploye;
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
