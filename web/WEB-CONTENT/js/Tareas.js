//----------------------------------------------------------------------------------------------------------------------
// Funciones equis
function color(porcentaje) {
    var color;
    if (porcentaje >= 74) {
        color = "bg-primary";
    } else {
        if (porcentaje >= 50) {
            color = "bg-success";
        } else {
            if (porcentaje >= 25) {
                color = "bg-warning";
            } else {
                color = "bg-danger";
            }
        }
    }
    return color;
}

function mes(fecha) {
    var mes;
    switch (fecha) {
        case "01":
            mes = "Enero";
            break;
        case "02":
            mes = "Febrero";
            break;
        case "03":
            mes = "Marzo";
            break;
        case "04":
            mes = "Abril";
            break;
        case "05":
            mes = "Mayo";
            break;
        case "06":
            mes = "Junio";
            break;
        case "07":
            mes = "Julio";
            break;
        case "08":
            mes = "Agosto";
            break;
        case "09":
            mes = "Septiembre";
            break;
        case "10":
            mes = "Octubre";
            break;
        case "11":
            mes = "Noviembre";
            break;
        case "12":
            mes = "Diciembre";
            break;
    }
    $("[name='" + mes + "']").css("cssText", "display:block !important");
    return mes;
}

//----------------------------------------------------------------------------------------------------------------------
//Funciones para la pagina

let lista;
let nombres;

function actualizarTarea(element){
    var numeroTarea = $(element).attr('noTarea');
    var pre = $(element).attr('predecesor');
    console.log(lista);
    $('#Titulo').text(lista[numeroTarea]['nombreTarea']);
    $('#PorcentajeNum').text(lista[numeroTarea]['porcentaje'] + "%");
    $('#PorcentajeNum').attr('name',lista[numeroTarea]['porcentaje']);
    $('#PorcentajeBar').attr('style',"width: " + lista[numeroTarea]['porcentaje']+"%");
    $('#PorcentajeBar').attr('class',"progress-bar progress-bar-striped progress-bar-animated " + color(lista[numeroTarea]['porcentaje']));
    $('[borrar]').attr('predecesor',pre);
    $('[editar]').attr('predecesor',pre);
    $('#Fecha').text(lista[numeroTarea]['fechaEntrega']);
}

