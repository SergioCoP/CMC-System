package com.mx.cmc.CMCSystem.controller;


import com.mx.cmc.CMCSystem.model.credits.BeanCredits;
import com.mx.cmc.CMCSystem.model.credits.DaoCredits;
import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.members.BeanMember;
import com.mx.cmc.CMCSystem.model.members.DaoMember;
import com.mx.cmc.CMCSystem.model.users.BeanUser;
import com.mx.cmc.CMCSystem.model.users.DaoUser;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ServletContainer", value = "/ServletContainer")
public class ServletContainer extends HttpServlet {
    Logger logger = LoggerFactory.getLogger(ServletContainer.class);
    BeanUser user = new BeanUser();
    DaoUser userdao = new DaoUser();
    BeanEmployee employ = new BeanEmployee();
    BeanCredits credit = new BeanCredits();
    DaoCredits creditdaot = new DaoCredits();
    BeanMember member = new BeanMember();
    DaoMember memberdao = new DaoMember();
    int iduser;


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
        String menu = request.getParameter("menu");
        String action = request.getParameter("action");
        if(menu.equals("member")){
            switch (action){
                case "Listar":
                    List<BeanMember> listMembers = memberdao.findmembers();
                    request.setAttribute("listMembers",listMembers);
                    break;
            }
            request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
        }
        if(menu.equals("main")){
            request.getRequestDispatcher("/views/main.jsp").forward(request, response);
        }
        if(menu.equalsIgnoreCase("employee")){
            String ret = "Listar";
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

                    iduser = Integer.parseInt(request.getParameter("id"));
                    System.out.println("" + iduser);
                    String nombre1 = request.getParameter("txtnombre") != null ? request.getParameter("txtnombre") : "";
                    String apellido1 = request.getParameter("txtapellidos");
                    String correo1 = request.getParameter("txtcorreo");
                    String contrasena1 = request.getParameter("txtcontrasena");
                    String rol1 = request.getParameter("txtrol");

                    user.setIduser(iduser);
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

                   iduser = Integer.parseInt(request.getParameter("id"));
                    System.out.println(iduser);
                    user = userdao.ListarporId(iduser);
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
            }
            request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);
        }
        if(menu.equals("credit")){
            switch (action){
                case "Listar":
                    List<BeanCredits> listCredits = creditdaot.findcredits();
                    request.setAttribute("listCredits",listCredits);
                    break;
                case "Agregar":
                    return;
                case "Actualizar":
                    return;
                case "Eliminar":
                    return;
                case "EliminarTemporal":
                    return;
            }
            request.getRequestDispatcher("/views/credits/credits.jsp").forward(request, response);
        }
        if(menu.equals("payment")){
            request.getRequestDispatcher("/views/payments/payments.jsp").forward(request, response);
        }
        if(menu.equals("loan")){
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
    }



