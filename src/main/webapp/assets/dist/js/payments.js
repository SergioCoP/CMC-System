//Obtencion de los botones para abrir los modales(dialogos)
var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-verpagos');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton = document.getElementById('cerrar');
const cancelButton3 = document.getElementById('cerrar4');
const dialogoregistrar = document.getElementById('Registrar');
const dialogopagos = document.getElementById('Pagos');
const dialogoseleccionsocio = document.getElementById('Buscar_socio');
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
        //Cargar fecha actual en inputs de modals.
        var fecha = new Date();//Fecha actual
        var mes = fecha.getMonth()+1;//Mes +1 ya que comienza desde 0
        var dia = fecha.getDate();//Obtener dia
        var anio = fecha.getFullYear();//Obtener año

        if(dia < 10){
            dia='0'+dia;
        }
        if(mes < 10){
            mes='0'+mes;
        }
        console.log(anio+"/"+mes+"/"+dia);
        $('#txt_fechabo1').val(anio+"-"+mes+"-"+dia);
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
    cancelButton3.addEventListener('click', function() {
        dialogoseleccionsocio.close();
    })

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
    $('#buscarreg1').val("");
    btnbuscarsocio.addEventListener('click', function() {
        idsocio = $('#txt_idsocio');
        inputsocios = $('#txt_nombresocio');

        findListMembers();
        dialogoseleccionsocio.showModal();
        SeleccionarSocio(idsocio,inputsocios);
        //findPrestamo();
    });

})();

const SeleccionarSocio = (inputid,inputnombre) =>{
    //Se delega el evento click, en cambio se agrega el elemento contenedor del elemento dinamico
    //.on('evento','elemento credado dinamicamente)
    $('#tdatossocios').on('click','.btn-seleccionar',function () {
        console.log("Seleccionaste un socio");
        //Obtener los valores almacenados en las variables data
        let idsocio =  $(this).attr('data-id');
        let nombresocio = $(this).attr('data-name');
        //Asignarlos a los inputs del modal de registro
        inputid.val(idsocio);
        inputnombre.val(nombresocio);
        //  dialogoregistrar.showModal();
        dialogoseleccionsocio.close();

        findMemberPrestamo(inputid.val());
    })
};

const findMemberPrestamo = (idsocio) =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    inputidprestamo = $('#txt_idprestamo');
    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=loan&action=Cargar',///ServletContainer?menu=member&action=Cargar
        data: {id: idsocio}
    }).done(function(response){
        console.log(response);
        var dsocio = response;
        $.each(dsocio, function(j,itam){
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
                <td>${i+1}</td>
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
      //console.log(table);
       $('#tdatospago').append(table);
        //    llenartablapago(item);
        })
    })
};

//Buscar en tabla para el modol de listar los socios, para no inferir
//en la busqued de las tablas mostradas en cada vista

function buscarsocio() {
    /*-----------------------------------------------------------*/
    var tableReg = document.getElementById('datostabla2');
    var searchText = document.getElementById('buscarreg1').value.toLowerCase();
    var cellsOfRow = "";
    var found = false;
    var CompareWith = "";

    //se recorren las filas
    for(var i=1; i < tableReg.rows.length; i++){

        cellsOfRow = tableReg.rows[i].getElementsByTagName('td');
        found=false;
        //se recorren las celdas
        for(var j=0; j < cellsOfRow.length && !found;j++){

            CompareWith = cellsOfRow[j].innerHTML.toLowerCase();
            //Buscar el texto en el contenido de las celdas
            if(searchText.length === 0 || (CompareWith.indexOf(searchText) > -1)){
                found=true;
            }
        }
        if(found){
            tableReg.rows[i].style.display='';
        }else{
            //si no se encuentra pues se esconde la fila
            tableReg.rows[i].style.display = 'none';
        }
    }
}

//Funcion para listar los socios al dar en clic al boton buscar dentro de los modals
const findListMembers= () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));
    $.ajax({
        type: 'GET',
        url: contextPath + '/ServletContainer?menu=member&action=Listar01'
    }).done(function(response){
        //  console.log(response);
        var dsocio = response;
        //llenartablapago(dabono);
        // console.log(dabono.AbonoSeleccionado);
        let table = "";
        $('#tdatossocios').empty();
        // var list = response.AbonoSeleccionado.length;
        $.each(dsocio, function(i,item){
            // console.log(item.name);
            let list = item;
            if(list.length > 0){
                for(let i = 0; i < list.length; i++){
                    table += `
            <tr>
                <td>${list[i].idmember}</td>
                <td>${list[i].name} ${list[i].lastname}</td>
                <td>${list[i].reg_dates}</td>
                <td>
                <a class="btn btn-success btn-sm btn-seleccionar" data-id="${list[i].idmember}" data-name="${list[i].name} ${list[i].lastname}"><i class="fas fa-check-circle"></i></a>
                </td>
            </tr>
            `;
                }
            }else{
                table = `
		`;
            }
            // console.log(item);
            //console.log(table);
            $('#tdatossocios').append(table);
            //    llenartablapago(item);
        })
    })
};


