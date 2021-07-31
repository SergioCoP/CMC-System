var abrir = document.getElementById('btn-registar');
var abrir2 = document.getElementsByClassName('btn-modificar');
var abrir3 = document.getElementsByClassName('btn-eliminar');
var cancelButton2 = document.getElementById('cerrar1');
var cancelButton = document.getElementById('cerrar');
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

})();

function cargarmodal(boton){
    boton.onclick = function(){
           dialogomodificar.showModal();
        /*  $.ajax({
       url: 'ServletContainer?menu=member&action=Cargar',
       type: 'POST',
       data: {id : $(idme).val(),
       },
       success: function(result){
           dialogomodificar.showModal();
          console.log('Peticion enviada a servlet');
       }
   } );*/
    }
}

function  cargarmodal2(boton2) {
    boton2.onclick = function(){
        dialogoeliminar.showModal();
    }
}

function buscar() {
    var tableReg = document.getElementById('miembrostabla');
    var searchText = document.getElementById('buscarreg').value.toLowerCase();
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

