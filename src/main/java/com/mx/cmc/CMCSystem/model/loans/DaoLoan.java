package com.mx.cmc.CMCSystem.model.loans;

import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.model.loans.DaoLoan;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
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

public class DaoLoan {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoLoan.class);
    int r;

    public List<BeanLoan> findAll(){
        List<BeanLoan> listLoan = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findAll}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanLoan loan = new BeanLoan();
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();

                loan.setIdloan(rs.getInt("idloan"));
                member.setIdmember(rs.getInt("idmember"));
                employe.setIdemploye(rs.getInt("idemploye"));
                loan.setMember_name(rs.getString("member_name"));
                loan.setEmployee_name(rs.getString("employee_name"));
                loan.setCredit_type(rs.getString("credit_type"));
                loan.setAmount(rs.getFloat("amount"));
                loan.setBalance(rs.getFloat("balance"));
                loan.setPeriod(rs.getInt("period"));
                loan.setDate_request(rs.getString("date_request"));
                loan.setAval1(rs.getString("aval1"));
                loan.setAval2(rs.getString("aval2"));
                loan.setIncome_document(rs.getString("income_document"));
                loan.setRazon_social(rs.getString("razon_social"));
                loan.setLocation(rs.getString("location"));
                loan.setLine_bussines(rs.getString("line_bussines"));
                loan.setIdemployee(employe);
                loan.setIdmember(member);

                listLoan.add(loan);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listLoan;
    }

    public BeanLoan ListarporId(int id){
        BeanLoan loan = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from prestamos as p inner join empleados as e on p.idempleado = e.idempleado inner join socios as s on p.idsocio = s.idsocio where p.idprestamo=?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();
                loan = new BeanLoan();

                loan.setIdloan(rs.getInt("idloan"));
                member.setIdmember(rs.getInt("idmember"));
                employe.setIdemploye(rs.getInt("idemploye"));
                loan.setMember_name(rs.getString("member_name"));
                loan.setEmployee_name(rs.getString("employee_name"));
                loan.setCredit_type(rs.getString("credit_type"));
                loan.setAmount(rs.getFloat("amount"));
                loan.setBalance(rs.getFloat("balance"));
                loan.setPeriod(rs.getInt("period"));
                loan.setDate_request(rs.getString("date_request"));
                loan.setAval1(rs.getString("aval1"));
                loan.setAval2(rs.getString("aval2"));
                loan.setIncome_document(rs.getString("income_document"));
                loan.setRazon_social(rs.getString("razon_social"));
                loan.setLocation(rs.getString("location"));
                loan.setLine_bussines(rs.getString("line_bussines"));
                loan.setIdemployee(employe);
                loan.setIdmember(member);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return loan;
    }

    public int agregar(BeanLoan loan){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registerloan(?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1, loan.getIdmember().getIdmember());
            cstm.setInt(2,loan.getIdemployee().getIdemploye());
            cstm.setString(3,loan.getMember_name());
            cstm.setString(4,loan.getEmployee_name());
            cstm.setString(5,loan.getCredit_type());
            cstm.setFloat(6,loan.getAmount());
            cstm.setFloat(7,loan.getBalance());
            cstm.setInt(8,loan.getPeriod());
            cstm.setString(9,loan.getDate_request());
            cstm.setString(10,loan.getAval1());
            cstm.setString(11,loan.getAval2());
            cstm.setString(12,loan.getIncome_document());
            cstm.setString(13,loan.getRazon_social());
            cstm.setString(14,loan.getLocation());
            cstm.setString(15,loan.getLine_bussines());
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanLoan loan){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifyLoan(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1, loan.getIdloan());
            cstm.setInt(2, loan.getIdmember().getIdmember());
            cstm.setInt(3,loan.getIdemployee().getIdemploye());
            cstm.setString(4,loan.getMember_name());
            cstm.setString(5,loan.getEmployee_name());
            cstm.setString(6,loan.getCredit_type());
            cstm.setFloat(7,loan.getAmount());
            cstm.setFloat(8,loan.getBalance());
            cstm.setInt(9,loan.getPeriod());
            cstm.setString(10,loan.getDate_request());
            cstm.setString(11,loan.getAval1());
            cstm.setString(12,loan.getAval2());
            cstm.setString(13,loan.getIncome_document());
            cstm.setString(14,loan.getRazon_social());
            cstm.setString(15,loan.getLocation());
            cstm.setString(16,loan.getLine_bussines());
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
            cstm = con.prepareCall("{call deleteloan(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }

}
