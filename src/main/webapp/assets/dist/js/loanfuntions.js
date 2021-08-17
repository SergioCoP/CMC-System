//Obtencion de los botones para abrir los modales(dialogos)
var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-modificar');
var abrir3 = document.getElementsByClassName('btn-eliminar');
var abrir4 = document.getElementsByClassName('btn-generaresquema');
const cancelButton2 = document.getElementById('cerrar1');
const cancelButton3 = document.getElementById('cerrar2');
const cancelButton = document.getElementById('cerrar');
const cancelButton4 = document.getElementById('cerrar3');
const dialogoregistrar = document.getElementById('Registrar');
const dialogomodificar = document.getElementById('Modificar');
const dialogoeliminar = document.getElementById('Eliminar');
const dialogoesquemapagos = document.getElementById('Esquema_Pago');
/*--------------------------------------*/
//Boton para exportar a pdf el table del esquema de pago
btnexportarPDF = document.getElementById('btn-exportar');
//Botonoes para buscar socio en registro
var btnbuscarsocio = document.getElementById("btn-buscarsocio");
//Botonoes para buscar socio en modificar
var btnbuscarsocio2 = document.getElementById("btn-buscarsocio2");
//Botonoes para buscar avales en  registro
var btnbuscaraval1 = document.getElementById("btn-buscaraval1");
var btnbuscaraval2 = document.getElementById("btn-buscaraval2");
//Botonoes para buscar avales en modificar
var btnbuscaraval11 = document.getElementById("btn-buscaraval12");
var btnbuscaraval22 = document.getElementById("btn-buscaraval22");

//Obtener id de socio, y socioaval del input de registrar y modificar
var idsocio ;
var inputsocios;

//Obtener select a llenar con creditos disponibles
var selectCredit;

/*-----------------------------------------------------------*/
//funcion para asignar el cierre y apertura a los botones para su modal correspondiente
(function() {

    // Update button opens a modal dialog
    abrir.addEventListener('click', function() {
        selectCredit = 1;
        findCredits();
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
    for(let x = 0; x < abrir4.length; x++){
        cargarmodal3(abrir4[x]);
    }

    btnexportarPDF.addEventListener('click', function() {
        let socioname = $('#txtnombre_socio').val();
        ExportaraPDF(socioname);
    })
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
        dialogoesquemapagos.close();
    })

})();


function cargarmodal(boton){
    //en el evento onclick
    boton.onclick = function(){
        //se obtienen los atributos obtenidos desde el boton
        let idprestamo = $(this).attr('data-id');
        let idsocio = $(this).attr('data-memberid');
        let nombresocio = $(this).attr('data-namemember');
        let tipocredito = $(this).attr('data-creditype');
        let monto = $(this).attr('data-monto');
        let plazo = $(this).attr('data-periodo');
        let fechasolicitud = $(this).attr('data-fechasolicitud');
        let nombreaval1 = $(this).attr('data-aval1');
        let nombreaval2 = $(this).attr('data-aval2');
        let comprobanteingresos = $(this).attr('data-comprobanteingreso'); ;
        let razonsocial = $(this).attr('data-razonsocial');
        let ubicacion = $(this).attr('data-ubicacion');
        let giro = $(this).attr('data-giro');
        //se le asignan las variables, al value de cada input del modal
        $('#txt_idprestamo').val(idprestamo);
        $('#tidsocio1').val(idsocio);
        $('#tnombresocio1').val(nombresocio);
        $('#txt_tipocredito2').val(tipocredito);
        $('#txtmonto2').val(monto);
        $('#txt_plazo').val(plazo);
        $('#txt_fechasolicitud').val(fechasolicitud);
        $('#txt_nombreaval11').val(nombreaval1);
        $('#txt_nombreaval22').val(nombreaval2);
        $('#txt_comprobanteingresos').val(comprobanteingresos);
        $('#txt_razonsocial').val(razonsocial);
        $('#txt_ubicacion').val(ubicacion);
        $('#txt_giro').val(giro);


        selectCredit = 2;
        findCredits();
        dialogomodificar.showModal();


    }
}

