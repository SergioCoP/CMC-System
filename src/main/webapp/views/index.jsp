<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>INICIO | CMC SYSTEM</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/index.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/employe.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<div class="container mt-xxl-5 col-lg-4 align-content-center">
    <div class="card mb-5">
        <div class="row g-0">
            <div class="col-md-5">
                <img src="${context}/assets/dist/img/Logo-Integradora.svg" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-7">
                <div class="card-body ">
                    <form class="form" action="ServletValidar" method="POST">
                        <div class="form-group text-center">
                            <h3>Inicio de Sesión</h3>
                            <label>Bienvenido</label>
                        </div>
                        <label id="msgerror"></label>
                        <div class="form-group">
                            <label class="text-center">Usuario:</label>
                            <input type="text" name="txtcorreo" class="form-control">
                        </div>
                        <div class="form-group">
                            <label class="text-center">Contraseña:</label>
                            <input type="password" name="txtcontrasena" class="form-control" id="pass1">
                            <span class="fas fa-eye password-icon" id="pass03"></span>
                        </div>
                        <div class="d-grid gap-2">
                            <br>
                            <!--  <a class="btn btn-primary btn" href="${context}/ServletUser">Iniciar Sesion</a>-->
                            <button type="submit" name="action" value="Ingresar" class="btn btn-primary">Ingresar </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/index.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/funciones.js"></script>
</body>

</html>