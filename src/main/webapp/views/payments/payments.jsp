<%--
  Created by IntelliJ IDEA.
  User: Sergio Cortes
  Date: 15/07/2021
  Time: 02:14:p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Pagos | CMC</title>
    <style>
        @media print{
            .botones:none;
        }
    </style>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<div class="main-content">
    <a href="" class="btn btn-success botones"><i class="fas fa-plus"></i>Agregar Pago</a>
    <a href="" class="btn btn-success botones"><i class="fas fa-plus"></i>Buscar Socio</a>
    <label class="nombre_socio"></label>
    <input type="hidden" name="idsocio">
    <br/>
    <table class="table">
        <thead class="table-light">
        <tr>
            <th>No.</th><!--Enbcabezado-->
            <th>Nombre socio</th>
            <th>Fecha abono</th>
            <th>Monto total</th>
            <th>Monto pagado</th>
            <th>Saldo</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listPayments}" var="payment" ><!--iterar cada usuario-->
        <tr>
            <td>${payment.id}</td>
            <td>${payment.member} </td>
            <td>${payment.id.date}</td><!--datos del bean person-->
            <td>${payment.id.totalamount}</td>
            <td>${payment.id.amount}</td><
            <td>${payment.id.balance}</td><
            <td>
                <button type="button" class="btn btn-primary botones"><i class="fas fa-edit"></i>Modificar</button>
                <button type="button" class="btn btn-danger botones" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-trash-alt"></i>Eliminar</button>
                <button type="button" class="btn btn-info botones"><i class="fas fa-trash-alt"></i>Ver</button>
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
                <button type="button" onclick="print()" class="btn btn-info"><i class="fa fa-file-pdf-o fa-2x"></i>Imprimir</button>
            </div>
        </div>
    </div>
</div>





<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
</html>
