package com.mx.cmc.CMCSystem.model.payments;

import com.mx.cmc.CMCSystem.model.payments.BeanPayments;
import com.mx.cmc.CMCSystem.model.payments.DaoPayments;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoPayments {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoPayments.class);
    int r;

    public List<BeanPayments> findAll(){
        List<BeanPayments> listPayments = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findPayments}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanPayments payments = new BeanPayments();
                BeanLoan loan = new BeanLoan();
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();

                payments.setIdpayment(rs.getInt("idpayment"));
                member.setIdmember(rs.getInt("idmember"));
                employe.setIdemploye(rs.getInt("idemploye"));
                loan.setIdloan(rs.getInt("idloan"));
                payments.setMembername(rs.getString("membername"));
                payments.setDate_payment(rs.getString("date_payment"));
                payments.setAmount_payment(rs.getFloat("amount_payment"));
                payments.setTotal_amount(rs.getFloat("total_amount"));
                payments.setBalance_loan(rs.getInt("total_amount"));
                payments.setIdmember(member);
                payments.setIdemploye(employe);
                payments.setIdloan(loan);

                listPayments.add(payments);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listPayments;
    }

    public BeanPayments ListarporId(int id){
        BeanPayments payments = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from abonos as a inner join empleados as e on a.idempleado = e.idempleado inner join socios as s on a.idsocio = s.idsocio inner join prestamos as p on a.idprestamo = p.idprestamo where p.idabono=?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){

                BeanLoan loan = new BeanLoan();
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();
                payments = new BeanPayments();

                payments.setIdpayment(rs.getInt("idpayment"));
                member.setIdmember(rs.getInt("idmember"));
                employe.setIdemploye(rs.getInt("idemploye"));
                loan.setIdloan(rs.getInt("idloan"));
                payments.setMembername(rs.getString("membername"));
                payments.setDate_payment(rs.getString("date_payment"));
                payments.setAmount_payment(rs.getFloat("amount_payment"));
                payments.setTotal_amount(rs.getFloat("total_amount"));
                payments.setBalance_loan(rs.getInt("total_amount"));
                payments.setIdmember(member);
                payments.setIdemploye(employe);
                payments.setIdloan(loan);

            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return payments;
    }

    public int agregar(BeanPayments payments){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registerPayments(?,?,?,?,?,?,?,?)}");

            cstm.setInt(1, payments.getIdmember().getIdmember());
            cstm.setInt(2,payments.getIdemploye().getIdemploye());
            cstm.setInt(3,payments.getIdloan().getIdloan());
            cstm.setString(4,payments.getMembername());
            cstm.setString(5,payments.getDate_payment());
            cstm.setFloat(6,payments.getAmount_payment());
            cstm.setFloat(7,payments.getTotal_amount());
            cstm.setFloat(8,payments.getBalance_loan());

            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanPayments payments){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifyPayments(?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1, payments.getIdpayment());
            cstm.setInt(2, payments.getIdmember().getIdmember());
            cstm.setInt(3,payments.getIdemploye().getIdemploye());
            cstm.setInt(4,payments.getIdloan().getIdloan());
            cstm.setString(5,payments.getMembername());
            cstm.setString(6,payments.getDate_payment());
            cstm.setFloat(7,payments.getAmount_payment());
            cstm.setFloat(8,payments.getTotal_amount());
            cstm.setFloat(9,payments.getBalance_loan());

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
            cstm = con.prepareCall("{call deletepayments(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }

}
