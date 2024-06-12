DROP PROCEDURE IF EXISTS actualizar_docente;
DROP PROCEDURE IF EXISTS actualizar_superusuario;
DROP PROCEDURE IF EXISTS actualizar_trabajador;
DROP PROCEDURE IF EXISTS eliminar_docente;
DROP PROCEDURE IF EXISTS eliminar_superusuario;
DROP PROCEDURE IF EXISTS eliminar_trabajador;
DROP PROCEDURE IF EXISTS eliminar_apoderado;
DROP PROCEDURE IF EXISTS eliminar_alumno;
DROP PROCEDURE IF EXISTS eliminar_aula;
DROP PROCEDURE IF EXISTS insertar_docente;
DROP PROCEDURE IF EXISTS insertar_alumno;
DROP PROCEDURE IF EXISTS insertar_aula;
DROP PROCEDURE IF EXISTS insertar_superusuario;
DROP PROCEDURE IF EXISTS insertar_trabajador;
DROP PROCEDURE IF EXISTS insertar_apoderado;
DROP PROCEDURE IF EXISTS mostrar_docentes;
DROP PROCEDURE IF EXISTS mostrar_superusuarios;
DROP PROCEDURE IF EXISTS mostrar_trabajadores;
DROP PROCEDURE IF EXISTS listar_apoderados;
DROP PROCEDURE IF EXISTS listar_alumnos;
DROP PROCEDURE IF EXISTS listar_curso;
DROP PROCEDURE IF EXISTS listar_evaluacion;
DROP PROCEDURE IF EXISTS listar_reunion;
DROP PROCEDURE IF EXISTS listar_sesion;
DROP PROCEDURE IF EXISTS listar_tarea;
DROP PROCEDURE IF EXISTS LISTAR_AULAS;
DROP PROCEDURE IF EXISTS MODIFICAR_ALUMNO;
DROP PROCEDURE IF EXISTS MODIFICAR_APODERADO;
DROP PROCEDURE IF EXISTS MODIFICAR_AULA;
DROP PROCEDURE IF EXISTS MODIFICAR_USUARIO;
DROP PROCEDURE IF EXISTS INSERTARCURSO;

DROP PROCEDURE IF EXISTS INSERTAR_ANHOESCOLAR;
DROP PROCEDURE IF EXISTS INSERTAR_PERIODO;
DROP PROCEDURE IF EXISTS MODIFICAR_ANHOESCOLAR;
DROP PROCEDURE IF EXISTS MODIFICAR_PERIODO;
DROP PROCEDURE IF EXISTS ELIMINAR_ANHO;
DROP PROCEDURE IF EXISTS ELIMINAR_PERIODO;
DROP PROCEDURE IF EXISTS LISTAR_ANHOS;
DROP PROCEDURE IF EXISTS LISTAR_PERIODOS;

-- Eliminar procedures
DROP PROCEDURE IF EXISTS InsertarCurso;
DROP PROCEDURE IF EXISTS InsertarSesionYActividad;
DROP PROCEDURE IF EXISTS InsertarReunionYActividad;
DROP PROCEDURE IF EXISTS InsertarTareaYActividad;
DROP PROCEDURE IF EXISTS InsertarEvaluacionYActividad;
DROP PROCEDURE IF EXISTS ActualizarSesionYActividad;
DROP PROCEDURE IF EXISTS ActualizarReunionYActividad;
DROP PROCEDURE IF EXISTS ActualizarTareaYActividad;
DROP PROCEDURE IF EXISTS ActualizarEvaluacionYActividad;
DROP PROCEDURE IF EXISTS ActualizarCurso;


DROP PROCEDURE IF EXISTS registraMeritoDemerito;
DROP PROCEDURE IF EXISTS registraAtencionMedica;
DROP PROCEDURE IF EXISTS actualizaAtencionMedica;
DROP PROCEDURE IF EXISTS actualizaMeriDemeri;
DROP PROCEDURE IF EXISTS borrarIncidencia;

DROP PROCEDURE IF EXISTS insertarAlumnoAula;
DROP PROCEDURE IF EXISTS modificarAlumnoAula;
DROP PROCEDURE IF EXISTS listarAlumnoAula;
DROP PROCEDURE IF EXISTS insertarApoderadoAlumno;
DROP PROCEDURE IF EXISTS insertarDocenteActividad;
DROP PROCEDURE IF EXISTS insertarIncidenciaAlumno;
DROP PROCEDURE IF EXISTS modificarIncidenciaAlumno;
DROP PROCEDURE IF EXISTS eliminarIncidenciaAlumno;
DROP PROCEDURE IF EXISTS insertarActividadAlumno;
DROP PROCEDURE IF EXISTS modificarActividadAlumnoPrimeraParte;
DROP PROCEDURE IF EXISTS modificarActividadAlumnoSegundaParte;
DROP PROCEDURE IF EXISTS eliminarActividadAlumno;

DROP PROCEDURE IF EXISTS insertarPublicacion;
DROP PROCEDURE IF EXISTS modificarPublicacion;
DROP PROCEDURE IF EXISTS listarPublicacion;
DROP PROCEDURE IF EXISTS eliminarPublicacion;
DROP PROCEDURE IF EXISTS modificarAlumnoAula;
DROP PROCEDURE IF EXISTS modificarApoderadoAlumno;
DROP PROCEDURE IF EXISTS modificarDocenteActividad;
DROP PROCEDURE IF EXISTS obtenerUsuarioPorID;
DROP PROCEDURE IF EXISTS obtenerUsuarioPorCE;
DROP PROCEDURE IF EXISTS ConsultarAtencionMedica;
DROP PROCEDURE IF EXISTS ConsultarMerito;
DROP PROCEDURE IF EXISTS ConsultarDemerito;
DROP PROCEDURE IF EXISTS LISTAR_NOTAS_ID;
DROP PROCEDURE IF exists OBTENER_AULA_ID_ALUMNO;
DROP PROCEDURE IF EXISTS OBTENER_SESION_CURSOXDOCENTE;
DROP PROCEDURE IF EXISTS LISTAR_ALUMNOS_APODERADO;
DROP PROCEDURE IF EXISTS MODIFICAR_AULA;
DROP PROCEDURE IF EXISTS INSERTAR_ALUMNO_X_AULA;
DROP PROCEDURE IF EXISTS INSERTAR_ALUMNO;
DROP PROCEDURE IF EXISTS listadoAula;
DROP PROCEDURE IF EXISTS LISTAR_ALUMNOS_SIN_SALON;
DROP PROCEDURE IF EXISTS restaurarAula;
DROP TRIGGER IF EXISTS alumnoQuitarSalon;
DROP PROCEDURE IF EXISTS ObtenerAlumnoPorIncidencia;
DROP PROCEDURE IF EXISTS ObtenerAulaxAlumnoID;
DROP PROCEDURE IF EXISTS listarTareasXAlumnoId;
DROP PROCEDURE IF EXISTS listarTareasXDocenteId;
DROP PROCEDURE IF EXISTS listarEvaluacionesXDocenteId;
DROP PROCEDURE IF EXISTS listarEvaluacionesXAlumnoId;
DROP PROCEDURE IF EXISTS listarReunionesXAlumnoId;
DROP PROCEDURE IF EXISTS listarReunionesXDocenteId;
DROP PROCEDURE IF EXISTS listarSesionesXDocenteId;
DROP PROCEDURE IF EXISTS listarSesionesXAlumnoId;
DROP PROCEDURE IF EXISTS listarSesionessXDocenteId;
DROP PROCEDURE IF EXISTS obtenerCursoXId;
-- Eliminar tablas si existen en orden inverso
DROP TABLE IF EXISTS Fotos;
DROP TABLE IF EXISTS Publicaciones;
#DROP TABLE IF EXISTS FotosUsuarios;

DROP TABLE IF EXISTS AlumnoXIncidencia;
DROP TABLE IF EXISTS AlumnoXActividad;
DROP TABLE IF EXISTS AulaXAlumno;
DROP TABLE IF EXISTS ApoderadoXAlumno;
DROP TABLE IF EXISTS DocenteXActividad;
DROP TABLE IF EXISTS aula;

DROP TABLE IF EXISTS Reunion;
DROP TABLE IF EXISTS Evaluacion;
DROP TABLE IF EXISTS Tarea;
DROP TABLE IF EXISTS Sesion;
DROP TABLE IF EXISTS Actividad;
DROP TABLE IF EXISTS Curso;
DROP TABLE IF EXISTS docente;

DROP TABLE IF EXISTS superusuario;


DROP TABLE IF EXISTS trabajador;

DROP TABLE IF EXISTS apoderado;

DROP TABLE IF EXISTS alumno;

DROP TABLE IF EXISTS personal;
DROP TABLE IF EXISTS usuario;


DROP TABLE IF EXISTS periodo;
DROP TABLE IF EXISTS anhoEscolar;
DROP TABLE IF EXISTS atencion_medica;
DROP TABLE IF EXISTS merito_demerito;
DROP TABLE IF EXISTS incidencia;



CREATE TABLE anhoEscolar (
    id_anho INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    activo TINYINT,
    PRIMARY KEY (id_anho)
)  ENGINE=INNODB;

CREATE TABLE periodo(
	id_periodo INT,
    fecha_inicio DATE,
    fecha_fin DATE,
    activo TINYINT,
    tipo  enum('verano','primerBimestre','segundoBimestre','tercerBimestre','cuartoBimestre'),
    PRIMARY KEY (id_periodo),
    FOREIGN KEY(id_periodo) REFERENCES anhoEscolar(id_anho)
)ENGINE=InnoDB;

CREATE TABLE usuario(
	id_usuario INT AUTO_INCREMENT,
    nombre VARCHAR(100),
    apellido_paterno VARCHAR(100),
    apellido_materno VARCHAR(100),
    correo_electronico VARCHAR(100),
    contrasenha VARCHAR(50),
    fecha_Creacion DATE,
    activo BOOL,
    foto LONGBLOB NULL,
    PRIMARY KEY(id_usuario)
)ENGINE=InnoDB;
ALTER TABLE usuario AUTO_INCREMENT=1000;
#INSERT INTO sala_especializada(nombre,apellido_paterno,pellido_materno,correo_electronico,contrasenha,fecha_Creacion, activo)
#values('PABLO', 'MARTINEZ', 'RIVEREA','pmartinriv@gmail.com','a123323_1212', ,true);

CREATE TABLE Publicaciones (
    idPublicacion INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(100),
    descripcion VARCHAR(500),
    activo BOOL,
    id_usuario INT,
    fecha DATE,
    fotoPrincipal LONGBLOB NULL,
    fotoDescripcion LONGBLOB NULL,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
) ENGINE=INNODB;

#CREATE TABLE Fotos (
#    idFoto INT PRIMARY KEY AUTO_INCREMENT,
#    idPublicacion INT,
#    tipoFoto VARCHAR(50),#
#    foto LONGBLOB NULL,
#    FOREIGN KEY (idPublicacion) REFERENCES Publicaciones(idPublicacion)
#) ENGINE=INNODB;
#drop table FotosUsuarios
#CREATE TABLE FotosUsuarios (
#    idFotoUsuario INT PRIMARY KEY AUTO_INCREMENT,
#    id_usuario INT,
#    foto LONGBLOB,
#    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
#) ENGINE=INNODB;

