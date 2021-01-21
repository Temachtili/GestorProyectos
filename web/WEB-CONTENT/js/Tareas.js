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