
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Abonos | CMC</title>
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
            <input type="hidden" id="seccion" value="payments">
            <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
            <button type="button" class="btn btn-success" id="btn-registar"><i class="fas fa-plus"></i> Agregar Pago</button>
            <table class="table" id="datostabla">
                <thead class="table-light">
                <tr>
                    <th>No</th>
                    <th>Nombre Socio</th>
                    <th>Tipo Crédito</th>
                    <th>Plazo</th>
                    <%--<th>Monto</th>--%>
                    <th>Restante</th>
                  <%--  <th>Monto Abonado</th>--%>
                    <th>Fecha Abono</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${listPayments}" var="payments" >
                <tr>
                    <td>${payments.getIdpayment()}</td>
                    <td>${payments.getMembername()}</td>
                    <td>${payments.getCreditname()}</td>
                    <td>${payments.getPeriod()} Meses</td>
                  <%--  <td>${payments.getTotal_amount()}</td>--%>
                    <td>$ ${payments.getBalance()}</td>
                  <%--  <td>${payments.getAmount_payment()}</td>--%>
                    <td>${payments.getDate_payment()}</td>
                    <td>
                        <c:if test="${payments.getStatus() == 1}">
                            <span class="badge bg-success">En Curso</span>
                        </c:if>
                        <c:if test="${payments.getStatus() == 0}">
                            <span class="badge bg-primary">Terminado</span>
                        </c:if>
                    </td>
                   <td>
                        <!--- href="ServletContainer?menu=payment&action=ListarporId=${payments.getIdpayment()}"-->
                        <a class="btn btn-primary btn-sm btn-verpagos" data-id="${payments.getIdmember()}"><i class="fas fa-eye"></i> Ver Pagos</a>
                        <!--  href="ServletContainer?menu=payment&action=Eliminar&id=${payments.getIdpayment()}" -->
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
                <form action="ServletContainer?menu=payment" method="POST" class="row g-3" >
                    <input type="hidden" name="action" value="Registrar">
                    <div class="form-group col-md-3">
                        <label>Buscar Socio:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscarsocio"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder="No.Socio"  aria-describedby="btn-buscarsocio" name="txtidsocio" id="txt_idsocio" >
                        </div>
                    </div>
                    <input type="hidden" name="txtidempleado" value="${EmpleadoActivo.getIdemploye().getIdemploye()}">
                    <div class="form-group col-md-9">
                        <label>Nombre del socio:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" id="txt_nombresocio" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label>No.Prestamo:</label>
                        <input type="text" class="form-control campo" name="txtidprestamo"  id="txt_idprestamo" value="" />
                    </div>
                    <div class="form-group col-md-4">
                        <label>Fecha:</label>
                        <input type="date" class="form-control campo" name="txtfechaabono" id="txt_fechabo1"/>
                    </div>
                    <div class="form-group col-md-5">
                        <label>Monto abonado: </label>
                        <input type="number" class="form-control" name="txtmontoabonado" onkeyup="" />
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Registrar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Pagos" class="col-sm-7 dialogo">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar1" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body content-schema1" id="">
                <table class="table" id="datostabla1">
                    <thead class="table-light">
                    <tr>
                        <th>No</th>
                        <th>Nombre Socio</th>
                        <th>Fecha de Abono</th>
                        <th>Monto Abonado</th>
                    </tr>
                    </thead>
                    <tbody id="tdatospago"></tbody>
                </table>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Buscar_socio" class="col-sm-5 dialogo">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar4" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <div class="col-md-12 align-content-center">
                    <input type="text" id="buscarreg1" class="inputbuscar" onkeyup="buscarsocio()" placeholder="Buscar">
                </div>
                <div class="form-group col-md-12" id="tableesquema1" >
                    <table class="table" id="datostabla2">
                        <thead class="table-light">
                        <tr>
                            <th>No.</th>
                            <th>Nombre Completo</th>
                            <th>Fecha de Registro</th>
                            <th>Seleccionar</th>
                        </tr>
                        </thead>
                        <tbody id="tdatossocios"></tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</dialog>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/funciones.js"></script>

<script src="${context}/assets/dist/js/validarusuario.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
<script src="${context}/assets/dist/js/payments.js"></script>
</html>
