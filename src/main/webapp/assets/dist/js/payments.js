//Obtencion de los botones para abrir los modales(dialogos)
var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-modificar');
var abrir3 = document.getElementsByClassName('btn-eliminar');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton3 = document.getElementById('cerrar2');
const cancelButton = document.getElementById('cerrar');
const dialogoregistrar = document.getElementById('Registrar');
const dialogomodificar = document.getElementById('Modificar');
const dialogoeliminar = document.getElementById('Eliminar');

//funcion para asignar el cierre y apertura a los botones para su modal correspondiente
(function() {

    // Update button opens a modal dialog
    abrir.addEventListener('click', function() {
        dialogoregistrar.showModal();
    });
//se recorrem todos los botones
    for(let i=0; i < abrir2.length; i++){
        //se llama a la funcion con se mostrara el modal y carga los datos en el mismo
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
    //en el evento onclick
    boton.onclick = function(){
        //se obtienen los atributos obtenidos desde el boton
        let id = $(this).attr('data-id');
        let datamembername = $(this).attr('data-membername');
        let datadatepayment = $(this).attr('data-date_payment');
        let dataamountpayment = $(this).attr('data-amount_payment');
        let datatotalamount = $(this).attr('data-total_amount');
        let databalanceloan = $(this).attr('data-balance_loan');

        //se le asignan las variables, al value de cada input del modal
        $('#txtidprestamo').val(id);
        $('#txtnombresocio').val(datamembername);
        $('#txtfechaabono').val(datadatepayment);
        $('#txtmontototal').val(dataamountpayment);
        $('#txtmontoabonado').val(datatotalamount);
        $('#txtsaldoprestamo').val(databalanceloan);

        dialogomodificar.showModal();


    }
}

function  cargarmodal2(boton2) {
    boton2.onclick = function(){
        let id = $(this).attr('data-id');
        let name = $(this).attr('data-membername');
        let lastname = $(this).attr('data-date_payment');

        $('#idprestamo1').val(id);
        $('#txtnombre2').val(name + ' ' + lastname);
        dialogoeliminar.showModal();
    }
}