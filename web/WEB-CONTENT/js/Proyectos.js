//---------------------------------------------------------------------------------------------------------------------
//BUSCAR PROYECTOS Y AUTOCOMPLETE
$(buscarProyectos(""));

function buscarProyectos(proyectos){

    let params = {
        "proyectos": proyectos
    }

    $.ajax({
        url: 'consultas/cConsultaProyecto.jsp',
        type: 'GET',
        dataType: 'html',
        data: params
    })
        .done(function (response){
            $("#lista-proyectos").html(response);
        })
        .fail(function (){
            console.log("error")
        });

}

$(document).on('keyup', '#Buscar', function (){
    let valor = $(this).val();
    if (valor !== ""){
        buscarProyectos(valor);
    }else{
        buscarProyectos("");
    }
})

//---------------------------------------------------------------------------------------------------------------------
// FUNCIONES DE BOTONES
function borrar(x){
    let cve = $(x).attr('cve')
    Swal.fire({
        title: 'Estas seguro?',
        text: "No podrás revertir los cambios!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#dd3333',
        confirmButtonText: 'Se ha eliminado!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Eliminado!',
                'Se ha eliminado el proyecto.',
                'success'
            );

            let parametro = {"Borrar" : cve};
            $.post( "consultas/cConsultaProyecto.jsp",parametro).done(function() {
                $("[cve='" + cve + "']").remove();
            });
        }
    });
}

function editar(x){
    let name = $(x).attr('name');
    let cve = $(x).attr('cve');
    Swal.fire({
        title: "Editar nombre",
        input: 'text',
        inputValue: name,
        inputPlaceholder: 'Nombre del proyecto',
        showCancelButton: true
    }).then((result) => {
        if (result.value) {
            let parametro = {"Actualizar" : result.value, "cveProyecto" : cve};
            $.post( "consultas/cConsultaProyecto.jsp",parametro).done(function() {
                $("p[name='"+name+"']").text(result.value);
            });
        }
    });
}

function tarea(x){
    let id = $(x).attr('id');
    let nombre = $(x).attr('name');
    $(location).attr('href','Tareas.jsp?cveProyecto='+id+'&nombreProyecto='+ nombre);
}

//---------------------------------------------------------------------------------------------------------------------
//AGREGAR PROYECTO

$(document).ready(function() {
    $('#btn_nuevo').click(function () {
        Swal.fire({
            title: "Crear nuevo proyecto",
            input: 'text',
            inputPlaceholder: 'Nombre del proyecto',
            showCancelButton: true
        }).then((result) => {
            if (result.value) {
                let parametro = {"NombreProyecto" : result.value};
                $.post("consultas/cConsultaProyecto.jsp",parametro).done(function() {
                    buscarProyectos("");
                });
            }
        });
    });
});