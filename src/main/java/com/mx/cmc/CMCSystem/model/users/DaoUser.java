package com.mx.cmc.CMCSystem.model.users;

import com.mx.cmc.CMCSystem.model.payments.BeanPayments;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.credit_history.BeanCreditHistory;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoUser {
   /* Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoUser.class);

    public List<BeanUser> findAll(){
        List<BeanUser> listUsers = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call finduser}");
            rs = cstm.executeQuery();

            while(rs.next()){
                BeanUser user = new BeanUser();
                BeanEmployee employe = new BeanEmployee();

                user.setIduser(rs.getInt("idRole"));
                employe.setName(rs.getString("name"));

                listUsers.add(user);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listUsers;
    }*/
}
