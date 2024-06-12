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
        private BindingList<string> cadenas;
        private BindingList<alumno> alumnos;
        private aula aula;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                string nombreAlumno = ObtenerNombreAlumno();
                string aulaAlumno = ObtenerAulaAlumno(idUsuario);
                string seccionAlumno = ObtenerSeccionAlumno(idUsuario);
                lblNombre.Text = nombreAlumno;
                lblAula.Text = aulaAlumno;
                lblSeccion.Text = seccionAlumno;
                notasAlumno = new BindingList<NotaAlumno>();
                daoServicio = new EduprogWSClient();
                List<string> datosDelServicio = daoServicio.listarnotasxalumno(idUsuario).ToList();
                foreach (string dato in datosDelServicio)
                {
                    string[] partes = dato.Split('-');
                    if (partes.Length == 3)
                    {
                        notasAlumno.Add(new NotaAlumno { Curso = partes[0], Criterio = partes[1], PrimerBimestre = partes[2] });

                    }
                }

                // Asignar la lista de notasAlumno al GridView
                gvNotas.DataSource = notasAlumno;
                gvNotas.DataBind();
            }
        }

        private string ObtenerSeccionAlumno(int idAlumno)
        {
            daoServicio = new EduprogWSClient();
            aula = new aula();
            aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
            return aula.seccion.ToString();
        }

        private string ObtenerAulaAlumno(int idAlumno)
        {
            daoServicio = new EduprogWSClient();
            aula = new aula();
            aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
            int seccion = aula.grado;
            return seccion.ToString();
        }
        //Modificado para el 90%
        private string ObtenerNombreAlumno()
        {
            int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(daoServicio.listarTodosAlumnos().ToList());
            foreach (alumno al in alumnos)
            {
                if (al.idAlumno == idUsuario) return al.nombre + " " + al.apellidoPaterno + " " + al.apellidoMaterno;
            }
            return "Tommy Velarde";
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
            public string Nota { get; set; }
            public string PrimerBimestre { get; set; } = " ";
            public string SegundoBimestre { get; set; } = " ";
            public string TercerBimestre { get; set; } = " ";
            public string CuartoBimestre { get; set; } = " ";
        }
    }
}