function  cargarmodal2(boton2) {
    boton2.onclick = function(){
        //se obtienen los atributos obtenidos desde el boton
        let idprestamo = $(this).attr('data-id');
        let nombresocio = $(this).attr('data-namemember');

        $('#txt_idprestamo1').val(idprestamo);
        $('#txt_nombresocio3').val(nombresocio);
        dialogoeliminar.showModal();
    }
}

//Cargar modal esquema pago
function cargarmodal3(boton3){
    boton3.onclick = function () {
        let nombresocio = $(this).attr('data-nombresocio');
        let fechasolicitud = new Date($(this).attr('data-fechasolicitud'));
        //console.log(fechasolicitud);
        let plazo = $(this).attr('data-plazo');
        //console.log(plazo);
        let montosolicitado = $(this).attr('data-montosolicitado');
        //console.log(montosolicitado);
        let tipocredito = $(this).attr('data-tipocredito');
        //console.log(tipocredito);
        let interes;
        let interescomercial;
        let pago;
        let iva;
        /*------Fechas-----*/
        var fecha = fechasolicitud.setMonth(fechasolicitud.getMonth());
        let totpagado=0;
        let totintereses=0;
        let totiva=0;
        let totahorro=0;
        let totabono=0;
        let totsaldo=0;
       // console.log(anio + ' ' + mes + ' ' + dia);
        let diferenciadias1;
        let diferenciadias2;
        /*---------------------*/
        let abono = (montosolicitado/plazo);//floor
        let table = "";
        $('#txtnombre_socio').val(nombresocio);
        $('#txtfechasolicitud').val($(this).attr('data-fechasolicitud'));
        /*Validar el credito y asignar el interes correspondiente*/
         if(tipocredito == "Mi Vivienda"){
            interes = 0.18;
        }else if(tipocredito == "De Temporada"){
            interes = 0.24;
        }else if(tipocredito == "Productivo"){
            interes = 0.12;
        }
        $('#tdatosdpago').empty();
        for(let x =1 ; x <= plazo; x++){

            //console.log(x);
            diferenciadias1 = fecha;
           /* anio = diferenciadias1.getFullYear();
            mes = diferenciadias1.getMonth();
            dia = diferenciadias1.getDay();*/
            fecha = new Date(fechasolicitud.setMonth(fechasolicitud.getMonth()+1));
            diferenciadias2 =Math.abs( Math.floor(((diferenciadias1 - fecha)/(1000*60*60*24))));
            //diferenciadias1 = fecha;
            //console.log(diferenciadias1);

           // console.log(diferenciadias2);
            interescomercial =  (((diferenciadias2/360)*interes)*montosolicitado);
            iva = Math.floor(interescomercial*.16);
            pago = abono+interescomercial+iva+30;
            montosolicitado = montosolicitado - abono;
            /*Inicializar variables acumuladoras, para mostrar el total*/
            totabono+= abono;
            totintereses+= interescomercial;
            totiva+=iva;
            totahorro+= 30;
            totpagado+=pago;
            totsaldo+=montosolicitado;
            /*------------------*/


//intentar poner defirenci1 antes del for y despues
            table +=`
                <tr>
                    <td>${x}</td>
                    <td>${fecha.getFullYear()}-${fecha.getMonth() +1 }-${fecha.getDate()}</td>
                    <td>${diferenciadias2}</td>
                    <td>$${abono.toFixed(2)}</td>
                    <td>$${interescomercial.toFixed(2)}</td>
                    <td>$${iva.toFixed(2)}</td>
                    <td>$${30}</td>
                    <td>$${pago.toFixed(2)}</td>
                    <td>$${montosolicitado.toFixed(2)}</td>
                </tr>
            `;

        }
        table+=`
         <tr>
                    <td></td>
                    <td></td>
                    <td>Total:</td>
                    <td>$ ${Math.round(totabono)}</td>
                    <td>$ ${totintereses.toFixed(2)}</td>
                    <td>$ ${totiva}</td>
                    <td>$ ${totahorro}</td>
                    <td>$ ${totpagado.toFixed(2)}</td>
                    <td>$ ${totsaldo.toFixed(2)}</td>
                </tr>
        `;
      //  Generaresqueme();
        $('#tdatosdpago').append(table);
        dialogoesquemapagos.showModal();
/*Vaciar el table y las variables, para que no se guarde con otro socio*/
        /*Implementar el exporta a pdf y corregir las fechas, */
    }
}
/*------------------------------------------------------------*/
//Funciones para abrir los dialogos y mandar variablea a ajax para obtener el idsocio, idaval y llenar los inputs con el response
(function() {
        btnbuscarsocio.addEventListener('click', function() {
           idsocio = $('#txt_idsocio').val();
           inputsocios = $('#tnombresocio');
           findMember();
        });

        btnbuscarsocio2.addEventListener('click', function() {
            idsocio = $('#tidsocio1').val();
            inputsocios = $('#tnombresocio1');
            findMember();
        });

        btnbuscaraval1.addEventListener('click', function() {
            idsocio = $('#txt_idaval1').val();
            inputsocios = $('#txt_nombreaval1');
            findMember();
        });

        btnbuscaraval2.addEventListener('click', function() {
            idsocio = $('#txt_idaval2').val();
            inputsocios = $('#txt_nombreaval2');
            findMember();
        });

        btnbuscaraval11.addEventListener('click', function() {
            idsocio = $('#txt_idaval11').val();
            inputsocios = $('#txt_nombreaval11');
            findMember();
        });

        btnbuscaraval22.addEventListener('click', function() {
            idsocio =$('#txt_idaval22').val();
            inputsocios = $('#txt_nombreaval22');
            findMember();
        })
})();

