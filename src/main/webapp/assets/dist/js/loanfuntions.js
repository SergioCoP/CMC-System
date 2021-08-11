var btnbuscarclien = document.getElementsByName("codigosocio");
const findmember = () =>{
    //const contextPath = window.location.origin + window.location.pathname.substring(0, window.location.pathname.indexOf("/",2));

    $.ajax({
        type: 'POST',
        url:  '/ServletContainer?menu=member&action=Cargar',
        data: { id: $('codigosocio').val()}
    }).done(function(res){
        fill(res.MiembroSeleccionado);
    });
};

const fill =(lista) =>{
    $('codigosocio').val(lista.getIdmember().getIdmember())
}

(function() {

    btnbuscarclien.addEventListener('click', function() {
        findmember();
    });


})();