//----------------------------------------------------------------------------------------------------------------------
// Funciones equis
function color(porcentaje) {
    let color;
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

let m1 = "", m2 = "", m3 = "", m4 = "", m5 = "", m6 = "", m7 = "", m8 = "", m9 = "", m10 = "", m11 = "", m12 = "";

function reiniciarMeses() {
    m1 = "";
    m2 = "";
    m3 = "";
    m4 = "";
    m5 = "";
    m6 = "";
    m7 = "";
    m8 = "";
    m9 = "";
    m10 = "";
    m11 = "";
    m12 = "";
}

function mes(fecha, str) {
    switch (fecha) {
        case "01":
            m1 += str;
            $('#Enero').html(m1);
            $("[name='Enero']").css("cssText", "display:block !important");
            break;
        case "02":
            m2 += str;
            $('#Febrero').html(m2);
            $("[name='Febrero']").css("cssText", "display:block !important");
            break;
        case "03":
            m3 += str;
            $('#Marzo').html(m3);
            $("[name='Marzo']").css("cssText", "display:block !important");
            break;
        case "04":
            m4 += str;
            $('#Abril').html(m4);
            $("[name='Abril']").css("cssText", "display:block !important");
            break;
        case "05":
            m5 += str;
            $('#Mayo').html(m5);
            $("[name='Mayo']").css("cssText", "display:block !important");
            break;
        case "06":
            m6 += str;
            $('#Junio').html(m6);
            $("[name='Junio']").css("cssText", "display:block !important");
            break;
        case "07":
            m7 += str;
            $('#Julio').html(m7);
            $("[name='Julio']").css("cssText", "display:block !important");
            break;
        case "08":
            m8 += str;
            $('#Agosto').html(m8);
            $("[name='Agosto']").css("cssText", "display:block !important");
            break;
        case "09":
            m9 += str;
            $('#Septiembre').html(m9);
            $("[name='Septiembre']").css("cssText", "display:block !important");
            break;
        case "10":
            m10 += str;
            $('#Octubre').html(m10);
            $("[name='Octubre']").css("cssText", "display:block !important");
            break;
        case "11":
            m11 += str;
            $('#Noviembre').html(m11);
            $("[name='Noviembre']").css("cssText", "display:block !important");
            break;
        case "12":
            m12 += str;
            $('#Diciembre').html(m12);
            $("[name='Diciembre']").css("cssText", "display:block !important");
            break;
    }
}

//----------------------------------------------------------------------------------------------------------------------
//Funciones para la pagina

let lista;
let nombres;

function agregar() {
    const cve = $('[setcve]').attr('setcve');
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
            const inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm');
            const inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

            inputNumber.addEventListener('input', () => {
                inputRange.value = inputNumber.value
            })

            inputRange.addEventListener('change', () => {
                inputNumber.value = inputRange.value
            })
        }
    }).then((result) => {
        if (result.value) { //validacion de datos
            const parametro = {
                "cve": cve,
                "Nombre": $('#TareaForm').val(),
                "Porcentaje": $('#PorcentajeBarForm').val(),
                "Fecha": $('#FechaForm').val()
            };
            $.post("consultas/cConsultaTarea.jsp", parametro).done(function () {
                location.reload();
            });
        }
    });
}

function borrar(x) {
    const cve = $('[setcve]').attr('setcve');
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

            let parametro = {
                "cve": cve,
                "predecesor": $(x).attr('predecesor'),
                "Borrar": true
            };
            $.post("consultas/cConsultaTarea.jsp", parametro).done(function () {
                consultar();
            });


        }
    });
}

