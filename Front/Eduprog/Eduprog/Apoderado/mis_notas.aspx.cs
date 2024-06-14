//using Eduprog.EduprogWS;
//using Eduprog.UsuarioAdministrativo;
//using System;
//using System.Collections.Generic;
//using System.ComponentModel;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;

//namespace Eduprog.Apoderado
//{
//    public partial class mis_notas : System.Web.UI.Page
//    {
//        private EduprogWSClient daoServicio;
//        private BindingList<NotaAlumno> notasAlumno;
//        private BindingList<alumno> alumnos;
//        private aula aula;
//        private aula aula2;
//        private alumno alumnoDato;
//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                daoServicio = new EduprogWSClient();
//                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
//                aula2 = new aula();

//                List<string> listaAlumnos = new List<string>(daoServicio.listarAlumnosApoderado(idUsuario));
//                foreach (string alumno in listaAlumnos)
//                {
//                    string[] partes = alumno.Split(';');
//                    ddlAlumnos.Items.Add(new ListItem(partes[1], partes[0]));
//                }

//                if (listaAlumnos.Count > 0)
//                {
//                    bool alumnoConNotasEncontrado = false;
//                    foreach (string alumno in listaAlumnos)
//                    {
//                        string[] partes = alumno.Split(';');
//                        int idAlumno = Int32.Parse(partes[0]);

//                        // Obtener el aula y las notas del alumno
//                        aula aulaAlumno = daoServicio.obtenerAulaxIDAlumno(idAlumno);
//                        var notasxalumno = daoServicio.listarnotasxalumno(idAlumno);

//                        // Verificar si el alumno tiene notas
//                        if (notasxalumno != null && notasxalumno.Any())
//                        {
//                            aula2 = aulaAlumno;
//                            alumnoDato = daoServicio.obtenerAlumnoPorID(idAlumno);
//                            // Convertir notasxalumno de string[] a List<string>
//                            List<string> notasList = new List<string>(notasxalumno);
//                            CargarDatosAlumno(alumnoDato, aula2, notasList);
//                            alumnoConNotasEncontrado = true;
//                            break;
//                        }
//                    }

//                    if (!alumnoConNotasEncontrado)
//                    {
//                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Ningún alumno a su cargo tiene notas'); window.location='publicaciones.aspx';", true);
//                    }
//                }
//                else
//                {
//                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay Alumnos registrados a su cargo'); window.location='publicaciones.aspx';", true);
//                }
//            }
//        }

//        private void CargarDatosAlumno(alumno alumnoDato, aula aula, List<string> notasxalumno)
//        {
//            // Cargar datos del alumno
//            string aulaAlumno = aula.grado.ToString();
//            string seccionAlumno = ((char)aula.seccion).ToString();
//            lblNombreAlumno.Text = alumnoDato.nombre + " " + alumnoDato.apellidoPaterno + " " + alumnoDato.apellidoMaterno;
//            lblAula.Text = aulaAlumno;
//            lblSeccion.Text = seccionAlumno;
//            lblCorreoAlumno.Text = alumnoDato.correoElectronico;
//            lblNivel.Text = aula.nivel == 1 ? "Inicial" : aula.nivel == 2 ? "Primaria" : "-";

//            // Cargar notas del alumno
//            notasAlumno = new BindingList<NotaAlumno>();
//            foreach (string dato in notasxalumno)
//            {
//                string[] partes = dato.Split('-');
//                if (partes.Length == 3)
//                {
//                    notasAlumno.Add(new NotaAlumno { Curso = partes[0], Criterio = partes[1], PrimerBimestre = partes[2] });
//                }
//            }

//            // Asignar la lista de notasAlumno al GridView
//            gvNotas.DataSource = notasAlumno;
//            gvNotas.DataBind();
//        }

//        protected void gvNotas_DataBound(object sender, EventArgs e)
//        {
//            int RowSpan = 2;
//            for (int i = gvNotas.Rows.Count - 2; i >= 0; i--)
//            {
//                GridViewRow currRow = gvNotas.Rows[i];
//                GridViewRow prevRow = gvNotas.Rows[i + 1];
//                if (currRow.Cells[0].Text == prevRow.Cells[0].Text)
//                {
//                    currRow.Cells[0].RowSpan = RowSpan;
//                    prevRow.Cells[0].Visible = false;
//                    RowSpan += 1;
//                }
//                else
//                    RowSpan = 2;
//            }
//        }

