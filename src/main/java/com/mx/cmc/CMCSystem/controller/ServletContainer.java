package com.mx.cmc.CMCSystem.controller;


import com.mx.cmc.CMCSystem.model.employees.BeanEmployee;
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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String action = request.getParameter("accion");

        if(menu.equals("member")){
            request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
        }
        if(menu.equals("employe")){
            switch (action){
                case "Listar":
                    List listUsers = userdao.findAll();
                    //request.setAttribute("listUsers",new DaoUser().findAll());
                    request.setAttribute("listUsers",listUsers);
                    //request.getRequestDispatcher("/views/employes/employes.jsp").forward(request,response);
                    break;
                case "Crear":
                    String nombre = request.getParameter("nombre");
                    String apellido = request.getParameter("apellidos");
                    String correo = request.getParameter("correo");
                    String contrasena = request.getParameter("contraseña");
                    String rol = request.getParameter("rol");

                    BeanEmployee beanemploy = new BeanEmployee(nombre,apellido,rol);
                   BeanUser beanuser = new BeanUser(beanemploy,correo,contrasena);


                    if(new DaoUser().agregar(beanuser)){
                        request.setAttribute("message","Empleado Registrado");
                    }else{
                        request.setAttribute("message","Empleado no Regsitrado");
                    }

                    request.getRequestDispatcher("/views/employes/employes.jsp").forward(request,response);
                    break;
                default:
                    throw new AssertionError();

            }
            request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);

        }
        if(menu.equals("credit")){
            request.getRequestDispatcher("/views/credits/credits.jsp").forward(request, response);
        }
        if(menu.equals("payment")){
            request.getRequestDispatcher("/views/payments/payments.jsp").forward(request, response);
        }
        if(menu.equals("loan")){
            request.getRequestDispatcher("/views/loans/loans.jsp").forward(request, response);
        }




    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }


}
