using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Alumno
{
    public partial class mis_notas : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<NotaAlumno> notasAlumno;
        private BindingList<alumno> alumnos;
        private aula aula;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                daoServicio = new EduprogWSClient();
                aula = daoServicio.obtenerAulaxIDAlumno(idUsuario);

                string nombreAlumno = ObtenerNombreAlumno(idUsuario);
                lblNombreAlumno.Text = nombreAlumno;
                lblAula.Text = aula.grado.ToString();
                lblSeccion.Text = ((char)aula.seccion).ToString();
                lblCorreoAlumno.Text = ObtenerCorreoAlumno(idUsuario);

                lblNivel.Text = aula.nivel == 1 ? "Inicial" : aula.nivel == 2 ? "Primaria" : "-";

                notasAlumno = new BindingList<NotaAlumno>();
                var notasxalumno = daoServicio.listarnotasxalumno(idUsuario);

                if (notasxalumno != null && notasxalumno.Any())
                {
                    List<string> notasRecibidas = notasxalumno.ToList();
                    ProcesarNotas(notasRecibidas);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay notas registradas para el alumno'); window.location='publicaciones.aspx';", true);
                }

                gvNotas.DataSource = notasAlumno;
                gvNotas.DataBind();
            }
        }

        private void ProcesarNotas(List<string> notasRecibidas)
        {
            foreach (string dato in notasRecibidas)
            {
                string[] partes = dato.Split('-');
                if (partes.Length == 3)
                {
                    string curso = partes[0];
                    string criterio = partes[1];
                    string nota = partes[2];

                    var notaAlumno = notasAlumno.FirstOrDefault(n => n.Curso == curso && n.Criterio == criterio);

                    if (notaAlumno == null)
                    {
                        notaAlumno = new NotaAlumno { Curso = curso, Criterio = criterio };
                        notasAlumno.Add(notaAlumno);
                    }

                    if (string.IsNullOrWhiteSpace(notaAlumno.PrimerBimestre))
                        notaAlumno.PrimerBimestre = nota;
                    else if (string.IsNullOrWhiteSpace(notaAlumno.SegundoBimestre))
                        notaAlumno.SegundoBimestre = nota;
                    else if (string.IsNullOrWhiteSpace(notaAlumno.TercerBimestre))
                        notaAlumno.TercerBimestre = nota;
                    else if (string.IsNullOrWhiteSpace(notaAlumno.CuartoBimestre))
                        notaAlumno.CuartoBimestre = nota;
                }
            }
        }

        private string ObtenerNombreAlumno(int idUsuario)
        {
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(daoServicio.listarTodosAlumnos().ToList());
            var alumno = alumnos.FirstOrDefault(al => al.idAlumno == idUsuario);
            return alumno != null ? $"{alumno.nombre} {alumno.apellidoPaterno} {alumno.apellidoMaterno}" : "Sin nombre registrado";
        }

        private string ObtenerCorreoAlumno(int idUsuario)
        {
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(daoServicio.listarTodosAlumnos().ToList());
            var alumno = alumnos.FirstOrDefault(al => al.idAlumno == idUsuario);
            return alumno != null ? alumno.correoElectronico : "Sin nombre registrado";
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
                    RowSpan = 2;
            }
        }

        public class NotaAlumno
        {
            public string Curso { get; set; }
            public string Criterio { get; set; }
            public string PrimerBimestre { get; set; } = " ";
            public string SegundoBimestre { get; set; } = " ";
            public string TercerBimestre { get; set; } = " ";
            public string CuartoBimestre { get; set; } = " ";
        }
    }
}