//        public class NotaAlumno
//        {
//            public string Curso { get; set; }
//            public string Criterio { get; set; }
//            public string Nota { get; set; }
//            public string PrimerBimestre { get; set; } = " ";
//            public string SegundoBimestre { get; set; } = " ";
//            public string TercerBimestre { get; set; } = " ";
//            public string CuartoBimestre { get; set; } = " ";
//        }

//        protected void ddlAlumnos_SelectedIndexChanged(object sender, EventArgs e)
//        {
//            int idAlumno = Int32.Parse(ddlAlumnos.SelectedValue);
//            daoServicio = new EduprogWSClient();
//            if (idAlumno != 0)
//            {
//                aula aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
//                int idAula = aula.idAula;
//                alumnoDato = new alumno();
//                alumnoDato = daoServicio.obtenerAlumnoPorID(idAlumno);
//                string aulaAlumno = aula.grado.ToString();
//                string seccionAlumno = ((char)aula.seccion).ToString();
//                lblNombreAlumno.Text = alumnoDato.nombre + " " + alumnoDato.apellidoPaterno + " " + alumnoDato.apellidoMaterno;
//                lblAula.Text = aulaAlumno;
//                lblSeccion.Text = seccionAlumno;
//                lblCorreoAlumno.Text = alumnoDato.correoElectronico;
//                if (aula.nivel == 1) lblNivel.Text = "Inicial";
//                else
//                    if (aula.nivel == 2) lblNivel.Text = "Primaria";
//                else
//                    lblNivel.Text = "-";

//                notasAlumno = new BindingList<NotaAlumno>();
//                var notasxalumno = daoServicio.listarnotasxalumno(idAlumno);
//                if (notasxalumno != null && notasAlumno.Any())
//                {
//                    List<string> notasRecibidas = new List<string>(notasxalumno);
//                    foreach (string dato in notasRecibidas)
//                    {
//                        string[] partes = dato.Split('-');
//                        if (partes.Length == 3)
//                        {
//                            notasAlumno.Add(new NotaAlumno { Curso = partes[0], Criterio = partes[1], PrimerBimestre = partes[2] });

//                        }
//                    }
//                }
//                else
//                {
//                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay notas registradas para el alumno'); window.location='publicaciones.aspx';", true);
//                }

//                // Asignar la lista de notasAlumno al GridView
//                gvNotas.DataSource = notasAlumno;
//                gvNotas.DataBind();
//            }
//        }
//    }
//}

