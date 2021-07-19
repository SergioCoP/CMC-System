package com.mx.cmc.CMCSystem.model.credits;

import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;

public class BeanCredits {
    private int idcredit;
    private BeanEmployee idempleado;
    private String name;
    private int max_period;//plazo maximo meses
    private int min_period;//plazo minimo en meses
    private float interest_rate;
    private float max_amount;//monto maximo en pesos
    private float min_amount; //monto minimo en pesos
    private String requeriments; //requerimientos de cada tipo de credito

    public BeanCredits() {
    }

    public BeanCredits(int idcredit, String name, int max_period, int min_period, float interest_rate, float max_amount, float min_amount, String requeriments) {
        this.idcredit = idcredit;
        this.name = name;
        this.max_period = max_period;
        this.min_period = min_period;
        this.interest_rate = interest_rate;
        this.max_amount = max_amount;
        this.min_amount = min_amount;
        this.requeriments = requeriments;
    }

    public int getIdcredit() {
        return idcredit;
    }

    public void setIdcredit(int idcredit) {
        this.idcredit = idcredit;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMax_period() {
        return max_period;
    }

    public void setMax_period(int max_period) {
        this.max_period = max_period;
    }

    public int getMin_period() {
        return min_period;
    }

    public void setMin_period(int min_period) {
        this.min_period = min_period;
    }

    public float getInterest_rate() {
        return interest_rate;
    }

    public void setInterest_rate(float interest_rate) {
        this.interest_rate = interest_rate;
    }

    public float getMax_amount() {
        return max_amount;
    }

    public void setMax_amount(float max_amount) {
        this.max_amount = max_amount;
    }

    public float getMin_amount() {
        return min_amount;
    }

    public void setMin_amount(float min_amount) {
        this.min_amount = min_amount;
    }

    public String getRequeriments() {
        return requeriments;
    }

    public void setRequeriments(String requeriments) {
        this.requeriments = requeriments;
    }

    public BeanEmployee getIdempleado() { return idempleado; }

    public void setIdempleado(BeanEmployee idempleado) { this.idempleado = idempleado; }
}
