
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Empleados | CMC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<div class="main-content">
    <!--<button type="button" class="btn btn-success" data-bs-toggle="modal" data-bs-target="#adduser"><i class="fas fa-plus"></i> Registrar</button>-->
    <div class="d-flex">
        <div class="card col-sm-3 border-0">
            <div class="card-body ">
                <form action="ServletContainer?menu=employee" method="post">
                    <div class="form-group">
                        <input type="hidden" name="id" value="${Usuario.getIduser()}">
                        <label>Nombre(s)</label>
                        <input type="text" class="form-control" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Usuario.getIdemploye().getName()}"/>
                    </div>
                    <div class="form-group">
                        <label>Apellido(s)</label>
                        <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Usuario.getIdemploye().getLastnames()}"/>
                    </div>
                    <div class="form-group">
                        <label>Correo electrónico: </label>
                        <input type="text" class="form-control" name="txtcorreo" onkeyup="" value="${Usuario.getEmail()}" />
                    </div>
                    <div class="form-group">
                        <label>Contraseña: </label>
                        <input type="text" class="form-control" name="txtcontrasena" onkeyup="" value="${Usuario.getPassword()}" />
                        <small id="desc-contraseña" class="text-danger form-text"></small>
                    </div>
                    <div class="col-lg-12">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="col-lg-12">
                                <select class="form-select fecha" name="txtrol" onchange="" >
                                    <option value="Cajero">Cajero</option>
                                    <option value="Coordinador">Coordinador</option>
                                    <option value="Asesor">Asesor</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <br>
                    <button type="submit" class="btn btn-success" name="action" value="Registrar"><i class="fas fa-plus"></i>Agregar</button>
                    <button type="submit" class="btn btn-primary" name="action" value="Actualizar"><i class="fas fa-edit"></i>Modificar</button>

                </form>
            </div>
        </div>
        <div class="col-sm-9">
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
                        <!--  <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#modifyuser" ><i class="fas fa-edit"><a href="ServletContainer?menu=employe&accion=Cargarporid&id=></a></i></button>-->
                        <a class="btn btn-primary btn-sm" href="ServletContainer?menu=employee&action=Cargar&id=${user.getIduser()}"><i class="fas fa-edit"></i></a>
                        <a class="btn btn-danger btn-sm"  href="ServletContainer?menu=employee&action=Eliminar&id=${user.getIduser()}" ><i class="fas fa-trash-alt"></i></a>
                        <!-- <button type="button" class="btn btn-info"><i class="fas fa-eye"></i></button>-->
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<!--MODAL -->
<!--<div class="modal fade" id="EliminarUsuario" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="ServletContainer?menu=employe&accion=EliminarEmpleado" >
                <div class="modal-header">
                    <h5 class="modal-title" id="titulo1">Eliminar Empleado</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Se eliminara al usuario:</label>
                            <input type="text" class="form-control campo" name="txtnombre" a pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Usuario.getIdemploye().getName()} ${Usuario.getIdemploye().getLastnames()}" disabled/>
                            <small id="desc-nombre1" class="text-danger form-text"></small>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-danger" id="btnGuardar1" >Eliminar</button>
                </div>
            </form>
        </div>
    </div>
</div>-->

<!--MODAL -->
<!--<div class="modal fade" id="adduser" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="ServletContainer?menu=employe&accion=RegistrarEmpleado" >
                <div class="modal-header">
                    <h5 class="modal-title" id="titulo">Registro de Empleados</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Nombre(s)</label>
                            <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Userselected.getIduser()}"/>
                            <small id="desc-nombre" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Apellido(s)</label>
                            <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                            <small id="desc-apellidos" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Correo electrónico: </label>
                            <input type="text" class="form-control" name="txtcorreo" onkeyup="" />
                            <small id="desc-correo" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="text" class="form-control" name="txtcontrasena" onkeyup="v" />
                            <small id="desc-contraseña" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="col-lg-4">
                                <select class="form-select fecha" name="txtrol" onchange="">
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
</div>-->

<!--MODAL -->
<!--<div class="modal fade" id="modifyuser" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form method="POST" action="ServletContainer?menu=employe&accion=ActualizarEmpleado" >
                <div class="modal-header">
                    <h5 class="modal-title" id="titulo2">Modificar Empleado</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Nombre(s)</label>
                            <input type="hidden" value="${Usuario.getIduser()}" name="id">
                            <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Usuario.getIdemploye().getName()}"/>
                            <small id="desc-nombre2" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Apellido(s)</label>
                            <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Usuario.getIdemploye().getLastnames()}"/>
                            <small id="desc-apellidos2" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Correo electrónico: </label>
                            <input type="text" class="form-control" name="txtcorreo" onkeyup="" value="${Usuario.getEmail()}"/>
                            <small id="desc-correo2" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <div class="form-group">
                            <label>Contraseña: </label>
                            <input type="text" class="form-control" name="txtcontrasena" onkeyup="" value="${Usuario.getPassword()}" />
                            <small id="desc-contraseña2" class="text-danger form-text"></small>
                        </div>
                    </div>
                    <br>
                    <div class="col-lg-12">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="col-lg-4">
                                <select class="form-select fecha" name="txtrol" onchange="">
                                    <option value="Cajero">Cajero</option>
                                    <option value="Coordinador">Coordinador</option>
                                    <option value="Asesor">Asesor</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol2" class="form-text text-danger"></small>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                    <button type="submit" class="btn btn-primary" id="btnGuardar2">Modificar</button>
                </div>
            </form>
        </div>
    </div>
</div>-->



<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script><
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
