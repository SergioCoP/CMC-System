package com.mx.cmc.CMCSystem.model.report;


import com.mx.cmc.CMCSystem.model.report.BeanReport;
import com.mx.cmc.CMCSystem.model.report.DaoReport;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DaoReport {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(com.mx.cmc.CMCSystem.model.report.DaoReport.class);
    int r;

    public List<BeanReport> report_pdf() {
        List<BeanReport> list_pdf = new ArrayList<>();
        try {
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call informe_pdf}");
            cstm = con.prepareCall("select * from informe_pdf where idinforme = isocio");
            rs = cstm.executeQuery();
            while (rs.next()) {

                BeanReport report = new BeanReport();

                report.setI_name(rs.getString("i_nombre"));
                report.setI_last_name(rs.getString("i_apellidos"));
                report.setI_registration_date(rs.getString("i_fecha_registro"));
                report.setIcredit_type(rs.getString("i_tipo_credito"));
                report.setI_amount(rs.getFloat("i_monto"));
                report.setI_term(rs.getInt("i_plazo"));
                report.setI_total_amount(rs.getString("i_monto_total"));
                report.setI_remaining_amount(rs.getString("i_monto_restante"));
                report.setI_subscriber_amount(rs.getFloat("i_monto_abonado"));
                report.setI_status(rs.getString("i_estatus"));
                list_pdf.add(report);
            }
        } catch (SQLException e) {
            logger.error("Ha ocurrido un error: " + e.getMessage());
        } finally {
            ConnectionMySQL.closeConnections(con, cstm, rs);
        }
        return list_pdf;
    }
}