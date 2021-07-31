var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-modificar');
var abrir3 = document.getElementsByClassName('btn-eliminar');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton3 = document.getElementById('cerrar2');
const cancelButton = document.getElementById('cerrar');
const dialogoregistrar = document.getElementById('Registrar');
const dialogomodificar = document.getElementById('Modificar');
const dialogoeliminar = document.getElementById('Eliminar');

(function() {

    // Update button opens a modal dialog
    abrir.addEventListener('click', function() {
        dialogoregistrar.showModal();
    });

    for(let i=0; i < abrir2.length; i++){
        cargarmodal(abrir2[i]);
    }

    for(let x=0; x< abrir3.length; x++){
        cargarmodal2(abrir3[x]);
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

})();

function cargarmodal(boton){
    boton.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');
        let plazomin = $(this).attr('data-minperiord');
        let plazomax = $(this).attr('data-maxperiod');
        let tasainteres = $(this).attr('data-interest');
        let montomin = $(this).attr('data-minamount');
        let montomax = $(this).attr('data-maxamount');
        let requisitos = $(this).attr('data-requeriment');

        $('#idcredito').val(id);
        $('#txtnombre').val(name);
        $('#txtplazominimo').val(plazomin);
        $('#txtplazomaximo').val(plazomax);
        $('#txttasainteres').val(tasainteres);
        $('#txtmontominimo').val(montomin);
        $('#txtmontomaximo').val(montomax);
        $('#txtrequisitos').val(requisitos);

        dialogomodificar.showModal();


    }
}

function  cargarmodal2(boton2) {
    boton2.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');

        $('#idcredito2').val(id);
        $('#txtnombre2').val(name);

        dialogoeliminar.showModal();
    }
}

function cargarmodal(boton){
    boton.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-name');
        let plazomin = $(this).attr('data-minperiord');
        let plazomax = $(this).attr('data-maxperiod');
        let tasainteres = $(this).attr('data-interest');
        let montomin = $(this).attr('data-minamount');
        let montomax = $(this).attr('data-maxamount');
        let requisitos = $(this).attr('data-requeriment');

        $('#idcredito').val(id);
        $('#txtnombre').val(name);
        $('#txtplazominimo').val(plazomin);
        $('#txtplazomaximo').val(plazomax);
        $('#txttasainteres').val(tasainteres);
        $('#txtmontominimo').val(montomin);
        $('#txtmontomaximo').val(montomax);
        $('#txtrequisitos').val(requisitos);

        dialogomodificar.showModal();


    }
}