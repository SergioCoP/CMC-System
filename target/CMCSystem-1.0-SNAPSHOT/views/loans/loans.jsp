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
            <button type="button" class="btn btn-success" id="btn-registar"><i class="fas fa-plus"></i>Agregar</button>
            <table class="table" id="datostabla">
                <thead class="table-light">
                <tr>
                    <th>Nombre del socio</th>
                    <th>Tipo de credito</th>
                    <th>Monto</th>
                    <th>Saldo</th>
                    <th>Plazo</th>
                    <th>Fecha de solicitud</th>

                </tr>
                </thead>
                <tbody>

                <c:forEach items="${listLoan}" var="loan" >
                    <tr>
                        <td>${loan.getEmployee_name()}}</td>
                        <td>${loan.getCredit_type()}</td>
                        <td>${loan.getAmount()}</td>
                        <td>${loan.getBalance()}</td>
                        <td>${loan.getPeriod()}}</td>
                        <td>${loan.getDate_request()}}</td>
                        <td>
                            <!--- href="ServletContainer?menu=loan&action=ListarporId=${loan.getidloan()}"-->
                            <a class="btn btn-primary btn-sm btn-modificar" data-id="${loan.getEmployee_name()}" data-credit_type="${loan.getCredit_type()} " data-amount="${loan.getAmount()}" data-balance="${loan.getBalance()}" data-period="${loan.getPeriod()}" data-date_request="${loan.getDate_request()}"><i class="fas fa-edit"></i></a>
                            <a class="btn btn-danger btn-sm btn-eliminar" data-id="${loan.getidloan()}" data-credit_type="${loan.getCredit_type()} " data-amount="${loan.getAmount()}" ><i class="fas fa-trash-alt"></i></a>
                            <!--  href="ServletContainer?menu=loan&action=Eliminar=${loan.getidloan()}" -->
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
                <form action="ServletContainer?menu=loan" method="POST" class="row g-3" >
                    <input type="hidden" name="action" value="Registrar">
                    <div class="form-group col-md-6">
                        <label>Nombre del socio:</label>
                        <input type="text" class="form-control campo" name="txtnombre socio" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${loan.getIdloan()}"/>
                    </div>
                    <div class="col-md-6">
                        <label>Tipo de credito: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txttipo credito" id="txttipo credito" onchange="">
                                    <option value="DE TEMPORADA">DE TEMPORADA</option>
                                    <option value="PRODUCTIVO">PRODUCTIVO</option>
                                    <option value="MI VIVIENDA">MI VIVIENDA</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-credito" class="form-text text-danger"></small>
                    </div>
                    <div class="col-md-6">
                        <label>Tipo de monto: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txtmonto" id="txtmonto" onchange="">
                                    <option value="1,000.00">1,000.00</option>
                                    <option value="2,000.00">2,000.00</option>
                                    <option value="3,000.00">3,000.00</option>
                                    <option value="4,000.00">4,000.00</option>
                                    <option value="5,000.00">5,000.00</option>
                                    <option value="6,000.00">6,000.00</option>
                                    <option value="7,000.00">7,000.00</option>
                                    <option value="8,000.00">8,000.00</option>
                                    <option value="9,000.00">9,000.00</option>
                                    <option value="10,000.00">10,000.00</option>
                                    <option value="11,000.00">11,000.00</option>
                                    <option value="12,000.00">12,000.00</option>
                                    <option value="13,000.00">13,000.00</option>
                                    <option value="14,000.00">14,000.00</option>
                                    <option value="15,000.00">15,000.00</option>
                                    <option value="16,000.00">16,000.00</option>
                                    <option value="17,000.00">17,000.00</option>
                                    <option value="18,000.00">18,000.00</option>
                                    <option value="19,000.00">19,000.00</option>
                                    <option value="20,000.00">20,000.00</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol" class="form-text text-danger"></small>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Saldo: </label>
                        <input type="number" class="form-control" name="txtsaldo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo: </label>
                        <input type="number" class="form-control" name="txtplazo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Fecha de solicitud: </label>
                        <input type="date" class="form-control" name="txtfecha solicitud" onkeyup="" />
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
                <form action="ServletContainer?menu=loan" method="POST" class="row g-3">
                    <input type="hidden" name="id" value="" id="idloan">
                    <div class="form-group col-md-6">
                        <label>Nombre del socio:</label>
                        <input type="text" class="form-control campo" name="txtnombre socio" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${loan.getIdloan()}"/>
                    </div>
                    <div class="col-md-6">
                        <label>Tipo de credito: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txttipo credito" id="txttipo credito1" onchange="">
                                    <option value="DE TEMPORADA">DE TEMPORADA</option>
                                    <option value="PRODUCTIVO">PRODUCTIVO</option>
                                    <option value="MI VIVIENDA">MI VIVIENDA</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-credito1" class="form-text text-danger"></small>
                    </div>
                    <div class="col-md-6">
                        <label>Tipo de monto: </label>
                        <div class="row">
                            <div class="">
                                <select class="form-select fecha" name="txtmonto" id="txtmonto1" onchange="">
                                    <option value="1,000.00">1,000.00</option>
                                    <option value="2,000.00">2,000.00</option>
                                    <option value="3,000.00">3,000.00</option>
                                    <option value="4,000.00">4,000.00</option>
                                    <option value="5,000.00">5,000.00</option>
                                    <option value="6,000.00">6,000.00</option>
                                    <option value="7,000.00">7,000.00</option>
                                    <option value="8,000.00">8,000.00</option>
                                    <option value="9,000.00">9,000.00</option>
                                    <option value="10,000.00">10,000.00</option>
                                    <option value="11,000.00">11,000.00</option>
                                    <option value="12,000.00">12,000.00</option>
                                    <option value="13,000.00">13,000.00</option>
                                    <option value="14,000.00">14,000.00</option>
                                    <option value="15,000.00">15,000.00</option>
                                    <option value="16,000.00">16,000.00</option>
                                    <option value="17,000.00">17,000.00</option>
                                    <option value="18,000.00">18,000.00</option>
                                    <option value="19,000.00">19,000.00</option>
                                    <option value="20,000.00">20,000.00</option>
                                </select>
                            </div>
                        </div>
                        <small id="desc-rol1" class="form-text text-danger"></small>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Saldo: </label>
                        <input type="number" class="form-control" name="txtsaldo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Plazo: </label>
                        <input type="number" class="form-control" name="txtplazo" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Fecha de solicitud: </label>
                        <input type="date" class="form-control" name="txtfecha solicitud" onkeyup="" />
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
                <form action="${context}/ServletContainer?menu=loan"  method="POST" class="row g-3">
                    <input type="hidden" name="id" value="" id="idloan2">
                    <div class="form-group col-md-12">
                        <label>Eliminar a:</label>
                        <input type="text" class="form-control campo" name="txtnombre socio" id="txtnombre socio" disabled />
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