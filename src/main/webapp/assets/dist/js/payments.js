//Obtencion de los botones para abrir los modales(dialogos)
var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-verpagos');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton = document.getElementById('cerrar');
const dialogoregistrar = document.getElementById('Registrar');
const dialogopagos = document.getElementById('Pagos');

//Variable que obtendra el valor del input donde se escribira el id del socio a buscar
var idsocio;

//Variable que obtendra el elemento input donde se mostrara el nombre del socio
var inputsocios;
var inputidprestamo;
//Botonoes para buscar socio, y ademas mostrar el id de prestamo
var btnbuscarsocio = document.getElementById("btn-buscarsocio");


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

    // Form cancel button closes the dialog box
    cancelButton.addEventListener('click', function() {
        dialogoregistrar.close();
    });

    cancelButton2.addEventListener('click', function() {
        dialogopagos.close();
    });


})();

function cargarmodal(boton){
    //en el evento onclick
    boton.onclick = function(){

        dialogopagos.showModal();

    }
}


//Funciones para abrir los dialogos y mandar variablea a ajax para obtener el idsocio, idaval y llenar los inputs con el response
(function() {
    btnbuscarsocio.addEventListener('click', function() {
        idsocio = $('#txt_idsocio').val();
        findMember1();
        findAbono();
    });

})();


const findMember1 = () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    inputsocios = $('#tnombresocio');
    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=member&action=Cargar',
        data: {id: idsocio}
    }).done(function(response){
        var dsocio = response;
        $.each(dsocio, function(i,item){
            console.log(item);
            inputsocios.val(item.name + ' '+ item.lastname);
        })
    })

};

const findAbono = () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    inputidprestamo = $('#tidprestamo');
    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=loan&action=Cargar',
        data: {id: idsocio}
    }).done(function(response){
        var dabono = response;
        $.each(dabono, function(i,item){
           // console.log(item.idloan);
            inputidprestamo.val(item.idloan);
        })
    })

};
