
function showModalFormTutor(event) {
    event.preventDefault();
    var modalFormTutor = new bootstrap.Modal(document.getElementById('form-modal-docentes'));
    modalFormTutor.toggle();
}
function showModalFormAlumno(event) {
    event.preventDefault();
    var modalFormProducto = new bootstrap.Modal(document.getElementById('form-modal-alumnos'));
    modalFormProducto.toggle();

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
    hide('cphContenido_campoAlumno');
    hide('cphContenido_campoApoderado');
    hide('cphContenido_campoDocente');
    hide('cphContenido_campoPersonal');
    hide('cphContenido_campoAdministrador');

}

function seleccionarAlumno(event) {
    event.preventDefault();
}
