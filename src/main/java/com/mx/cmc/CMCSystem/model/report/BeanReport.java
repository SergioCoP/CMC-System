package com.mx.cmc.CMCSystem.model.report;

import com.mx.cmc.CMCSystem.model.credit_history.BeanCreditHistory;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.payments.BeanPayments;

public class BeanReport {
    private int idreport;
private BeanMember idmember;
private BeanCreditHistory idsocio_history;
private BeanPayments idpayment;
private String i_name;
private String i_last_name;
private String i_registration_date;
private String icredit_type;
private float i_amount;
private int i_term;
private String i_total_amount;
private String i_remaining_amount;
private float i_subscriber_amount;
private String i_status;

    public BeanReport() {
    }

    public BeanReport(int idreport, BeanMember idmember, BeanCreditHistory idsocio_history, BeanPayments idpayment, String i_name, String i_last_name, String i_registration_date, String icredit_type, float i_amount, int i_term, String i_total_amount, String i_remaining_amount, float i_subscriber_amount, String i_status) {
        this.idreport = idreport;
        this.idmember = idmember;
        this.idsocio_history = idsocio_history;
        this.idpayment = idpayment;
        this.i_name = i_name;
        this.i_last_name = i_last_name;
        this.i_registration_date = i_registration_date;
        this.icredit_type = icredit_type;
        this.i_amount = i_amount;
        this.i_term = i_term;
        this.i_total_amount = i_total_amount;
        this.i_remaining_amount = i_remaining_amount;
        this.i_subscriber_amount = i_subscriber_amount;
        this.i_status = i_status;
    }

    public int getIdreport() {
        return idreport;
    }

    public void setIdreport(int idreport) {
        this.idreport = idreport;
    }

    public BeanMember getIdmember() {
        return idmember;
    }

    public void setIdmember(BeanMember idmember) {
        this.idmember = idmember;
    }

    public BeanCreditHistory getIdsocio_history() {
        return idsocio_history;
    }

    public void setIdsocio_history(BeanCreditHistory idsocio_history) {
        this.idsocio_history = idsocio_history;
    }

    public BeanPayments getIdpayment() {
        return idpayment;
    }

    public void setIdpayment(BeanPayments idpayment) {
        this.idpayment = idpayment;
    }

    public String getI_name() {
        return i_name;
    }

    public void setI_name(String i_name) {
        this.i_name = i_name;
    }

    public String getI_last_name() {
        return i_last_name;
    }

    public void setI_last_name(String i_last_name) {
        this.i_last_name = i_last_name;
    }

    public String getI_registration_date() {
        return i_registration_date;
    }

    public void setI_registration_date(String i_registration_date) {
        this.i_registration_date = i_registration_date;
    }

    public String getIcredit_type() {
        return icredit_type;
    }

    public void setIcredit_type(String icredit_type) {
        this.icredit_type = icredit_type;
    }

    public float getI_amount() {
        return i_amount;
    }

    public void setI_amount(float i_amount) {
        this.i_amount = i_amount;
    }

    public int getI_term() {
        return i_term;
    }

    public void setI_term(int i_term) {
        this.i_term = i_term;
    }

    public String getI_total_amount() {
        return i_total_amount;
    }

    public void setI_total_amount(String i_total_amount) {
        this.i_total_amount = i_total_amount;
    }

    public String getI_remaining_amount() {
        return i_remaining_amount;
    }

    public void setI_remaining_amount(String i_remaining_amount) {
        this.i_remaining_amount = i_remaining_amount;
    }

    public float getI_subscriber_amount() {
        return i_subscriber_amount;
    }

    public void setI_subscriber_amount(float i_subscriber_amount) {
        this.i_subscriber_amount = i_subscriber_amount;
    }

    public String getI_status() {
        return i_status;
    }

    public void setI_status(String i_status) {
        this.i_status = i_status;
    }
}
