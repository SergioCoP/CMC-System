<%--
  Created by IntelliJ IDEA.
  User: Sergio Cortes
  Date: 15/07/2021
  Time: 01:54:p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Creditos | CMC</title>
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
            <input type="hidden" id="seccion" value="credits">
            <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
            <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

            </c:if>
            <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Coordinador'}">
                <button type="button" class="btn btn-success btn-reg" id="btn-registar"><i class="fas fa-plus"></i> Agregar</button>
            </c:if>
            <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">

            </c:if>

            <table class="table" id="datostabla">
                <thead class="table-light" >
                <tr>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Coordinador'}">
                        <th>No.</th><!--Enbcabezado-->
                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">

                    </c:if>
                    <th>Nombre</th>
                    <th>Plazo mínimo y máximo</th>
                    <th>Tasa de Intéres</th>
                    <th>Monto mínimo y máximo</th>
                    <th>Requisitos</th>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Coordinador'}">
                        <th>Acciones</th>
                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">

                    </c:if>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${listCredits}" var="credit" ><!--iterar cada usuario-->
                <tr>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Coordinador'}">
                        <td>${credit.getIdcredit()} </td>
                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">

                    </c:if>

                    <td>${credit.getName()} </td>
                    <td>${credit.getMin_period()} -- ${credit.getMax_period()} Meses</td><!--datos del bean person-->
                    <td>${credit.getInterest_rate()} %</td>
                    <td>${credit.getMin_amount()}$ -- ${credit.getMax_amount()}$</td>
                    <td>${credit.getRequeriments()}</td>
                    <td>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                        </c:if>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Coordinador'}">
                            <a  class="btn btn-primary btn-sm btn-modificar" data-id="${credit.getIdcredit()}" data-name="${credit.getName()}" data-minperiord="${credit.getMin_period()}" data-maxperiod="${credit.getMax_period()}" data-interest="${credit.getInterest_rate()}" data-minamount="${credit.getMin_amount()}" data-maxamount="${credit.getMax_amount()}" data-requeriment="${credit.getRequeriments()}"><i class="fas fa-edit"></i></a>
                            <a  class="btn btn-danger btn-sm btn-eliminar"  data-id="${credit.getIdcredit()}" data-name="${credit.getName()}"><i class="fas fa-trash-alt"></i></a>
                        </c:if>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">

                        </c:if>
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
                <form action="ServletContainer?menu=credit" method="POST" class="row g-3" >
                    <input type="hidden" name="action" value="Registrar">
                    <div class="form-group col-md-6">
                        <label>Nombre: </label>
                        <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo Mínimo: </label>
                        <input type="text" class="form-control campo" name="txtplazominimo" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo Máximo: </label>
                        <input type="text" class="form-control" name="txtplazomaximo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Tasa de Intéres: </label>
                        <input type="text" class="form-control" name="txttasainteres" onkeyup=""  />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto Mínimo:</label>
                        <input type="text" class="form-control" name="txtmontominimo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto Máximo</label>
                        <input type="text" class="form-control" name="txtmontomaximo" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Requisitos</label>
                        <textarea class="form-control" name="txtrequisitos" rows="4" ></textarea>
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
                <form action="ServletContainer?menu=credit" method="POST" class="row g-3" >
                    <input type="hidden" name="id" id="idcredito" value="">
                    <div class="form-group col-md-6">
                        <label>Nombre:</label>
                        <input type="text" class="form-control campo" name="txtnombre" id="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${CreditoSeleccionado.getName()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo Mínimo:</label>
                        <input type="text" class="form-control campo" name="txtplazominimo" id="txtplazominimo" onkeyup="" value="${CreditoSeleccionado.getMin_period()}" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo Máximo: </label>
                        <input type="text" class="form-control" name="txtplazomaximo" id="txtplazomaximo" onkeyup="" value="${CreditoSeleccionado.getMax_period()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Tasa de Intéres: </label>
                        <input type="text" class="form-control" name="txttasainteres" id="txttasainteres" onkeyup="" value="${CreditoSeleccionado.getInterest_rate()}" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto Mínimo:</label>
                        <input type="text" class="form-control" name="txtmontominimo" id="txtmontominimo" onkeyup="" value="${CreditoSeleccionado.getMin_amount()}" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto Máximo:</label>
                        <input type="text" class="form-control" name="txtmontomaximo" id="txtmontomaximo" onkeyup="" value="${CreditoSeleccionado.getMax_amount()}"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Requisitos:</label>
                        <textarea class="form-control" name="txtrequisitos" id="txtrequisitos" rows="4" >${CreditoSeleccionado.getRequeriments()}</textarea>
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-primary" name="action" value="Actualizar"><i class="fas fa-plus"></i>Modificar</button>
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
                <form action="${context}/ServletContainer?menu=credit"  method="POST" class="row g-3">
                    <input type="hidden" name="id" id="idcredito2" value="">
                    <div class="form-group col-md-12">
                        <label>Eliminar Crédito: </label>
                        <input type="text" class="form-control campo" name="txtnombre" id="txtnombre2" disabled />
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-danger" name="action" value="Eliminar"><i class="fas fa-plus"></i>Eliminar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/funciones.js"></script>
<script src="${context}/assets/dist/js/creditfunctions.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/validarusuario.js"></script>
</body>
</html>
