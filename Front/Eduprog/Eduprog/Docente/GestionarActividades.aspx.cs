using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;
//Modificar con Id´s
namespace Eduprog.Docente
{
    public partial class GestionarActividad : Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<curso> listaCursos;
        private BindingList<aula> listaAulas;
        private int idDocente, idCurso, idAula, idUsuario;
        private int[] idAlumnos;
        private string idUsuarioS;
        private curso curso;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["idUsuarioActivo"] == null)
                {
                    Response.Redirect("~/login.aspx");
                    return;
                }

                idUsuarioS = (string)Session["idUsuarioActivo"];
                idUsuario = int.Parse(idUsuarioS);
                idDocente = int.Parse(idUsuarioS);
                daoServicio = new EduprogWSClient();
                CargarDatosIniciales();
            }
        }

        private void CargarDatosIniciales()
        {
            listaCursos = new BindingList<curso>(daoServicio.listarCurso().ToList());
            listaAulas = new BindingList<aula>(daoServicio.listarTodasAulas().ToList());

            ddlCurso.DataSource = listaCursos;
            ddlCurso.DataTextField = "descripcion";
            ddlCurso.DataValueField = "idCurso";
            ddlCurso.DataBind();

            ddlAula.DataSource = listaAulas;
            ddlAula.DataTextField = "seccion";
            ddlAula.DataValueField = "idAula";
            ddlAula.DataBind();

            idCurso = Convert.ToInt32(ddlCurso.SelectedValue);
            idAula = Convert.ToInt32(ddlAula.SelectedValue);
            idAlumnos = ObtenerIdAlumnos(idAula);
            curso = daoServicio.obtenerCursoXId(idCurso);
        }

        private int[] ObtenerIdAlumnos(int idAula)
        {
            return daoServicio.listarAlumnossAulasXId(idAula);
        }

        protected void ddlTipoActividad_SelectedIndexChanged(object sender, EventArgs e)
        {
            pnlSesion.Visible = false;
            pnlReunion.Visible = false;
            pnlTarea.Visible = false;
            pnlEvaluacion.Visible = false;

            switch (ddlTipoActividad.SelectedValue)
            {
                case "sesion":
                    pnlSesion.Visible = true;
                    break;
                case "reuniones":
                    pnlReunion.Visible = true;
                    break;
                case "tareas":
                    pnlTarea.Visible = true;
                    break;
                case "evaluaciones":
                    pnlEvaluacion.Visible = true;
                    break;
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (!ValidarEntradas()) return;

            string tipoActividad = ddlTipoActividad.SelectedValue;

            switch (tipoActividad)
            {
                case "sesion":
                    GuardarSesion();
                    break;
                case "reuniones":
                    GuardarReunion();
                    break;
                case "tareas":
                    GuardarTarea();
                    break;
                case "evaluaciones":
                    GuardarEvaluaciones();
                    break;
            }

            Response.Redirect("actividades.aspx");
        }

        private bool ValidarEntradas()
        {
            // Implementa lógica de validación de entradas aquí y muestra mensajes al usuario si es necesario.
            // Por ejemplo:
            if (ddlCurso.SelectedIndex == -1 || ddlAula.SelectedIndex == -1 || ddlTipoActividad.SelectedIndex == -1)
            {
                // Mostrar mensaje de error al usuario.
                return false;
            }
            return true;
        }

        private void GuardarReunion()
        {
            daoServicio = new EduprogWSClient();
            reunion reu = new reunion
            {
                curso = curso,
                lugar = txtLugar.Text,
                duracionMinutos = Convert.ToInt32(txtDuracionMinutos.Text),
                organizador = txtOrganizador.Text,
                descripcion = txtDescripcion.Text
            };
            daoServicio.insertarReunion(reu, idAlumnos, idDocente);
        }

        private void GuardarEvaluaciones()
        {
            daoServicio = new EduprogWSClient();
            evaluacion eva = new evaluacion
            {
                curso = curso,
                puntajeTotal = Convert.ToInt32(txtPuntajeMax.Text),
                puntajeObtenido = 0
            };

            switch (ddlTipoEvaluacion.SelectedValue)
            {
                case "Practica":
                    eva.tipoEvaluacion = tipoEvaluacion.Practica;
                    break;
                case "Examen":
                    eva.tipoEvaluacion = tipoEvaluacion.Examen;
                    break;
            }

            daoServicio.insertarEvaluacion(eva, idAlumnos, idDocente);
        }

        private void GuardarSesion()
        {
            daoServicio = new EduprogWSClient();
            sesion sesion = new sesion
            {
                curso = curso,
                asistencia = 'A',
                fechaInicio = DateTime.ParseExact(txtFechaInicio.Text, "yyyy-MM-ddTHH:mm", System.Globalization.CultureInfo.InvariantCulture),
                fechaFin = DateTime.ParseExact(txtFechaFin.Text, "yyyy-MM-ddTHH:mm", System.Globalization.CultureInfo.InvariantCulture)
            };

            daoServicio.insertarSesion(sesion, idAlumnos, idDocente);
        }

        private void GuardarTarea()
        {
            daoServicio = new EduprogWSClient();
            tarea tarea = new tarea();
            tarea.curso = curso;
            tarea.descripcion = txtDescpTarea.Text;
            tarea.estado = "Activo";
            tarea.fechaRegistro = DateTime.Today;

            switch (ddlTipoTarea.SelectedValue)
            {
                case "Desarrollar":
                    tarea.tipoTarea = tipoTarea.DESARROLLAR;
                    break;
                case "Completado":
                    tarea.tipoTarea = tipoTarea.MARCAR_COMPLETADA;
                    break;
                case "Solucionario":
                    tarea.tipoTarea = tipoTarea.ENVIAR_SOLUCIONARIO;
                    break;
            }

            daoServicio.insertarTareas(tarea, idAlumnos, idDocente);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("actividades.aspx");
        }
    }
}