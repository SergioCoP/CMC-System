
function buscar() {
    /*-----------------------------------------------------------*/
    var tableReg = document.getElementById('datostabla');
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




(function() {


    /*Ocultar y mostar contraseña en login(index) */

    /*Obteniendo el span con icono de ojo*/
    $('#pass03').on('click', function () {
        //Obteniendo el input y obteniendo su tipo del input
        $('#pass1').attr('type', function (index, attr) {
            //retornar el tipo dependiendo el establecido en html
            return attr == 'text' ? 'password' : 'text';
        })
    })
    /*----------------------------------------------*/
    /*Ocultar y mostrar contraseña al registrar y modificar a los empleados*/

    //Registro
    /*Obteniedno el span con icono de ojo*/
    $('#pass01').on('click', function () {
        //Obteniendo el input y su tipo de input
        $('#pass2').attr('type', function (index, attr) {
            //retornar el tipo dependiendo el establecido en html
            return attr == 'text' ? 'password' : 'text';
        })
    })

    //Modificar
    /*Obteniedno el span con icono de ojo*/
    $('#pass02').on('click', function () {
        //Obteniendo el input y su tipo de input
        $('#txtcontrasena').attr('type', function (index, attr) {
            //retornar el tipo dependiendo el establecido en html
            return attr == 'text' ? 'password' : 'text';
        })
    })




})();
