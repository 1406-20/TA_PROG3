using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Contexts;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Docente
{
    public partial class cursos : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                daoServicio = new EduprogWSClient();
                var sesiones = daoServicio.Obtener_sesionesxDocente(idUsuario);

                if (sesiones != null && sesiones.Any())
                {
                    List<string> listaCursos = new List<string>(sesiones);
                    var cursosConHorarios = ObtenerCursosConHorarios(listaCursos);

                    rptCursos.DataSource = cursosConHorarios;
                    rptCursos.DataBind();
                }
                else
                {
                    // No hay sesiones programadas, mostrar el mensaje en un cuadro y redirigir a otra página
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay sesiones registradas a los cursos que dicta'); window.location='publicaciones.aspx';", true);
                }
            }
        }

        public class CursoConHorarios
        {
            public string NombreCurso { get; set; }
            public List<string> Horarios { get; set; }

            public CursoConHorarios()
            {
                Horarios = new List<string>();
            }
        }

        public List<CursoConHorarios> ObtenerCursosConHorarios(List<string> listaCursos)
        {
            var cursos = new List<CursoConHorarios>();
            var formatoFecha = "dddd, MMMM d, yyyy HH:mm";
            var cultura = new CultureInfo("es-ES"); // Asegurarse de que la cultura sea la correcta para el idioma español.

            foreach (var item in listaCursos)
            {
                var partes = item.Split(';');
                if (partes.Length != 3) continue;

                var nombreCurso = partes[0];
                DateTime fechaInicio;
                DateTime fechaFin;

                // Parsear las fechas usando el formato y la cultura especificada.
                if (!DateTime.TryParseExact(partes[1], formatoFecha, cultura, DateTimeStyles.None, out fechaInicio) ||
                    !DateTime.TryParseExact(partes[2], formatoFecha, cultura, DateTimeStyles.None, out fechaFin))
                {
                    // Si no se puede parsear la fecha, saltar al siguiente elemento.
                    continue;
                }

                var curso = cursos.FirstOrDefault(c => c.NombreCurso == nombreCurso);
                if (curso == null)
                {
                    curso = new CursoConHorarios { NombreCurso = nombreCurso };
                    cursos.Add(curso);
                }

                var fechaFormateada = $"{fechaInicio:dddd, MMMM d, yyyy HH:mm} - {fechaFin:dddd, MMMM d, yyyy HH:mm}";
                curso.Horarios.Add(fechaFormateada);
            }

            return cursos;
        }

    }
}