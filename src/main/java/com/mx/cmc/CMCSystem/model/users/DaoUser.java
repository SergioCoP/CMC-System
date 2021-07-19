package com.mx.cmc.CMCSystem.model.users;

import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoUser {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoUser.class);
    int r;

    public List<BeanUser> findAll(){
        List<BeanUser> listUsers = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findusers}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanUser user = new BeanUser();
                BeanEmployee employe = new BeanEmployee();

                user.setEmail(rs.getString("correo"));
                user.setIduser(rs.getInt("idusuario"));
                user.setPassword(rs.getString("contrasena"));
                employe.setIdemploye(rs.getInt("idempleado"));
                employe.setName(rs.getString("nombre"));
                employe.setLastnames(rs.getString("apellidos"));
                employe.setRole(rs.getString("rol"));
                user.setIdemploye(employe);

                listUsers.add(user);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listUsers;
    }

    public BeanUser ListarporId(int id){
        BeanUser user = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from usuarios as U inner join empleados as e on U.id_empleado = e.idempleado where U.idusuario = ?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanEmployee employe = new BeanEmployee();
                user = new BeanUser();

                employe.setIdemploye(rs.getInt("idempleado"));
                employe.setName(rs.getString("nombre"));
                employe.setLastnames(rs.getString("apellidos"));
                employe.setRole(rs.getString("rol"));
                user.setIduser(rs.getInt("idusuario"));
                user.setEmail(rs.getString("correo"));
                user.setPassword(rs.getString("contrasena"));
                user.setIdemploye(employe);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return user;
    }

    public int agregar(BeanUser user){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registeremploye(?,?,?,?,?)}");

            cstm.setString(1,user.getIdemploye().getName());
            cstm.setString(2,user.getIdemploye().getLastnames());
            cstm.setString(3,user.getIdemploye().getRole());
            cstm.setString(4,user.getEmail());
            cstm.setString(5,user.getPassword());
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    public int actualizar(BeanUser user){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifyemploye(?,?,?,?,?,?)}");

            cstm.setInt(1,user.getIduser());
            cstm.setString(2,user.getIdemploye().getName());
            cstm.setString(3,user.getIdemploye().getLastnames());
            cstm.setString(4,user.getIdemploye().getRole());
            cstm.setString(5,user.getEmail());
            cstm.setString(6,user.getPassword());
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
            cstm = con.prepareCall("{call deleteemploye(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }


    public BeanUser Validar(String correo, String contrasena){
        BeanUser user = null;

        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select * from usuarios as u inner join empleados as e on u.id_empleado = e.idempleado where u.correo = ? AND u.contrasena = ?");
            cstm.setString(1,correo);
            cstm.setString(2,contrasena);
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanEmployee employ = new BeanEmployee();
                user = new BeanUser();

                user.setEmail(rs.getString("correo"));
                user.setPassword(rs.getString("contrasena"));
                employ.setName(rs.getString("nombre"));
                employ.setLastnames(rs.getString("apellidos"));
                employ.setRole(rs.getString("rol"));
                user.setIdemploye(employ);
            }
        }catch (SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return user;

    }


}
