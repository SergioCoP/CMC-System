package com.mx.cmc.CMCSystem.model.loans;

import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.members.BeanMember;

public class BeanLoan {
    private int idloan;
    private BeanMember idmember;
    private BeanEmployee idemployee;
    private BeanCredits idcredit;
    private String member_name;
    private String employee_name;
    private String credit_type;
    private float amount;//monto solicitado
    private int period;//plazo solicitado a pagar
    private String date_request;//fecha de solicitid
    private String aval1;
    private String aval2;
    private String income_document;//comprobante de ingresos
    private String razon_social;
    private String location;//ubicacion
    private String line_bussines;//giro de la empresa

    public BeanLoan() {
    }

    public BeanLoan(int idloan, BeanMember idmember, BeanEmployee idemployee, String member_name, String employee_name, String credit_type, float amount, int period, String date_request, String aval1, String aval2, String income_document, String razon_social, String location, String line_bussines) {
        this.idloan = idloan;
        this.idmember = idmember;
        this.idemployee = idemployee;
        this.member_name = member_name;
        this.employee_name = employee_name;
        this.credit_type = credit_type;
        this.amount = amount;
        this.period = period;
        this.date_request = date_request;
        this.aval1 = aval1;
        this.aval2 = aval2;
        this.income_document = income_document;
        this.razon_social = razon_social;
        this.location = location;
        this.line_bussines = line_bussines;
    }

    public int getIdloan() {
        return idloan;
    }

    public void setIdloan(int idloan) {
        this.idloan = idloan;
    }

    public BeanMember getIdmember() {
        return idmember;
    }

    public void setIdmember(BeanMember idmember) {
        this.idmember = idmember;
    }

    public BeanEmployee getIdemployee() {
        return idemployee;
    }

    public void setIdemployee(BeanEmployee idemployee) {
        this.idemployee = idemployee;
    }

    public String getMember_name() {
        return member_name;
    }

    public void setMember_name(String member_name) {
        this.member_name = member_name;
    }

    public String getEmployee_name() {
        return employee_name;
    }

    public void setEmployee_name(String employee_name) {
        this.employee_name = employee_name;
    }

    public String getCredit_type() {
        return credit_type;
    }

    public void setCredit_type(String credit_type) {
        this.credit_type = credit_type;
    }

    public float getAmount() {
        return amount;
    }

    public void setAmount(float amount) {
        this.amount = amount;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public String getDate_request() {
        return date_request;
    }

    public void setDate_request(String date_request) {
        this.date_request = date_request;
    }

    public String getAval1() {
        return aval1;
    }

    public void setAval1(String aval1) {
        this.aval1 = aval1;
    }

    public String getAval2() {
        return aval2;
    }

    public void setAval2(String aval2) {
        this.aval2 = aval2;
    }

    public String getIncome_document() {
        return income_document;
    }

    public void setIncome_document(String income_document) {
        this.income_document = income_document;
    }

    public String getRazon_social() {
        return razon_social;
    }

    public void setRazon_social(String razon_social) {
        this.razon_social = razon_social;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getLine_bussines() {
        return line_bussines;
    }

    public void setLine_bussines(String line_bussines) {
        this.line_bussines = line_bussines;
    }

    public BeanCredits getIdcredit() {
        return idcredit;
    }

    public void setIdcredit(BeanCredits idcredit) {
        this.idcredit = idcredit;
    }
}
