package com.mx.cmc.CMCSystem.controller;


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

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String menu = request.getParameter("menu");
        String action = request.getParameter("accion");
        DaoUser userdao = new DaoUser();
        if(menu.equals("member")){
            request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
        }
        if(menu.equals("employe")){
            request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);
            switch (action){
                case "Listar":
                    //List listUsers = userdao.findAll();
                    request.setAttribute("listUsers",new DaoUser().findAll());
                  //  request.setAttribute("users",listUsers);
                    //
                        break;
                default:
                    throw new AssertionError();

            }
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
