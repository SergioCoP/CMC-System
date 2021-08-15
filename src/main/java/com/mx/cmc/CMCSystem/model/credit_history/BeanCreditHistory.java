package com.mx.cmc.CMCSystem.model.credit_history;

import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.payments.BeanPayments;

public class BeanCreditHistory {

    private int idmember;
    private int idpayment;
    private String membername;
    private String creditname;
    private int period;
    private float total_amount;
    private float balance;
    private float amount_payment;
    private String date_payment;
    private int status;


    public BeanCreditHistory() {
    }


    public int getIdmember() {
        return idmember;
    }

    public void setIdmember(int idmember) {
        this.idmember = idmember;
    }

    public int getIdpayment() {
        return idpayment;
    }

    public void setIdpayment(int idpayment) {
        this.idpayment = idpayment;
    }

    public String getMembername() {
        return membername;
    }

    public void setMembername(String membername) {
        this.membername = membername;
    }

    public String getCreditname() {
        return creditname;
    }

    public void setCreditname(String creditname) {
        this.creditname = creditname;
    }

    public int getPeriod() {
        return period;
    }

    public void setPeriod(int period) {
        this.period = period;
    }

    public float getTotal_amount() {
        return total_amount;
    }

    public void setTotal_amount(float total_amount) {
        this.total_amount = total_amount;
    }

    public float getBalance() {
        return balance;
    }

    public void setBalance(float balance) {
        this.balance = balance;
    }

    public float getAmount_payment() {
        return amount_payment;
    }

    public void setAmount_payment(float amount_payment) {
        this.amount_payment = amount_payment;
    }

    public String getDate_payment() {
        return date_payment;
    }

    public void setDate_payment(String date_payment) {
        this.date_payment = date_payment;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