function editar(x) {
    const cve = $('[setcve]').attr('setcve');
    Swal.fire({
        title: "Editar tarea",
        html: '' +
            '<div class="text-start">' +
            '<div class="mb-3">' +
            '<label class="form-label">Nombre tarea</label>' +
            '<input type="text" class="form-control swal2-input" id="TareaForm" placeholder="Nombre" value="' + $('#Titulo').text() + '">' +
            '</div>' +
            '<div class="mb-3">' +
            '<label class="form-label">Porcentaje</label>' +
            '<div class="row mb-3">' +
            '<div class="col-3">' +
            '<input type="number" value="' + $('#PorcentajeNum').attr('name') + '" step="5" class="form-control" id="PorcentajeNumForm">' +
            '</div>' +
            '<div class="col-9">' +
            '<input type="range" class="form-range" min="0" max="100" step="5" id="PorcentajeBarForm" value="' + $('#PorcentajeNum').attr('name') + '">' +
            '</div>' +
            '</div>' +
            '</div>' +
            '<div class="mb-3">' +
            '<label class="form-label">Fecha</label>' +
            '<input type="date" value="' + $('#Fecha').text() + '" class="form-control swal2-input" id="FechaForm">' +
            '</div>' +
            '</div>',
        showCancelButton: true,
        didOpen: () => {
            const inputNumber = Swal.getContent().querySelector('#PorcentajeBarForm')
            const inputRange = Swal.getContent().querySelector('#PorcentajeNumForm')

            inputNumber.addEventListener('input', () => {
                inputRange.value = inputNumber.value
            })

            inputRange.addEventListener('change', () => {
                inputNumber.value = inputRange.value
            })
        }
    }).then((result) => {
        if (result.value) {
            const parametro = {
                "Nombre": $('#TareaForm').val(),
                "Porcentaje": $('#PorcentajeBarForm').val(),
                "Fecha": $('#FechaForm').val(),
                "cve": cve,
                "predecesor": $(x).attr('predecesor'),
                "Editar": "true"
            };
            $.post("consultas/cConsultaTarea.jsp", parametro).done(function () {
                consultar();
            });
        }
    });
}


function actualizarTarea(element) {
    const numeroTarea = $(element).attr('noTarea');
    const pre = $(element).attr('predecesor');
    $('#Titulo').text(lista[numeroTarea]['nombreTarea']);
    $('#PorcentajeNum').text(lista[numeroTarea]['porcentaje'] + "%");
    $('#PorcentajeNum').attr('name', lista[numeroTarea]['porcentaje']);
    $('#PorcentajeBar').attr('style', "width: " + lista[numeroTarea]['porcentaje'] + "%");
    $('#PorcentajeBar').attr('class', "progress-bar progress-bar-striped progress-bar-animated " + color(lista[numeroTarea]['porcentaje']));
    $('button').attr('predecesor', pre);
    $('#Fecha').text(lista[numeroTarea]['fechaEntrega']);
}

function consultar() {
    const cve = $('[setcve]').attr('setcve');
    $.ajax({
        url: 'consultas/cJsonTareas.jsp?cveProyecto=' + cve,
        type: 'GET',
        async: false
    })
        .done(function (response) {
            lista = JSON.parse(response);

            reiniciarMeses();

            for (let i = 0; i < lista.length; i++) {
                mes(lista[i]['fechaEntrega'].split("-")[1],
                    '<li class="list-group-item" role="button" onclick="actualizarTarea(this)" noTarea="' + i + '" predecesor = "' + lista[i]["predecesor"] + '">' +
                    '<div class="row mb-3">' +
                    '<div class="col-sm-4">' + lista[i]['nombreTarea'] + '</div>' +
                    '<div class="col-sm-8">' +
                    '<div class="progress">' +
                    '<div class="progress-bar progress-bar-striped progress-bar-animated ' + color(lista[i]['porcentaje']) + '" role="progressbar" style="width: ' + lista[i]['porcentaje'] + '%"></div>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</li>');
            }

            actualizarTarea($('[noTarea=0]'));

        });
}

$(function () {
    const cve = $('[setcve]').attr('setcve');

    $.ajax({
        url: 'consultas/cJsonTareasNombres.jsp?cveProyecto=' + cve,
        type: 'GET',
        async: false
    })
        .done(function (response) {
            nombres = JSON.parse(response);
        });

    $('#Buscar').autocomplete({
        source: nombres,
        select: function (event, item) {
            const params = {
                "tarea": item.item.value
            }
            $.get("consultas/cConsultaTR.jsp", params, function (tarea) {
                $('#Titulo').text(tarea['nombreTarea']);
                $('#PorcentajeNum').text(tarea['porcentaje'] + "%");
                $('#PorcentajeNum').attr('name', tarea['porcentaje']);
                $('#PorcentajeBar').attr('style', "width: " + tarea['porcentaje'] + "%");
                $('#PorcentajeBar').attr('class', "progress-bar progress-bar-striped progress-bar-animated " + color(tarea['porcentaje']));
                $('#Fecha').text(tarea['fechaEntrega']);
            });
        }
    });

    consultar();
});