using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Docente
{
    public partial class actividades : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<sesion> listaSesiones;
        private BindingList<tarea> listaTareas;
        private string idUsuarioS;
        private int idUsuario;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idUsuarioActivo"] == null) Response.Redirect("~/login.aspx");
                idUsuarioS = (string)Session["idUsuarioActivo"];
                idUsuario = int.Parse(idUsuarioS);
                lblNombre.Text = ObtenerNombre(idUsuario);
                daoServicio = new EduprogWSClient(); // Inicializa el cliente del servicio web aquí
                InicializarActividades();

                DateTime today = DateTime.Today;
                MostrarActividades(today);
            }
        }

        protected void btnAgregarActividad_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarActividades.aspx");
        }

        private string ObtenerNombre(int id)
        {
            daoServicio = new EduprogWSClient();
            usuario usuario = daoServicio.obtenerAlumnoPorID(id);
            return usuario.nombre + " " + usuario.apellidoPaterno + " " + usuario.apellidoMaterno;
        }

        private void InicializarActividades()
        {
            listaSesiones = new BindingList<sesion>(daoServicio.listarSesionesXDocenteId(idUsuario));
            listaTareas = new BindingList<tarea>(daoServicio.listarTareasXDocenteId(idUsuario));
        }

        protected void CalActividades_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = CalActividades.SelectedDate;
            MostrarActividades(selectedDate);
        }

        private void MostrarActividades(DateTime fecha)
        {
            LimpiarCeldas();

            Dictionary<DayOfWeek, BindingList<tarea>> tareasPorSemana = ObtenerTareasPorSemana(fecha);
            Dictionary<DayOfWeek, BindingList<sesion>> sesionesPorSemana = ObtenerSesionesPorSemana(fecha);

            for (int i = 0; i < 5; i++)
            {
                TableCell celdaFecha = ObtenerCeldaFechaPorDia((DayOfWeek)i + 1, fecha);
                celdaFecha.Controls.Clear();
                celdaFecha.Controls.Add(new LiteralControl(fecha.AddDays(i - (int)fecha.DayOfWeek + 1).ToString("dd/MM/yyyy")));
            }

            MostrarSesiones(sesionesPorSemana);
            MostrarTareas(tareasPorSemana);
        }

        private void MostrarSesiones(Dictionary<DayOfWeek, BindingList<sesion>> sesionesPorSemana)
        {
            foreach (var dia in sesionesPorSemana)
            {
                TableCell celda = ObtenerCeldaPorDia(dia.Key);
                foreach (sesion sesion in dia.Value)
                {
                    Panel card = new Panel { CssClass = "card mb-3" };
                    Panel cardBody = new Panel { CssClass = "card-body" };

                    LiteralControl titulo = new LiteralControl($"<h5 class='card-title'>{sesion.curso.nombreCurso}</h5>");
                    cardBody.Controls.Add(titulo);

                    LiteralControl asistencia = new LiteralControl($"<p class='card-text'>{sesion.asistencia}</p>");
                    cardBody.Controls.Add(asistencia);

                    card.Controls.Add(cardBody);
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
                    Panel card = new Panel { CssClass = "card mb-3" };
                    Panel cardBody = new Panel { CssClass = "card-body" };

                    /*LiteralControl titulo = new LiteralControl($"<h5 class='card-title'>{tarea.curso.nombreCurso}</h5>");
                    cardBody.Controls.Add(titulo);
                    */
                    LiteralControl descripcion = new LiteralControl($"<p class='card-text'>{tarea.descripcion}</p>");
                    cardBody.Controls.Add(descripcion);

                    //LiteralControl estado = new LiteralControl($"<p class='card-text'><b>Estado:</b> {tarea.estado}</p>");
                    //cardBody.Controls.Add(estado);

                    LiteralControl tipo = new LiteralControl($"<p class='card-text'><b>Tipo:</b> {tarea.tipoTarea}</p>");
                    cardBody.Controls.Add(tipo);

                    card.Controls.Add(cardBody);
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

        private TableCell ObtenerCeldaFechaPorDia(DayOfWeek dia, DateTime fecha)
        {
            DateTime inicioSemana = fecha.AddDays(-(int)fecha.DayOfWeek + (int)DayOfWeek.Monday);
            DateTime fechaDia = inicioSemana.AddDays((int)dia - (int)DayOfWeek.Monday);
            TableCell celdaFecha = ObtenerCeldaPorDia(dia);
            celdaFecha.Controls.Add(new LiteralControl(fechaDia.ToString("dd/MM/yyyy")));
            return celdaFecha;
        }

        private Dictionary<DayOfWeek, BindingList<sesion>> ObtenerSesionesPorSemana(DateTime fecha)
        {
            DateTime inicioSemana = fecha.AddDays(-(int)fecha.DayOfWeek + (int)DayOfWeek.Monday);
            var sesionesPorSemana = new Dictionary<DayOfWeek, BindingList<sesion>>();

            for (int i = 0; i < 5; i++)
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
            var tareasPorSemana = new Dictionary<DayOfWeek, BindingList<tarea>>();

            for (int i = 0; i < 5; i++)
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

            if (listaTareas == null)
            {
                return tareasFiltradas;
            }

            List<tarea> tareas = listaTareas.Where(a => a.fechaRegistro.Date == fecha.Date).ToList();
            return new BindingList<tarea>(tareas);
        }
    }
}