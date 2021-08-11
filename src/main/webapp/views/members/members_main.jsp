<%--
  Created by IntelliJ IDEA.
  User: Sergio Cortes
  Date: 15/07/2021
  Time: 09:17:a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Principal | CMC</title>
    <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
    <link rel="stylesheet" href="${context}/assets/dist/css/font.css">
    <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
    <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>

<div class="main-content">
<div class="d-flex">
    <div class="col-sm-12">
        <input type="hidden" id="seccion" value="member">
        <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
        <table class="table" id="datostabla">
            <thead class="table-light">
            <tr>
                <th>No.</th><!--Enbcabezado-->
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>Fecha Registro</th>
                <th>Identificación Oficial</th>
                <th>Acta de Nacimiento</th>
                <th>Curp</th>
                <th>Comprobante Domicilio</th>
                <th>Croquis</th>
                <th>Status</th>
                <th>Acciones</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listMembers}" var="member" varStatus="status"><!--iterar cada usuario-->
            <tr>
                <td>${member.getIdmember()}</td>
                <td>${member.getName()} </td>
                <td>${member.getLastname()}</td><!--datos del bean person-->
                <td>${member.getReg_dates()} </td>
                <td>
                    <c:if test="${member.getOfficial_id() == 1}">
                        <span class="badge bg-primary">Aceptado</span>
                    </c:if>
                    <c:if test="${member.getOfficial_id() == 2}">
                        <span class="badge bg-dark">Pendiente</span>
                    </c:if>
                    <c:if test="${member.getOfficial_id() == 3}">
                        <span class="badge bg-secondary">No necesario</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getBirth_certificate() == 1}">
                        <span class="badge bg-primary">Aceptado</span>
                    </c:if>
                    <c:if test="${member.getBirth_certificate() == 2}">
                        <span class="badge bg-dark">Pendiente</span>
                    </c:if>
                    <c:if test="${member.getBirth_certificate() == 3}">
                        <span class="badge bg-secondary">No necesario</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getCurp() == 1}">
                        <span class="badge bg-primary">Aceptado</span>
                    </c:if>
                    <c:if test="${member.getCurp() == 2}">
                        <span class="badge bg-dark">Pendiente</span>
                    </c:if>
                    <c:if test="${member.getCurp() == 3}">
                        <span class="badge bg-secondary">No necesario</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getProof_residence() == 1}">
                        <span class="badge bg-primary">Aceptado</span>
                    </c:if>
                    <c:if test="${member.getProof_residence() == 2}">
                        <span class="badge bg-dark">Pendiente</span>
                    </c:if>
                    <c:if test="${member.getProof_residence() == 3}">
                        <span class="badge bg-secondary">No necesario</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getSketch_address() == 1}">
                        <span class="badge bg-primary">Aceptado</span>
                    </c:if>
                    <c:if test="${member.getSketch_address() == 2}">
                        <span class="badge bg-dark">Pendiente</span>
                    </c:if>
                    <c:if test="${member.getSketch_address() == 3}">
                        <span class="badge bg-secondary">No necesario</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getStatus() == 1}">
                        <span class="badge bg-success">Activo</span>
                    </c:if>
                    <c:if test="${member.getStatus() == 0}">
                        <span class="badge bg-secondary">Inactivo</span>
                    </c:if>
                </td>
                <td>
                    <c:if test="${member.getStatus() == 1}">
                        <button type="button" class="btn btn-info btn-sm btn-informacion" data-id="${member.getIdmember()}" data-name="${member.getName()}" data-lastname="${member.getLastname()}" data-regdate="${member.getReg_dates()}" data-borndate="${member.getBorn_date()}" data-sex="${member.getSexo()}" data-ine="${member.getOfficial_id()}" data-certibirth="${member.getBirth_certificate()}" data-curp="${member.getCurp()}" data-compdomici="${member.getProof_residence()}" data-croqui="${member.getSketch_address()}"><i class="fas fa-eye"></i></button>
                    </c:if>
                    <c:if test="${member.getStatus() == 0}">
                        <button type="button" class="btn btn-info btn-sm btn-informacion" data-id="${member.getIdmember()}" data-name="${member.getName()}" data-lastname="${member.getLastname()}" data-regdate="${member.getReg_dates()}" data-borndate="${member.getBorn_date()}" data-sex="${member.getSexo()}" data-ine="${member.getOfficial_id()}" data-certibirth="${member.getBirth_certificate()}" data-curp="${member.getCurp()}" data-compdomici="${member.getProof_residence()}" data-croqui="${member.getSketch_address()}"><i class="fas fa-eye"></i></button>
                    </c:if>
                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</div>