$(function () {
    var cve = $('[setcve]').attr('setcve');
    $.ajax({
        url: 'consultas/cJsonTareasNombres.jsp?cveProyecto=' + cve,
        type: 'GET',
        async:false
    })
        .done(function (response){
            nombres = JSON.parse(response);
        });

    $('#Buscar').autocomplete({
        source: nombres,
        select: function (event, item){
            var params = {
                "tarea": item.item.value
            }

            $.get("consultas/cConsultaTR.jsp", params, function(tarea){
                $('#Titulo').text(tarea['nombreTarea']);
                $('#PorcentajeNum').text(tarea['porcentaje'] + "%");
                $('#PorcentajeNum').attr('name',tarea['porcentaje']);
                $('#PorcentajeBar').attr('style',"width: " + tarea['porcentaje']+"%");
                $('#PorcentajeBar').attr('class',"progress-bar progress-bar-striped progress-bar-animated " + color(tarea['porcentaje']));
                $('#Fecha').text(tarea['fechaEntrega']);
            });
        }
    });

    $.ajax({
        url: 'consultas/cJsonTareas.jsp?cveProyecto=' + cve,
        type: 'GET',
        async:false
    })
        .done(function (response){
            lista = JSON.parse(response);
        });

    const ext = lista.length;
    var cve = lista[0]["cveProyecto"];

    for (var i = 0; i < ext; i++) {
        $('#' + mes(lista[i]['fechaEntrega'].split("-")[1])).append(
            '<li class="list-group-item" role="button" onclick="actualizarTarea(this)" noTarea="'+i+'" predecesor = "'+ lista[i]["predecesor"] +'">' +
            '<div class="row mb-3">' +
            '<div class="col-sm-4">' + lista[i]['nombreTarea'] + '</div>' +
            '<div class="col-sm-8">' +
            '<div class="progress">' +
            '<div class="progress-bar progress-bar-striped progress-bar-animated ' + color(lista[i]['porcentaje']) + '" role="progressbar" style="width: ' + lista[i]['porcentaje'] + '%"></div>' +
            '</div>' +
            '</div>' +
            '</div>' +
            '</li>'
        );
    }
    $('#TareaActual').append(
        '<div class="card-header">' +
        '<p id="Titulo">'+lista[0]['nombreTarea']+'</p>' +
        '</div>' +
        '<div class="card-body">' +
        '<div class="mb-3">' +
        '<label class="form-label">Porcentaje: </label>' +
        '<div class="row mb-3">' +
        '<div class="col-1">' +
        '<p id="PorcentajeNum" name="'+lista[0]['porcentaje']+'">'+lista[0]['porcentaje']+'%</p>' +
        '</div>' +
        '<div class="col-11">' +
        '<div class="progress">' +
        '<div id="PorcentajeBar" class="progress-bar progress-bar-striped progress-bar-animated '+color(lista[0]['porcentaje'])+'" role="progressbar" style="width: '+lista[0]['porcentaje']+'%"></div>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="mb-3">' +
        '<label class="form-label">Fecha:</label>' +
        '<p id="Fecha">'+lista[0]['fechaEntrega']+'</p>' +
        '</div>' +
        '<div class="mb-3 d-flex justify-content-center">' +
        '<button type="button" class="btn btn-primary me-3" editar predecesor = "'+ lista[0]["predecesor"]+'">Editar</button>' +
        '<button type="button" class="btn btn-danger" borrar predecesor = "'+ lista[0]["predecesor"] +'">Eliminar</button>' +
        '</div>' +
        '</div>'
    );

    $('[agregar]').click(function () {
        Swal.fire({
            title: "Crear nueva tarea",
            html: '' +
                '<div class="text-start">' +
                '<div class="mb-3">' +
                '<label class="form-label">Nombre tarea</label>' +
                '<input type="text" class="form-control swal2-input" id="TareaForm" placeholder="Nombre">' +
                '</div>' +
                '<div class="mb-3">' +
                '<label class="form-label">Porcentaje</label>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<input type="number" value="80" step="5" class="form-control" id="PorcentajeNumForm">' +
                '</div>' +
                '<div class="col-9">' +
                '<input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm" value="80">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="mb-3">' +
                '<label class="form-label">Fecha</label>' +
                '<input type="date" class="form-control swal2-input" id="FechaForm">' +
                '</div>' +
                '</div>',
            showCancelButton: true,
            didOpen: () => {
                inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm')
                inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

                inputNumber.addEventListener('input', () => {
                    inputRange.value = inputNumber.value
                })

                inputRange.addEventListener('change', () => {
                    inputNumber.value = inputRange.value
                })
            }
        }).then((result) => {
            if (result.value) { //validacion de datos
                var parametro = {
                    "cve": cve,
                    "Nombre": $('#TareaForm').val(),
                    "Porcentaje": $('#PorcentajeBarForm').val(),
                    "Fecha": $('#FechaForm').val()
                };
                $.post("consultas/cConsultaTarea.jsp",parametro).done(function() {
                    location.reload();
                });
            }
        });
    });

    $('[editar]').click(function () {
        Swal.fire({
            title: "Editar tarea",
            html: '' +
                '<div class="text-start">' +
                '<div class="mb-3">' +
                '<label class="form-label">Nombre tarea</label>' +
                '<input type="text" class="form-control swal2-input" id="TareaForm" placeholder="Nombre" value="'+$('#Titulo').text()+'">' +
                '</div>' +
                '<div class="mb-3">' +
                '<label class="form-label">Porcentaje</label>' +
                '<div class="row mb-3">' +
                '<div class="col-3">' +
                '<input type="number" value="'+$('#PorcentajeNum').attr('name')+'" step="5" class="form-control" id="PorcentajeNumForm">' +
                '</div>' +
                '<div class="col-9">' +
                '<input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm" value="'+$('#PorcentajeNum').attr('name')+'">' +
                '</div>' +
                '</div>' +
                '</div>' +
                '<div class="mb-3">' +
                '<label class="form-label">Fecha</label>' +
                '<input type="date" value="'+$('#Fecha').text()+'" class="form-control swal2-input" id="FechaForm">' +
                '</div>' +
                '</div>',
            showCancelButton: true,
            didOpen: () => {
                inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm')
                inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

                inputNumber.addEventListener('input', () => {
                    inputRange.value = inputNumber.value
                })

                inputRange.addEventListener('change', () => {
                    inputNumber.value = inputRange.value
                })
            }
        }).then((result) => {
            if (result.value) {
                var parametro = {
                    "Nombre2": $('#TareaForm').val(),
                    "Porcentaje": $('#PorcentajeBarForm').val(),
                    "Fecha": $('#FechaForm').val(),
                    "cve" : cve,
                    "predecesor" : $(this).attr('predecesor'),
                    "Editar": "true"
                };
                $.post("consultas/cConsultaTarea.jsp",parametro).done(function() {
                    location.reload();
                });
            }
        });
    });

    $('[borrar]').click(function () {
        Swal.fire({
            title: 'Estas seguro?',
            text: "No podrás revertir los cambios!",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Eliminado!'
        }).then((result) => {
            if (result.isConfirmed) {
                Swal.fire(
                    'Eliminado!',
                    'La tarea ha sido eliminada.',
                    'success'
                );

                var parametro = {
                    "cve": cve,
                    "predecesor" : $(this).attr('predecesor'),
                    "Borrar" : true
                };
                $.post("consultas/cConsultaTarea.jsp",parametro).done(function() {
                    //$('#' + name).remove();
                    location.reload();
                });


            }
        });
    });
});