using Eduprog.EduprogWS;
using Eduprog.UsuarioAdministrativo;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Apoderado
{
    public partial class mis_notas : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<NotaAlumno> notasAlumno;
        private BindingList<alumno> alumnos;
        private aula aula;
        private aula aula2;
        private alumno alumnoDato;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                aula2 = new aula();

                List<string> listaAlumnos = new List<string>(daoServicio.listarAlumnosApoderado(idUsuario));
                foreach (string alumno in listaAlumnos)
                {
                    string[] partes = alumno.Split(';');
                    ddlAlumnos.Items.Add(new ListItem(partes[1], partes[0]));
                }

                if (listaAlumnos.Count > 0)
                {
                    bool alumnoConNotasEncontrado = false;
                    foreach (string alumno in listaAlumnos)
                    {
                        string[] partes = alumno.Split(';');
                        int idAlumno = Int32.Parse(partes[0]);

                        aula aulaAlumno = daoServicio.obtenerAulaxIDAlumno(idAlumno);
                        var notasxalumno = daoServicio.listarnotasxalumno(idAlumno);

                        if (notasxalumno != null && notasxalumno.Any())
                        {
                            aula2 = aulaAlumno;
                            alumnoDato = daoServicio.obtenerAlumnoPorID(idAlumno);
                            List<string> notasList = new List<string>(notasxalumno);
                            CargarDatosAlumno(alumnoDato, aula2, notasList);
                            alumnoConNotasEncontrado = true;
                            break;
                        }
                    }

                    if (!alumnoConNotasEncontrado)
                    {
                        ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('Ningún alumno a su cargo tiene notas'); window.location='publicaciones.aspx';", true);
                    }
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay Alumnos registrados a su cargo'); window.location='publicaciones.aspx';", true);
                }
            }
        }

        private void CargarDatosAlumno(alumno alumnoDato, aula aula, List<string> notasxalumno)
        {
            string aulaAlumno = aula.grado.ToString();
            string seccionAlumno = ((char)aula.seccion).ToString();
            lblNombreAlumno.Text = alumnoDato.nombre + " " + alumnoDato.apellidoPaterno + " " + alumnoDato.apellidoMaterno;
            lblAula.Text = aulaAlumno;
            lblSeccion.Text = seccionAlumno;
            lblCorreoAlumno.Text = alumnoDato.correoElectronico;
            lblNivel.Text = aula.nivel == 1 ? "Inicial" : aula.nivel == 2 ? "Primaria" : "-";

            notasAlumno = new BindingList<NotaAlumno>();
            Dictionary<string, NotaAlumno> notasDict = new Dictionary<string, NotaAlumno>();

            foreach (string dato in notasxalumno)
            {
                string[] partes = dato.Split('-');
                if (partes.Length == 3)
                {
                    string curso = partes[0];
                    string criterio = partes[1];
                    string nota = partes[2];

                    string key = curso + "-" + criterio;

                    if (!notasDict.ContainsKey(key))
                    {
                        notasDict[key] = new NotaAlumno { Curso = curso, Criterio = criterio };
                    }

                    NotaAlumno notaAlumno = notasDict[key];

                    if (string.IsNullOrWhiteSpace(notaAlumno.PrimerBimestre))
                    {
                        notaAlumno.PrimerBimestre = nota;
                    }
                    else if (string.IsNullOrWhiteSpace(notaAlumno.SegundoBimestre))
                    {
                        notaAlumno.SegundoBimestre = nota;
                    }
                    else if (string.IsNullOrWhiteSpace(notaAlumno.TercerBimestre))
                    {
                        notaAlumno.TercerBimestre = nota;
                    }
                    else if (string.IsNullOrWhiteSpace(notaAlumno.CuartoBimestre))
                    {
                        notaAlumno.CuartoBimestre = nota;
                    }
                }
            }

            foreach (var nota in notasDict.Values)
            {
                notasAlumno.Add(nota);
            }

            gvNotas.DataSource = notasAlumno;
            gvNotas.DataBind();
        }

        protected void gvNotas_DataBound(object sender, EventArgs e)
        {
            int RowSpan = 2;
            for (int i = gvNotas.Rows.Count - 2; i >= 0; i--)
            {
                GridViewRow currRow = gvNotas.Rows[i];
                GridViewRow prevRow = gvNotas.Rows[i + 1];
                if (currRow.Cells[0].Text == prevRow.Cells[0].Text)
                {
                    currRow.Cells[0].RowSpan = RowSpan;
                    prevRow.Cells[0].Visible = false;
                    RowSpan += 1;
                }
                else
                {
                    RowSpan = 2;
                }
            }
        }

        public class NotaAlumno
        {
            public string Curso { get; set; }
            public string Criterio { get; set; }
            public string Nota { get; set; }
            public string PrimerBimestre { get; set; } = " ";
            public string SegundoBimestre { get; set; } = " ";
            public string TercerBimestre { get; set; } = " ";
            public string CuartoBimestre { get; set; } = " ";
        }

        //protected void ddlAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int idAlumno = Int32.Parse(ddlAlumnos.SelectedValue);
        //    daoServicio = new EduprogWSClient();
        //    if (idAlumno != 0)
        //    {
        //        aula aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
        //        int idAula = aula.idAula;
        //        alumnoDato = new alumno();
        //        alumnoDato = daoServicio.obtenerAlumnoPorID(idAlumno);
        //        string aulaAlumno = aula.grado.ToString();
        //        string seccionAlumno = ((char)aula.seccion).ToString();
        //        lblNombreAlumno.Text = alumnoDato.nombre + " " + alumnoDato.apellidoPaterno + " " + alumnoDato.apellidoMaterno;
        //        lblAula.Text = aulaAlumno;
        //        lblSeccion.Text = seccionAlumno;
        //        lblCorreoAlumno.Text = alumnoDato.correoElectronico;
        //        lblNivel.Text = aula.nivel == 1 ? "Inicial" : aula.nivel == 2 ? "Primaria" : "-";

        //        notasAlumno = new BindingList<NotaAlumno>();
        //        var notasxalumno = daoServicio.listarnotasxalumno(idAlumno);
        //        if (notasxalumno != null && notasxalumno.Any())
        //        {
        //            List<string> notasRecibidas = new List<string>(notasxalumno);
        //            foreach (string dato in notasRecibidas)
        //            {
        //                string[] partes = dato.Split('-');
        //                if (partes.Length == 3)
        //                {
        //                    notasAlumno.Add(new NotaAlumno { Curso = partes[0], Criterio = partes[1], PrimerBimestre = partes[2] });
        //                }
        //            }
        //        }
        //        else
        //        {
        //            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay notas registradas para el alumno'); window.location='publicaciones.aspx';", true);
        //        }

        //        gvNotas.DataSource = notasAlumno;
        //        gvNotas.DataBind();
        //    }
        //}
        protected void ddlAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(ddlAlumnos.SelectedValue);
            daoServicio = new EduprogWSClient();
            if (idAlumno != 0)
            {
                aula aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
                int idAula = aula.idAula;
                alumnoDato = new alumno();
                alumnoDato = daoServicio.obtenerAlumnoPorID(idAlumno);
                string aulaAlumno = aula.grado.ToString();
                string seccionAlumno = ((char)aula.seccion).ToString();
                lblNombreAlumno.Text = alumnoDato.nombre + " " + alumnoDato.apellidoPaterno + " " + alumnoDato.apellidoMaterno;
                lblAula.Text = aulaAlumno;
                lblSeccion.Text = seccionAlumno;
                lblCorreoAlumno.Text = alumnoDato.correoElectronico;
                lblNivel.Text = aula.nivel == 1 ? "Inicial" : aula.nivel == 2 ? "Primaria" : "-";

                notasAlumno = new BindingList<NotaAlumno>();
                var notasxalumno = daoServicio.listarnotasxalumno(idAlumno);
                if (notasxalumno != null && notasxalumno.Any())
                {
                    Dictionary<string, NotaAlumno> notasDict = new Dictionary<string, NotaAlumno>();

                    foreach (string dato in notasxalumno)
                    {
                        string[] partes = dato.Split('-');
                        if (partes.Length == 3)
                        {
                            string curso = partes[0];
                            string criterio = partes[1];
                            string nota = partes[2];

                            string key = curso + "-" + criterio;

                            if (!notasDict.ContainsKey(key))
                            {
                                notasDict[key] = new NotaAlumno { Curso = curso, Criterio = criterio };
                            }

                            NotaAlumno notaAlumno = notasDict[key];

                            if (string.IsNullOrWhiteSpace(notaAlumno.PrimerBimestre))
                            {
                                notaAlumno.PrimerBimestre = nota;
                            }
                            else if (string.IsNullOrWhiteSpace(notaAlumno.SegundoBimestre))
                            {
                                notaAlumno.SegundoBimestre = nota;
                            }
                            else if (string.IsNullOrWhiteSpace(notaAlumno.TercerBimestre))
                            {
                                notaAlumno.TercerBimestre = nota;
                            }
                            else if (string.IsNullOrWhiteSpace(notaAlumno.CuartoBimestre))
                            {
                                notaAlumno.CuartoBimestre = nota;
                            }
                        }
                    }

                    foreach (var nota in notasDict.Values)
                    {
                        notasAlumno.Add(nota);
                    }

                    gvNotas.DataSource = notasAlumno;
                    gvNotas.DataBind();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay notas registradas para el alumno'); window.location='publicaciones.aspx';", true);
                }
            }
        }

    }
}
