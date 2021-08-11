var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-modificar');
var abrir3 = document.getElementsByClassName('btn-eliminar');
var abrir4 = document.getElementsByClassName('btn-informacion');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton3 = document.getElementById('cerrar2');
const cancelButton = document.getElementById('cerrar');
const cancelButton4 = document.getElementById('cerrar3')
const dialogoregistrar = document.getElementById('Registrar');
const dialogomodificar = document.getElementById('Modificar');
const dialogoeliminar = document.getElementById('Eliminar');
const dialogoinformacion = document.getElementById('Informacion');

(function() {

    if(abrir){
       abrir.addEventListener('click', function() {
           dialogoregistrar.showModal();
       });
   }

    for(let i=0; i < abrir2.length; i++){
        cargarmodal(abrir2[i]);
    }

    for(let x=0; x< abrir3.length; x++){
        cargarmodal2(abrir3[x]);
    }
    for(let x=0; x < abrir4.length; x++){
        cargarmodal3(abrir4[x]);
    }
    // Form cancel button closes the dialog box
    cancelButton.addEventListener('click', function() {
        dialogoregistrar.close();
    });

    cancelButton2.addEventListener('click', function() {
        dialogomodificar.close();
    });
    cancelButton3.addEventListener('click', function() {
        dialogoeliminar.close();
    });
    cancelButton4.addEventListener('click', function() {
        dialogoinformacion.close();
    })

})();

function cargarmodal(boton){
    boton.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');
        let lastname = $(this).attr('data-lastname');
        let fecharegistro = $(this).attr('data-regdate');
        let borndate = $(this).attr('data-borndate');
        let sexo = $(this).attr('data-sex');
        let officialid = $(this).attr('data-ine');
        let actanacimiento = $(this).attr('data-certibirth');
        let curp = $(this).attr('data-curp');
        let comprobantedomi = $(this).attr('data-compdomici');
        let croquis = $(this).attr('data-croqui');

        $('#idmiembro').val(id);
        $('#txtnombre').val(name);
        $('#txtapellidos').val(lastname);
        $('#txtfechanacimiento').val(borndate);
        $('#txtfecharegistro').val(fecharegistro);
        $('#txtsexo').val(sexo);
        $('#txtidentificacionofical').val(officialid);
        $('#txtactanacimiento').val(actanacimiento);
        $('#txtcurp').val(curp);
        $('#txtcomprobantedomicilio').val(comprobantedomi);
        $('#txtcroquis').val(croquis);
        dialogomodificar.showModal();


    }
}

function  cargarmodal2(boton2) {
    boton2.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');
        let lastname = $(this).attr('data-lastname');

        $('#idmiembro2').val(id);
        $('#txtnombre2').val(name + ' ' + lastname);
        dialogoeliminar.showModal();
    }
}

function cargarmodal3(boton){
    boton.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');
        let lastname = $(this).attr('data-lastname');
        let fecharegistro = $(this).attr('data-regdate');
        let borndate = $(this).attr('data-borndate');
        let sexo = $(this).attr('data-sex');
        let officialid = $(this).attr('data-ine');
        let actanacimiento = $(this).attr('data-certibirth');
        let curp = $(this).attr('data-curp');
        let comprobantedomi = $(this).attr('data-compdomici');
        let croquis = $(this).attr('data-croqui');

        $('#idmiembro3').val(id);
        $('#txtnombre3').val(name);
        $('#txtapellidos3').val(lastname);
        $('#txtfechanacimiento3').val(borndate);
        $('#txtfecharegistro3').val(fecharegistro);
        $('#txtsexo3').val(sexo);
        $('#txtidentificacionofical3').val(officialid);
        $('#txtactanacimiento3').val(actanacimiento);
        $('#txtcurp3').val(curp);
        $('#txtcomprobantedomicilio3').val(comprobantedomi);
        $('#txtcroquis3').val(croquis);
        dialogoinformacion.showModal();
    }
}