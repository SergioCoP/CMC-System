package com.mx.cmc.CMCSystem.controller;


import com.lowagie.text.pdf.PdfPTable;
import com.mx.cmc.CMCSystem.model.credit_history.BeanCreditHistory;
import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.credits.DaoCredits;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.loans.BeanLoan;
import com.mx.cmc.CMCSystem.model.loans.DaoLoan;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.members.DaoMember;
import com.mx.cmc.CMCSystem.model.payments.BeanPayments;
import com.mx.cmc.CMCSystem.model.payments.DaoPayments;
import com.mx.cmc.CMCSystem.model.users.BeanUser;
import com.mx.cmc.CMCSystem.model.users.DaoUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.google.gson.Gson;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "ServletContainer", value = "/ServletContainer")
public class ServletContainer extends HttpServlet {
    private Map map = new HashMap();
    Logger logger = LoggerFactory.getLogger(ServletContainer.class);
    BeanUser user = new BeanUser();
    DaoUser userdao = new DaoUser();
    BeanEmployee employ = new BeanEmployee();
    BeanCredits credit = new BeanCredits();
    DaoCredits creditdaot = new DaoCredits();
    BeanMember member = new BeanMember();
    DaoMember memberdao = new DaoMember();
    DaoPayments daoPayments = new DaoPayments();
    BeanPayments payments = new BeanPayments();
    BeanLoan loan = new BeanLoan();
    DaoLoan daoLoan = new DaoLoan();
    int idusuario,idcredit,idpayment,idmiembro,idabono,idempleado,idprestamo1;


    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
        request.setCharacterEncoding("UTF-8");
        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        if(menu.equals("login")){
            request.getRequestDispatcher("/views/index.jsp").forward(request, response);
        }
        if(menu.equals("member")){

            switch (action){
                case "Listar":
                    List<BeanMember> listMembers = memberdao.findmembers();
                    request.setAttribute("listMembers",listMembers);
                   // HttpSession session = request.getSession();//Para guardar los datos del usuario durante todo el tiempo que use la app
                   // session.setAttribute("SocioASeleccionar",listMembers);//Para guardar los datos del usuario durante todo el tiempo que use la app-se guardan
                    break;
                case "Listar01":
                    List<BeanMember> listMembers01 = memberdao.findmembers();
                    map.put("ListMembers", listMembers01);
                    write(response, map);
                   map.clear();
                    return;
                case "Registrar":
                    //int idemp = Integer.parseInt(request.getParameter("txtidempleado"));
                    String nombre = request.getParameter("txtnombre");
                    String apellido = request.getParameter("txtapellidos");
                    String fechanac = request.getParameter("txtfechanacimiento");
                    String fecharegistro = request.getParameter("txtfecharegistro");
                    String sexo = request.getParameter("txtsexo");
                    int identificacion = Integer.parseInt(request.getParameter("txtidentificacionofical"));
                    int actanacimiento = Integer.parseInt(request.getParameter("txtactanacimiento"));
                    int curp = Integer.parseInt(request.getParameter("txtcurp"));
                    int comprobantecomicilio = Integer.parseInt(request.getParameter("txtcomprobantedomicilio"));
                    int croquis = Integer.parseInt(request.getParameter("txtcroquis"));

                    member.setName(nombre);
                    member.setLastname(apellido);
                    member.setBorn_date(fechanac);
                    member.setReg_dates(fecharegistro);
                    member.setSexo(sexo);
                    member.setOfficial_id(identificacion);
                    member.setBirth_certificate(actanacimiento);
                    member.setCurp(curp);
                    member.setProof_residence(comprobantecomicilio);
                    member.setSketch_address(croquis);

                    memberdao.agregar(member);
                    request.getRequestDispatcher("ServletContainer?menu=member&action=Listar").forward(request, response);
                    return;
                case "Actualizar":
                    idmiembro= Integer.parseInt(request.getParameter("id"));
                    String nombre1 = request.getParameter("txtnombre");
                    String apellido1 = request.getParameter("txtapellidos");
                    String fechanac1 = request.getParameter("txtfechanacimiento");
                    String fecharegistro1 = request.getParameter("txtfecharegistro");
                    String sexo1 = request.getParameter("txtsexo");
                    int identificacion1 = Integer.parseInt(request.getParameter("txtidentificacionofical"));
                    int actanacimiento1 = Integer.parseInt(request.getParameter("txtactanacimiento"));
                    int curp1 = Integer.parseInt(request.getParameter("txtcurp"));
                    int comprobantecomicilio1 = Integer.parseInt(request.getParameter("txtcomprobantedomicilio"));
                    int croquis1 = Integer.parseInt(request.getParameter("txtcroquis"));

                    member.setIdmember(idmiembro);
                    member.setName(nombre1);
                    member.setLastname(apellido1);
                    member.setBorn_date(fechanac1);
                    member.setReg_dates(fecharegistro1);
                    member.setSexo(sexo1);
                    member.setOfficial_id(identificacion1);
                    member.setBirth_certificate(actanacimiento1);
                    member.setCurp(curp1);
                    member.setProof_residence(comprobantecomicilio1);
                    member.setSketch_address(croquis1);

                    memberdao.actualizar(member);
                    request.getRequestDispatcher("ServletContainer?menu=member&action=Listar").forward(request, response);
                    return;
                case "Eliminar":
                    idmiembro = Integer.parseInt(request.getParameter("id"));
                    memberdao = new DaoMember();
                    memberdao.eliminar(idmiembro);
                    request.getRequestDispatcher("ServletContainer?menu=member&action=Listar").forward(request, response);
                    return;
                case "EliminarTemporal":
                    idmiembro = Integer.parseInt(request.getParameter("id"));
                    memberdao = new DaoMember();
                    memberdao.eliminartemporal(idmiembro);
                    request.getRequestDispatcher("ServletContainer?menu=member&action=Listar").forward(request, response);
                    return;
                case "Cargar":
                    idmiembro= Integer.parseInt(request.getParameter("id"));
                    System.out.println(idmiembro);
                    member = memberdao.ListarporId(idmiembro);
                   // request.setAttribute("MiembroSeleccionado", member);
                    map.put("MiembroSeleccionado", member);
                    write(response, map);
                    //request.getRequestDispatcher("ServletContainer?menu=member&action=Listar").forward(request, response);
                    return;
            }
            request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
        }
        if(menu.equals("main")){
            request.getRequestDispatcher("/views/main.jsp").forward(request, response);
        }
        if(menu.equalsIgnoreCase("employee")){

            switch (action){
                case "Listar":
                    List<BeanUser> listUsers = userdao.findAll();
                    request.setAttribute("listUsers",listUsers);
                    break;
                case "Registrar":
                    String nombre = request.getParameter("txtnombre") != null ? request.getParameter("txtnombre") : "";
                    String apellido = request.getParameter("txtapellidos");
                    String correo = request.getParameter("txtcorreo");
                    String contrasena = request.getParameter("txtcontrasena");
                    String rol = request.getParameter("txtrol");

                    employ.setName(nombre);
                    employ.setLastnames(apellido);
                    employ.setRole(rol);
                    user.setEmail(correo);
                    user.setPassword(contrasena);
                    user.setIdemploye(employ);
                    userdao.agregar(user);
                    request.getRequestDispatcher("ServletContainer?menu=employee&action=Listar").forward(request, response);

                    return;
                //break;
                case "Actualizar":

                    idusuario = Integer.parseInt(request.getParameter("id"));
                    System.out.println("" + idusuario);
                    String nombre1 = request.getParameter("txtnombre") != null ? request.getParameter("txtnombre") : "";
                    String apellido1 = request.getParameter("txtapellidos");
                    String correo1 = request.getParameter("txtcorreo");
                    String contrasena1 = request.getParameter("txtcontrasena");
                    String rol1 = request.getParameter("txtrol");

                    user.setIduser(idusuario);
                    user.setEmail(correo1);
                    user.setPassword(contrasena1);
                    employ.setName(nombre1);
                    employ.setLastnames(apellido1);
                    employ.setRole(rol1);
                    user.setIdemploye(employ);
                    userdao.actualizar(user);
                    request.getRequestDispatcher("ServletContainer?menu=employee&action=Listar").forward(request, response);
                    return;
                //break;
                case "Cargar":

                    idusuario = Integer.parseInt(request.getParameter("id"));
                    System.out.println(idusuario);
                    user = userdao.ListarporId(idusuario);
                    request.setAttribute("Usuario", user);
                    request.getRequestDispatcher("ServletContainer?menu=employee&action=Listar").forward(request, response);
                    return;
                //break;
                case "Eliminar":
                    int iduser1 = Integer.parseInt(request.getParameter("id"));
                    userdao = new DaoUser();
                    userdao.eliminar(iduser1);
                    request.getRequestDispatcher("ServletContainer?menu=employee&action=Listar").forward(request, response);
                    return;
                //break;
                    //break;
            }
            request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);
        }

        if(menu.equals("credit")){
            switch (action){
                case "Listar":
                    List<BeanCredits> listCredits = creditdaot.findcredits();
                    request.setAttribute("listCredits",listCredits);
                    break;
                case "Listar1":
                    List<BeanCredits> listCredits1 = creditdaot.findcredits();
                    map.put("listCredits1",listCredits1);
                    write(response, map);
                    map.clear();
                    return;
                case "Registrar":
                    String nombre = request.getParameter("txtnombre") != null ? request.getParameter("txtnombre") : "";
                    int plazomin = Integer.parseInt(request.getParameter("txtplazominimo"));
                    int plazomax = Integer.parseInt(request.getParameter("txtplazomaximo"));
                    float tasainteres = Float.parseFloat(request.getParameter("txttasainteres"));
                    float montomin = Float.parseFloat(request.getParameter("txtmontominimo"));
                    float montomax = Float.parseFloat(request.getParameter("txtmontomaximo"));
                    String requisitos = request.getParameter("txtrequisitos");
                    credit.setName(nombre);
                    credit.setMin_period(plazomin);
                    credit.setMax_period(plazomax);
                    credit.setInterest_rate(tasainteres);
                    credit.setMin_amount(montomin);
                    credit.setMax_amount(montomax);
                    credit.setRequeriments(requisitos);
                    creditdaot.agregar(credit);
                    request.getRequestDispatcher("ServletContainer?menu=credit&action=Listar").forward(request, response);
                    return;
                case "Actualizar":
                    idcredit = Integer.parseInt(request.getParameter("id"));
                    System.out.println("" + idcredit);
                    String nombre1 = request.getParameter("txtnombre") != null ? request.getParameter("txtnombre") : "";
                    int plazomin1 = Integer.parseInt(request.getParameter("txtplazominimo"));
                    int plazomax1 = Integer.parseInt(request.getParameter("txtplazomaximo"));
                    float tasainteres1 = Float.parseFloat(request.getParameter("txttasainteres"));
                    float montomin1 = Float.parseFloat(request.getParameter("txtmontominimo"));
                    float montomax1 = Float.parseFloat(request.getParameter("txtmontomaximo"));
                    String requisitos1 = request.getParameter("txtrequisitos");

                    credit.setName(nombre1);
                    credit.setMin_period(plazomin1);
                    credit.setMax_period(plazomax1);
                    credit.setInterest_rate(tasainteres1);
                    credit.setMin_amount(montomin1);
                    credit.setMax_amount(montomax1);
                    credit.setRequeriments(requisitos1);
                    creditdaot.actualizar(credit);
                    request.getRequestDispatcher("ServletContainer?menu=credit&action=Listar").forward(request, response);
                    return;
                case "Eliminar":
                    idcredit = Integer.parseInt(request.getParameter("id"));
                    creditdaot = new DaoCredits();
                    creditdaot.eliminar(idcredit);
                    request.getRequestDispatcher("ServletContainer?menu=credit&action=Listar").forward(request, response);
                    return;
                case "EliminarTemporal":
                    return;
                case "Cargar":
                    idcredit = Integer.parseInt(request.getParameter("id"));
                    System.out.println(idcredit);
                    credit = creditdaot.ListarporId(idcredit);
                    request.setAttribute("CreditoSeleccionado", credit);
                    request.getRequestDispatcher("ServletContainer?menu=credit&action=Listar").forward(request, response);
                    return;
            }
            request.getRequestDispatcher("/views/credits/credits.jsp").forward(request, response);
        }

        if(menu.equals("payment")){
            switch (action) {
                case "Listar":
                  //  PdfPTable table = null;
                    List<BeanCreditHistory> listPayments = daoPayments.findAll();
                    request.setAttribute("listPayments", listPayments);
                    break;
                case "Registrar":
                    int idsocio = Integer.parseInt( request.getParameter("txtidsocio"));
                    idempleado = Integer.parseInt( request.getParameter("txtidempleado"));
                    System.out.println(idempleado);
                    idprestamo1 = Integer.parseInt(request.getParameter("txtidprestamo"));
                    System.out.println(idprestamo1);

                    String nombresocio = request.getParameter("txtnombresocio");
                    String fecha_abono = request.getParameter("txtfechaabono");
                    float monto_abonado = Float.parseFloat(request.getParameter("txtmontoabonado"));

                    member = new BeanMember();
                    employ = new BeanEmployee();
                    loan = new BeanLoan();

                    member.setIdmember(idsocio);
                    employ.setIdemploye(idempleado);
                    loan.setIdloan(idprestamo1);

                    payments.setIdmember(member);
                    payments.setIdemploye(employ);
                    payments.setIdloan(loan);
                    payments.setMembername(nombresocio);
                    payments.setDate_payment(fecha_abono);
                    payments.setAmount_payment(monto_abonado);
                    daoPayments.agregar(payments);
                    request.getRequestDispatcher("ServletContainer?menu=payment&action=Listar").forward(request, response);
                    return;
                case "Cargar":
                    idabono = Integer.parseInt(request.getParameter("id"));
                    System.out.println(idabono);
                    List<BeanPayments> listPagos = daoPayments.ListarporId(idabono);
                    map.put("AbonoSeleccionado", listPagos);
                    write(response, map);
                    map.clear();
                  //  request.getRequestDispatcher("ServletContainer?menu=payment&action=Listar").forward(request, response);
                    return;

            }
            request.getRequestDispatcher("/views/payments/payments.jsp").forward(request, response);
        }

        if(menu.equals("loan")){
            switch (action) {
                case "Listar":
                    List<BeanLoan> listLoan = daoLoan.findAll();
                    request.setAttribute("listLoan", listLoan);
                    break;
                case "Registrar":
                    int idsocio = Integer.parseInt(request.getParameter("txtidsocio"));
                    String nombresocio = request.getParameter("txtnombresocio");
                    int idempleado = Integer.parseInt(request.getParameter("txtidempleado"));
                    String nombreempleado = request.getParameter("txtnombrempleado");
                    String tipo_credito = request.getParameter("txttipocredito");
                    float monto = Float.parseFloat(request.getParameter("txtmonto"));
                    int plazo = Integer.parseInt(request.getParameter("txtplazo"));
                    String fecha_solicitud = request.getParameter("txtfechasolicitud");
                    String aval_1 = request.getParameter("txtnombreaval1");
                    String aval_2 = request.getParameter("txtnombreaval2");
                    String comprobante_ingresos = request.getParameter("txtcomprobanteingresos");
                    String razon_social = request.getParameter("txtrazonsocial");
                    String ubicacion = request.getParameter("txtubicacion");
                    String giro = request.getParameter("txtgiro");

                    member = new BeanMember();
                    employ = new BeanEmployee();

                    member.setIdmember(idsocio);
                    employ.setIdemploye(idempleado);

                    loan.setIdmember(member);
                    loan.setIdemployee(employ);

                    loan.setMember_name(nombresocio);
                    loan.setEmployee_name(nombreempleado);
                    loan.setCredit_type(tipo_credito);
                    loan.setAmount(monto);
                    loan.setPeriod(plazo);
                    loan.setDate_request(fecha_solicitud);
                    loan.setAval1(aval_1);
                    loan.setAval2(aval_2);
                    loan.setIncome_document(comprobante_ingresos);
                    loan.setRazon_social(razon_social);
                    loan.setLocation(ubicacion);
                    loan.setLine_bussines(giro);

                    daoLoan.agregar(loan);
                    request.getRequestDispatcher("ServletContainer?menu=loan&action=Listar").forward(request, response);
                    return;
                case "Actualizar":
                    int idprestamo = Integer.parseInt(request.getParameter("txtidprestamo"));
                    try{
                        idmiembro = Integer.parseInt(request.getParameter("txtidsocio1"));
                        System.out.println(idmiembro);
                    }catch(Exception e){
                        System.out.println("Hubo un error");
                    }

                    String nombresocio1 = request.getParameter("txtnombresocio");
                    int idempleado1 = Integer.parseInt(request.getParameter("txtidempleado"));
                    String nombreempleado1 = request.getParameter("txtnombrempleado");
                    String tipo_credito1 = request.getParameter("txttipocredito");
                    float monto1 = Float.parseFloat(request.getParameter("txtmonto"));
                    int plazo1 = Integer.parseInt(request.getParameter("txtplazo"));
                    String fecha_solicitud1 = request.getParameter("txtfechasolicitud");
                    String aval_12 = request.getParameter("txtnombreaval1");
                    String aval_22 = request.getParameter("txtnombreaval2");
                    String comprobante_ingresos1 = request.getParameter("txtcomprobanteingresos");
                    String razon_social1 = request.getParameter("txtrazonsocial");
                    String ubicacion1 = request.getParameter("txtubicacion");
                    String giro1 = request.getParameter("txtgiro");

                    member = new BeanMember();
                    employ = new BeanEmployee();

                    member.setIdmember(idmiembro);
                    employ.setIdemploye(idempleado1);

                    loan.setIdmember(member);
                    loan.setIdemployee(employ);
                    loan.setIdloan(idprestamo);
                    loan.setMember_name(nombresocio1);
                    loan.setEmployee_name(nombreempleado1);
                    loan.setCredit_type(tipo_credito1);
                    loan.setAmount(monto1);
                    loan.setPeriod(plazo1);
                    loan.setDate_request(fecha_solicitud1);
                    loan.setAval1(aval_12);
                    loan.setAval2(aval_22);
                    loan.setIncome_document(comprobante_ingresos1);
                    loan.setRazon_social(razon_social1);
                    loan.setLocation(ubicacion1);
                    loan.setLine_bussines(giro1);

                    daoLoan.actualizar(loan);
                    request.getRequestDispatcher("ServletContainer?menu=loan&action=Listar").forward(request, response);
                    return;
                case "Eliminar":
                    int idprestamo1 = Integer.parseInt(request.getParameter("txtidprestamo1"));
                    daoLoan = new DaoLoan();
                    daoLoan.eliminar(idprestamo1);
                    request.getRequestDispatcher("ServletContainer?menu=loan&action=Listar").forward(request, response);
                    return;
                case "Cargar":
                    idprestamo = Integer.parseInt(request.getParameter("id"));
                    System.out.println(idprestamo);
                    loan = daoLoan.ListarporIdSocio(idprestamo);
                    // request.setAttribute("MiembroSeleccionado", member);
                    map.put("PrestamoSeleccionado", loan);
                    write(response, map);
                    return;
            }
            request.getRequestDispatcher("/views/loans/loans.jsp").forward(request, response);
        }
    }

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request,response);
    }


    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    private void write(HttpServletResponse response, Map<String, Object> map) throws IOException {
        response.setContentType("application/json");
        response.getWriter().write(new Gson().toJson(map));
    }
    }



