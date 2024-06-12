function showModalFormAlumno() {
    var modalFormProducto = new bootstrap.Modal(document.getElementById('form-modal-alumnos'));
    modalFormProducto.toggle();
}

function showModalFormTutor() {
    var modalFormTutor = new bootstrap.Modal(document.getElementById('form-modal-tutor'));
    modalFormTutor.toggle();
}

function show(userType) {
    var element = document.getElementById(userType);

    if (element) {
        element.style.display = 'block';
    } else {
        console.error("Element with id '" + userType + "' not found!");
    }
}

function hide(userType) {
    var element = document.getElementById(userType);

    if (element) {
        element.style.display = 'none';
    } else {
        console.error("Element with id '" + userType + "' not found!");
    }
}

function hideAll() {
    hide('campoAlumno');
    hide('campoApoderado');
    hide('campoDocente');
    hide('campoPersonal');
    hide('campoAdministrador');

}


function borrarPublicacion(idPublicacion) {
    if (confirm("¿Borrar publicación?")) {
        $.ajax({
            type: "POST",
            url: "adminPublicaciones.aspx/BorrarPublicacion",
            data: JSON.stringify({ idPublicacion: idPublicacion }),
            contentType: "application/json; charset=utf-8",
            dataType: "json",
        });
        location.reload();
    }
}