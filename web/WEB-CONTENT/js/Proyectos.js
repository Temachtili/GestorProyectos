//---------------------------------------------------------------------------------------------------------------------
//BUSCAR PROYECTOS Y AUTOCOMPLETE
$(buscarProyectos(""));

function buscarProyectos(proyectos){

    var params = {
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
    var valor = $(this).val();
    if (valor != ""){
        buscarProyectos(valor);
    }else{
        buscarProyectos("");
    }
})

//---------------------------------------------------------------------------------------------------------------------
// FUNCIONES DE BOTONES
function borrar(x){
    var cve = $(x).attr('cve');
    console.log(cve);
    Swal.fire({
        title: 'Are you sure?',
        text: "You won't be able to revert this!",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonColor: '#3085d6',
        cancelButtonColor: '#dd3333',
        confirmButtonText: 'Yes, delete it!'
    }).then((result) => {
        if (result.isConfirmed) {
            Swal.fire(
                'Deleted!',
                'Your file has been deleted.',
                'success'
            );

            var parametro = {"Borrar" : cve};
            $.post( "Proyectos.jsp",parametro).done(function() {
                $("[cve='" + cve + "']").remove();
            });


        }
    });
}

function editar(x){
    var name = $(x).attr('name');
    var cve = $(x).attr('cve');
    Swal.fire({
        title: "Editar nombre",
        input: 'text',
        inputValue: name,
        inputPlaceholder: 'Nombre del proyecto',
        showCancelButton: true
    }).then((result) => {
        if (result.value) {
            var parametro = {"Actualizar" : result.value, "cveProyecto" : cve};
            $.post( "Proyectos.jsp",parametro).done(function() {
                $("p[name='"+name+"']").text(result.value);
            });
        }
    });
}

function tarea(x){
    var id = $(x).attr('id');
    var nombre = $(x).attr('name');
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
                var parametro = {"NombreProyecto" : result.value};
                $.post( "Proyectos.jsp",parametro).done(function() {
                    buscarProyectos("");
                });
            }
        });
    });
});