CREATE TABLE personal(
	id_personal int,
    sueldo double,
    fecha_contrato Date,
    PRIMARY KEY(id_personal),
	FOREIGN KEY(id_personal) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

-- Crear tabla Docente
CREATE TABLE docente(
    id_docente INT PRIMARY KEY AUTO_INCREMENT,
    especialidad VARCHAR(50),
    tipo_docente VARCHAR(50),
    FOREIGN KEY(id_docente) REFERENCES personal(id_personal)
) ENGINE=InnoDB;


CREATE TABLE superusuario(
	id_superusuario int,
    cargo varchar(50),
    area_administrativa varchar(50),
    PRIMARY KEY(id_superusuario),
	FOREIGN KEY(id_superusuario) REFERENCES personal(id_personal)
)ENGINE=InnoDB;

CREATE TABLE trabajador(
	id_trabajador int,
    cargo varchar(50),
    tipo_trabajador VARCHAR(50),
    PRIMARY KEY(id_trabajador),
	FOREIGN KEY(id_trabajador) REFERENCES personal(id_personal)
)ENGINE=InnoDB;

CREATE TABLE apoderado (
	id_apoderado INT,
	ocupacion VARCHAR(30),
    telefono VARCHAR(9),
    direccion VARCHAR(100),
    relacion_alumno VARCHAR(10),
    PRIMARY KEY(id_apoderado),
	FOREIGN KEY(id_apoderado) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE alumno (
    id_alumno INT,
    fecha_nacimiento DATE,
    genero CHAR,
    direccion VARCHAR(100),
    grado_actual TINYINT,
    nivel_actual TINYINT,
    tieneSalon BOOL,
    PRIMARY KEY(id_alumno),
    FOREIGN KEY(id_alumno) REFERENCES usuario(id_usuario)
)ENGINE=InnoDB;

CREATE TABLE ApoderadoXAlumno(
	idApoderado INT,
    idAlumno int,
    activo bool
)ENGINE=InnoDB;

CREATE TABLE aula (
    idAula INT AUTO_INCREMENT,
    grado TINYINT,
    seccion CHAR,
    nivel TINYINT,
    tutor INT,
    anho_escolar INT,
    estado INT,
    fotoAula LONGBLOB NULL,
    fotoHorario LONGBLOB NULL,
    PRIMARY KEY(idAula),
    FOREIGN KEY(tutor) REFERENCES docente(id_docente),
    FOREIGN KEY(anho_escolar) REFERENCES anhoEscolar(id_anho)
)ENGINE=InnoDB;

CREATE TABLE AulaXAlumno(
	idAula INT,
    idAlumno int,
    activo bool
)ENGINE=InnoDB;

-- Crear tabla Curso
CREATE TABLE Curso (
    idCurso INT PRIMARY KEY AUTO_INCREMENT,
    nombreCurso VARCHAR(255),
    Descripcion VARCHAR(255), -- Cambiado de TEXT a VARCHAR(255)
    Estado VARCHAR(50),
    fechaCreacion DATE,
    idDocente INT,
    FOREIGN KEY (idDocente) REFERENCES docente(id_Docente)
) ENGINE=InnoDB;

-- Crear tabla Actividad
CREATE TABLE Actividad (
    idActividad INT PRIMARY KEY AUTO_INCREMENT,
    idCurso INT,
    FOREIGN KEY (idCurso) REFERENCES Curso(idCurso)
) ENGINE=InnoDB;

CREATE TABLE AlumnoXActividad(
	idAlumno INT,
    idActividad int,
    activo bool
)ENGINE=InnoDB;

CREATE TABLE DocenteXActividad(
    idDocente INT,
    idActividad INT,
    activo bool
)ENGINE=InnoDB;

-- Crear tabla Sesion
CREATE TABLE Sesion (
    idSesion INT PRIMARY KEY AUTO_INCREMENT,
    idActividad INT,
    fechaInicio DATETIME,
    fechaFin DATETIME,
    asistencia CHAR(1),
    FOREIGN KEY (idActividad) REFERENCES Actividad(idActividad)
) ENGINE=InnoDB;

-- Crear tabla Tarea
CREATE TABLE Tarea (
    idTarea INT PRIMARY KEY AUTO_INCREMENT,
    idActividad INT,
    descripcion VARCHAR(255), -- Cambiado de TEXT a VARCHAR(255)
    fechaRegistro DATETIME,
    tipoTarea VARCHAR(255),
    estado VARCHAR(50),
    FOREIGN KEY (idActividad) REFERENCES Actividad(idActividad)
) ENGINE=InnoDB;

-- Crear tabla Evaluacion
CREATE TABLE Evaluacion (
    idEvaluacion INT PRIMARY KEY AUTO_INCREMENT,
    idActividad INT,
    tipoEvaluacion VARCHAR(20),
    puntajeTotal DOUBLE,
    puntajeObtenido DOUBLE,
    FOREIGN KEY (idActividad) REFERENCES Actividad(idActividad)
) ENGINE=InnoDB;

-- Crear tabla 

CREATE TABLE Reunion (
    idReunion INT PRIMARY KEY AUTO_INCREMENT,
    idActividad INT,
    lugar VARCHAR(255),
    asunto VARCHAR(255),
    descripcion VARCHAR(255), -- Cambiado de TEXT a VARCHAR(255)
    duracionMinutos INT,
    organizador VARCHAR(255),
    FOREIGN KEY (idActividad) REFERENCES Actividad(idActividad)
) ENGINE=InnoDB;

CREATE TABLE incidencia(
	idIncidencia INT AUTO_INCREMENT,
    descripcion VARCHAR(500),
    docenteRegistro INT,
    fechaRegistro DATETIME,
    tipo CHAR,
    estado TINYINT,
    PRIMARY KEY(idIncidencia)
)ENGINE=InnoDB;

CREATE TABLE AlumnoXIncidencia(
	idAlumno INT,
    idIncidencia int,
    activo bool
)ENGINE=InnoDB;

CREATE TABLE merito_demerito(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    comentario VARCHAR(500),
    tipo CHAR,
    idIncidencia INT,
    foreign key (idIncidencia) references incidencia(idIncidencia)
)ENGINE=InnoDB;


CREATE TABLE atencion_medica(
	codigo INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(100),
    diagnostico VARCHAR(500),
    tratamiento VARCHAR(500),
    fecha_hora DATETIME,
    idIncidencia INT,
    foreign key (idIncidencia) references incidencia(idIncidencia)
)ENGINE=InnoDB;


DELIMITER $
CREATE PROCEDURE INSERTAR_PERIODO(
	OUT _id_periodo INT,
	IN _anho INT,
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE,
    IN  _tipo ENUM("verano","primerBimestre","segundoBimestre","tercerBimestre","cuartoBimestre")
)
BEGIN
    SET _id_periodo = @@last_insert_id ;
    INSERT INTO periodo(id_periodo,id_anho,fecha_inicio,fecha_fin,activo,tipo) 
		VALUES(_id_periodo,_anho,_fecha_inicio,_fecha_fin,1,_tipo);
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ANHOESCOLAR(
	OUT _anho INT,
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE
)
BEGIN
    SET _anho = @@last_insert_id ;
    INSERT INTO anhoEscolar(id_anho,fecha_inicio,fecha_fin,activo) 
		VALUES(_anho,_fecha_inicio,_fecha_fin,1);
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ANHOESCOLAR(
	IN _id_anho INT,
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE
)
BEGIN
	UPDATE anhoEscolar
    SET fecha_inicio=_fecha_inicio, fecha_fin=_fecha_fin
    WHERE id_anho=_id_anho;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_PERIODO(
	IN  _tipo ENUM("verano","primerBimestre","segundoBimestre","tercerBimestre","cuartoBimestre"),
    IN _fecha_inicio DATE,
    IN _fecha_fin DATE
)
BEGIN
	UPDATE periodo
    SET fecha_inicio=_fecha_inicio, fecha_fin=_fecha_fin, tipo=_tipo
    WHERE id_Periodo=id_periodo;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ANHO(
	IN _id_anho INT
)
BEGIN
	UPDATE anhoEscolar SET activo = 0 WHERE id_anho = _id_anho;
END $

DELIMITER $
CREATE PROCEDURE ELIMINAR_PERIODO(
	IN _id_periodo INT
)
BEGIN
	UPDATE periodo SET activo = 0 WHERE id_periodo = _id_periodo;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ANHOS()
BEGIN
	SELECT A.id_anho, A.fecha_inicio, A.fecha_fin,A.activo
    FROM anhoEscolar A; 
END$

DELIMITER $
CREATE PROCEDURE LISTAR_PERIODOS()
BEGIN
	SELECT p.id_periodo, a.id_anho,p.tipo,p.fecha_inicio,p.fecha_fin
    FROM anhoEscolar a, periodo p where a.id_anho = p.id_anho;
END$



DELIMITER $
CREATE PROCEDURE insertar_docente(
	out _id_docente INT,
    in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
    in _activo BOOL,
    in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _especialidad VARCHAR(50),
    in _tipo_docente VARCHAR(50),
    in _foto BLOB
)
BEGIN
	INSERT INTO usuario(nombre,apellido_paterno,apellido_materno,correo_electronico,contrasenha,fecha_Creacion,activo,foto)
    VALUES (_nombre,_apellido_paterno,_apellido_materno,_correo_electronico,_contrasenha,_fecha_Creacion,_activo,_foto);
    SET _id_docente = @@last_insert_id;
    INSERT INTO personal(id_personal,sueldo,fecha_contrato)
    VALUES (_id_docente,_sueldo,_fecha_contrato); 
	INSERT INTO docente(id_docente,especialidad,tipo_docente)
    VALUES (_id_docente,_especialidad,_tipo_docente);
END$

DELIMITER $
CREATE PROCEDURE insertar_trabajador(
	out _id_trabajador INT,
	in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
    in _activo BOOL,
    in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _cargo VARCHAR(50),
    in _tipo_trabajador VARCHAR(50),
    IN _foto BLOB
)
BEGIN
	INSERT INTO usuario(nombre,apellido_paterno,apellido_materno,correo_electronico,contrasenha,fecha_Creacion,activo,foto)
    VALUES (_nombre,_apellido_paterno,_apellido_materno,_correo_electronico,_contrasenha,_fecha_Creacion,_activo,_foto);
    SET _id_trabajador = @@last_insert_id;
    INSERT INTO personal(id_personal,sueldo,fecha_contrato)
    VALUES (_id_trabajador,_sueldo,_fecha_contrato);
	INSERT INTO trabajador(id_trabajador,cargo,tipo_trabajador)
    VALUES (_id_trabajador,_cargo,_tipo_trabajador);
END$

DELIMITER $
CREATE PROCEDURE insertar_superusuario(
	out _id_superusuario INT,
    in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
    in _activo BOOL,
     in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _cargo VARCHAR(50),
    in _area_administrativa VARCHAR(50),
    IN _foto BLOB
)
BEGIN
	INSERT INTO usuario(nombre,apellido_paterno,apellido_materno,correo_electronico,contrasenha,fecha_Creacion,activo, foto)
    VALUES (_nombre,_apellido_paterno,_apellido_materno,_correo_electronico,_contrasenha,_fecha_Creacion,_activo,_foto);
    SET _id_superusuario = @@last_insert_id;
    INSERT INTO personal(id_personal,sueldo,fecha_contrato)
    VALUES (_id_superusuario,_sueldo,_fecha_contrato);
	INSERT INTO superusuario(id_superusuario,cargo,area_administrativa)
    VALUES (_id_superusuario,_cargo,_area_administrativa);
END$

DELIMITER $
CREATE PROCEDURE mostrar_docentes()
BEGIN
    SELECT * FROM docente
    INNER JOIN personal on docente.id_docente=personal.id_personal
    INNER JOIN usuario on personal.id_personal=usuario.id_usuario
    WHERE activo=true; 
END$

DELIMITER $
CREATE PROCEDURE mostrar_trabajadores()
BEGIN
    SELECT * FROM trabajador
    INNER JOIN personal on trabajador.id_trabajador=personal.id_personal
    INNER JOIN usuario on personal.id_personal=usuario.id_usuario
    WHERE activo=true; 
END$

DELIMITER $
CREATE PROCEDURE mostrar_superusuarios()
BEGIN
    SELECT * FROM superusuario
    INNER JOIN personal on superusuario.id_superusuario=personal.id_personal
    INNER JOIN usuario on personal.id_personal=usuario.id_usuario
    WHERE activo=true; 
END$

DELIMITER $
CREATE PROCEDURE actualizar_docente(
	in _id_docente INT,
    in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
    in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _especialidad VARCHAR(50),
    in _tipo_docente VARCHAR(50),
    in _foto BLOB
)
BEGIN
    UPDATE docente
    SET especialidad = _especialidad, tipo_docente = _tipo_docente
    WHERE id_docente = _id_docente;
    
    UPDATE personal
    SET sueldo = _sueldo, fecha_contrato = _fecha_contrato
    WHERE id_personal = _id_docente;
    
    UPDATE usuario
    SET nombre=_nombre, apellido_paterno=_apellido_paterno, apellido_materno=_apellido_materno,
    correo_electronico=_correo_electronico,contrasenha=_contrasenha,fecha_Creacion=_fecha_Creacion,foto=_foto
    WHERE id_usuario= _id_docente;
END$

DELIMITER $
CREATE PROCEDURE actualizar_trabajador(
	in _id_trabajador INT,
	in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
    in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _cargo VARCHAR(50),
    in _tipo_trabajador VARCHAR(50),
    in _foto BLOB
)
BEGIN
    UPDATE trabajador
    SET cargo = _cargo, tipo_trabajador = _tipo_trabajador
    WHERE id_trabajador = _id_trabajador;
    
    UPDATE personal
    SET sueldo = _sueldo, fecha_contrato = _fecha_contrato
    WHERE id_personal = _id_trabajador;
    
    UPDATE usuario
    SET nombre=_nombre, apellido_paterno=_apellido_paterno, apellido_materno=_apellido_materno,
    correo_electronico=_correo_electronico,contrasenha=_contrasenha,fecha_Creacion=_fecha_Creacion,foto=_foto
    WHERE id_usuario= _id_trabajador;
END$

DELIMITER $
CREATE PROCEDURE actualizar_superusuario(
	in _id_superusuario INT,
    in _nombre VARCHAR(100),
    in _apellido_paterno VARCHAR(100),
    in _apellido_materno VARCHAR(100),
    in _correo_electronico VARCHAR(100),
    in _contrasenha VARCHAR(50),
    in _fecha_Creacion DATE,
	in _sueldo DOUBLE,
    in _fecha_contrato DATE,
    in _cargo VARCHAR(50),
    in _area_administrativa VARCHAR(50),
    in _foto BLOB
)
BEGIN
    UPDATE superusuario
    SET cargo = _cargo, area_administrativa = _area_administrativa
    WHERE id_superusuario = _id_superusuario;
    
    UPDATE personal
    SET sueldo = _sueldo, fecha_contrato = _fecha_contrato
    WHERE id_personal = _id_superusuario;
    
    UPDATE usuario
    SET nombre=_nombre, apellido_paterno=_apellido_paterno, apellido_materno=_apellido_materno,
    correo_electronico=_correo_electronico,contrasenha=_contrasenha,fecha_Creacion=_fecha_Creacion,foto=_foto
    WHERE id_usuario= _id_superusuario;
END$

DELIMITER $
CREATE PROCEDURE eliminar_docente(
	IN _id_docente INT
)
BEGIN
	UPDATE usuario
    SET activo=false
    WHERE id_usuario= _id_docente;
END$

DELIMITER $
CREATE PROCEDURE eliminar_trabajador(
	IN _id_trabajador INT
)
BEGIN
	UPDATE usuario
    SET activo=false
    WHERE id_usuario= _id_trabajador;
END$

DELIMITER $
CREATE PROCEDURE eliminar_superusuario(
	IN _id_superusuario INT
)
BEGIN
	UPDATE usuario
    SET activo=false
    WHERE id_usuario= _id_superusuario;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_APODERADO(
	OUT _id_apoderado INT,
    IN _nombre VARCHAR(100),
    IN _apellido_paterno VARCHAR(100),
	IN _apellido_materno VARCHAR(100),
    IN _correo_electronico VARCHAR(100),
    IN _contrasenha VARCHAR(50),
    IN _fecha_creacion DATE,
    IN _activo BOOl,
    IN _ocupacion VARCHAR(30),
    IN _telefono VARCHAR(9),
    IN _direccion VARCHAR(100),
    IN _relacion_alumno VARCHAR(10),
    IN _foto BLOB
)
BEGIN
	INSERT INTO usuario
    (nombre,apellido_paterno,apellido_materno,correo_electronico,contrasenha,fecha_Creacion,activo,foto)
    VALUES(_nombre,_apellido_paterno,_apellido_materno,_correo_electronico,_contrasenha,_fecha_creacion,1,_foto);
    SET _id_apoderado = @@last_insert_id;
    INSERT INTO apoderado(id_apoderado,ocupacion,telefono,direccion,relacion_alumno)
    VALUES(_id_apoderado,_ocupacion,_telefono,_direccion,_relacion_alumno);
END$
DELIMITER $
CREATE PROCEDURE INSERTAR_ALUMNO(
    OUT _id_alumno INT,
    IN _nombre VARCHAR(100),
    IN _apellido_paterno VARCHAR(100),
    IN _apellido_materno VARCHAR(100),
    IN _correo_electronico VARCHAR(100),
    IN _contrasenha VARCHAR(50),
    IN _fecha_creacion DATE,
    IN _activo BOOl,
    IN _fecha_nacimiento VARCHAR(30),
    IN _genero CHAR,
    IN _direccion VARCHAR(100),
    IN _grado_actual TINYINT,
    IN _nivel_actual TINYINT,
    IN _foto BLOB
)
BEGIN
    INSERT INTO usuario
    (nombre,apellido_paterno,apellido_materno,correo_electronico,contrasenha,fecha_Creacion,activo,foto)
    VALUES(_nombre,_apellido_paterno,_apellido_materno,_correo_electronico,_contrasenha,_fecha_creacion,1,_foto);
    SET _id_alumno = @@last_insert_id;
    INSERT INTO alumno(id_alumno,fecha_nacimiento,genero,grado_actual,nivel_actual, tieneSalon)
    VALUES(_id_alumno,_fecha_nacimiento,_genero,_grado_actual,_nivel_actual, false);
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_AULA(
    out _idAula INT,
    IN _grado TINYINT,
    IN _seccion CHAR,
    IN _nivel TINYINT,
    IN _tutor INT,
    IN _anho_escolar INT,
    IN _estado INT,
    IN _fotoAula LONGBLOB,
    IN _fotoHorario LONGBLOB
)
BEGIN
    SET _idAula = @@last_insert_id;
    INSERT INTO aula
    (idAula,grado,seccion,nivel,tutor,anho_escolar, estado, fotoAula, fotoHorario)
    VALUES(_idAula,_grado,_seccion,_nivel,_tutor,_anho_escolar, _estado, _fotoAula, _fotoHorario);
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_APODERADO(
	IN _id_apoderado INT
)
BEGIN
	UPDATE usuario
    SET activo = false
    WHERE id_usuario = _id_apoderado;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_ALUMNO(
	IN _id_alumno INT
)
BEGIN
	UPDATE usuario
    SET activo = false
    WHERE id_usuario = _id_alumno;
END$

DELIMITER $
CREATE PROCEDURE ELIMINAR_AULA(
	IN _grado TINYINT,
    IN _seccion CHAR,
    IN _nivel TINYINT
)
BEGIN
	UPDATE aula
    SET estado = 0
    WHERE grado = _grado AND seccion = _seccion AND nivel = _nivel;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_APODERADOS(
)
BEGIN
	SELECT * 
    FROM usuario
    INNER JOIN apoderado
    ON usuario.id_usuario = apoderado.id_apoderado
    WHERE activo=true; 
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ALUMNOS(
)
BEGIN
	SELECT *
    FROM usuario
    INNER JOIN alumno
    ON usuario.id_usuario = alumno.id_alumno
    WHERE activo=true; 
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_USUARIO(
	IN _id_usuario INT,
	IN _correo_electronico VARCHAR(100),
    IN _contrasenha VARCHAR(50),
    IN _foto BLOB
)
BEGIN
	UPDATE usuario 
    SET contrasenha = _contrasenha, correo_electronico = _correo_electronico, foto=_foto
    WHERE id_usuario = _id_usuario;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_AULAS(
)
BEGIN
	select * from aula where estado=1;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_APODERADO(
	IN _id_apoderado INT,
    IN _nombre VARCHAR(100),
    IN _apellido_paterno VARCHAR(100),
	IN _apellido_materno VARCHAR(100),
    IN _correo_electronico VARCHAR(100),
    IN _contrasenha VARCHAR(50),
    IN _activo BOOl,
    IN _ocupacion VARCHAR(30),
    IN _telefono VARCHAR(9),
    IN _direccion VARCHAR(100),
    IN _relacion_alumno VARCHAR(10),
    IN _foto BLOB
)
BEGIN
	UPDATE usuario
    SET nombre=_nombre, apellido_paterno=_apellido_paterno, apellido_materno=_apellido_materno,
    correo_electronico=_correo_electronico,contrasenha=_contrasenha,activo=_activo,foto=_foto
    WHERE id_usuario= _id_apoderado;
    
	UPDATE apoderado 
    SET ocupacion = _ocupacion , telefono = _telefono , direccion = _direccion , relacion_alumno = _relacion_alumno
    WHERE id_apoderado = _id_apoderado;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_ALUMNO(
	IN _id_usuario INT,
    IN _nombre VARCHAR(100),
    IN _apellido_paterno VARCHAR(100),
	IN _apellido_materno VARCHAR(100),
	IN _correo_electronico VARCHAR(100),
    IN _contrasenha VARCHAR(50),
    IN _genero CHAR,
    IN _direccion VARCHAR(100),
    IN _grado_actual TINYINT,
    IN _nivel_actual TINYINT,
    in _fecha_nacimiento DATE,
    IN _foto BLOB
)
BEGIN
    UPDATE usuario
    SET nombre=_nombre, apellido_paterno=_apellido_paterno, apellido_materno=_apellido_materno,
    correo_electronico=_correo_electronico,contrasenha=_contrasenha,foto=_foto
    WHERE id_usuario= _id_usuario;
    
	UPDATE alumno 
    SET genero = _genero, grado_actual = _grado_actual, nivel_actual = _nivel_actual, direccion = _direccion, fecha_nacimiento = _fecha_nacimiento
    WHERE id_alumno = _id_usuario;
END$

DELIMITER $
CREATE PROCEDURE MODIFICAR_AULA(
    IN _grado TINYINT,
    IN _seccion CHAR,
    IN _nivel TINYINT,
    IN _tutor INT,
    IN _anho_escolar INT,
    IN _fotoAula LONGBLOB,
    IN _fotoHorario LONGBLOB
)
BEGIN
    UPDATE aula 
    SET tutor = _tutor,
    anho_escolar = _anho_escolar,
    fotoAula = _fotoAula,
    fotoHorario = _fotoHorario
    WHERE grado = _grado AND _seccion = seccion AND _nivel = nivel;
END$


INSERT INTO usuario (nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo)
VALUES ('Juan', 'Pérez', 'García', 'juan.perez@example.com', 'contraseña123', NOW(), 1);

INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1, 2000.00, '2024-04-25');

INSERT INTO docente (especialidad, tipo_docente) VALUES ('Matemáticas', 'Tiempo Completo');


######################################### PROCEDURES ###########################################
# INSERTAR
##CURSO
DELIMITER //
CREATE PROCEDURE InsertarCurso(
    OUT p_idCurso INT,
    IN p_nombreCurso VARCHAR(255),
    IN p_Descripcion VARCHAR(255),
    IN p_Estado VARCHAR(50),
    IN p_fechaCreacion DATE,
    IN p_idDocente INT
)
BEGIN
    INSERT INTO Curso (nombreCurso, Descripcion, Estado, fechaCreacion,idDocente)
    VALUES (p_nombreCurso, p_Descripcion, p_Estado, p_fechaCreacion,p_idDocente);

    -- Obtener el ID del curso recién insertado
    SET p_idCurso = LAST_INSERT_ID();
END //


DELIMITER //
CREATE PROCEDURE InsertarSesionYActividad(
    OUT p_idActividad INT,
    OUT p_idSesion INT,
    IN p_idCurso INT,
    IN p_fechaInicio DATETIME,
    IN p_fechaFin DATETIME,
    IN p_asistencia CHAR(1)
)
BEGIN
    DECLARE v_existeCurso INT;

    -- Verificar si el docente y el curso existen antes de la inserción
    SELECT COUNT(*) INTO v_existeCurso FROM Curso WHERE idCurso = p_idCurso;

    -- Si el docente y el curso existen, insertar en la tabla Actividad y Sesion
    IF v_existeCurso > 0 THEN
        BEGIN
            -- Insertar en la tabla Actividad
            INSERT INTO Actividad (idCurso) VALUES (p_idCurso);

            -- Obtener el ID de la actividad recién insertada
            SET p_idActividad = LAST_INSERT_ID();

            -- Insertar en la tabla Sesion
            INSERT INTO Sesion (idActividad, fechaInicio, fechaFin, asistencia)
            VALUES (p_idActividad, p_fechaInicio, p_fechaFin, p_asistencia);
            
            -- Obtener el ID de la sesión recién insertada
            SET p_idSesion = LAST_INSERT_ID();
            
        END;
    ELSE
        -- Si el docente o el curso no existen, lanzar una excepción
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El docente o el curso no existen.';
    END IF;
END //



DELIMITER //
CREATE PROCEDURE InsertarReunionYActividad(
    OUT p_idActividad INT,
    OUT p_idReunion INT,
    IN p_idCurso INT,
    IN p_lugar VARCHAR(255),
    IN p_asunto VARCHAR(255),
    IN p_descripcion VARCHAR(255),
    IN p_duracionMinutos INT,
    IN p_organizador VARCHAR(255)
)
BEGIN
    DECLARE v_existeCurso INT;

    -- Verificar si el docente y el curso existen antes de la inserción
    SELECT COUNT(*) INTO v_existeCurso FROM Curso WHERE idCurso = p_idCurso;

    -- Si el docente y el curso existen, insertar en la tabla Actividad y Reunion
    IF v_existeCurso > 0 THEN
        BEGIN
            -- Insertar en la tabla Actividad
            INSERT INTO Actividad (idCurso) VALUES (p_idCurso);

            -- Obtener el ID de la actividad recién insertada
            SET p_idActividad = LAST_INSERT_ID();

            -- Insertar en la tabla Reunion
            INSERT INTO Reunion (idActividad, lugar, asunto, descripcion, duracionMinutos, organizador)
            VALUES (p_idActividad, p_lugar, p_asunto, p_descripcion, p_duracionMinutos, p_organizador);
            
            -- Obtener el ID de la actividad recién insertada
            SET p_idReunion = LAST_INSERT_ID();
            
        END;
    ELSE
        -- Si el docente o el curso no existen, lanzar una excepción
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El docente o el curso no existen.';
    END IF;
END //


DELIMITER //
CREATE PROCEDURE InsertarTareaYActividad(
    OUT p_idActividad INT,
    OUT p_idTarea INT,
    IN p_idCurso INT,
    IN p_descripcion VARCHAR(255),
    IN p_fechaRegistro DATETIME,
    IN p_tipoTarea VARCHAR(255),
    IN p_estado VARCHAR(50)
)
BEGIN
    DECLARE v_existeCurso INT;

    -- Verificar si el docente y el curso existen antes de la inserción
    SELECT COUNT(*) INTO v_existeCurso FROM Curso WHERE idCurso = p_idCurso;

    -- Si el docente y el curso existen, insertar en la tabla Actividad y Tarea
    IF v_existeCurso > 0 THEN
        BEGIN
            -- Insertar en la tabla Actividad
            INSERT INTO Actividad (idCurso) VALUES (p_idCurso);

            -- Obtener el ID de la actividad recién insertada
            SET p_idActividad = LAST_INSERT_ID();

            -- Insertar en la tabla Tarea
            INSERT INTO Tarea (idActividad, descripcion, fechaRegistro, tipoTarea, estado)
            VALUES (p_idActividad, p_descripcion, p_fechaRegistro, p_tipoTarea, p_estado);
            
            -- Obtener el ID de la actividad recién insertada
            SET p_idTarea = LAST_INSERT_ID();
            
        END;
    ELSE
        -- Si el docente o el curso no existen, lanzar una excepción
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El docente o el curso no existen.';
    END IF;
END //


DELIMITER //

CREATE PROCEDURE InsertarEvaluacionYActividad(
    OUT p_idActividad INT,
    OUT p_idEvaluacion INT,
    IN p_idCurso INT,
    IN p_tipoEvaluacion VARCHAR(20),
    IN p_puntajeTotal DOUBLE,
    IN p_puntajeObtenido DOUBLE
)
BEGIN
    DECLARE v_existeCurso INT;

    -- Verificar si el docente y el curso existen antes de la inserción
    SELECT COUNT(*) INTO v_existeCurso FROM Curso WHERE idCurso = p_idCurso;

    -- Si el docente y el curso existen, insertar en la tabla Actividad y Evaluacion
    IF v_existeCurso > 0 THEN
        BEGIN
            -- Insertar en la tabla Actividad
            INSERT INTO Actividad (idCurso) VALUES (p_idCurso);

            -- Obtener el ID de la actividad recién insertada
            SET p_idActividad = LAST_INSERT_ID();

            -- Insertar en la tabla Evaluacion
            INSERT INTO Evaluacion (idActividad, tipoEvaluacion, puntajeTotal, puntajeObtenido)
            VALUES (p_idActividad, p_tipoEvaluacion, p_puntajeTotal, p_puntajeObtenido);
            
            -- Obtener el ID de la actividad recién insertada
            SET p_idEvaluacion = LAST_INSERT_ID();
            
        END;
    ELSE
        -- Si el docente o el curso no existen, lanzar una excepción
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El docente o el curso no existen.';
    END IF;
END //

################################################ UPDATES ##########################################

DELIMITER //
CREATE PROCEDURE ActualizarSesionYActividad(
    IN p_idSesion INT,
    IN p_fechaInicio DATETIME,
    IN p_fechaFin DATETIME,
    IN p_asistencia CHAR(1),
    IN p_idActividad INT,
    IN p_idCurso INT
)
BEGIN
    -- Actualizar la tabla Sesion
    UPDATE Sesion
    SET fechaInicio = p_fechaInicio,
        fechaFin = p_fechaFin,
        asistencia = p_asistencia
    WHERE idSesion = p_idSesion;
END //

DELIMITER //
CREATE PROCEDURE ActualizarReunionYActividad(
    IN p_idReunion INT,
    IN p_idActividad INT,
    IN p_lugar VARCHAR(255),
    IN p_asunto VARCHAR(255),
    IN p_descripcion VARCHAR(255),
    IN p_duracionMinutos INT,
    IN p_organizador VARCHAR(255),
    IN p_idCurso INT
)
BEGIN
    -- Actualizar la tabla Reunion
    UPDATE Reunion
    SET lugar = p_lugar,
        asunto = p_asunto,
        descripcion = p_descripcion,
        duracionMinutos = p_duracionMinutos,
        organizador = p_organizador
    WHERE idReunion = p_idReunion;

END //

DELIMITER //

CREATE PROCEDURE ActualizarTareaYActividad(
    IN p_idTarea INT,
    IN p_descripcion VARCHAR(255),
    IN p_fechaRegistro DATETIME,
    IN p_tipoTarea VARCHAR(255),
    IN p_estado VARCHAR(50),
    IN p_idActividad INT,
    IN p_idCurso INT
)
BEGIN
    DECLARE v_existeCurso INT;

    -- Verificar si el docente y el curso existen antes de la actualización
    SELECT COUNT(*) INTO v_existeCurso FROM Curso WHERE idCurso = p_idCurso;

    -- Si el docente y el curso existen, actualizar la tabla Tarea y Actividad
    IF v_existeCurso > 0 THEN
        BEGIN
            -- Actualizar la tabla Tarea
            UPDATE Tarea
            SET descripcion = p_descripcion,
                fechaRegistro = p_fechaRegistro,
                tipoTarea = p_tipoTarea,
                estado = p_estado
            WHERE idTarea = p_idTarea;

        END;
    ELSE
        -- Si el docente o el curso no existen, lanzar una excepción
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El docente o el curso no existen.';
    END IF;
END //


DELIMITER //
CREATE PROCEDURE ActualizarEvaluacionYActividad(
	IN p_idEvaluacion INT,
    IN p_tipoEvaluacion VARCHAR(20),
    IN p_puntajeTotal DOUBLE,
    IN p_puntajeObtenido DOUBLE,
    IN p_idActividad INT,
    IN p_idCurso INT
)
BEGIN
    -- Actualizar la tabla Evaluacion
    UPDATE Evaluacion
    SET tipoEvaluacion = p_tipoEvaluacion,
        puntajeTotal = p_puntajeTotal,
        puntajeObtenido = p_puntajeObtenido
    WHERE idEvaluacion = p_idEvaluacion;

END //

DELIMITER //
CREATE PROCEDURE ActualizarCurso(
    IN p_idCurso INT,
    IN p_nombreCurso VARCHAR(255),
    IN p_Descripcion VARCHAR(255),
    IN p_Estado VARCHAR(50),
    IN p_fechaCreacion DATE
)
BEGIN
    UPDATE Curso
    SET nombreCurso = p_nombreCurso,
        Descripcion = p_Descripcion,
        Estado = p_Estado,
        fechaCreacion = p_fechaCreacion
    WHERE idCurso = p_idCurso;
END //
DELIMITER //
CREATE PROCEDURE LISTAR_CURSO(
)
BEGIN
	SELECT * 
    FROM Curso
    WHERE Estado="Activo";
END //

DELIMITER //
CREATE PROCEDURE LISTAR_SESION()
BEGIN
    SELECT Sesion.idSesion, Sesion.idActividad, Sesion.fechaInicio, Sesion.fechaFin, Sesion.asistencia
		, Actividad.idCurso AS idCursoActividad
    FROM Sesion
    INNER JOIN Actividad ON Sesion.idActividad = Actividad.idActividad; 
END //

DELIMITER //
CREATE PROCEDURE LISTAR_REUNION()
BEGIN
    SELECT Reunion.idReunion, Reunion.idActividad, Reunion.lugar, Reunion.asunto, Reunion.descripcion, Reunion.duracionMinutos, Reunion.organizador,
		Actividad.idCurso AS idCursoActividad
    FROM Reunion
    INNER JOIN Actividad ON Reunion.idActividad = Actividad.idActividad; 
END //

DELIMITER //
CREATE PROCEDURE LISTAR_TAREA()
BEGIN
    SELECT Tarea.idTarea, Tarea.idActividad, Tarea.descripcion, Tarea.fechaRegistro, Tarea.tipoTarea, Tarea.estado,
            Actividad.idCurso AS idCursoActividad
    FROM Tarea
    INNER JOIN Actividad ON Tarea.idActividad = Actividad.idActividad; 
END //

DELIMITER //
CREATE PROCEDURE LISTAR_EVALUACION()
BEGIN
    SELECT Evaluacion.idEvaluacion, Evaluacion.idActividad, Evaluacion.tipoEvaluacion, 
           Evaluacion.puntajeTotal, Evaluacion.puntajeObtenido,
			Actividad.idCurso AS idCursoActividad
    FROM Evaluacion
    INNER JOIN Actividad ON Evaluacion.idActividad = Actividad.idActividad; 
END //

-- Insertar un curso con valores específicos
INSERT INTO Curso (nombreCurso, Descripcion, Estado, fechaCreacion) 
VALUES ('Matemáticas Avanzadas', 'Curso sobre temas avanzados de matemáticas', 'Activo', '2024-04-21');

-- Insertar otro curso con valores específicos
INSERT INTO Curso (nombreCurso, Descripcion, Estado, fechaCreacion) 
VALUES ('Programación en Python', 'Curso introductorio sobre programación en Python', 'Activo', '2024-04-22');

-- Insertar un tercer curso con valores específicos
INSERT INTO Curso (nombreCurso, Descripcion, Estado, fechaCreacion) 
VALUES ('Inglés Básico', 'Curso para principiantes de inglés', 'Activo', '2024-04-23');


DELIMITER #
CREATE PROCEDURE registraMeritoDemerito (
	OUT d_idIncidencia INT,
	IN d_tipo CHAR, 
    IN d_descripcion VARCHAR(500), 
    IN d_fechaRegistro DATETIME,
	IN d_estado tinyint, 
    IN d_docenteRegistro INT, 
    IN d_comentario VARCHAR(500)
)
BEGIN
	INSERT INTO incidencia(descripcion,docenteRegistro,fechaRegistro,tipo,estado) 
		VALUES (d_descripcion,d_docenteRegistro,d_fechaRegistro,d_tipo,d_estado);
    SET d_idIncidencia = @@last_insert_id;
    INSERT INTO merito_demerito(comentario,tipo,idIncidencia) values (d_comentario,d_tipo,d_idIncidencia);	
END #
DELIMITER ;



DELIMITER #
CREATE PROCEDURE registraAtencionMedica (
	OUT d_idIncidencia INT,
	IN d_tipo CHAR, 
    IN d_descripcion VARCHAR(500), 
    IN d_fechaRegistro DATETIME,
	IN d_estado tinyint, 
    IN d_docenteRegistro INT, 
    IN d_tipo_ate VARCHAR(100), 
    IN d_diagnostico VARCHAR(500), 
    IN d_tratamiento VARCHAR(500)
)
BEGIN

    INSERT INTO incidencia(descripcion,docenteRegistro,fechaRegistro,tipo,estado) 
		VALUES (d_descripcion,d_docenteRegistro,d_fechaRegistro,d_tipo,d_estado);
	SET d_idIncidencia = @@last_insert_id;
	INSERT INTO atencion_medica(tipo,idIncidencia,diagnostico,tratamiento,fecha_hora) 
		values (d_tipo_ate,d_idIncidencia,d_diagnostico,d_tratamiento,sysdate());	
END #
DELIMITER ;



DELIMITER #

CREATE PROCEDURE actualizaAtencionMedica (
	IN d_idIncidencia INT,
    IN d_tipo_ate VARCHAR(100), 
    IN d_diagnostico VARCHAR(500), 
    IN d_tratamiento VARCHAR(500)
)
BEGIN
	IF (EXISTS (SELECT * FROM atencion_medica where idIncidencia = d_idIncidencia)) THEN
		UPDATE atencion_medica SET 
			tipo = d_tipo_ate, 	
			diagnostico = d_diagnostico,
			tratamiento = d_tratamiento ,
			fecha_hora = SYSDATE()
			WHERE idIncidencia = d_idIncidencia;
	END IF;
END #
DELIMITER ;



DELIMITER #

CREATE PROCEDURE actualizaMeriDemeri (
	IN d_idIncidencia INT,
    IN d_tipo CHAR, 
    IN d_comentario VARCHAR(500)
)
BEGIN
	IF (EXISTS (SELECT * FROM merito_demerito where idIncidencia = d_idIncidencia)) THEN
		UPDATE merito_demerito SET 
			tipo = d_tipo, 	
			comentario = d_comentario
			WHERE idIncidencia = d_idIncidencia;
	END IF;
END #
DELIMITER ;


DELIMITER //
CREATE PROCEDURE borrarIncidencia (IN d_idIncidencia INT)
BEGIN
    UPDATE incidencia SET estado = 0 WHERE idIncidencia = d_idIncidencia;
END //

DELIMITER //
CREATE PROCEDURE insertarAlumnoAula(IN _idAula INT, IN _idAlumno INT)
BEGIN
	INSERT INTO AulaXAlumno (idAula, idAlumno, activo) VALUES (_idAula, _idAlumno, true);
END//

DELIMITER //
CREATE PROCEDURE modificarAlumnoAula(
	IN _idAula INT,
	IN _idAlumno INT,
    IN _estado BOOL
)
BEGIN
	UPDATE AlumnoXIncidencia SET 
			idAula = _idAula, 	
			idAlumno = _idAlumno,
            activo = _estado;
END//


DELIMITER //
CREATE PROCEDURE listarAlumnoAula(
	IN _idAula INT
)
BEGIN
	select * from AulaXAlumno where activo=1 and idAula=_idAula;
END//


DELIMITER //
CREATE PROCEDURE insertarApoderadoAlumno(IN _idApoderado INT, IN _idAlumno INT)
BEGIN
	INSERT INTO ApoderadoXAlumno (idApoderado, idAlumno,activo) VALUES (_idApoderado, _idAlumno, true);
END//

DELIMITER //
CREATE PROCEDURE modificarApoderadoAlumno(
	IN _idApoderado INT,
	IN _idAlumno INT,
    IN _estado BOOL
)
BEGIN
	UPDATE AlumnoXIncidencia SET 
			idApoderado = _idApoderado, 	
			idAlumno = _idAlumno,
            activo = _estado;
END//

    
DELIMITER //
CREATE PROCEDURE insertarDocenteActividad(IN _idDocente INT, IN _idActividad INT)
BEGIN
	INSERT INTO DocenteXActividad (idDocente, idActividad, activo) VALUES (_idDocente, _idActividad, true);
END//
select * from DocenteXActividad;



#drop procedure modificarDocenteActividad;
DELIMITER //
CREATE PROCEDURE modificarDocenteActividad(IN _idDocente INT, IN _idActividad INT, IN _estado BOOL)
BEGIN
    UPDATE DocenteXActividad
    SET idActividad = _idActividad,
        activo = _estado
    WHERE idDocente = _idDocente;
END //

DELIMITER $
CREATE PROCEDURE insertarIncidenciaAlumno(
	IN _idIncidencia INT,
	IN _idAlumno INT 
)
BEGIN
	INSERT INTO AlumnoXIncidencia (idAlumno, idIncidencia,activo) VALUES (_idAlumno, _idIncidencia,true);
END$

DELIMITER //
CREATE PROCEDURE modificarIncidenciaAlumno(
	IN _idAlumno INT, 
    IN _idIncidencia INT)
BEGIN
    UPDATE AlumnoXIncidencia
    SET idAlumno = _idAlumno
    WHERE idIncidencia = _idIncidencia;
END //



DELIMITER //
CREATE PROCEDURE eliminarIncidenciaAlumno(
	IN _idIncidencia INT)
BEGIN
    UPDATE AlumnoXIncidencia
    SET activo = false
    WHERE idIncidencia = _idIncidencia;
END //

DELIMITER $
CREATE PROCEDURE insertarActividadAlumno(
	IN _idActividad INT,
	IN _idAlumno INT 
)
BEGIN
	INSERT INTO AlumnoXActividad (idAlumno, idActividad,activo) VALUES (_idAlumno, _idActividad,true);
END$

DELIMITER //
CREATE PROCEDURE modificarActividadAlumnoPrimeraParte(
	IN _idActividad INT
)
BEGIN
	UPDATE AlumnoXActividad
	SET activo = false
	WHERE idActividad = _idActividad;
END //

DELIMITER //
CREATE PROCEDURE modificarActividadAlumnoSegundaParte(
	IN _idAlumno INT, 
    IN _idActividad INT)
BEGIN
	DECLARE alumnoNuevo INT;
    SELECT COUNT(*) INTO alumnoNuevo FROM AlumnoXActividad WHERE idAlumno = _idAlumno;
    IF alumnoNuevo = 0 THEN
        BEGIN
            INSERT INTO AlumnoXActividad (idAlumno, idActividad,activo) VALUES (_idAlumno, _idActividad,true);
        END;
    ELSE
		UPDATE AlumnoXActividad
		SET activo=true
		WHERE idAlumno = _idAlumno;
    END IF;
END //

DELIMITER //
CREATE PROCEDURE eliminarActividadAlumno(
	IN _idActividad INT
)
BEGIN
	
	UPDATE AlumnoXActividad
    SET activo = false
    WHERE idActividad = _idActividad;
END //

-- PROCEDURES de publicacion
DELIMITER $
CREATE PROCEDURE insertarPublicacion(
	OUT _idPublicacion INT,
	IN _titulo VARCHAR(100),
    IN _descripcion VARCHAR(100),
    IN _activo BOOL,
    IN _idUsuario INT,
    IN _fecha DATE,
    IN _fotoPrincipal LONGBLOB,
    IN _fotoDescripcion LONGBLOB
)
BEGIN
	DECLARE last_insert_id INT;
	INSERT INTO Publicaciones (titulo, descripcion, activo, id_usuario, fecha, fotoPrincipal, fotoDescripcion) 
    VALUES (_titulo, _descripcion,_activo,_idUsuario,_fecha, _fotoPrincipal, _fotoDescripcion);
    #SELECT LAST_INSERT_ID() INTO last_insert_id;
    #SET _idPublicacion = last_insert_id;
    #IF fotoPrincipal IS NOT NULL THEN
	#	INSERT INTO Fotos (idPublicacion, tipoFoto, foto) VALUES (last_insert_id, 'PRINCIPAL', fotoPrincipal);
	#END IF;
    #IF fotoDescripcion IS NOT NULL THEN
	#	INSERT INTO Fotos (idPublicacion, tipoFoto, foto) VALUES (last_insert_id, 'DESCRIPCION', fotoDescripcion);
    #END IF;
END$

DELIMITER $
CREATE PROCEDURE modificarPublicacion(
	IN _idPublicacion INT,
	IN _titulo VARCHAR(100),
    IN _descripcion VARCHAR(100),
    IN _activo BOOL,
    IN _idUsuario INT,
    IN _fecha DATE,
    IN _fotoPrincipal LONGBLOB,
    IN _fotoDescripcion LONGBLOB
)
BEGIN
	UPDATE Publicaciones SET
		titulo = _titulo, descripcion=_descripcion, activo=_activo, id_usuario=_idUsuario, fecha = _fecha,
        fotoPrincipal=_fotoPrincipal, fotoDescripcion=_fotoDescripcion
	WHERE idPublicacion = _idPublicacion;
    
    #IF fotoPrincipal IS NOT NULL THEN
	#	UPDATE Fotos SET
	#		foto=fotoPrincipal
	#	WHERE idPublicacion = _idPublicacion;
	#END IF;
    #IF fotoDescripcion IS NOT NULL THEN
	#	UPDATE Fotos SET
	#		foto=fotoDescripcion
	#	WHERE idPublicacion = _idPublicacion;
	#END IF;
END$

#drop procedure listarPublicacion;
DELIMITER $
CREATE PROCEDURE listarPublicacion(
)
BEGIN
	SELECT * FROM Publicaciones WHERE activo = true;

END$

DELIMITER $
CREATE PROCEDURE eliminarPublicacion(
	IN _idPublicacion INT
)
BEGIN
	UPDATE Publicaciones SET activo = false WHERE idPublicacion = _idPublicacion;

END$


DELIMITER $
CREATE PROCEDURE obtenerUsuarioPorID(
	IN _idUsuario INT
)
BEGIN
	SELECT * FROM usuario WHERE id_usuario = _idUsuario;
END$
/*
DELIMITER $
CREATE PROCEDURE obtenerUsuarioPorID(
	IN _idUsuario INT,
    IN _tipoUsuario VARCHAR(20)
)
BEGIN
	IF _tipoUsuario ='apoderado' THEN
		SELECT * 
		FROM usuario
		INNER JOIN apoderado
		ON usuario.id_usuario = apoderado.id_apoderado
		WHERE activo=true
        AND usuario.id_usuario=_idUsuario; 
    END IF;

    IF _tipoUsuario ='alumno' THEN
		SELECT *
		FROM usuario
		INNER JOIN alumno
		ON usuario.id_usuario = alumno.id_alumno
		WHERE activo=true
		AND usuario.id_usuario=_idUsuario; 
    END IF;

    IF _tipoUsuario ='docente' THEN
		SELECT * FROM docente
		INNER JOIN personal on docente.id_docente=personal.id_personal
		INNER JOIN usuario on personal.id_personal=usuario.id_usuario
		WHERE activo=true
		AND usuario.id_usuario=_idUsuario; 
    END IF;

    IF _tipoUsuario ='trabajador' THEN
		SELECT * FROM trabajador
		INNER JOIN personal on trabajador.id_trabajador=personal.id_personal
		INNER JOIN usuario on personal.id_personal=usuario.id_usuario
		WHERE activo=true
		AND usuario.id_usuario=_idUsuario; 
    END IF;

    IF _tipoUsuario ='superusuario' THEN
		SELECT * FROM superusuario
		INNER JOIN personal on superusuario.id_superusuario=personal.id_personal
		INNER JOIN usuario on personal.id_personal=usuario.id_usuario
		WHERE activo=true
		AND usuario.id_usuario=_idUsuario; 
    END IF;
END$*/

DELIMITER //
CREATE PROCEDURE obtenerUsuarioPorCE(
	out _tipo_usuario varchar(20),
	in _correo varchar(100)
)
BEGIN
	DECLARE tipo_usuario int;
    
	SELECT COUNT(*) INTO tipo_usuario FROM apoderado a, usuario u WHERE u.id_usuario = a.id_apoderado and u.correo_electronico=_correo;
    IF tipo_usuario > 0 THEN
		set _tipo_usuario='apoderado';
        SELECT id_usuario, correo_electronico, contrasenha FROM usuario WHERE correo_electronico=_correo;
    END IF;

    SELECT COUNT(*) INTO tipo_usuario FROM alumno a, usuario u WHERE u.id_usuario = a.id_alumno and u.correo_electronico=_correo;
    IF tipo_usuario > 0 THEN
		set _tipo_usuario='alumno';
        SELECT id_usuario, correo_electronico, contrasenha FROM usuario WHERE correo_electronico=_correo;
    END IF;

    SELECT COUNT(*) INTO tipo_usuario FROM docente d, usuario u WHERE u.id_usuario = d.id_docente and u.correo_electronico=_correo;
    IF tipo_usuario > 0 THEN
		set _tipo_usuario='docente';
        SELECT id_usuario, correo_electronico, contrasenha FROM usuario WHERE correo_electronico=_correo;
    END IF;

    SELECT COUNT(*) INTO tipo_usuario FROM trabajador t, usuario u WHERE u.id_usuario = t.id_trabajador and u.correo_electronico=_correo;
    IF tipo_usuario > 0 THEN
		set _tipo_usuario='trabajador';
        SELECT id_usuario, correo_electronico, contrasenha FROM usuario WHERE correo_electronico=_correo;
    END IF;

    SELECT COUNT(*) INTO tipo_usuario FROM superusuario s, usuario u WHERE u.id_usuario = s.id_superusuario and u.correo_electronico=_correo;
    IF tipo_usuario > 0 THEN
		set _tipo_usuario='superusuario';
        SELECT id_usuario, correo_electronico, contrasenha FROM usuario WHERE correo_electronico=_correo;
    END IF;
END//


DELIMITER //
CREATE PROCEDURE ConsultarAtencionMedica()
BEGIN
    SELECT 
        i.idIncidencia,
        i.descripcion AS descripcion_incidencia,
        i.docenteRegistro,
        i.fechaRegistro AS fecha_registro_incidencia,
        i.tipo AS tipo_incidencia,
        i.estado AS estado_incidencia,
        am.codigo AS codigo_atencion_medica,
        am.tipo AS tipo_atencion_medica,
        am.diagnostico,
        am.tratamiento
    FROM 
        incidencia i
    INNER JOIN 
        atencion_medica am ON i.idIncidencia = am.idIncidencia WHERE i.estado= 1;
END //



DELIMITER //
CREATE PROCEDURE ConsultarMerito(
)
BEGIN
    SELECT *
	FROM merito_demerito md
	INNER JOIN incidencia i ON md.idIncidencia = i.idIncidencia AND md.tipo = 'M' WHERE i.estado = 1;
END //


DELIMITER //
CREATE PROCEDURE ConsultarDemerito(
)
BEGIN
    SELECT *
	FROM merito_demerito md
	INNER JOIN incidencia i ON md.idIncidencia = i.idIncidencia AND md.tipo = "D" WHERE i.estado = 1;
END //


DROP PROCEDURE IF exists LISTAR_NOTAS_ID;

DELIMITER $
CREATE PROCEDURE LISTAR_NOTAS_ID(
    IN _id_alumno INT
)
BEGIN
    SELECT cur.nombreCurso AS CURSO, ev.tipoEvaluacion AS CRITERIO, ev.puntajeObtenido AS NOTA 
        FROM Evaluacion ev
        INNER JOIN Actividad ac ON ev.idActividad = ac.idActividad
        INNER JOIN Curso cur ON cur.idCurso = ac.idCurso
        INNER JOIN AlumnoXActividad alxac ON ac.idActividad = alxac.idActividad
        INNER JOIN alumno al ON al.id_alumno = alxac.idAlumno
        WHERE al.id_alumno = _id_alumno;

END $

DELIMITER $
CREATE PROCEDURE OBTENER_AULA_ID_ALUMNO(
    IN _id_alumno INT
)
BEGIN
    SELECT a.idAula, grado, seccion, nivel, tutor, estado, fotoAula, fotoHorario
        FROM aula a
        INNER JOIN AulaXAlumno ax ON a.idAula = ax.idAula
        WHERE ax.idAlumno = _id_alumno;
END $

DELIMITER //
CREATE PROCEDURE OBTENER_SESION_CURSOXDOCENTE(
    IN p_idDocente INT
)
BEGIN
    SELECT Sesion.fechaInicio, Sesion.fechaFin, Curso.nombreCurso
			FROM Sesion
			INNER JOIN Actividad ON Sesion.idActividad = Actividad.idActividad
			INNER JOIN Curso ON Actividad.idCurso = Curso.idCurso
			INNER JOIN docente ON docente.id_docente = Curso.idDocente
			where docente.id_docente = p_idDocente;
END //

DELIMITER $
CREATE PROCEDURE LISTAR_ALUMNOS_APODERADO(
    IN idApoderado INT
)
BEGIN
    SELECT AA.idAlumno, U.nombre, U.apellido_paterno, U.apellido_materno FROM ApoderadoXAlumno AA
        INNER JOIN apoderado A ON A.id_apoderado = AA.idApoderado
        INNER JOIN usuario U ON U.id_usuario = AA.idAlumno
        WHERE A.id_apoderado = idApoderado AND AA.activo = 1;
END$

DELIMITER $
CREATE PROCEDURE INSERTAR_ALUMNO_X_AULA(
    IN _idAula INT,
    IN _idAlumno INT,
    IN _grado INT,
    IN _nivel INT
)
BEGIN
    INSERT INTO AulaXAlumno(idAula, idAlumno, activo) 
        VALUES(_idAula, _idAlumno, true);
    UPDATE alumno
    SET grado_actual = _grado,nivel_actual=_nivel,tieneSalon=true
    WHERE id_alumno = _idAlumno;
END$

DELIMITER $
CREATE PROCEDURE LISTAR_ALUMNOS_SIN_SALON(
)
BEGIN
    SELECT *
    FROM usuario
    INNER JOIN alumno
    ON usuario.id_usuario = alumno.id_alumno
    WHERE activo=true AND tieneSalon = false;
END$

DELIMITER $
CREATE PROCEDURE listadoAula (
    IN _idAula INT
)
BEGIN
    SELECT * 
    FROM (
        SELECT * 
        FROM alumno 
        INNER JOIN AulaXAlumno
        ON id_alumno = idAlumno
        WHERE activo = true
    ) AS temp
    INNER JOIN usuario
    ON id_alumno = id_usuario
    WHERE usuario.activo = true AND idAula = _idAula;
END$

DELIMITER $
CREATE PROCEDURE restaurarAula (
    IN _idAula INT
)
BEGIN
    DELETE FROM AulaXAlumno
    WHERE idAula = _idAula;
END$

DELIMITER $
CREATE TRIGGER alumnoQuitarSalon
AFTER DELETE ON AulaXAlumno
FOR EACH ROW
BEGIN
    UPDATE alumno
    SET tieneSalon = false
    WHERE id_alumno = OLD.idAlumno;
END$

DELIMITER //
CREATE PROCEDURE ObtenerAlumnoPorIncidencia(
	IN _idIncidencia INT
)
BEGIN
    SELECT u.id_usuario, u.nombre, u.apellido_paterno, u.apellido_materno, u.correo_electronico
    FROM usuario u
    INNER JOIN AlumnoXIncidencia axi ON u.id_usuario = axi.idAlumno
    WHERE axi.idIncidencia = _idIncidencia AND axi.activo = TRUE;
END //

DELIMITER $
CREATE PROCEDURE ObtenerAulaxAlumnoID(
	IN _idUsuario INT
)
BEGIN
	SELECT A.grado,A.seccion,A.nivel 
    FROM aula A,AulaXAlumno U 
    WHERE U.idAula=A.idAula AND U.idAlumno = _idUsuario;
END$
DELIMITER $
CREATE PROCEDURE listarTareasXAlumnoId(
	IN _idUsuario INT
)
BEGIN
	SELECT T.descripcion,T.fechaRegistro,T.tipoTarea,T.estado
    FROM AlumnoXActividad A,Tarea T 
    WHERE A.idActividad=T.idActividad AND A.idAlumno = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarTareasXDocenteId(
	IN _idUsuario INT
)
BEGIN
	SELECT T.descripcion,T.fechaRegistro,T.tipoTarea,T.estado
    FROM DocenteXActividad D,Tarea T 
    WHERE D.idActividad=T.idActividad AND D.idDocente = _idUsuario;
END$
DELIMITER $
CREATE PROCEDURE listarEvaluacionesXAlumnoId(
	IN _idUsuario INT
)
BEGIN
	SELECT E.puntajeObtenido,E.puntajeTotal,E.tipoEvaluacion
    FROM AlumnoXActividad A,Evaluacion E 
    WHERE A.idActividad=E.idActividad AND A.idAlumno = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarEvaluacionesXDocenteId(
	IN _idUsuario INT
)
BEGIN
	SELECT E.puntajeObtenido,E.puntajeTotal,E.tipoEvaluacion
    FROM  DocenteXActividad D,Evaluacion E 
    WHERE D.idActividad=E.idActividad AND D.idDocente = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarReunionesXAlumnoId(
	IN _idUsuario INT
)
BEGIN
	SELECT R.asunto,R.descripcion,R.duracionMinutos,R.lugar,R.organizador
    FROM AlumnoXActividad A,Reunion R 
    WHERE A.idActividad=R.idActividad AND A.idAlumno = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarReunionesXDocenteId(
	IN _idUsuario INT
)
BEGIN
	SELECT R.asunto,R.descripcion,R.duracionMinutos,R.lugar,R.organizador
    FROM DocenteXActividad D,Reunion R 
    WHERE D.idActividad=R.idActividad AND D.idDocente = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarSesionesXAlumnoId(
    IN _idUsuario INT
)
BEGIN
    SELECT S.fechaInicio, S.fechaFin, S.asistencia
    FROM AlumnoXActividad A
    INNER JOIN Sesion S ON A.idActividad = S.idActividad
    WHERE A.idAlumno = _idUsuario;
END$

DELIMITER $
CREATE PROCEDURE listarSesionesXDocenteId(
	IN _idUsuario INT
)
BEGIN
	SELECT S.fechaInicio, S.fechaFin, S.asistencia
    FROM DocenteXActividad Dk
    INNER JOIN Sesion S ON D.idActividad = S.idActividad
    WHERE D.idAlumno = _idUsuario;
END$

call InsertarSesionYActividad(@idActividad, @idSesion,1,'2024-06-24','2024-06-25','A');
call InsertarSesionYActividad(@idActividad, @idSesion,1,'2024-06-17','2024-06-17','A');
call InsertarSesionYActividad(@idActividad, @idSesion,2,'2024-06-18','2024-06-17','A');
call InsertarSesionYActividad(@idActividad, @idSesion,2,'2024-05-19','2024-05-20','A');
call InsertarSesionYActividad(@idActividad, @idSesion,3,'2024-05-20','2024-05-20','A');
call InsertarSesionYActividad(@idActividad, @idSesion,3,'2024-06-21','2024-06-24','A');

call InsertarSesionYActividad(@idActividad, @idSesion,1,'2024-06-24','2024-06-25','A');
call InsertarSesionYActividad(@idActividad, @idSesion,1,'2024-06-17','2024-06-17','A');
call InsertarSesionYActividad(@idActividad, @idSesion,2,'2024-06-18','2024-06-17','A');
call InsertarSesionYActividad(@idActividad, @idSesion,2,'2024-05-19','2024-05-20','A');
call InsertarSesionYActividad(@idActividad, @idSesion,3,'2024-05-20','2024-05-20','A');
call InsertarSesionYActividad(@idActividad, @idSesion,3,'2024-06-21','2024-06-24','A');


call insertarActividadAlumno(16,1000);
call insertarActividadAlumno(15,1000);
call insertarActividadAlumno(17,1000);
call insertarActividadAlumno(18,1000);
call insertarActividadAlumno(19,1000);
call insertarActividadAlumno(20,1000);
call insertarActividadAlumno(21,1000);
call insertarActividadAlumno(22,1000);
call insertarActividadAlumno(23,1000);
call insertarActividadAlumno(24,1000);


DELIMITER $
CREATE PROCEDURE obtenerCursoXId(
	IN _idCurso INT
)
BEGIN
	SELECT * FROM Curso WHERE idCurso = _idCurso;
END$



-- Insertar en la tabla usuario
CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Juan',
    'Perez',
    'López',
    'juan.perez@example.com',
    '123',
    '2024-01-01',
    TRUE,
    '2010-04-01',
    'M',
    'calle',
    2,
    2,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'María',
    'Perez',
    'Lopez',
    'maria.gonzalez@example.com',
    '123',
    '2024-06-10',
    TRUE,
    '2010-04-01',
    'M',
    'Calle 123',
    2,
    2,
    NULL
);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1002, 'Pedro', 'Rodríguez', 'Martínez', 'pedro.rodriguez@example.com', '123', '2024-03-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1003, 'Carlos', 'Durán', 'García', 'carlos.duran@example.com', '123', '2024-01-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1004, 'Carla', 'Velasquez', 'López', 'carla.velasquez@example.com', '123', '2024-02-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1005, 'Pedro', 'García', 'Martínez', 'pedro.garcia@example.com', '123', '2024-03-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1006, 'Martin', 'Buendía', 'García', 'martin.buendia@example.com', '123', '2024-01-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1007, 'Carmen', 'Gutierrez', 'López', 'carmen.gutierrez@example.com', '123', '2024-02-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1008, 'David', 'Velarde', 'Martínez', 'david.velarde@example.com', '123', '2024-03-01', true);
INSERT INTO usuario (id_usuario, nombre, apellido_paterno, apellido_materno, correo_electronico, contrasenha, fecha_Creacion, activo) VALUES (1009, 'Jorge', 'Chavez', 'Rodriguez', 'jorge.chavez@example.com', '123', '2024-03-01', true);