const findMember = () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    $.ajax({
        type: 'POST',
        url: contextPath + '/ServletContainer?menu=member&action=Cargar',
        data: {id: idsocio}
    }).done(function(response){
     var dsocio = response;
      $.each(dsocio, function(i,item){
            inputsocios.val(item.name + ' '+ item.lastname);
       })
    })

};

const findCredits = () =>{
    const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    $.ajax({
        type: 'GET',
        url: contextPath + '/ServletContainer?menu=credit&action=Listar1'
       // dataType: 'json'
    }).done(function(response){
        console.log(response);
        var options;
       // var dcredit = response;
       $.each(response.listCredits1, function(i,item){
          console.log(item);
           options += "<option value='"+item.name+"'>"+item.name+"</option>";
        //  fillSelect(item);
           if(selectCredit == 1){

              // $('#txt_tipocredito').append('<option value = '+ item.name +'>'+ item.name +'</option>');
               $('#txt_tipocredito').html(options);
           }else if(selectCredit == 2){
              // $('#txt_tipocredito2').append('<option value = '+ item.name +'>'+ item.name +'</option>');
               $('#txt_tipocredito2').html(options);
           }

        })
    })
};

const ExportaraPDF = (socio) =>{
   /*Probablemente no se utilicen*/
    var HTML_Width = $('#EsquemaPagoPDF').width();
    var HTML_Height = $('#EsquemaPagoPDF').height();
    var top_left_margin = 15;
    var PDF_Width = HTML_Width + (top_left_margin * 2);
    var PDF_Height = (PDF_Width * 1.1) + (top_left_margin * 2);
/*----------------------------------------------------*/
    var totalPDFPages = Math.ceil(HTML_Height / PDF_Height) - 1;

    html2canvas($('#EsquemaPagoPDF')[0]).then(function (canvas) {
        var imgData = canvas.toDataURL("image/jpeg", 80.0);
        var pdf = new jsPDF('p', 'pt', 'letter');
        PDF_Width = pdf.internal.pageSize.getWidth()*.65;
        PDF_Height = pdf.internal.pageSize.getHeight()*.98;
        pdf.addImage(imgData, 'JPG', 100, 10, PDF_Width, PDF_Height);
       /* for (var i = 1; i <= totalPDFPages; i++) {
            pdf.addPage(PDF_Width, PDF_Height);
            pdf.addImage(imgData, 'JPG', top_left_margin, -(PDF_Height*i)+(top_left_margin*4),canvas_image_width,canvas_image_height);
        }*/
        pdf.save("Esquema-Pagos-" + socio + ".pdf");
       // $('#EsquemaPagoPDF').hide();
    });



}

