package com.mx.cmc.CMCSystem.model.employees;

import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.employees.DaoEmployee;
import com.mx.cmc.CMCSystem.model.users.BeanUser;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoEmployee {
   Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoEmployee.class);
    int r;

    public List<BeanEmployee> findAll(){
        List<BeanEmployee> listEmployees = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findAll}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanEmployee employee = new BeanEmployee();
                employee.setIdemploye(rs.getInt("idusuario"));
                employee.setName(rs.getString("contraseña"));
                employee.setLastnames(rs.getString("lastnames"));
                employee.setRole(rs.getString("role"));
                listEmployees.add(employee);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listEmployees;
    }

    public BeanEmployee ListarporId(int id){
        BeanEmployee employee = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from empleados where idempleados = ?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                employee = new BeanEmployee();

                employee.setIdemploye(rs.getInt("idemploye"));
                employee.setName(rs.getString("name"));
                employee.setLastnames(rs.getString("lastnames"));
                employee.setRole(rs.getString("role"));


            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return employee;
    }

    public int agregar(BeanEmployee employee){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call regitermembers(?,?,?)}");

            cstm.setString(1,employee.getName());
            cstm.setString(2,employee.getLastnames());
            cstm.setString(3,employee.getRole());

            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanEmployee employee){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifymember(?,?,?,?)}");

            cstm.setInt(1,employee.getIdemploye());
            cstm.setString(2,employee.getName());
            cstm.setString(3,employee.getLastnames());
            cstm.setString(4,employee.getRole());

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
            cstm = con.prepareCall("{call deleteemployee(?)}");
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
            cstm = con.prepareCall("{call deletemployeetemporal(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }
   /* public BeanEmployee Validar(String correo, String contrasena){
        BeanEmployee employee = null;

        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from empleados  where correo = ? and contraseña = ?");
            cstm.setString(1,correo);
            cstm.setString(2,contrasena);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanEmployee employ = new BeanEmployee();
                employee = new BeanEmployee();

                employee.setIdemploye(rs.getInt("idemploye"));
                employee.setName(rs.getString("name"));
                employ.setLastnames(rs.getString("lastnames"));
                employ.setRole(rs.getString("role"));
                employ.setEmail(rs.getString("email"));
                employee.setPassword(rs.getString("password"));
            }
        }catch (SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return employee;

    }*/
}