-- Insertar en la tabla personal
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1004, 3000.00, '2024-03-10');
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1005, 3000.00, '2024-03-10');
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1006, 3000.00, '2024-03-10');
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1007, 3000.00, '2024-03-10');
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1008, 3000.00, '2024-03-10');
INSERT INTO personal (id_personal, sueldo, fecha_contrato) VALUES (1009, 3000.00, '2024-03-10');

-- Insertar en la tabla alumnos utilizando los id_personal generados

INSERT INTO apoderado(id_apoderado,ocupacion,telefono,direccion,relacion_alumno) values (1002,"Ingeniero","994064776","Av. 123","Padre");
INSERT INTO apoderado(id_apoderado,ocupacion,telefono,direccion,relacion_alumno) values (1003,"Arquitecto","994064777","Av. 321","Tutor");

-- Insertar en la tabla docente utilizando los id_personal generados
INSERT INTO docente (id_docente, especialidad, tipo_docente) VALUES (1004, 'Historia', 'TiempoCompleto');
INSERT INTO docente (id_docente, especialidad, tipo_docente) VALUES (1005, 'Matemáticas', 'TiempoCompleto');

INSERT INTO trabajador(id_trabajador,cargo,tipo_trabajador) values (1006,"abogado","Legal");
INSERT INTO trabajador(id_trabajador,cargo,tipo_trabajador) values (1007,"abogado","Legal");

