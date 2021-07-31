
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="context" value="${pageContext.request.contextPath}" />
<html>
<head>
    <title>Socios | CMC</title>
  <link rel="stylesheet" href="${context}/assets/plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="${context}/assets/dist/css/main.css">
  <link rel="stylesheet" href="${context}/assets/dist/css/dialogos.css">
  <link rel="stylesheet" href="${context}/assets/dist/css/member.css">
  <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
  <link href="https://use.fontawesome.com/releases/v5.0.6/css/all.css" rel="stylesheet">
</head>
<body>
<!--data-bs-toggle="modal" data-bs-target="#Agregar"-->
<div class="main-content">
  <div class="d-flex">
    <div class="col-sm-12">
      <input type="text" id="buscarreg" class="inputbuscar" onkeyup="buscar()" placeholder="Buscar">
      <button type="button" id="btn-registar" class="btn btn-success" ><i class="fas fa-plus"></i>Agregar Socio</button>
      <table class="table" id="miembrostabla">
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
           <!--   <form action="ServletContainer?menu=member" id="modal-modificar" method="POST">
              <input type="hidden" name="action" value="Cargar">
                <input type="hidden" name="id" value="${member.getIdmember()}">
              </form>-->
              <!--<input type="hidden" name="txtidmember" value="${member.getIdmember()}">-->
              <!--href="ServletContainer?menu=member&action=Cargar&id=${member.getIdmember()}"-->
              <a  class="btn btn-primary btn-modificar"><i class="fas fa-edit"></i></a>
              <a  class="btn btn-danger btn-modificar"><i class="fas fa-trash-alt"></i></a>
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

  <dialog id="Registrar" class="col-sm-5 dialogo">
    <div class="d-flex">
      <div class="card col-sm-12 border-0">
        <div class="card-body">
          <form action="${context}/ServletContainer?menu=member"  method="POST" class="row g-3">
            <input type="hidden" name="action" value="Registrar">
            <input type="hidden" name="id" value="">
            <div class="form-group col-md-6">
              <label>Nombre(S)</label>
              <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" />
            </div>
            <div class="form-group col-md-6">
              <label>Apellido(S)</label>
              <input type="text" class="form-control campo" name="txtapellidos" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" />
            </div>
            <div class="form-group col-md-6">
              <label>Fecha Nacimiento</label>
              <input type="text" class="form-control campo" name="txtfechanacimiento" onkeyup=""  placeholder="YYYY-MM-DD" />
            </div>
            <div class="form-group col-md-6">
              <label>Fecha de Registro</label>
              <input type="text" class="form-control campo" name="txtfecharegistro" onkeyup=""  placeholder="YYYY-MM-DD"/>
            </div>
            <div class="form-group col-md-6">
              <label>Sexo</label>
              <input type="text" class="form-control campo" name="txtsexo" onkeyup=""  placeholder="Masculino/Femenino"/>
            </div>
            <div class="col-md-6">
              <label>Identificacion Oficial: </label>
              <div class="row">
                <div class="">
                  <select class="form-select" name="txtidentificacionofical" onchange="" >
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
                    <option value="1">Aceptado</option>
                    <option value="2">Pendiente</option>
                    <option value="3">No necesario</option>
                  </select>
                </div>
              </div>
            </div>
            <menu>
              <button class="btn btn-danger" id="cerrar" type="reset">Cerrar</button>
              <button type="submit" class="btn btn-success" ><i class="fas fa-plus"></i>Agregar</button>
            </menu>
          </form>
        </div>
      </div>
    </div>
  </dialog>

  <dialog id="Modificar" class="col-sm-5 dialogo" data-backdrop="static">
    <div class="d-flex">
      <div class="card col-sm-12 border-0">
        <div class="card-body">
          <form action="ServletContainer?menu=member" method="POST" class="row g-3" id="formmodificar">
            <div class="form-group col-md-6">
              <input type="hidden" value="${MiembroSeleccionado.getIdmember()}" name="id">
              <label>Nombre(S)</label>
              <input type="text" class="form-control campo" name="txtnombre" onkeyup="" pattern="^[a-zA-ZáéíóúÁÉÍÓÚÑñüÜ ]+" title="Sólo letras" value="${MiembroSeleccionado.getName()}"/>
            </div>
            <div class="form-group col-md-6">
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
                      <option value="1">Aceptado</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getOfficial_id() == 2}">
                      <option value="2">Pendiente</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getOfficial_id() == 3}">
                      <option value="3">No necesario</option>
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
                      <option value="1">Aceptado</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getBirth_certificate() == 2}">
                      <option value="2">Pendiente</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getBirth_certificate() == 3}">
                      <option value="3">No necesario</option>
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
                      <option value="1">Aceptado</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getCurp() == 2}">
                      <option value="2">Pendiente</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getCurp() == 3}">
                      <option value="3">No necesario</option>
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
                      <option value="1">Aceptado</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getProof_residence() == 2}">
                      <option value="2">Pendiente</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getProof_residence() == 3}">
                      <option value="3">No necesario</option>
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
                      <option value="1">Aceptado</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getSketch_address() == 2}">
                      <option value="2">Pendiente</option>
                    </c:if>
                    <c:if test="${MiembroSeleccionado.getSketch_address() == 3}">
                      <option value="3">No necesario</option>
                    </c:if>
                    <option value="1">Aceptado</option>
                    <option value="2">Pendiente</option>
                    <option value="3">No necesario</option>
                  </select>
                </div>
              </div>
            </div>
            <menu>
              <button class="btn btn-danger" id="cerrar1" type="reset">Cerrar</button>
              <button type="submit" class="btn btn-success" name="action" value="Actualizar"><i class="fas fa-edit"></i>Modificar</button>
            </menu>
          </form>
        </div>
      </div>
    </div>
  </dialog>

  <dialog id="Eliminar" class="col-sm-5 dialogo">
    <div class="d-flex">
      <div class="card col-sm-12 border-0">
        <div class="card-body">
          <form action="${context}/ServletContainer?menu=member"  method="POST" class="row g-3">
            <input type="hidden" name="id" value="">
            <div class="form-group col-md-6">
              <label>Nombre</label>
              <input type="text" class="form-control campo" name="txtnombre" disabled />
            </div>
            <menu>
              <button type="submit" class="btn btn-danger" name="action" value="Eliminar"><i class="fas fa-plus"></i>Eliminar</button>
              <button type="submit" class="btn btn-primary" name="action" value="EliminarTemporal"><i class="fas fa-plus"></i>Baja Temporal</button>
            </menu>
          </form>
        </div>
      </div>
    </div>
  </dialog>


</div>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
  <script src="${context}/assets/dist/js/members.js"></script>
  <script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="${context}/assets/plugins/bootstrap/js/bootstrap.bundle.js"></script>
  <script src="${context}/assets/plugins/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
