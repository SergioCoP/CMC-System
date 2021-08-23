package com.mx.cmc.CMCSystem.service;

import java.sql.*;
public class ConnectionMySQL {
    public static Connection getConnection() throws SQLException {
        String host = "172.31.44.34";//172.31.44.34//54.173.40.143//127.0.0.1//localhost
        String port = "3306";
        String database = "sistemacmc";
        String useSSL = "false";
        String timezone = "UTC";
        String url = String.format("jdbc:mysql://%s:%s/%s?allowPublicKeyRetrieval=true&useSSL=%s&serverTimezone=%s", host, port, database, useSSL, timezone);
       try {

           DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());

           System.out.println("Conectado");
       }catch(Exception e){
           System.out.println("No Conectado");
        }
        return DriverManager.getConnection(url,"root","Integr4dor@");//Integr4dor@
    }

    public static void closeConnections(Connection con, CallableStatement cstm, ResultSet rs){
        try{
            if(rs != null){ rs.close(); }

            if(cstm != null){ cstm.close(); }

            if(con != null){ con.close(); }

        }catch(SQLException e){ }
    }

    public static void closeConnections(Connection con, CallableStatement cstm){
        try{
            if(cstm != null){ cstm.close(); }

            if(con != null){ con.close(); }

        }catch(SQLException e){ }
    }

}
