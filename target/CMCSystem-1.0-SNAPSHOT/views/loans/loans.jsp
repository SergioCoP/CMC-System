<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Prestamos | CMC</title>
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
            <input type="hidden" id="seccion" value="loans">
            <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
            <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">
                <button type="button" class="btn btn-success" id="btn-registar"><i class="fas fa-plus"></i> Agregar</button>
            </c:if>
            <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">
                <input type="hidden" class="btn btn-success" id="btn-registar"></input>
            </c:if>

            <table class="table" id="datostabla">
                <thead class="table-light">
                <tr>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">
                    <th>No Socio</th>
                    </c:if>
                    <th>Nombre del socio</th>
                    <th>Tipo de crédito</th>
                    <th>Monto</th>
                    <th>Plazo</th>
                    <th>Fecha de solicitud</th>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">
                        <th>Acciones</th>
                    </c:if>
                    <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                    </c:if>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${listLoan}" var="loan" >
                    <tr>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">
                            <td>${loan.getIdmember().getIdmember()}</td>
                        </c:if>
                        <td>${loan.getMember_name()}</td>
                        <td>${loan.getCredit_type()}</td>
                        <td>$ ${loan.getAmount()}</td>
                        <td>${loan.getPeriod()} Meses</td>
                        <td>${loan.getDate_request()}</td>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Asesor'}">
                            <td>
                                <a class="btn btn-primary btn-sm btn-modificar" data-id="${loan.getIdloan()}" data-memberid="${loan.getIdmember().getIdmember()}" data-namemember="${loan.getMember_name()}" data-creditype="${loan.getCredit_type()}" data-monto="${loan.getAmount()}" data-periodo="${loan.getPeriod()}" data-fechasolicitud="${loan.getDate_request()}" data-aval1="${loan.getAval1()}" data-aval2="${loan.getAval2()}" data-comprobanteingreso="${loan.getIncome_document()}" data-razonsocial="${loan.getRazon_social()}" data-ubicacion="${loan.getLocation()}" data-giro="${loan.getLine_bussines()}"><i class="fas fa-edit"></i></a>
                                <a class="btn btn-danger btn-sm btn-eliminar" data-id="${loan.getIdloan()}" data-namemember="${loan.getMember_name()}"><i class="fas fa-trash-alt"></i></a>
                                <a class="btn btn-success btn-sm btn-generaresquema" data-fechasolicitud="${loan.getDate_request()}" data-plazo="${loan.getPeriod()}" data-montosolicitado="${loan.getAmount()}" data-tipocredito="${loan.getCredit_type()}" data-nombresocio="${loan.getMember_name()}"><i class="far fa-file-pdf"></i></a>
                            </td>
                        </c:if>
                        <c:if test="${EmpleadoActivo.getIdemploye().getRole() == 'Cajero'}">

                        </c:if>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<dialog id="Registrar" class="col-sm-6 dialogo">
    <div class="d-flex">
        <div class="card col-sm-16 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <form action="ServletContainer?menu=loan" method="POST" class="row g-3" >
                    <input type="hidden" name="action" value="Registrar">
                    <div class="form-group col-md-3">
                        <label>Buscar Socio:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscarsocio"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder="Por Id"  aria-describedby="btn-buscarsocio" name="txtidsocio" id="txt_idsocio" >
                        </div>
                    </div>
                    <div class="form-group col-md-9">
                        <label>Nombre del socio:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" id="tnombresocio" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras"/>
                    </div>
                    <input type="hidden" name="txtidempleado" value="${EmpleadoActivo.getIdemploye().getIdemploye()}">
                    <input type="hidden" name="txtnombrempleado" value="${EmpleadoActivo.getIdemploye().getName()} ${EmpleadoActivo.getIdemploye().getLastnames()}">
                    <div class="col-md-5">
                        <label>Tipo de crédito: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txttipocredito" id="txt_tipocredito" onchange="">

                                </select>
                            </div>
                        </div>
                        <small id="desc-credito" class="form-text text-danger"></small>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Monto Solicitado:  </label>
                        <input type="text" class="form-control" name="txtmonto" >
                    </div>
                    <div class="form-group col-md-4">
                        <label>Plazo: </label>
                        <input type="number" class="form-control" name="txtplazo" onkeyup="" placeholder="No. Meses" />
                    </div>
                    <div class="form-group col-md-8">
                        <label>Fecha solicitud: </label>
                        <input type="date" class="form-control" name="txtfechasolicitud" onkeyup="" />
                    </div>
                    <div class="form-group col-md-4">
                        <label>Aval 1:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscaraval1"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder="Id Socio"  aria-describedby="btn-buscarsocio" name="txtidaval1" id="txt_idaval1" >
                        </div>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Nombre del Aval:</label>
                        <input type="text" class="form-control campo" name="txtnombreaval1" id="txt_nombreaval1" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Aval 2:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscaraval2"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder=" Id Socio"  aria-describedby="btn-buscarsocio" name="txtidaval2" id="txt_idaval2" >
                        </div>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Nombre del Aval:</label>
                        <input type="text" class="form-control campo" name="txtnombreaval2" id="txt_nombreaval2"/>
                    </div>
                    <div class="col-md-5">
                        <label>Comprobante Ingresos:</label>
                        <div class="row">
                            <div class="">
                                <select class="form-select" name="txtcomprobanteingresos" id="txcomprobanteingresos" onchange="">
                                    <option value="1">Aceptado</option>
                                    <option value="2">Pendiente</option>
                                    <option value="0">Rechazado</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Razón Social:</label>
                        <input type="text" class="form-control campo" name="txtrazonsocial" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Ubicación:</label>
                        <input type="text" class="form-control campo" name="txtubicacion" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Giro:</label>
                        <input type="text" class="form-control campo" name="txtgiro" onkeyup=""/>
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-success"><i class="fas fa-plus"></i> Registrar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Modificar" class="col-sm-6 dialogo" data-backdrop="static">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar1" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body">
                <form action="ServletContainer?menu=loan" method="POST" class="row g-3">
                    <input type="hidden" name="action" value="Actualizar">
                    <div class="form-group col-md-3">
                        <input type="hidden" name="txtidprestamo" id="txt_idprestamo" >
                        <label>Buscar Socio:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscarsocio2" ><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder="Por Id"  aria-describedby="btn-buscarsocio" name="txtidsocio1" id="tidsocio1"  >
                        </div>
                    </div>
                    <div class="form-group col-md-9">
                        <label>Nombre del socio:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" id="tnombresocio1" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" />
                    </div>
                    <input type="hidden" name="txtidempleado" value="${EmpleadoActivo.getIdemploye().getIdemploye()}">
                    <input type="hidden" name="txtnombrempleado" value="${EmpleadoActivo.getIdemploye().getName()} ${EmpleadoActivo.getIdemploye().getLastnames()}">
                    <div class="col-md-5">
                        <label>Tipo de crédito: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txttipocredito" id="txt_tipocredito2" onchange="">
                                    <%--<option value="DE TEMPORADA">DE TEMPORADA</option>
                                    <option value="PRODUCTIVO">PRODUCTIVO</option>
                                    <option value="MI VIVIENDA">MI VIVIENDA</option>--%>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Monto Solicitado:  </label>
                        <input type="text" class="form-control" name="txtmonto" id="txtmonto2">
                    </div>
                    <div class="form-group col-md-4">
                        <label>Plazo: </label>
                        <input type="number" class="form-control" name="txtplazo" id="txt_plazo" onkeyup="" placeholder="No. Meses" />
                    </div>
                    <div class="form-group col-md-8">
                        <label>Fecha solicitud: </label>
                        <input type="date" class="form-control" name="txtfechasolicitud" id="txt_fechasolicitud" onkeyup="" />
                    </div>
                    <div class="form-group col-md-4">
                        <label>Aval 1:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscaraval12"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder="Id Socio"  aria-describedby="btn-buscarsocio" name="txtidaval" id="txt_idaval11" >
                        </div>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Nombre del Aval:</label>
                        <input type="text" class="form-control campo" name="txtnombreaval1" id="txt_nombreaval11"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label>Aval 2:</label>
                        <div class="input-group">
                            <button class="btn btn-outline-secondary" type="button" id="btn-buscaraval22"><i class="fas fa-search"></i></button>
                            <input type="text" class="form-control" placeholder=" Id Socio"  aria-describedby="btn-buscarsocio" name="txtidaval" id="txt_idaval22" >
                        </div>
                    </div>
                    <div class="form-group col-md-8">
                        <label>Nombre del Aval:</label>
                        <input type="text" class="form-control campo" name="txtnombreaval2" id="txt_nombreaval22"/>
                    </div>
                    <div class="col-md-5">
                        <label>Comprobante Ingresos:</label>
                        <div class="row">
                            <div class="">
                                <select class="form-select" name="txtcomprobanteingresos" id="txt_comprobanteingresos" onchange="">
                                    <option value="1">Aceptado</option>
                                    <option value="2">Pendiente</option>
                                    <option value="0">Rechazado</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="form-group col-md-7">
                        <label>Razón Social:</label>
                        <input type="text" class="form-control campo" name="txtrazonsocial" id="txt_razonsocial" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Ubicación:</label>
                        <input type="text" class="form-control campo" name="txtubicacion" id="txt_ubicacion" onkeyup=""/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Giro:</label>
                        <input type="text" class="form-control campo" name="txtgiro" id="txt_giro" onkeyup=""/>
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-primary"><i class="fas fa-edit"></i> Modificar</button>
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
                <form action="${context}/ServletContainer?menu=loan"  method="POST" class="row g-3">
                    <input type="hidden" name="txtidprestamo1" id="txt_idprestamo1" value="">
                    <input type="hidden" name="action" value="Eliminar">
                    <div class="form-group col-md-12">
                        <label>Eliminar a:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" id="txt_nombresocio3" disabled />
                    </div>
                    <menu>
                        <button type="submit" class="btn btn-danger"><i class="fas fa-trash-alt"></i> Eliminar</button>
                    </menu>
                </form>
            </div>
        </div>
    </div>
