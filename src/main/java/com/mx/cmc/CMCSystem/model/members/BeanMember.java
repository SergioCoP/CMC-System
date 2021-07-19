package com.mx.cmc.CMCSystem.model.members;

public class BeanMember {

    private int idmember;
    private String name;
    private String lastname;
    private String born_date;
    private String reg_dates;
    private String sexo;
    private int status;
    private int official_id;
    private int birth_certificate;
    private int curp;
    private int proof_residence;
    private int sketch_address;

    public BeanMember() {
    }

    public BeanMember(int idmember,String name, String born_date, String reg_dates, String sexo, int status, int official_id, int birth_certificate, int curp, int proof_residence, int sketch_address) {
        this.idmember = idmember;
        this.name = name;
        this.born_date = born_date;//fecha de nacimineot
        this.reg_dates = reg_dates;//fecha de nacimiento
        this.sexo = sexo;
        this.status = status;
        this.official_id = official_id;//identificaion ofical
        this.birth_certificate = birth_certificate;//acta de nacimiento
        this.curp = curp;
        this.proof_residence = proof_residence;//comprobante de domicilio
        this.sketch_address = sketch_address;//croquia de domicilio
    }

    public int getIdmember() {
        return idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBorn_date() {
        return born_date;
    }

    public void setBorn_date(String born_date) {
        this.born_date = born_date;
    }

    public String getLastname() {
        return lastname;
    }

    public void setLastname(String lastname) {
        this.lastname = lastname;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getOfficial_id() {
        return official_id;
    }

    public void setOfficial_id(int official_id) {
        this.official_id = official_id;
    }

    public int getBirth_certificate() {
        return birth_certificate;
    }

    public void setBirth_certificate(int birth_certificate) {
        this.birth_certificate = birth_certificate;
    }

    public int getCurp() {
        return curp;
    }

    public void setCurp(int curp) {
        this.curp = curp;
    }

    public int getProof_residence() {
        return proof_residence;
    }

    public void setProof_residence(int proof_residence) {
        this.proof_residence = proof_residence;
    }

    public int getSketch_address() {
        return sketch_address;
    }

    public void setSketch_address(int sketch_address) {
        this.sketch_address = sketch_address;
    }

    public String getReg_dates() {
        return reg_dates;
    }

    public void setReg_dates(String reg_dates) {
        this.reg_dates = reg_dates;
    }
}
