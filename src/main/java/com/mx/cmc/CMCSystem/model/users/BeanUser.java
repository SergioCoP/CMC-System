package com.mx.cmc.CMCSystem.model.users;

import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;

public class BeanUser {
    private int iduser;
    private String email;
    private String password;
    private BeanEmployee idemploye;

    public BeanUser() {
    }

    public BeanUser(BeanEmployee idemploye, String email, String password) {
        this.idemploye = idemploye;
        this.email = email;
        this.password = password;

    }



    public BeanEmployee getIdemploye() {
        return idemploye;

    }

    public void setIdemploye(BeanEmployee idemploye) {
        this.idemploye = idemploye;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }
}