INSERT INTO superusuario(id_superusuario,cargo,area_administrativa) values (1008,"Director","Direccion");
INSERT INTO superusuario(id_superusuario,cargo,area_administrativa) values (1009,"Director","Direccion");

-- Insertar en la tabla anhoEscolar
INSERT INTO anhoEscolar (id_anho, fecha_inicio, fecha_fin, activo) VALUES (1, '2024-01-01', '2024-12-31', 1);
INSERT INTO anhoEscolar (id_anho, fecha_inicio, fecha_fin, activo) VALUES (2, '2025-01-01', '2025-12-31', 0);
INSERT INTO anhoEscolar (id_anho, fecha_inicio, fecha_fin, activo) VALUES (3, '2026-01-01', '2026-12-31', 0);

-- Insertar en la tabla aula
INSERT INTO aula (idAula, grado, seccion, nivel, tutor, anho_escolar, estado) VALUES (1, 5, 'A', 1, 1004, 1, 1);
INSERT INTO aula (idAula, grado, seccion, nivel, tutor, anho_escolar, estado) VALUES (2, 6, 'B', 2, 1005, 1, 1);



CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Juan',
    'Perez',
    'Lopez',
    'juan.perezg@example.com',
    'password123',
    '2024-06-10',
    TRUE,
    '2004-05-15',
    'M',
    'Calle Falsa 123',
    10,
    2,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Ana',
    'Gomez',
    'Martinez',
    'ana.gomez@example.com',
    'securepass',
    '2024-06-10',
    TRUE,
    '2006-07-22',
    'F',
    'Avenida Siempre Viva',
    8,
    1,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Carlos',
    'Rodriguez',
    'Fernandez',
    'carlos.rodriguez@example.com',
    'mypassword',
    '2024-06-10',
    TRUE,
    '2005-09-10',
    'M',
    'Camino Real',
    9,
    2,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Laura',
    'Hernandez',
    'Vargas',
    'laura.hernandez@example.com',
    'laurapass',
    '2024-06-10',
    TRUE,
    '2003-11-03',
    'F',
    'Calle Principal',
    11,
    3,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Pedro',
    'Sanchez',
    'Diaz',
    'pedro.sanchez@example.com',
    'pedro123',
    '2024-06-10',
    TRUE,
    '2004-01-20',
    'M',
    'Calle Secundaria',
    10,
    2,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Maria',
    'Fernandez',
    'Gonzalez',
    'maria.fernandez@example.com',
    'maria2024',
    '2024-06-10',
    TRUE,
    '2005-03-15',
    'F',
    'Calle Tercera',
    9,
    1,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Luis',
    'Martinez',
    'Garcia',
    'luis.martinez@example.com',
    'luispass',
    '2024-06-10',
    TRUE,
    '2003-12-25',
    'M',
    'Avenida Central',
    12,
    3,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Sofia',
    'Lopez',
    'Mendez',
    'sofia.lopez@example.com',
    'sofia2024',
    '2024-06-10',
    TRUE,
    '2006-08-18',
    'F',
    'Avenida Norte',
    8,
    1,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Miguel',
    'Gonzalez',
    'Rodriguez',
    'miguel.gonzalez@example.com',
    'miguel123',
    '2024-06-10',
    TRUE,
    '2004-10-02',
    'M',
    'Avenida Sur',
    10,
    2,
    NULL
);

