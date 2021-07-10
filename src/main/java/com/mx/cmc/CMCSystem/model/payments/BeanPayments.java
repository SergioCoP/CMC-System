package com.mx.cmc.CMCSystem.model.payments;

public class BeanPayments {

    private int idpayment;
    private int idmember;
    private int idemploye;
    private int idloan;
    private String membername;
    private String date_payment;
    private float amount_payment;
    private float total_amount;
    private float balance_loan;

    public BeanPayments() {
    }

    public BeanPayments(int idpayment, int idmember, int idemploye, int idloan, String membername, String date_payment, float amount_payment, float total_amount, float balance_loan) {
        this.idpayment = idpayment;
        this.idmember = idmember;
        this.idemploye = idemploye;
        this.idloan = idloan;
        this.membername = membername;
        this.date_payment = date_payment;
        this.amount_payment = amount_payment;
        this.total_amount = total_amount;
        this.balance_loan = balance_loan;
    }

    public int getIdpayment() {
        return idpayment;
    }

    public void setIdpayment(int idpayment) {
        this.idpayment = idpayment;
    }

    public int getIdmember() {
        return idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public int getIdemploye() {
        return idemploye;
    }

    public void setIdemploye(int idemploye) {
        this.idemploye = idemploye;
    }

    public int getIdloan() {
        return idloan;
    }

    public void setIdloan(int idloan) {
        this.idloan = idloan;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getDate_payment() {
        return date_payment;
    }

    public void setDate_payment(String date_payment) {
        this.date_payment = date_payment;
    }

    public float getAmount_payment() {
        return amount_payment;
    }

    public void setAmount_payment(float amount_payment) {
        this.amount_payment = amount_payment;
    }
}
