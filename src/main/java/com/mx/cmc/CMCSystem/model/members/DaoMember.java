package com.mx.cmc.CMCSystem.model.members;

import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.members.DaoMember;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoMember {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoMember.class);
    int r;

    public List<BeanMember> findmembers(){
        List<BeanMember> listMembers = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findmembers}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanMember member = new BeanMember();
                member.setIdmember(rs.getInt("idsocio"));
                member.setName(rs.getString("nombre"));
                member.setLastname(rs.getString("apellidos"));
                member.setBorn_date(rs.getString("fecha_nacimiento"));
                member.setReg_dates(rs.getString("fecha_registro"));
                member.setSexo(rs.getString("sexo"));
                member.setStatus(rs.getInt("estado"));
                member.setOfficial_id(rs.getInt("identificacion_oficial"));
                member.setBirth_certificate(rs.getInt("acta_nacimiento"));
                member.setCurp(rs.getInt("curp"));
                member.setProof_residence(rs.getInt("comprobante_domicilio"));
                member.setSketch_address(rs.getInt("croquis_domicilio"));
             listMembers.add(member);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listMembers;
    }

    public BeanMember ListarporId(int id){
        BeanMember member = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from socios where idsocio = ?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                member = new BeanMember();

                member.setIdmember(rs.getInt("idsocio"));
                member.setName(rs.getString("nombre"));
                member.setLastname(rs.getString("apellidos"));
                member.setBorn_date(rs.getString("fecha_nacimiento"));
                member.setReg_dates(rs.getString("fecha_registro"));
                member.setSexo(rs.getString("sexo"));
                member.setStatus(rs.getInt("estado"));
                member.setOfficial_id(rs.getInt(rs.getInt("identificacion_oficial")));
                member.setBirth_certificate(rs.getInt("acta_nacimiento"));
                member.setCurp(rs.getInt("curp"));
                member.setProof_residence(rs.getInt("comprobante_domicilio"));
                member.setSketch_address(rs.getInt("croquis_domicilio"));

            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return member;
    }

    public int agregar(BeanMember member){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call regitermembers(?,?,?,?,?,?,?,?,?,?)}");

            cstm.setString(1,member.getName());
            cstm.setString(2,member.getLastname());
            cstm.setString(3,member.getBorn_date());
            cstm.setString(4,member.getReg_dates());
            cstm.setString(5,member.getSexo());
            cstm.setInt(6,member.getOfficial_id());
            cstm.setInt(7,member.getBirth_certificate());
            cstm.setInt(8,member.getCurp());
            cstm.setInt(9,member.getProof_residence());
            cstm.setInt(10,member.getSketch_address());
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanMember member){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifymember(?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1,member.getIdmember());
            cstm.setString(2,member.getName());
            cstm.setString(3,member.getLastname());
            cstm.setString(4,member.getBorn_date());
            cstm.setInt(5,member.getOfficial_id());
            cstm.setInt(6,member.getBirth_certificate());
            cstm.setInt(7,member.getCurp());
            cstm.setInt(8,member.getProof_residence());
            cstm.setInt(9,member.getSketch_address());
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
            cstm = con.prepareCall("{call deletemember(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }

    public void eliminartemporal(int id){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call deletemembertemporal(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }
}