CALL INSERTAR_ALUMNO(
    @id_alumno,
    'Elena',
    'Ramirez',
    'Torres',
    'elena.ramirez@example.com',
    'elenapass',
    '2024-06-10',
    TRUE,
    '2005-07-12',
    'F',
    'Calle Oeste',
    9,
    1,
    NULL
);

call insertarAlumnoAula(1,1000);
call insertarAlumnoAula(2,1001);
call insertarAlumnoAula(1,1010);
call insertarAlumnoAula(2,1011);
call insertarAlumnoAula(1,1012);
call insertarAlumnoAula(2,1013);
call insertarAlumnoAula(1,1014);
call insertarAlumnoAula(2,1015);
call insertarAlumnoAula(1,1016);
call insertarAlumnoAula(2,1017);
call insertarAlumnoAula(1,1018);
call insertarAlumnoAula(2,1019);

CALL insertar_docente(@idDocente, 'Luis', 'Ramírez', 'Ortiz', 'luis.ramirez@correo.com', '123', '2024-06-01', TRUE, 2500.00, '2024-05-01', 'Matemáticas', 'Profesor', NULL);
CALL insertar_docente(@idDocente, 'Elena', 'Ruiz', 'Pérez', 'elena.ruiz@correo.com', '123', '2024-06-02', TRUE, 2700.00, '2024-05-02', 'Historia', 'Profesor', NULL);
CALL insertar_docente(@idDocente, 'Miguel', 'Santos', 'López', 'miguel.santos@correo.com', '123', '2024-06-03', TRUE, 2800.00, '2024-05-03', 'Inglés', 'Profesor', NULL);
CALL insertar_docente(@idDocente, 'Laura', 'Díaz', 'Martínez', 'laura.diaz@correo.com', '123', '2024-06-04', TRUE, 2600.00, '2024-05-04', 'Ciencias', 'Profesor', NULL);
CALL insertar_docente(@idDocente, 'Fernando', 'García', 'Vázquez', 'fernando.garcia@correo.com', '123', '2024-06-05', TRUE, 2900.00, '2024-05-05', 'Educación Física', 'Profesor', NULL);

