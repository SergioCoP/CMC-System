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
  <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<div class="main-content">
    <a href="" class="btn btn-success"><i class="fas fa-plus"></i>Agregar Credito</a>
    <br/>
    <table class="table">
        <thead class="table-light">
        <tr>
            <th>No.</th><!--Enbcabezado-->
            <th>Nombre</th>
            <th>Plazo minimo y maximo</th>
            <th>Tasa de Interes</th>
            <th>Monto minimo y maximo</th>
            <th>Requisitos</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${listCredits}" var="credit" ><!--iterar cada usuario-->
        <tr>
            <td>${credit.getIdcredit()}</td>
            <td>${credit.getName()} </td>
            <td>${credit.getMin_period()} -- ${credit.getMax_period()} Meses</td><!--datos del bean person-->
            <td>${credit.getInterest_rate()} %</td>
            <td>${credit.getMin_amount()}$ -- ${credit.getMax_amount()}$</td>
            <td>${credit.getRequeriments()}</td>
            <td>
                <button type="button" class="btn btn-primary"><i class="fas fa-edit"></i>Modificar</button>
                <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal"><i class="fas fa-trash-alt"></i>Eliminar</button>
                <button type="button" class="btn btn-info"><i class="fas fa-trash-alt"></i>Ver</button>
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


<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
</body>
</html>
