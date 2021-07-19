package com.mx.cmc.CMCSystem.model.credits;

import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.credits.DaoCredits;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoCredits {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoCredits.class);
    int r;

    public List<BeanCredits> findcredits(){
        List<BeanCredits> listCredits = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findcredits}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanCredits credit = new BeanCredits();
                BeanEmployee employe = new BeanEmployee();

               credit.setIdcredit(rs.getInt("idcredito"));
               credit.setName(rs.getString("nombre"));
               credit.setMax_period(rs.getInt("plazo_maximo"));
               credit.setMin_period(rs.getInt("plazo_minimo"));
               credit.setMax_amount(rs.getFloat("monto_maximo"));
               credit.setMin_amount(rs.getFloat("monto_minimo"));
               credit.setInterest_rate(rs.getFloat("tasa_interes"));
               credit.setRequeriments(rs.getString("requisitos"));
               employe.setIdemploye(rs.getInt("idempleado"));
               credit.setIdempleado(employe);
                listCredits.add(credit);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listCredits;
    }

    public BeanCredits ListarporId(int id){
        BeanCredits credit = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from creditos as c inner join empleados as e on c.idempleado = e.idempleado where c.idcredito=?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanEmployee employe = new BeanEmployee();
                credit = new BeanCredits();


                credit.setIdcredit(rs.getInt("idcredito"));
                credit.setName(rs.getString("nombre"));
                credit.setMax_period(rs.getInt("plazo_maximo"));
                credit.setMin_period(rs.getInt("plazo_minimo"));
                credit.setMax_amount(rs.getFloat("monto_maximo"));
                credit.setMin_amount(rs.getFloat("monto_minimo"));
                credit.setInterest_rate(rs.getFloat("tasa_interes"));
                credit.setRequeriments(rs.getString("requisitos"));
                employe.setIdemploye(rs.getInt("idempleado"));
                credit.setIdempleado(employe);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return credit;
    }

    public int agregar(BeanCredits credit){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registercredit(?,?,?,?,?,?,?,?)}");

            cstm.setInt(1,credit.getIdempleado().getIdemploye());
            cstm.setString(2, credit.getName());
            cstm.setInt(3,credit.getMin_period());
            cstm.setInt(4,credit.getMax_period());
            cstm.setFloat(5,credit.getInterest_rate());
            cstm.setFloat(6,credit.getMin_amount());
            cstm.setFloat(7,credit.getMax_amount());
            cstm.setString(8,credit.getRequeriments());
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanCredits credit){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifycredit(?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1,credit.getIdcredit());
            cstm.setInt(2,credit.getIdempleado().getIdemploye());
            cstm.setString(3, credit.getName());
            cstm.setInt(4,credit.getMin_period());
            cstm.setInt(5,credit.getMax_period());
            cstm.setFloat(6,credit.getInterest_rate());
            cstm.setFloat(7,credit.getMin_amount());
            cstm.setFloat(8,credit.getMax_amount());
            cstm.setString(9,credit.getRequeriments());
            cstm.executeUpdate();
        }catch (SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;

    }

    public void eliminar(int id){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call deletecredit(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }

}