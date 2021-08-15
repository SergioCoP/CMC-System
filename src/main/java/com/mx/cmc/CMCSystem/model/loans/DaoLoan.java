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
            cstm = con.prepareCall("{call findloans}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanLoan loan = new BeanLoan();
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();

                loan.setIdloan(rs.getInt("idprestamo"));
                member.setIdmember(rs.getInt("idsocio"));
                employe.setIdemploye(rs.getInt("idempleado"));
                loan.setMember_name(rs.getString("nombresocio"));
                loan.setEmployee_name(rs.getString("nombreempleado"));
                loan.setCredit_type(rs.getString("tipo_credito"));
                loan.setAmount(rs.getFloat("monto"));
                loan.setPeriod(rs.getInt("plazo"));
                loan.setDate_request(rs.getString("fecha_solicitud"));
                loan.setAval1(rs.getString("aval_1"));
                loan.setAval2(rs.getString("aval_2"));
                loan.setIncome_document(rs.getString("comprobante_ingresos"));
                loan.setRazon_social(rs.getString("razon_social"));
                loan.setLocation(rs.getString("ubicacion"));
                loan.setLine_bussines(rs.getString("giro"));
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

    public BeanLoan ListarporIdSocio(int id){
        BeanLoan loan = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from prestamos where idsocio=?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();
                loan = new BeanLoan();

                loan.setIdloan(rs.getInt("idprestamo"));
                member.setIdmember(rs.getInt("idsocio"));
                employe.setIdemploye(rs.getInt("idempleado"));
                loan.setMember_name(rs.getString("nombresocio"));
                loan.setEmployee_name(rs.getString("nombreempleado"));
                loan.setCredit_type(rs.getString("tipo_credito"));
                loan.setAmount(rs.getFloat("monto"));
                loan.setPeriod(rs.getInt("plazo"));
                loan.setDate_request(rs.getString("fecha_solicitud"));
                loan.setAval1(rs.getString("aval_1"));
                loan.setAval2(rs.getString("aval_2"));
                loan.setIncome_document(rs.getString("comprobante_ingresos"));
                loan.setRazon_social(rs.getString("razon_social"));
                loan.setLocation(rs.getString("ubicacion"));
                loan.setLine_bussines(rs.getString("giro"));
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
            cstm.setString(2,loan.getMember_name());
            cstm.setInt(3,loan.getIdemployee().getIdemploye());
            cstm.setString(4,loan.getEmployee_name());
            cstm.setString(5,loan.getCredit_type());
            cstm.setFloat(6,loan.getAmount());
            cstm.setInt(7,loan.getPeriod());
            cstm.setString(8,loan.getDate_request());
            cstm.setString(9,loan.getAval1());
            cstm.setString(10,loan.getAval2());
            cstm.setString(11,loan.getIncome_document());
            cstm.setString(12,loan.getRazon_social());
            cstm.setString(13,loan.getLocation());
            cstm.setString(14,loan.getLine_bussines());
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
            cstm.setString(2,loan.getEmployee_name());
            cstm.setString(3,loan.getMember_name());
            cstm.setString(4,loan.getCredit_type());
            cstm.setString(5,loan.getDate_request());
            cstm.setFloat(6,loan.getAmount());
            cstm.setInt(7,loan.getPeriod());
            cstm.setString(8,loan.getAval1());
            cstm.setString(9,loan.getAval2());
            cstm.setString(10,loan.getIncome_document());
            cstm.setString(11,loan.getRazon_social());
            cstm.setString(12,loan.getLocation());
            cstm.setString(13,loan.getLine_bussines());
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
