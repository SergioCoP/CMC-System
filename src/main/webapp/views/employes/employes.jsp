
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Empleados | CMC</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/dialogos.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/member.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">

</head>
<body>

<div class="main-content">
    <div class="d-flex">
        <div class="col-sm-12">
            <input type="hidden" id="seccion" value="employes">
            <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
            <button type="button" class="btn btn-success btn-reg" id="btn-registar"><i class="fas fa-plus"></i>Agregar</button>
            <table class="table" id="datostabla">
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
                        <!-- href="ServletContainer?menu=employee&action=Cargar&id=${user.getIduser()}"-->
                        <a class="btn btn-primary btn-sm btn-modificar" data-id="${user.getIduser()}" data-name="${user.getIdemploye().getName()} " data-lastname="${user.getIdemploye().getLastnames()}" data-email="${user.getEmail()}" data-password="${user.getPassword()}" data-role="${user.getIdemploye().getRole()}"><i class="fas fa-edit"></i></a>
                        <a class="btn btn-danger btn-sm btn-eliminar" data-id="${user.getIduser()}" data-name="${user.getIdemploye().getName()} " data-lastname="${user.getIdemploye().getLastnames()}" ><i class="fas fa-trash-alt"></i></a>
                        <!--  href="ServletContainer?menu=employee&action=Eliminar&id=${user.getIduser()}" -->
                    </td>
                </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>

<dialog id="Registrar" class="col-sm-5 dialogo">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <form action="ServletContainer?menu=employee" method="POST" class="row g-3" >
                    <input type="hidden" name="action" value="Registrar">
                    <div class="form-group col-md-6">
                        <label>Nombre(s)</label>
                        <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Userselected.getIduser()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Apellido(s)</label>
                        <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Correo electrónico: </label>
                        <input type="text" class="form-control" name="txtcorreo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Contraseña: </label>
                        <input type="text" class="form-control" name="txtcontrasena" onkeyup="" />
                    </div>
                    <div class="col-md-6">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txtrol" onchange="">
                                    <option value="Cajero">Cajero</option>
                                    <option value="Coordinador">Coordinador</option>
                                    <option value="Asesor">Asesor</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i>Registrar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Modificar" class="col-sm-5 dialogo" data-backdrop="static">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar1" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <form action="ServletContainer?menu=employee" method="POST" class="row g-3">
                    <input type="hidden" name="id" value="" id="idemploye">
                    <div class="form-group col-md-6">
                        <label>Nombre(s)</label>
                        <input type="text" class="form-control campo" name="txtnombre" id="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${Userselected.getIduser()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Apellido(s)</label>
                        <input type="text" class="form-control campo" name="txtapellidos" id="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Correo electrónico: </label>
                        <input type="text" class="form-control" name="txtcorreo" id="txtcorreo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Contraseña: </label>
                        <input type="text" class="form-control" name="txtcontrasena" id="txtcontrasena" onkeyup="" />
                    </div>
                    <div class="col-md-6">
                        <label>Rol: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txtrol" id="txtrol" onchange="">
                                    <option value="Cajero">Cajero</option>
                                    <option value="Coordinador">Coordinador</option>
                                    <option value="Asesor">Asesor</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol" class="form-text text-danger"></small>
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-primary" name="action" value="Actualizar"><i class="fas fa-edit"></i>Modificar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Eliminar" class="col-sm-5 dialogo">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar2" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <form action="${context}/ServletContainer?menu=employee"  method="POST" class="row g-3">
                    <input type="hidden" name="id" value="" id="idemploye2">
                    <div class="form-group col-md-12">
                        <label>Eliminar a:</label>
                        <input type="text" class="form-control campo" name="txtnombre" id="txtnombre2" disabled />
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-danger" name="action" value="Eliminar" ><i class="fas fa-plus"></i>Eliminar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/funciones.js"></script>
<script src="${context}/assets/dist/js/employefunctions.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/validarusuario.js"></script>
</body>
</html>