CALL InsertarCurso(@idCurso, 'Matemáticas Básicas', 'Curso introductorio a las matemáticas', 'Activo', '2024-06-01', 1020);
CALL InsertarCurso(@idCurso, 'Álgebra', 'Curso de álgebra avanzada', 'Activo', '2024-06-01', 1020);
CALL InsertarCurso(@idCurso, 'Geometría', 'Curso de geometría básica', 'Activo', '2024-06-01', 1020);
CALL InsertarCurso(@idCurso, 'Cálculo', 'Curso de cálculo diferencial', 'Activo', '2024-06-01', 1020);

CALL InsertarCurso(@idCurso, 'Historia Antigua', 'Estudio de las civilizaciones antiguas', 'Activo', '2024-06-01', 1021);
CALL InsertarCurso(@idCurso, 'Historia Medieval', 'Estudio de la edad media', 'Activo', '2024-06-01', 1021);
CALL InsertarCurso(@idCurso, 'Historia Moderna', 'Estudio de la era moderna', 'Activo', '2024-06-01', 1021);
CALL InsertarCurso(@idCurso, 'Historia Contemporánea', 'Estudio de la historia contemporánea', 'Activo', '2024-06-01', 1021);

CALL InsertarCurso(@idCurso, 'Inglés Básico', 'Curso de inglés para principiantes', 'Activo', '2024-06-01', 1022);
CALL InsertarCurso(@idCurso, 'Inglés Intermedio', 'Curso de inglés de nivel intermedio', 'Activo', '2024-06-01', 1022);
CALL InsertarCurso(@idCurso, 'Inglés Avanzado', 'Curso de inglés avanzado', 'Activo', '2024-06-01', 1022);
CALL InsertarCurso(@idCurso, 'Conversación en Inglés', 'Curso de práctica de conversación en inglés', 'Activo', '2024-06-01', 1022);

