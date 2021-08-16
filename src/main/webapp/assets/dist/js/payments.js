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
        var idmember = $(this).attr('data-id');
        findAbonos(idmember);
        dialogopagos.showModal();
    }
}


//Funciones para abrir los dialogos y mandar variablea a ajax para obtener el idsocio, idaval y llenar los inputs con el response
(function() {
    btnbuscarsocio.addEventListener('click', function() {
        idsocio = $('#txt_idsocio').val();
        inputsocios = $('#txt_nombresocio');
        inputidprestamo = $('#txt_idprestamo');
        findMemberPrestamo();

        //findPrestamo();
    });

})();


const findMemberPrestamo = () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=loan&action=Cargar',///ServletContainer?menu=member&action=Cargar
        data: {id: idsocio}
    }).done(function(response){
        console.log(response);
        var dsocio = response;
        $.each(dsocio, function(j,itam){
            inputsocios.val(itam.member_name);
            inputidprestamo.val(itam.idloan);
           // console.log(itam.idloan);
        })
    })
};

const findAbonos= (idmember) =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=payment&action=Cargar',
        data: {id: idmember}
    }).done(function(response){
       var dabono = response;
        //llenartablapago(dabono);
       // console.log(dabono.AbonoSeleccionado);
        let table = "";
        $('#tdatospago').empty();
       // var list = response.AbonoSeleccionado.length;
   $.each(dabono, function(i,item){
          // console.log(item.membername);
       let list = item;
       if(list.length > 0){
           for(let i = 0; i < list.length; i++){
               table += `
            <tr>
                <td>${list[i].idpayment}</td>
                <td>${list[i].membername}</td>
                <td>${list[i].date_payment}</td>
                <td>$ ${list[i].amount_payment}</td>
            </tr>
            `;
           }
       }else{
           table = `
		`;
       }
      // console.log(item);
      console.log(table);
       $('#tdatospago').append(table);
        //    llenartablapago(item);
        })
    })
};

/*const llenartablapago = (list) =>{
    console.log(list);
    let table = "";
    if(list.length > 0){
        for(let i = 0; i < list.length; i++){
            console.log(list[i].membername);
            table += `
            <tr>
                <td>${list[i].idpayment}</td>
                <td>${list[i].membername}</td>
                <td>${list[i].date_payment}</td>
                <td>${list[i].amount_payment}</td>
            </tr>
            `;
        }
    }else{
        table = `
		<tr class="text-center">
			<td colspan="5">No hay registros para mostrar</td>
		</tr>
		`;
    }
    $('#tdatospago').html(table);
};*/
