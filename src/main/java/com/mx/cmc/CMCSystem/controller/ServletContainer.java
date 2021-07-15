package com.mx.cmc.CMCSystem.controller;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ServletContainer", value = "/ServletContainer")
public class ServletContainer extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        switch (action){

            case "member":
                request.getRequestDispatcher("/views/members/members.jsp").forward(request, response);
                break;
            case "employe":
                request.getRequestDispatcher("/views/employes/employes.jsp").forward(request, response);
                break;
            case "credit":
                request.getRequestDispatcher("/views/credits/credits.jsp").forward(request, response);
                break;
            case "payment":
                request.getRequestDispatcher("/views/payments/payments.jsp").forward(request, response);
                break;
            case "loan":
                request.getRequestDispatcher("/views/loans/loans.jsp").forward(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


}
