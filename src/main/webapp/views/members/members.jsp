
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Socios | CMC</title>
  <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>
</head>
<body>

<div class="main-content">
<!--<a href="" class="btn btn-success"><i class="fas fa-plus"></i>Agregar Socio</a>-->
<div class="d-flex">
  <div class="card col-sm-4 border-0">
    <div class="card-body">
      <form action="ServletContainer?menu=member" method="post" class="row g-3">
        <div class="form-group col-md-5">
          <input type="hidden" value="${MiembroSeleccionado.getIdmember()}" name="id">
          <label>Nombre(S)</label>
          <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${MiembroSeleccionado.getName()}"/>
        </div>
        <div class="form-group col-md-7">
          <label>Apellido(S)</label>
          <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${MiembroSeleccionado.getLastname()}"/>
        </div>
        <div class="form-group col-md-6">
          <label>Fecha Nacimiento</label>
          <input type="text" class="form-control campo" name="txtfechanacimiento" onkeyup=""  placeholder="YYYY-MM-DD" value="${MiembroSeleccionado.getBorn_date()}"/>
        </div>
        <div class="form-group col-md-6">
          <label>Fecha de Registro</label>
          <input type="text" class="form-control campo" name="txtfecharegistro" onkeyup=""  placeholder="YYYY-MM-DD" value="${MiembroSeleccionado.getReg_dates()}"/>
        </div>
        <div class="form-group col-md-6">
          <label>Sexo</label>
          <input type="text" class="form-control campo" name="txtsexo" onkeyup=""  placeholder="Masculino/Femenino" value="${MiembroSeleccionado.getSexo()}"/>
        </div>
        <div class="col-md-6">
          <label>Identificacion Oficial: </label>
          <div class="row">
            <div class="">
              <select class="form-select" name="txtidentificacionofical" onchange="" >
                <c:if test="${MiembroSeleccionado.getOfficial_id() == 1}">
                  <option>Aceptado</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getOfficial_id() == 2}">
                  <option>Pendiente</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getOfficial_id() == 3}">
                  <option>No necesario</option>
                </c:if>
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
              <select class="form-select" name="txtactanacimiento" onchange="" >
                <c:if test="${MiembroSeleccionado.getBirth_certificate() == 1}">
                  <option>Aceptado</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getBirth_certificate() == 2}">
                  <option>Pendiente</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getBirth_certificate() == 3}">
                  <option>No necesario</option>
                </c:if>
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
              <select class="form-select" name="txtcurp" onchange="" >
                <c:if test="${MiembroSeleccionado.getCurp() == 1}">
                  <option>Aceptado</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getCurp() == 2}">
                  <option>Pendiente</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getCurp() == 3}">
                  <option>No necesario</option>
                </c:if>
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
              <select class="form-select" name="txtcomprobantedomicilio" onchange="" >
                <c:if test="${MiembroSeleccionado.getProof_residence() == 1}">
                  <option>Aceptado</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getProof_residence() == 2}">
                  <option>Pendiente</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getProof_residence() == 3}">
                  <option>No necesario</option>
                </c:if>
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
              <select class="form-select" name="txtcroquis" onchange="" >
                <c:if test="${MiembroSeleccionado.getSketch_address() == 1}">
                  <option>Aceptado</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getSketch_address() == 2}">
                  <option>Pendiente</option>
                </c:if>
                <c:if test="${MiembroSeleccionado.getSketch_address() == 3}">
                  <option>No necesario</option>
                </c:if>
                <option value="1">Aceptado</option>
                <option value="2">Pendiente</option>
                <option value="3">No necesario</option>
              </select>
            </div>
          </div>
        </div>
        <div class="col-12">
          <button type="submit" class="btn btn-success" name="action" value="Registrar"><i class="fas fa-plus"></i>Agregar</button>
          <button type="submit" class="btn btn-primary" name="action" value="Actualizar"><i class="fas fa-edit"></i>Modificar</button>
          <button type="submit" class="btn btn-info" name="action" value="EliminarTemporal"><i class="fas fa-edit"></i>Baja Temporal</button>
        </div>

      </form>
    </div>

  </div>
  <div class="col-sm-8">
    <table class="table">
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
            <a type="button" class="btn btn-primary" href="ServletContainer?menu=member&action=Cargar&id=${member.getIdmember()}"><i class="fas fa-edit"></i></a>
            <a type="button" class="btn btn-danger" href="ServletContainer?menu=member&action=Eliminar&id=${member.getIdmember()}" ><i class="fas fa-trash-alt"></i></a>
          </c:if>
          <c:if test="${member.getStatus() == 0}">
            <button type="button" class="btn btn-info"><i class="fas fa-trash-alt"></i>Info</button>
          </c:if>
        </td>
      </tr>
      </c:forEach>
      </tbody>
    </table>
  </div>

</div>
</div>

<%-- MODAL --%>
<!--<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
</div>-->

<script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
</body>
</html>
