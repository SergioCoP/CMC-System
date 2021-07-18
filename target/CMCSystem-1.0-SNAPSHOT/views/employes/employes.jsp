
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Empleados | CMC</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<div class="main-content">
    <button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#adduser"><i class="fas fa-plus"></i> Registrar</button>
    <br/>
    <table class="table">
        <thead class="table-light">
        <tr>
            <th>No.</th><!--Enbcabezado-->
            <th>Nombre</th>
            <th>Rol</th>
            <th>Correo</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listUsers}" var="user" ><!--iterar cada usuario-->
        <tr>
            <td>${user.getIduser()}</td>
            <td>${user.getIdemploye().getName()} ${user.getIdemploye().getLastnames()}</td><!--datos del bean person-->
            <td>${user.getIdemploye().getRole()}</td>
            <td>${user.getEmail()}</td>
            <td>
                    <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i></button>
                    <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-trash-alt"></i></button>
                    <button type="button" class="btn btn-info"><i class="fas fa-eye"></i></button>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%-- MODAL --%>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Eliminar Usuario</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                ...
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal"><i class="fas fa-times"></i>Cerrar</button>
                <button type="button" class="btn btn-danger"><i class="fas fa-trash-alt"></i>Eliminar usuario</button>
            </div>
        </div>
    </div>
</div>

<!--MODAL -->
<div class="modal fade" id="adduser" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="ServletContainer?menu=employe&accion=Crear" >
                <div class="modal-header">
                    <h5 class="modal-title" id="titulo">Registro de Empleados</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden" value="Crear" name="accion">
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
                                <select class="form-select fecha" id="rol" onchange="">
                                    <option value="Cajero">Cajero</option>
                                    <option value="Coordinador">Coordinador</option>
                                    <option value="Asesor">Asesor</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol" class="form-text text-danger"></small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="btnGuardar" >Guardar</button>
                </div>
            </form>
        </div>
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
