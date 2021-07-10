package com.mx.cmc.CMCSystem.model.members;

public class BeanMember {

    private int idmember;
    private int idloan;
    private int idpayment;
    private String name;
    private String born_date;
    private String registration_date;
    private char sexo;
    private String status;
    private String official_id;
    private String birth_certificate;
    private String curp;
    private String proof_residence;
    private String sketch_address;

    public BeanMember() {
    }

    public BeanMember(int idmember, int idloan, int idpayment, String name, String born_date, String registration_date, char sexo, String status, String official_id, String birth_certificate, String curp, String proof_residence, String sketch_address) {
        this.idmember = idmember;
        this.idloan = idloan;
        this.idpayment = idpayment;
        this.name = name;
        this.born_date = born_date;//fecha de nacimineot
        this.registration_date = registration_date;//fecha de nacimiento
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

    public int getIdloan() {
        return idloan;
    }

    public void setIdloan(int idloan) {
        this.idloan = idloan;
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

    public String getBorn_date() {
        return born_date;
    }

    public void setBorn_date(String born_date) {
        this.born_date = born_date;
    }

    public String getRegistration_date() {
        return registration_date;
    }

    public void setRegistration_date(String registration_date) {
        this.registration_date = registration_date;
    }

    public char getSexo() {
        return sexo;
    }

    public void setSexo(char sexo) {
        this.sexo = sexo;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOfficial_id() {
        return official_id;
    }

    public void setOfficial_id(String official_id) {
        this.official_id = official_id;
    }

    public String getBirth_certificate() {
        return birth_certificate;
    }

    public void setBirth_certificate(String birth_certificate) {
        this.birth_certificate = birth_certificate;
    }

    public String getCurp() {
        return curp;
    }

    public void setCurp(String curp) {
        this.curp = curp;
    }

    public String getProof_residence() {
        return proof_residence;
    }

    public void setProof_residence(String proof_residence) {
        this.proof_residence = proof_residence;
    }

    public String getSketch_address() {
        return sketch_address;
    }

    public void setSketch_address(String sketch_address) {
        this.sketch_address = sketch_address;
    }
}
