var rol = $('#txtrole').val();
var btnsocio = document.getElementById("btn-socios");
var btnempleado = document.getElementById("btn-empleados");
var btncredito = document.getElementById("btn-creditos");
var btnpagos = document.getElementById("btn-abonos");
var btnprestamo = document.getElementById("btn-prestamos");

var seccion = $('#seccion').val();

var btnabri = document.getElementById("btn-registar");
var btnmodific = document.getElementsByClassName("btn-modificar");
var btnelimin = document.getElementsByClassName("btn-eliminar");

(function() {
   if(rol == "Asesor"){
        btncredito.style.display = "none";
        btnpagos.style.display = "none";
        btnempleado.style.display = "none";
    }else if(rol == "Coordinador"){
        btnsocio.style.display = "none";
        btnprestamo.style.display = "none";
        btncredito.style.display = "block";
        btnpagos.style.display = "none";
        btnempleado.style.display = "block";
    }else if(rol == "Cajero"){
       btnsocio.style.display = "block";
       btnprestamo.style.display = "none";
       btncredito.style.display = "none";
       btnpagos.style.display = "block";
       btnempleado.style.display = "none";
   }
})();