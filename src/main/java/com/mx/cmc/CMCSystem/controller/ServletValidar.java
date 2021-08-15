package com.mx.cmc.CMCSystem.controller;

import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
import com.mx.cmc.CMCSystem.model.employees.DaoEmployee;
import com.mx.cmc.CMCSystem.model.users.BeanUser;
import com.mx.cmc.CMCSystem.model.users.DaoUser;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletValidar", value = "/ServletValidar")
public class ServletValidar extends HttpServlet {
    BeanUser user = new BeanUser();
    DaoUser userdaor = new DaoUser();
    BeanEmployee employee = new BeanEmployee();
    DaoEmployee daoemployee = new DaoEmployee();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("action");


        if(accion.equalsIgnoreCase("Ingresar")) {
            String correo = request.getParameter("txtcorreo");
            String contra = request.getParameter("txtcontrasena");

            if(  userdaor.Validar(correo,contra)==1){
                user = userdaor.Validar2(correo,contra);
                request.setAttribute("user",user);
                HttpSession session = request.getSession();//Para guardar los datos del usuario durante todo el tiempo que use la app
                session.setAttribute("EmpleadoActivo",user);//Para guardar los datos del usuario durante todo el tiempo que use la app-se guardan
                request.getRequestDispatcher("ServletContainer?menu=main").forward(request,response);
            }else{
                request.getRequestDispatcher("/views/index.jsp").forward(request,response);
            }
            /*if (tipo_usuario == "member") {
                user = userdaor.Validar(correo, contra);
                if (user.getIdemploye().getName() != null) {
                    System.out.println("nombre:" + user.getIdemploye().getName());
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("ServletContainer?menu=main").forward(request, response);
                } else {
                    request.getRequestDispatcher("/views/index.jsp").forward(request, response);
                }
                if (user.getEmail() == correo && user.getPassword() == contra) {
                    System.out.println("Bienvenido " + user.getIdemploye().getName());
                    request.setAttribute("user", user);
                    request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
                }
                else {
                    System.out.println("Correo o contraseña incorrecta, intentelo de nuevo, por favor");
                }

            } else if (tipo_usuario == "employee"){
                employee = daoemployee.Validar(correo, contra);
                if (employee.getName() != null) {
                    System.out.println("nombre:" + employee.getName());
                    request.setAttribute("employee", employee);
                    request.getRequestDispatcher("ServletContainer?menu=main").forward(request, response);
                } else {
                    request.getRequestDispatcher("/views/index.jsp").forward(request, response);
                }
                if (employee.getEmail() == correo && employee.getPassword() == contra) {
                    System.out.println("Bienvenido " + employee.getName());
                    request.setAttribute("employee", employee);
                    request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);
                }
                else {
                    System.out.println("Correo o contraseña incorrecta, intentelo de nuevo, por favor");
                }*/
            }else{
            request.getRequestDispatcher("/views/index.jsp").forward(request,response);
        }
        }
    }
//}
