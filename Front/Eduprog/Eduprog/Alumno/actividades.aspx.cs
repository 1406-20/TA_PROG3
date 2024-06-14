using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Alumno
{
    public partial class actividades : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<sesion> listaSesiones;
        private BindingList<reunion> listaReuniones;
        private BindingList<evaluacion> listaEvaluacion;
        private BindingList<tarea> listaTareas;
        private BindingList<curso> listaCurso;
        private string idUsuarioS;
        private int idUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)

            {
                if (Session["idUsuarioActivo"] == null) Response.Redirect("~/login.aspx");
                idUsuarioS = (string)Session["idUsuarioActivo"];
                idUsuario = int.Parse(idUsuarioS);
                mostrarDatos(idUsuario);
                // Inicializar lista de actividades
                daoServicio = new EduprogWSClient(); // Inicializa el cliente del servicio web aquí
                InicializarActividades();
                // Inicializar la tabla con actividades para la semana actual
                DateTime today = DateTime.Now;
                MostrarActividades(today);
                
            }
        }

        private void mostrarDatos(int id)
        {
            daoServicio = new EduprogWSClient();
            alumno alu = daoServicio.obtenerAlumnoPorID(id);
            lblNombre.Text=alu.nombre + " " + alu.apellidoPaterno + " " + alu.apellidoMaterno;
            lblAula.Text=alu.gradoActual.ToString();
        }

        private string ObtenerAula(int id)
        {
            daoServicio = new EduprogWSClient();
            aula salon = daoServicio.ObtenerAulaxAlumnoID(id);
            return salon.grado.ToString() + "° -  " + Convert.ToChar(salon.seccion);
        }

        private void InicializarActividades()
        {

            //listaEvaluacion = new BindingList<evaluacion>(daoServicio.listarEvaluacionesXAlumnoId(idUsuario));
            listaSesiones = new BindingList<sesion>(daoServicio.listarSesionesXAlumnoId(idUsuario));
            // listaReuniones = daoServicio.listarReunionesXAlumnoId(idUsuario);
            listaTareas = new BindingList<tarea>(daoServicio.listarTareasXAlumnoId(idUsuario));

        }

        protected void CalActividades_SelectionChanged(object sender, EventArgs e)
        {
            LimpiarCeldas();
            DateTime selectedDate = CalActividades.SelectedDate;
            MostrarActividades(selectedDate);
        }

        private void MostrarActividades(DateTime fecha)
        {
            //Arreglar funcion

            // Obtener las actividades de la semana seleccionada
            Dictionary<DayOfWeek, BindingList<tarea>> tareasPorSemana = ObtenerTareasPorSemana(fecha);
            // Dictionary<DayOfWeek, BindingList<reunion>> reunionesPorSemana = ObtenerReunionesPorSemana(fecha);
            Dictionary<DayOfWeek, BindingList<sesion>> sesionesPorSemana = ObtenerSesionesPorSemana(fecha);

            // Mostrar las fechas en la fila de fechas
            for (int i = 0; i < 5; i++)
            {
                TableCell celdaFecha = ObtenerCeldaFechaPorDia((DayOfWeek)i + 1, fecha);
                celdaFecha.Controls.Clear();
                celdaFecha.Controls.Add(new LiteralControl(fecha.AddDays(i - (int)fecha.DayOfWeek + 1).ToString("dd/MM/yyyy")));
            }

            MostrarSesiones(sesionesPorSemana);
            MostrarTareas(tareasPorSemana);
            // Mostrar las actividades en la tabla
            // MostrarReuniones(reunionesPorSemana);
        }

        private void MostrarSesiones(Dictionary<DayOfWeek, BindingList<sesion>> sesionesPorSemana)
        {
            foreach (var dia in sesionesPorSemana)
            {
                TableCell celda = ObtenerCeldaPorDia(dia.Key);
                foreach (sesion sesion in dia.Value)
                {

                    // Crear la tarjeta para la actividad
                    Panel card = new Panel { CssClass = "card mb-3" };
                    Panel cardBody = new Panel { CssClass = "card-body" };

                    // Agregar el título de la tarjeta
                    //LiteralControl titulo = new LiteralControl($"<h5 class='card-title'>{sesion.curso.nombreCurso}</h5>");
                    //cardBody.Controls.Add(titulo);

                    // Agregar la descripción de la tarjeta
                    LiteralControl asistencia = new LiteralControl($"<p class='card-text'>{Convert.ToChar(sesion.asistencia)}</p>");
                    cardBody.Controls.Add(asistencia);

                    // Agregar el cuerpo de la tarjeta al panel principal
                    card.Controls.Add(cardBody);

                    // Agregar la tarjeta a la celda
                    celda.Controls.Add(card);
                }
            }
        }
        private void MostrarTareas(Dictionary<DayOfWeek, BindingList<tarea>> tareasPorSemana)
        {
            foreach (var dia in tareasPorSemana)
            {
                TableCell celda = ObtenerCeldaPorDia(dia.Key);
                foreach (tarea tarea in dia.Value)
                {
                    // Crear la tarjeta para la actividad
                    Panel card = new Panel { CssClass = "card mb-3" };
                    Panel cardBody = new Panel { CssClass = "card-body" };

                    // Agregar el título de la tarjeta
                    //LiteralControl titulo = new LiteralControl($"<h5 class='card-title'>{tarea.curso.nombreCurso}</h5>");
                    //cardBody.Controls.Add(titulo);

                    // Agregar la descripción de la tarjeta
                    LiteralControl descripcion = new LiteralControl($"<p class='card-text'>{tarea.descripcion}</p>");
                    cardBody.Controls.Add(descripcion);

                    // Agregar el tipo de actividad
                    LiteralControl tipoActividad = new LiteralControl($"<p class='card-text'><b>Tipo:</b>Tarea</p>");
                    cardBody.Controls.Add(tipoActividad);

                    // Agregar el tipo de tarea de la tarjeta
                    LiteralControl tipo = new LiteralControl($"<p class='card-text'>{tarea.tipoTarea}</p>");
                    cardBody.Controls.Add(tipo);

                    // Agregar el cuerpo de la tarjeta al panel principal
                    card.Controls.Add(cardBody);

                    // Agregar la tarjeta a la celda
                    celda.Controls.Add(card);
                }
            }
        }
        private void LimpiarCeldas()
        {
            tdLunes.Controls.Clear();
            tdMartes.Controls.Clear();
            tdMiercoles.Controls.Clear();
            tdJueves.Controls.Clear();
            tdViernes.Controls.Clear();
        }

        private TableCell ObtenerCeldaPorDia(DayOfWeek dia)
        {
            if (dia == DayOfWeek.Monday)
            {
                return tdLunes;
            }
            else if (dia == DayOfWeek.Tuesday)
            {
                return tdMartes;
            }
            else if (dia == DayOfWeek.Wednesday)
            {
                return tdMiercoles;
            }
            else if (dia == DayOfWeek.Thursday)
            {
                return tdJueves;
            }
            else if (dia == DayOfWeek.Friday)
            {
                return tdViernes;
            }
            else if (dia == DayOfWeek.Sunday || dia == DayOfWeek.Saturday)
            {
                throw new ArgumentOutOfRangeException(nameof(dia), dia, "Día no válido. Debe ser entre lunes y viernes.");
            }
            else
            {
                throw new ArgumentOutOfRangeException(nameof(dia), dia, "Día no válido. Debe ser entre lunes y viernes.");
            }
        }

        /*private TableCell ObtenerCeldaFechaPorDia(DayOfWeek dia, DateTime fecha)
        {
            DateTime inicioSemana = fecha.AddDays(-(int)fecha.DayOfWeek + (int)DayOfWeek.Monday);
            DateTime fechaDia = inicioSemana.AddDays((int)dia - (int)DayOfWeek.Monday);
            TableCell celdaFecha = ObtenerCeldaPorDiaFecha(dia);
            celdaFecha.Controls.Add(new LiteralControl(fechaDia.ToString("dd/MM/yyyy")));
            return celdaFecha;
        }
        ObtenerCeldaPorDiaFecha(dia)
        {


        }*/

        private Dictionary<DayOfWeek, BindingList<sesion>> ObtenerSesionesPorSemana(DateTime fecha)
        {
            DateTime inicioSemana = fecha.AddDays(-(int)fecha.DayOfWeek + (int)DayOfWeek.Monday);

            // Diccionario para almacenar las actividades por día de la semana
            var sesionesPorSemana = new Dictionary<DayOfWeek, BindingList<sesion>>();

            for (int i = 0; i < 5; i++) // Solo de lunes a viernes
            {
                DateTime diaActual = inicioSemana.AddDays(i);
                BindingList<sesion> sesionesDelDia = ObtenerSesionesPorFecha(diaActual);
                sesionesPorSemana[diaActual.DayOfWeek] = sesionesDelDia;
            }

            return sesionesPorSemana;
        }

        private Dictionary<DayOfWeek, BindingList<tarea>> ObtenerTareasPorSemana(DateTime fecha)
        {
            DateTime inicioSemana = fecha.AddDays(-(int)fecha.DayOfWeek + (int)DayOfWeek.Monday);

            // Diccionario para almacenar las actividades por día de la semana
            var tareasPorSemana = new Dictionary<DayOfWeek, BindingList<tarea>>();

            for (int i = 0; i < 5; i++) // Solo de lunes a viernes
            {
                DateTime diaActual = inicioSemana.AddDays(i);
                BindingList<tarea> tareasDelDia = ObtenerTareasPorFecha(diaActual);
                tareasPorSemana[diaActual.DayOfWeek] = tareasDelDia;
            }

            return tareasPorSemana;
        }

        private BindingList<sesion> ObtenerSesionesPorFecha(DateTime fecha)
        {
            BindingList<sesion> sesionesFiltradas = new BindingList<sesion>();

            if (listaSesiones == null)
            {
                return sesionesFiltradas;
            }

            List<sesion> sesiones = listaSesiones.Where(a => a.fechaInicio.Date == fecha.Date).ToList();
            return new BindingList<sesion>(sesiones);
        }

        private BindingList<tarea> ObtenerTareasPorFecha(DateTime fecha)
        {
            BindingList<tarea> tareasFiltradas = new BindingList<tarea>();
            // Encontrar todas las tareas que coinciden con la fecha especificada y convertir a BindingList

            if (listaTareas == null)
            {
                return tareasFiltradas;
            }
            List<tarea> tareas = listaTareas.Where(a => a.fechaRegistro.Date == fecha.Date).ToList();
            return new BindingList<tarea>(tareas);
        }
    }
}