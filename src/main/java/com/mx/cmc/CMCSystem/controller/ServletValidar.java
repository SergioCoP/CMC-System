package com.mx.cmc.CMCSystem.controller;

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
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("action");

        if(accion.equalsIgnoreCase("Ingresar")){
            String correo = request.getParameter("txtcorreo");
            String contra = request.getParameter("txtcontrasena");

            user = userdaor.Validar(correo,contra);
            if(user.getIdemploye().getName() != null){
                request.setAttribute("user",user);
                request.getRequestDispatcher("/views/main.jsp").forward(request,response);
            }else{
                request.getRequestDispatcher("/views/index.jsp").forward(request,response);
            }
        }else{
            request.getRequestDispatcher("/views/index.jsp").forward(request,response);
        }
    }
}
