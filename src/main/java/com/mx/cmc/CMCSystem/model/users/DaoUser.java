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

    public List findAll(){
        List<BeanUser> listUsers = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findusers}");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanUser user = new BeanUser();
                BeanEmployee employe = new BeanEmployee();

                user.setEmail(rs.getString(2));
                user.setIduser(rs.getInt(3));
                user.setPassword(rs.getString(1));

                employe.setIdemploye(rs.getInt(3));
                employe.setName(rs.getString(5));
                employe.setLastnames(rs.getString(1));
                employe.setRole(rs.getString(6));

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


}
