using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Data.SqlTypes;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class addCurso : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private curso curso;
        private curso cursoModificar;
        protected void Page_Load(object sender, EventArgs e)
        {
            string accion = (string)Session["accionCurso"];
            if (accion == "editar")
            {
                cursoModificar = (curso)Session["cursoEditar"];
                tituloAddCurso.Text = "Editar Curso";
                txtNombre.Attributes["placeholder"] = cursoModificar.nombreCurso;
                txtDesc.Attributes["placeholder"] = cursoModificar.descripcion;
            }
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminCursos.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            string accion = (string)Session["accionCurso"];
            if (accion == "editar")
            {
                if(txtNombre.Text!="")
                    cursoModificar.nombreCurso = txtNombre.Text;
                if(txtDesc.Text!="")
                    cursoModificar.descripcion=txtDesc.Text;
                if(txtNombre.Text != "" && txtDesc.Text != "")
                    cursoModificar.fechaCreacion = DateTime.Now;
                daoServicio.modificarCurso(cursoModificar);
                Session["cursoEditar"] = null;
                Session["accionCurso"] = null;
            }
            else 
            {
                curso = new curso();
                curso.nombreCurso = txtNombre.Text;
                curso.descripcion = txtDesc.Text;
                curso.fechaCreacion = DateTime.Now;
                curso.fechaCreacionSpecified = true;
                curso.estado = "Activo";
                //int resultado = daoServicio.insertarCurso(curso);
            }
            Response.Redirect("adminCursos.aspx");
        }
    }
}