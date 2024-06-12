using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Docente
{
    public partial class mis_notas : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string nombreAlumno = ObtenerNombreAlumno();
                string aulaAlumno = ObtenerAulaAlumno();
                string seccionAlumno = ObtenerSeccionAlumno();
                lblNombre.Text = nombreAlumno;
                lblAula.Text = aulaAlumno;
                lblSeccion.Text = seccionAlumno;
                DataTable dt = new DataTable();
                dt.Columns.AddRange(new DataColumn[]
                {
                    new DataColumn("Curso"),
                    new DataColumn("Criterios"),
                    new DataColumn("1erBimestre"),
                    new DataColumn("2doBimestre"),
                    new DataColumn("3erBimestre"),
                    new DataColumn("4toBimestre")
                });

                // Aquí puedes agregar las filas con los datos correspondientes a cada bimestre y curso

                // Por ejemplo:
                dt.Rows.Add("Matemáticas", "Comprensión matemática", "A", "AD", "", "");
                dt.Rows.Add("Matemáticas", "Resolviendo problemas", "AD", "B", "", "");
                dt.Rows.Add("Matemáticas", "Comprensión matemática2", "A", "AD", "", "");
                dt.Rows.Add("Matemáticas", "Resolviendo problemas2", "AD", "B", "", "");
                dt.Rows.Add("Lengua", "Comprensión matemática3", "A", "AD", "", "");
                dt.Rows.Add("Lengua", "Resolviendo problemas3", "AD", "B", "", "");
                dt.Rows.Add("Lengua", "Comprensión matemática4", "A", "AD", "", "");
                dt.Rows.Add("Lengua", "Resolviendo problemas4", "AD", "B", "", "");
                // Agrega más filas según sea necesario

                gvNotas.DataSource = dt;
                gvNotas.DataBind();
            }
        }

        private string ObtenerSeccionAlumno()
        {
            return "Conejos rabiosos";
        }

        private string ObtenerAulaAlumno()
        {
            return "5";
        }

        private string ObtenerNombreAlumno()
        {
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

        protected void lnkEdit1erBimestre_Click(object sender, EventArgs e)
        {
            // Lógica para abrir el modal de edición del 1er bimestre
        }

        protected void lnkEdit2doBimestre_Click(object sender, EventArgs e)
        {
            // Lógica para abrir el modal de edición del 2do bimestre
        }

        protected void lnkEdit3erBimestre_Click(object sender, EventArgs e)
        {

        }

        protected void lnkEdit4toBimestre_Click(object sender, EventArgs e)
        {

        }

        // Agrega más métodos para los otros bimestres si es necesario


    }
}