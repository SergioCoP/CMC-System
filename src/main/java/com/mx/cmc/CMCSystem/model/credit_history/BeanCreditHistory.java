package com.mx.cmc.CMCSystem.model.credit_history;

public class BeanCreditHistory {
    private int idsocio_history;
    private int idloan; //loan es prestamo
    private String credit_name; //noombre del tipo de credito
    private int period; //plazo al que se esta pagando
    private float total_amount; //monto total prestado
    private float balance; //monto restante a pagar
    private String status; //mencionar el estado del prestamo

    public BeanCreditHistory() {
    }

    public BeanCreditHistory(int idsocio_history, int idloan, String credit_name, int period, float total_amount, float balance, String status) {
        this.idsocio_history = idsocio_history;
        this.idloan = idloan;
        this.credit_name = credit_name;
        this.period = period;
        this.total_amount = total_amount;
        this.balance = balance;
        this.status = status;
    }

    public int getIdsocio_history() {
        return idsocio_history;
    }

    public void setIdsocio_history(int idsocio_history) {
        this.idsocio_history = idsocio_history;
    }

    public int getIdloan() {
        return idloan;
    }

    public void setIdloan(int idloan) {
        this.idloan = idloan;
    }

    public String getCredit_name() {
        return credit_name;
    }

    public void setCredit_name(String credit_name) {
        this.credit_name = credit_name;
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

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