<dialog id="Informacion" class="col-sm-5 dialogo" data-backdrop="static">
    <div class="d-flex">
        <div class="card col-sm-12 border-0">
            <div class="card-header align-content-end">
                <button class="btn btn-light" id="cerrar3" type="reset"><i class="fas fa-times"></i></button>
            </div>
            <div class="card-body row g-3">
                <div class="form-group col-md-6">
                    <input type="hidden" value="${MiembroSeleccionado.getIdmember()}" name="id" id="idmiembro3">
                    <label>Nombre(S)</label>
                    <input type="text" class="form-control campo" name="txtnombre" id="txtnombre3" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" disabled/>
                </div>
                <div class="form-group col-md-6">
                    <label>Apellido(S)</label>
                    <input type="text" class="form-control campo" name="txtapellidos" id="txtapellidos3" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" disabled/>
                </div>
                <div class="form-group col-md-6">
                    <label>Fecha Nacimiento</label>
                    <input type="text" class="form-control campo" name="txtfechanacimiento" id="txtfechanacimiento3" onkeyup=""  placeholder="YYYY-MM-DD" disabled/>
                </div>
                <div class="form-group col-md-6">
                    <label>Fecha de Registro</label>
                    <input type="text" class="form-control campo" name="txtfecharegistro"  id="txtfecharegistro3" onkeyup=""  placeholder="YYYY-MM-DD" disabled/>
                </div>
                <div class="form-group col-md-6">
                    <label>Sexo</label>
                    <input type="text" class="form-control campo" name="txtsexo" id="txtsexo3" onkeyup=""  placeholder="Masculino/Femenino" disabled/>
                </div>
                <div class="col-md-6">
                    <label>Identificacion Oficial: </label>
                    <div class="row">
                        <div class="">
                            <select class="form-select" name="txtidentificacionofical" id="txtidentificacionofical3" onchange="" disabled >
                                <option value="1">Aceptado</option>
                                <option value="2">Pendiente</option>
                                <option value="3">No necesario</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Acta de Nacimiento: </label>
                    <div class="row">
                        <div class="">
                            <select class="form-select" name="txtactanacimiento" id="txtactanacimiento3" onchange="" disabled>
                                <option value="1">Aceptado</option>
                                <option value="2">Pendiente</option>
                                <option value="3">No necesario</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Curp: </label>
                    <div class="row">
                        <div class="">
                            <select class="form-select" name="txtcurp" id="txtcurp3" onchange="" disabled>
                                <option value="1">Aceptado</option>
                                <option value="2">Pendiente</option>
                                <option value="3">No necesario</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Comprobante de Domcilio: </label>
                    <div class="row">
                        <div class="">
                            <select class="form-select" name="txtcomprobantedomicilio" id="txtcomprobantedomicilio3" onchange="" disabled>
                                <option value="1">Aceptado</option>
                                <option value="2">Pendiente</option>
                                <option value="3">No necesario</option>
                            </select>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <label>Croquis: </label>
                    <div class="row">
                        <div class="">
                            <select class="form-select" name="txtcroquis"  id="txtcroquis3" onchange="" disabled>
                                <option value="1">Aceptado</option>
                                <option value="2">Pendiente</option>
                                <option value="3">No necesario</option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</dialog>

<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${context}/assets/dist/js/validarseleccion.js"></script>
<script src="${context}/assets/dist/js/validarusuario.js"></script>
<script src="${context}/assets/dist/js/memberfuntions.js"></script>
</body>
</html>