CALL InsertarCurso(@idCurso, 'Biología', 'Curso de biología general', 'Activo', '2024-06-01', 1023);
CALL InsertarCurso(@idCurso, 'Química', 'Curso de química básica', 'Activo', '2024-06-01', 1023);
CALL InsertarCurso(@idCurso, 'Física', 'Curso de física general', 'Activo', '2024-06-01', 1023);
CALL InsertarCurso(@idCurso, 'Ciencias Ambientales', 'Curso sobre medio ambiente y ecología', 'Activo', '2024-06-01', 1023);

CALL InsertarCurso(@idCurso, 'Educación Física I', 'Curso de educación física inicial', 'Activo', '2024-06-01', 1024);
CALL InsertarCurso(@idCurso, 'Educación Física II', 'Curso de educación física intermedia', 'Activo', '2024-06-01', 1024);
CALL InsertarCurso(@idCurso, 'Deportes', 'Curso de práctica de deportes', 'Activo', '2024-06-01', 1024);

CALL InsertarCurso(@idCurso, 'Educación Física Avanzada', 'Curso de educación física avanzada', 'Activo', '2024-06-01', 1004);
CALL InsertarCurso(@idCurso, 'Nutrición Deportiva', 'Curso sobre nutrición para deportistas', 'Activo', '2024-06-01', 1004);
CALL InsertarCurso(@idCurso, 'Entrenamiento Personal', 'Curso de entrenamiento personal y fitness', 'Activo', '2024-06-01', 1004);

