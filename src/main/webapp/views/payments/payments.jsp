
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
            <button type="button" class="btn btn-success" id="btn-registar"><i class="fas fa-plus"></i>Agregar</button>
            <table class="table" id="datostabla">
                <thead class="table-light">
                <tr>
                    <th>Nombre de Abono</th>
                    <th>Fecha de abono</th>
                    <th>Monto total</th>
                    <th>Monto Abonado</th>
                    <th>Saldo</th>
                </tr>
                </thead>
                <tbody>

                <c:forEach items="${listPayments}" var="payments" >
                <tr>
                    <td>${payments.getMembername()}}</td>
                    <td>${payments.getDate_payment()}</td>
                    <td>${payments.getTotal_amount()}</td>
                    <td>${payments.getAmount_payment()}</td>
                    <td>${payments.getBalance_loan()}}</td>
                    <td>
                        <!--- href="ServletContainer?menu=payment&action=ListarporId=${payments.getIdpayment()}"-->
                        <a class="btn btn-primary btn-sm btn-modificar" data-id="${payments.getIdpayment()}" data-membername="${payments.getMembername()} " data-date_payment="${payments.getDate_payment()}" data-amount_payment="${payments.getAmount_payment()}" data-total_amount="${payments.getTotal_amount()}" data-balance_loan="${payments.getBalance_loan()}"><i class="fas fa-edit"></i></a>
                        <a class="btn btn-danger btn-sm btn-eliminar" data-id="${payments.getIdpayment()}" data-membername="${payments.getMembername()} " data-date_payment="${payments.getDate_payment()}" ><i class="fas fa-trash-alt"></i></a>
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
                    <div class="form-group col-md-6">
                        <label>Nombre Abono:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${payments.getIdpayment()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Fecha:</label>
                        <input type="date" class="form-control campo" name="txtfechaabono" onkeyup="" title="Fecha de registro"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Monto total: </label>
                        <input type="number" class="form-control" name="txtmontototal" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto abonado: </label>
                        <input type="number" class="form-control" name="txtmontoabonado" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Saldo: </label>
                        <input type="number" class="form-control" name="txtsaldoprestamo" onkeyup="" />
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
                <form action="ServletContainer?menu=payment" method="POST" class="row g-3">
                    <input type="hidden" name="id" value="" id="idpayment">
                    <div class="form-group col-md-6">
                        <label>Nombre Abono:</label>
                        <input type="text" class="form-control campo" name="txtnombresocio" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${payments.getIdpayment()}"/>
                    </div>
                    <div class="form-group col-md-6">
                        <label>Fecha:</label>
                        <input type="date" class="form-control campo" name="txtfechaabono" onkeyup="" title="Fecha de registro"/>
                    </div>
                    <div class="form-group col-md-12">
                        <label>Monto total: </label>
                        <input type="number" class="form-control" name="txtmontototal" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Monto abonado: </label>
                        <input type="number" class="form-control" name="txtmontoabonado" onkeyup="" />
                    </div>
                    <div class="form-group col-md-6">
                        <label>Saldo: </label>
                        <input type="number" class="form-control" name="txtsaldoprestamo" onkeyup="" />
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
                <form action="${context}/ServletContainer?menu=payment"  method="POST" class="row g-3">
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
<script src="${context}/assets/dist/js/payments.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/validarusuario.js"></script>
</body>
</html>
