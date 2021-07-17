<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>INICIO | CMC SYSTEM</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5 col-lg-4">
    <div class="card col-sm-10">
        <div class="card-body ">
            <form class="form" action="validar" method="post">
                <div class="form-group text-center">
                    <h3>Inicio de Sesión</h3>
                    <label>Bienvenido</label>
                </div>
                <div class="form-group">
                    <label class="text-center">Usuario:</label>
                    <input type="text" name="correo" class="form-control">
                </div>
                <div class="form-group">
                    <label class="text-center">Contraseña:</label>
                    <input type="password" name="contrasena" class="form-control">
                </div>
                <div class="d-grid gap-2">
                    <br>
                   <a class="btn btn-primary btn" href="${context}/ServletUser">Iniciar Sesion</a>
                  <!--  <input type="submit" name="accion" value="Ingresar" class="btn btn-primary">-->
                </div>
            </form>
        </div>
    </div>
</div>

<!--MODAL -->
<div class="modal fade" id="addStudent" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="#" id="formStudent">
                <div class="modal-header">
                    <h5 class="modal-title" id="titulo">Registro de Empleados</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" id="id">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Nombre(s)</label>
                            <input type="text" class="form-control campo" id="nombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                            <small id="desc-nombre" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Apellido(s)</label>
                            <input type="text" class="form-control campo" id="apellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                            <small id="desc-apellidos" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Correo electrónico: </label>
                            <input type="text" class="form-control" id="correo" onkeyup="" />
                            <small id="desc-correo" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="text" class="form-control" id="contraseña" onkeyup="v" />
                            <small id="desc-contraseña" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="col-lg-4">
                                <select class="form-select fecha" id="diaNac" onchange="">
                                    <option value="0">Cajero</option>
                                    <option value="1">Coordinador</option>
                                    <option value="2">Asesor</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol" class="form-text text-danger"></small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="btnGuardar">Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>

<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
</html>