-- Matemáticas (idCurso: 1)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 1, '2024-06-10 08:00:00', '2024-06-10 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 1, '2024-06-12 08:00:00', '2024-06-12 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 1, '2024-06-14 08:00:00', '2024-06-14 10:00:00', 'A');

-- Historia (idCurso: 2)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 2, '2024-06-10 10:00:00', '2024-06-10 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 2, '2024-06-12 10:00:00', '2024-06-12 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 2, '2024-06-14 10:00:00', '2024-06-14 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 2, '2024-06-16 10:00:00', '2024-06-16 12:00:00', 'A');

-- Inglés (idCurso: 3)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 3, '2024-06-10 12:00:00', '2024-06-10 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 3, '2024-06-12 12:00:00', '2024-06-12 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 3, '2024-06-14 12:00:00', '2024-06-14 14:00:00', 'A');

-- Matemática para inicial (idCurso: 4)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 4, '2024-06-11 08:00:00', '2024-06-11 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 4, '2024-06-13 08:00:00', '2024-06-13 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 4, '2024-06-15 08:00:00', '2024-06-15 10:00:00', 'A');

-- Matemáticas Básicas (idCurso: 5)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 5, '2024-06-11 10:00:00', '2024-06-11 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 5, '2024-06-13 10:00:00', '2024-06-13 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 5, '2024-06-15 10:00:00', '2024-06-15 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 5, '2024-06-17 10:00:00', '2024-06-17 12:00:00', 'A');

-- Álgebra (idCurso: 6)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 6, '2024-06-11 12:00:00', '2024-06-11 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 6, '2024-06-13 12:00:00', '2024-06-13 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 6, '2024-06-15 12:00:00', '2024-06-15 14:00:00', 'A');

-- Geometría (idCurso: 7)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 7, '2024-06-11 14:00:00', '2024-06-11 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 7, '2024-06-13 14:00:00', '2024-06-13 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 7, '2024-06-15 14:00:00', '2024-06-15 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 7, '2024-06-17 14:00:00', '2024-06-17 16:00:00', 'A');

-- Cálculo Diferencial (idCurso: 8)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 8, '2024-06-11 16:00:00', '2024-06-11 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 8, '2024-06-13 16:00:00', '2024-06-13 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 8, '2024-06-15 16:00:00', '2024-06-15 18:00:00', 'A');

-- Historia Antigua (idCurso: 9)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 9, '2024-06-12 08:00:00', '2024-06-12 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 9, '2024-06-14 08:00:00', '2024-06-14 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 9, '2024-06-16 08:00:00', '2024-06-16 10:00:00', 'A');

-- Historia Medieval (idCurso: 10)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 10, '2024-06-12 10:00:00', '2024-06-12 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 10, '2024-06-14 10:00:00', '2024-06-14 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 10, '2024-06-16 10:00:00', '2024-06-16 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 10, '2024-06-18 10:00:00', '2024-06-18 12:00:00', 'A');

-- Historia Moderna (idCurso: 11)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 11, '2024-06-12 12:00:00', '2024-06-12 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 11, '2024-06-14 12:00:00', '2024-06-14 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 11, '2024-06-16 12:00:00', '2024-06-16 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 11, '2024-06-18 12:00:00', '2024-06-18 14:00:00', 'A');

-- Historia Contemporánea (idCurso: 12)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 12, '2024-06-12 14:00:00', '2024-06-12 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 12, '2024-06-14 14:00:00', '2024-06-14 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 12, '2024-06-16 14:00:00', '2024-06-16 16:00:00', 'A');

-- Inglés Básico (idCurso: 13)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 13, '2024-06-12 16:00:00', '2024-06-12 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 13, '2024-06-14 16:00:00', '2024-06-14 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 13, '2024-06-16 16:00:00', '2024-06-16 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 13, '2024-06-18 16:00:00', '2024-06-18 18:00:00', 'A');

-- Inglés Intermedio (idCurso: 14)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 14, '2024-06-13 08:00:00', '2024-06-13 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 14, '2024-06-15 08:00:00', '2024-06-15 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 14, '2024-06-17 08:00:00', '2024-06-17 10:00:00', 'A');

-- Inglés Avanzado (idCurso: 15)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 15, '2024-06-13 10:00:00', '2024-06-13 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 15, '2024-06-15 10:00:00', '2024-06-15 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 15, '2024-06-17 10:00:00', '2024-06-17 12:00:00', 'A');

-- Conversación en Inglés (idCurso: 16)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 16, '2024-06-13 12:00:00', '2024-06-13 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 16, '2024-06-15 12:00:00', '2024-06-15 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 16, '2024-06-17 12:00:00', '2024-06-17 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 16, '2024-06-19 12:00:00', '2024-06-19 14:00:00', 'A');

-- Biología (idCurso: 17)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 17, '2024-06-13 14:00:00', '2024-06-13 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 17, '2024-06-15 14:00:00', '2024-06-15 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 17, '2024-06-17 14:00:00', '2024-06-17 16:00:00', 'A');

-- Química (idCurso: 18)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 18, '2024-06-13 16:00:00', '2024-06-13 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 18, '2024-06-15 16:00:00', '2024-06-15 18:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 18, '2024-06-17 16:00:00', '2024-06-17 18:00:00', 'A');

-- Física (idCurso: 19)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 19, '2024-06-14 08:00:00', '2024-06-14 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 19, '2024-06-16 08:00:00', '2024-06-16 10:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 19, '2024-06-18 08:00:00', '2024-06-18 10:00:00', 'A');

-- Ciencias Ambientales (idCurso: 20)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 20, '2024-06-14 10:00:00', '2024-06-14 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 20, '2024-06-16 10:00:00', '2024-06-16 12:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 20, '2024-06-18 10:00:00', '2024-06-18 12:00:00', 'A');

-- Educación Física I (idCurso: 21)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 21, '2024-06-14 12:00:00', '2024-06-14 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 21, '2024-06-16 12:00:00', '2024-06-16 14:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 21, '2024-06-18 12:00:00', '2024-06-18 14:00:00', 'A');

-- Educación Física II (idCurso: 22)
CALL InsertarSesionYActividad(@idActividad, @idSesion, 22, '2024-06-14 14:00:00', '2024-06-14 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 22, '2024-06-16 14:00:00', '2024-06-16 16:00:00', 'A');
CALL InsertarSesionYActividad(@idActividad, @idSesion, 22, '2024-06-18 14:00:00', '2024-06-18 16:00:00', 'A');

call insertarApoderadoAlumno(1002,1000);
call insertarApoderadoAlumno(1002,1001);
call insertarApoderadoAlumno(1002,1010);
call insertarApoderadoAlumno(1002,1011);
call insertarApoderadoAlumno(1003,1012);
call insertarApoderadoAlumno(1003,1013);
call insertarApoderadoAlumno(1003,1014);
call insertarApoderadoAlumno(1003,1015);

CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 1, 'Clases', 20, 16);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 1, 'Tareas', 20, 14);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 1, 'Evaluacion Oral', 20, 19);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 1, 'Examen', 20, 11);

CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 2, 'Clases', 20, 16);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 2, 'Tareas', 20, 14);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 2, 'Evaluacion Oral', 20, 19);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 2, 'Examen', 20, 11);

CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 3, 'Clases', 20, 16);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 3, 'Tareas', 20, 14);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 3, 'Evaluacion Oral', 20, 19);
CALL InsertarEvaluacionYActividad(@idActividad, @idEvaluacion, 3, 'Examen', 20, 11);

call InsertarTareaYActividad(@idActividad, @idTarea,1,"Dibujar un paisaje",'2024-06-17',"Desarrollar","Activo");
call InsertarTareaYActividad(@idActividad, @idTarea,1,"Escribir una historia corta",'2024-06-19',"Desarrollar","Activo");
call InsertarTareaYActividad(@idActividad, @idTarea,2,"Resolver problemas de matemáticas",'2024-06-20',"Solucionario","Activo");
call InsertarTareaYActividad(@idActividad, @idTarea,2,"Hacer un experimento de ciencias",'2024-06-21',"Desarrollar","Activo");
call InsertarTareaYActividad(@idActividad, @idTarea,3,"Leer un capítulo de un libro",'2024-06-26',"Desarrollar","Activo");
call InsertarTareaYActividad(@idActividad, @idTarea,3,"Preparar una presentación sobre animales",'2024-06-27',"Desarrollar","Activo");

call insertarActividadAlumno(1,1000);
call insertarActividadAlumno(2,1000);
call insertarActividadAlumno(3,1000);
call insertarActividadAlumno(4,1000);
call insertarActividadAlumno(5,1000);



call insertarActividadAlumno(74,1000);
call insertarActividadAlumno(75,1000);
call insertarActividadAlumno(76,1000);
call insertarActividadAlumno(77,1000);
call insertarActividadAlumno(78,1000);
call insertarActividadAlumno(79,1000);
call insertarActividadAlumno(80,1000);
call insertarActividadAlumno(81,1000);
call insertarActividadAlumno(82,1000);
call insertarActividadAlumno(83,1000);
call insertarActividadAlumno(84,1000);
call insertarActividadAlumno(85,1000);

call insertarActividadAlumno(86,1000);
call insertarActividadAlumno(87,1000);
call insertarActividadAlumno(88,1000);

INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1004, 20,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1004, 21,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1004, 22,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 23,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 24,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 25,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 36,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 35,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 34,1);
INSERT INTO DocenteXActividad (idDocente, idActividad,activo) VALUES (1005, 33,1);