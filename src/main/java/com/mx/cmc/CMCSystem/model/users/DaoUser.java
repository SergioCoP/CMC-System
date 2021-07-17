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

    public boolean agregar(BeanUser user){
        boolean flag = false;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registeremploye(?,?,?,?,?)}");

            cstm.setString(1,user.getIdemploye().getName());
            cstm.setString(2,user.getIdemploye().getLastnames());
            cstm.setString(3,user.getIdemploye().getRole());
            cstm.setString(4,user.getEmail());
            cstm.setString(5,user.getPassword());
            cstm.execute();
            flag=true;
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return flag;
    }


}
