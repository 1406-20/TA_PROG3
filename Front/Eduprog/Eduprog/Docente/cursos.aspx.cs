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
        //    private EduprogWSClient daoServicio;
        //    protected void Page_Load(object sender, EventArgs e)
        //    {
        //        if (!IsPostBack)
        //        {
        //            int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
        //            daoServicio = new EduprogWSClient();
        //            var sesiones = daoServicio.Obtener_sesionesxDocente(idUsuario);

        //            if (sesiones != null && sesiones.Any())
        //            {
        //                List<string> listaCursos = new List<string>(sesiones);
        //                var cursosConHorarios = ObtenerCursosConHorarios(listaCursos);

        //                rptCursos.DataSource = cursosConHorarios;
        //                rptCursos.DataBind();
        //            }
        //            else
        //            {
        //                // No hay sesiones programadas, mostrar el mensaje en un cuadro y redirigir a otra página
        //                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay sesiones registradas a los cursos que dicta'); window.location='publicaciones.aspx';", true);
        //            }
        //        }
        //    }

        //    public class CursoConHorarios
        //    {
        //        public string NombreCurso { get; set; }
        //        public List<string> Horarios { get; set; }

        //        public CursoConHorarios()
        //        {
        //            Horarios = new List<string>();
        //        }
        //    }

        //    public List<CursoConHorarios> ObtenerCursosConHorarios(List<string> listaCursos)
        //    {
        //        var cursos = new List<CursoConHorarios>();
        //        var formatoFecha = "yyyy-MM-dd HH:mm";
        //        var cultura = new CultureInfo("es-ES"); // Asegurarse de que la cultura sea la correcta para el idioma español.

        //        foreach (var item in listaCursos)
        //        {
        //            var partes = item.Split(';');
        //            if (partes.Length != 3) continue;

        //            var nombreCurso = partes[0];
        //            DateTime fechaInicio;
        //            DateTime fechaFin;

        //            // Parsear las fechas usando el formato y la cultura especificada.
        //            if (!DateTime.TryParseExact(partes[1], formatoFecha, cultura, DateTimeStyles.None, out fechaInicio) ||
        //                !DateTime.TryParseExact(partes[2], formatoFecha, cultura, DateTimeStyles.None, out fechaFin))
        //            {
        //                // Si no se puede parsear la fecha, saltar al siguiente elemento.
        //                continue;
        //            }

        //            var curso = cursos.FirstOrDefault(c => c.NombreCurso == nombreCurso);
        //            if (curso == null)
        //            {
        //                curso = new CursoConHorarios { NombreCurso = nombreCurso };
        //                cursos.Add(curso);
        //            }

        //            var fechaFormateada = $"{fechaInicio:dddd, MMMM d, yyyy HH:mm} - {fechaFin:dddd, MMMM d, yyyy HH:mm}";
        //            curso.Horarios.Add(fechaFormateada);
        //        }

        //        return cursos;
        //    }

        //private EduprogWSClient daoServicio;
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        rptCursos.ItemCommand += rptCursos_ItemCommand;
        //        rptCursos.ItemDataBound += rptCursos_ItemDataBound;
        //        int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
        //        daoServicio = new EduprogWSClient();
        //        var sesiones = daoServicio.Obtener_sesionesxDocente(idUsuario);

        //        if (sesiones != null && sesiones.Any())
        //        {
        //            List<string> listaCursos = new List<string>(sesiones);
        //            var cursosConHorarios = ObtenerCursosConHorarios(listaCursos);

        //            rptCursos.DataSource = cursosConHorarios;
        //            rptCursos.DataBind();
        //        }
        //        else
        //        {
        //            // No hay sesiones programadas, mostrar el mensaje en un cuadro y redirigir a otra página
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay sesiones registradas a los cursos que dicta'); window.location='publicaciones.aspx';", true);
        //        }
        //    }
        //}

        //public class Horario
        //{
        //    public string StartTime { get; set; }
        //    public string EndTime { get; set; }
        //}

        //public class CursoConHorarios
        //{
        //    public string NombreCurso { get; set; }
        //    public List<Horario> Horarios { get; set; }
        //    public int TotalPages => (int)Math.Ceiling((double)Horarios.Count / 2);
        //    public int CurrentPage { get; set; } = 1;

        //    public CursoConHorarios()
        //    {
        //        Horarios = new List<Horario>();
        //    }
        //}

        //public List<CursoConHorarios> ObtenerCursosConHorarios(List<string> listaCursos)
        //{
        //    var cursos = new List<CursoConHorarios>();
        //    var formatoFecha = "yyyy-MM-dd HH:mm";
        //    var cultura = new CultureInfo("es-ES");

        //    foreach (var item in listaCursos)
        //    {
        //        var partes = item.Split(';');
        //        if (partes.Length != 3) continue;

        //        var nombreCurso = partes[0];
        //        DateTime fechaInicio;
        //        DateTime fechaFin;

        //        if (!DateTime.TryParseExact(partes[1], formatoFecha, cultura, DateTimeStyles.None, out fechaInicio) ||
        //            !DateTime.TryParseExact(partes[2], formatoFecha, cultura, DateTimeStyles.None, out fechaFin))
        //        {
        //            continue;
        //        }

        //        var curso = cursos.FirstOrDefault(c => c.NombreCurso == nombreCurso);
        //        if (curso == null)
        //        {
        //            curso = new CursoConHorarios { NombreCurso = nombreCurso };
        //            cursos.Add(curso);
        //        }

        //        var horario = new Horario
        //        {
        //            StartTime = $"{fechaInicio:dddd, MMMM d, yyyy HH:mm}",
        //            EndTime = $"{fechaFin:dddd, MMMM d, yyyy HH:mm}"
        //        };

        //        curso.Horarios.Add(horario);
        //    }

        //    return cursos;
        //}

        //protected void rptCursos_ItemCommand(object source, RepeaterCommandEventArgs e)
        //{
        //    if (e.CommandName == "Page")
        //    {
        //        int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
        //        daoServicio = new EduprogWSClient();
        //        var sesiones = daoServicio.Obtener_sesionesxDocente(idUsuario);

        //        if (sesiones != null && sesiones.Any())
        //        {
        //            List<string> listaCursos = new List<string>(sesiones);
        //            var cursosConHorarios = ObtenerCursosConHorarios(listaCursos);

        //            var cursoConHorarios = cursosConHorarios[e.Item.ItemIndex];

        //            if (e.CommandArgument.ToString() == "next" && cursoConHorarios.CurrentPage < cursoConHorarios.TotalPages)
        //            {
        //                cursoConHorarios.CurrentPage++;
        //            }
        //            else if (e.CommandArgument.ToString() == "prev" && cursoConHorarios.CurrentPage > 1)
        //            {
        //                cursoConHorarios.CurrentPage--;
        //            }

        //            rptCursos.DataSource = cursosConHorarios;
        //            rptCursos.DataBind();
        //        }
        //    }
        //}

        //protected void rptCursos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        var cursoConHorarios = (CursoConHorarios)e.Item.DataItem;
        //        var rptHorarios = (Repeater)e.Item.FindControl("rptHorarios");

        //        var horariosPaginados = cursoConHorarios.Horarios
        //            .Skip((cursoConHorarios.CurrentPage - 1) * 2)
        //            .Take(2)
        //            .ToList();

        //        rptHorarios.DataSource = horariosPaginados;
        //        rptHorarios.DataBind();
        //    }
        //}


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

        public class Horario
        {
            public string StartTime { get; set; }
            public string EndTime { get; set; }
        }

        public class CursoConHorarios
        {
            public string NombreCurso { get; set; }
            public List<Horario> Horarios { get; set; }

            public CursoConHorarios()
            {
                Horarios = new List<Horario>();
            }
        }

        public List<CursoConHorarios> ObtenerCursosConHorarios(List<string> listaCursos)
        {
            var cursos = new List<CursoConHorarios>();
            var formatoFecha = "yyyy-MM-dd HH:mm";
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

                var horario = new Horario
                {
                    StartTime = $"{fechaInicio:dddd, MMMM d, yyyy HH:mm}",
                    EndTime = $"{fechaFin:dddd, MMMM d, yyyy HH:mm}"
                };

                curso.Horarios.Add(horario);
            }

            return cursos;
        }

        protected void rptCursos_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var curso = e.Item.DataItem as CursoConHorarios;
                if (curso != null && curso.Horarios != null && curso.Horarios.Count > 0)
                {
                    var rptHorarios = e.Item.FindControl("rptHorarios") as Repeater;
                    if (rptHorarios != null)
                    {
                        rptHorarios.DataSource = curso.Horarios;
                        rptHorarios.DataBind();
                    }
                }
            }
        }


    }
}