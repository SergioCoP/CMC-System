package com.mx.cmc.CMCSystem.model.employees;

public class BeanEmployee {

    private int idemploye;
    private int idcredit;
    private int idpayment;
    private String name;
    private String lastnames;
    private String role;

    public BeanEmployee() {
    }

    public BeanEmployee(int idemploye, int idcredit, int idpayment, String name, String lastnames, String role) {
        this.idemploye = idemploye;
        this.idcredit = idcredit;
        this.idpayment = idpayment;
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

    public int getIdcredit() {
        return idcredit;
    }

    public void setIdcredit(int idcredit) {
        this.idcredit = idcredit;
    }

    public int getIdpayment() {
        return idpayment;
    }

    public void setIdpayment(int idpayment) {
        this.idpayment = idpayment;
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
