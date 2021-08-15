package com.mx.cmc.CMCSystem.model.payments;

import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.model.members.BeanMember;

public class BeanPayments {

    private int idpayment;
    private BeanMember idmember;
    private BeanEmployee idemploye;
    private BeanLoan idloan;
    private String membername;
    private String date_payment;
    private float amount_payment;

    public BeanPayments() {
    }

    public BeanPayments(int idpayment, BeanMember idmember, BeanEmployee idemploye, BeanLoan idloan, String membername, String date_payment, float amount_payment) {
        this.idpayment = idpayment;
        this.idmember = idmember;
        this.idemploye = idemploye;
        this.idloan = idloan;
        this.membername = membername;
        this.date_payment = date_payment;
        this.amount_payment = amount_payment;
    }

    public int getIdpayment() {
        return idpayment;
    }

    public void setIdpayment(int idpayment) {
        this.idpayment = idpayment;
    }

    public BeanMember getIdmember() {
        return idmember;
    }

    public void setIdmember(BeanMember idmember) {
        this.idmember = idmember;
    }

    public BeanEmployee getIdemploye() {
        return idemploye;
    }

    public void setIdemploye(BeanEmployee idemploye) {
        this.idemploye = idemploye;
    }

    public BeanLoan getIdloan() {
        return idloan;
    }

    public void setIdloan(BeanLoan idloan) {
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
