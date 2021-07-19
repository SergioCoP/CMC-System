<%--
  Created by IntelliJ IDEA.
  User: Sergio Cortes
  Date: 15/07/2021
  Time: 09:17:a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Principal | CMC</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/font.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<input type="checkbox" id="nav-toggle">
<div class="sidebar">
    <div class="sidebar-brand">
        <h2><img src="${context}/assets/dist/img/Logo-Integradora.svg" alt="60" width="50"><span>  CMC System</span></h2>

    </div>
    <!--Secciones-del-tablero-->
    <div class="sidebar-menu">
        <ul>
            <li>
                <a href="ServletContainer?menu=member&action=Listar" target="myframe" ><span class="las la-handshake"></span>
                    <span>Socios</span></a>
            </li>
            <li>
               <a href="ServletContainer?menu=employee&action=Listar" target="myframe" ><span class="fas fa-address-card"></span>
                    <span>Empleados</span></a>
            </li>
            <li>
                <a href="ServletContainer?menu=credit&action=Listar" target="myframe"><span class="fas fa-th-list"></span>
                    <span>Creditos</span></a>
            </li>
            <li>
                <a href="ServletContainer?menu=payment" target="myframe"><span class="las la-cash-register"></span>
                    <span>Abonos</span></a>
            </li>
            <li>
                <a href="ServletContainer?menu=loan" target="myframe"><span class="las la-wallet"></span>
                    <span>Prestamos</span></a>
            </li>
        </ul>
    </div>
</div>

<!--Top bar-->
<div class="main-topbar">

    <header>
        <h2>
            <label for="nav-toggle">
                <span class="las la-bars"></span>
            </label>
        </h2>

        <div class="user-wrapper">
            <img src="${context}/assets/dist/img/usuario.png" alt="50" width="50">
            <div>
                <h4>${user.getIdemploye().getName()} ${user.getIdemploye().getLastnames()}</h4>
                <small>${user.getEmail()}</small>
            </div>
            <form method="post" action="ServletValidar">
                <div class="d-inline-block" tabindex="0" data-bs-popper="tooltip" title="Cerrar Sesión">
                    <button class="btn btn-light btn-sm" type="submit" name="action" value="Salir"><i class="fas fa-sign-out-alt"></i></button>
                </div>
            </form>

        </div>
    </header>

<main>

    <div class="m-4 contenedorjsp" style="height: 530px;" >
        <iframe name="myframe" width="100%" height="100%" style="border: none;"></iframe>
    </div>
</main>

</div>









<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/validarseleccion.js"></script>
</body>
</html>