</dialog>

<dialog id="Esquema_Pago" class="col-sm-10 dialogo">
    <div class="d-lg-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar3" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body content-schema" id="">
                    <div id="EsquemaPagoPDF">
                        <div class="card-title">
                            <div class="form-group col-md-4">
                                <label>Socio:</label>
                                <input class="form-control campo" type="text" id="txtnombre_socio" >
                            </div>
                        </div>
                        <br>
                        <div class="form-group col-md-12" id="tableesquema" >
                            <table class="table" id="datostabla1">
                                <thead class="table-light">
                                <tr>
                                    <th># Pago</th>
                                    <th>Fecha</th>
                                    <th>Diferencia de Tiempo</th>
                                    <th>Abono</th>
                                    <th>Interès</th>
                                    <th>IVA</th>
                                    <th>Ahorro Obligatorio Fijo</th>
                                    <th>Total a Pagar</th>
                                    <th>Saldo</th>
                                </tr>
                                </thead>
                                <tbody id="tdatosdpago"></tbody>
                            </table>
                        </div>
                    </div>

            </div>
            <br>
            <div class="card-footer  row g-3 ">
                <menu>
                    <button class="btn btn-success" id="btn-exportar"><i class="far fa-file-pdf"></i> Exportar a PDF</button>
                </menu>
            </div>
        </div>
    </div>
</dialog>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="${context}/assets/dist/js/funciones.js"></script>
<script src="http://momentjs.com/downloads/moment.min.js"></script>
<script src="${context}/assets/dist/js/loanfuntions.js"></script>
<script src="${context}/assets/dist/js/validarusuario.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<!--Script que permite exportar a pdf -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script type="text/javascript" src="https://html2canvas.hertzen.com/dist/html2canvas.js"></script>
</body>
</html>