function login(event) {
    event.preventDefault();
    var user = document.getElementById("user").value;
    if (user == "alumno")
        window.location.href = "/Alumno/Publicaciones.aspx";
    if (user == "apoderado")
        window.location.href = "/Apoderado/Publicaciones.aspx";
    if (user == "docente")
        window.location.href = "/Docente/Publicaciones.aspx";
    if (user == "admin")
        window.location.href = "/Admin/adminPublicaciones.aspx";
    if (user == "personal")
        window.location.href = "/UsuarioAdministrativo/Publicaciones.aspx";
}