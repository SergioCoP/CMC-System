package com.mx.cmc.CMCSystem.model.payments;

import com.lowagie.text.*;
import com.lowagie.text.Font;
import com.lowagie.text.pdf.PdfPTable;
import com.lowagie.text.pdf.PdfWriter;
import com.mx.cmc.CMCSystem.model.credit_history.BeanCreditHistory;
import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.service.ConnectionMySQL;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DaoPayments {
    Connection con;
    CallableStatement cstm;
    ResultSet rs;
    Logger logger = LoggerFactory.getLogger(DaoPayments.class);
    int r;

    public List<BeanCreditHistory> findAll(){
        List<BeanCreditHistory> listPayments = new ArrayList<>();
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call findpayments}");
            rs = cstm.executeQuery();
            while(rs.next()){

                BeanCreditHistory credithis = new BeanCreditHistory();

                credithis.setIdpayment(rs.getInt("idabono"));
                credithis.setIdmember(rs.getInt("idsocio"));
                credithis.setMembername(rs.getString("nombresocio"));
                credithis.setCreditname(rs.getString("tipo_credito"));
                credithis.setPeriod(rs.getInt("plazo"));
                credithis.setTotal_amount(rs.getFloat("monto_total"));
                credithis.setBalance(rs.getFloat("monto_restante"));
                credithis.setAmount_payment(rs.getFloat("monto_abonado"));
                credithis.setDate_payment(rs.getString("fecha_abono"));
                credithis.setStatus(rs.getInt("estatus"));

               listPayments.add(credithis);
            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return listPayments;
    }

    public BeanPayments ListarporId(int id){
        BeanPayments payments = null;
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("select idabono,nombresocio,fecha_abono,monto_abonado from abonos where idsocio = ?");
            cstm.setInt(1,id);
            rs = cstm.executeQuery();

            while(rs.next()){

                BeanLoan loan = new BeanLoan();
                BeanMember member = new BeanMember();
                BeanEmployee employe = new BeanEmployee();
                payments = new BeanPayments();

                payments.setIdpayment(rs.getInt("idabono"));
                payments.setMembername(rs.getString("nombresocio"));
                payments.setDate_payment(rs.getString("fecha_abono"));
                payments.setAmount_payment(rs.getFloat("monto_abonado"));

            }
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm,rs);
        }
        return payments;
    }

    public int agregar(BeanPayments payments){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call registerpayment(?,?,?,?,?,?)}");

            cstm.setInt(1, payments.getIdmember().getIdmember());
            cstm.setInt(2,payments.getIdemploye().getIdemploye());
            cstm.setInt(3,payments.getIdloan().getIdloan());
            cstm.setString(4,payments.getMembername());
            cstm.setString(5,payments.getDate_payment());
            cstm.setFloat(6,payments.getAmount_payment());

            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;
    }

    /*public int actualizar(BeanPayments payments){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call modifyPayments(?,?,?,?,?,?,?,?,?)}");

            cstm.setInt(1, payments.getIdpayment());
            cstm.setInt(2, payments.getIdmember().getIdmember());
            cstm.setInt(3,payments.getIdemploye().getIdemploye());
            cstm.setInt(4,payments.getIdloan().getIdloan());
            cstm.setString(5,payments.getMembername());
            cstm.setString(6,payments.getDate_payment());
            cstm.setFloat(7,payments.getAmount_payment());

            cstm.executeUpdate();

        }catch (SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
        return r;

    }*/

    /*public void eliminar(int id){
        try{
            con = ConnectionMySQL.getConnection();
            cstm = con.prepareCall("{call deletepayments(?)}");
            cstm.setInt(1,id);
            cstm.executeUpdate();
        }catch(SQLException e){
            logger.error("Ha ocurrido un error: " + e.getMessage());
        }finally {
            ConnectionMySQL.closeConnections(con,cstm);
        }
    }*/

  /*  public void export(HttpServletResponse response) {
        try (Document document = new Document(PageSize.A4)){
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();
            Font font= FontFactory.getFont(FontFactory.HELVETICA);
            font.setSize(20);
            font.setColor(Color.white);
            Paragraph paragraph= new Paragraph("Lista de pagos",font);
            paragraph.setAlignment(Paragraph.ALIGN_CENTER);
            document.add(paragraph);
            PdfPTable table = new PdfPTable(6);
            table.setWidthPercentage(100f);
            table.setWidths(new int[] {1,2,3,3,3,3,3,3,3});
            table.setSpacingBefore(10f);
            findAll(table);
            document.add(table);
            document.close();
        } catch (Exception e) {
            System.out.println("Error: "+ e);
        }
    }

    private void findAll(PdfPTable table) {
    }*/

}
