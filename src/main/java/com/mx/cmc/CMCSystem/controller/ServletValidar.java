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
    int idusuario;
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("action");
        if(accion.equalsIgnoreCase("Ingresar")){
            String correo = request.getParameter("txtcorreo");
            String contra = request.getParameter("txtcontrasena");
            if(correo != null & contra != null){
                user = userdaor.Validar(correo,contra);
                System.out.println("nombre:"+user.getIdemploye().getName());
                request.setAttribute("user",user);
                request.getRequestDispatcher("ServletContainer?menu=main").forward(request,response);
                HttpSession session = request.getSession();//Para guardar los datos del usuario durante todo el tiempo que use la app
                session.setAttribute("EmpleadoActivo",user);//Para guardar los datos del usuario durante todo el tiempo que use la app-se guardan
            }else{
                request.getRequestDispatcher("/views/index.jsp").forward(request,response);
                return;
            }
        }else{
            request.getRequestDispatcher("/views/index.jsp").forward(request,response);
            return;
        }
    }
}
