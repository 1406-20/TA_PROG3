using Eduprog.Docente;
using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class adminCursos : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<curso> cursos;
        private BindingList<curso> cursosFiltrados;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            cursos= new BindingList<curso>(daoServicio.listarCurso());
            gvCursos.DataSource = cursos;
            gvCursos.DataBind();

        }

        public void registrarCurso_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCurso.aspx");
        }

        public void btnEditarCurso_Click(object sender, EventArgs e)
        {
            int idCurso = Int32.Parse(((LinkButton)sender).CommandArgument);
            curso cursoModificar = new curso();
            foreach (curso curso in cursos)
            {
                if (curso.idCurso == idCurso)
                    cursoModificar = curso;

            }
            Session["accionCurso"] = "editar";
            Session["cursoEditar"] = cursoModificar;
            Response.Redirect("addCurso.aspx");
        }

        public void btnEliminarCurso_Click(object sender, EventArgs e)
        {
            int idCurso = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoServicio = new EduprogWSClient();
            curso cursoEliminar = new curso();
            foreach(curso curso in cursos)
            {
                if (curso.idCurso == idCurso)
                    cursoEliminar = curso;

            }
            cursoEliminar.estado = "Inactivo";
            daoServicio.modificarCurso(cursoEliminar);
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
        }
        protected void gvCursos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvCursos.PageIndex = e.NewPageIndex;
            gvCursos.DataSource = cursos;
            gvCursos.DataBind();
        }

        protected void filtrarCurso(object sender, EventArgs e)
        {
            cursosFiltrados = new BindingList<curso>();
            foreach(curso curso in cursos)
            {
                if (curso.nombreCurso.StartsWith(txtSearchUser.Text))
                {
                    cursosFiltrados.Add(curso);
                }
            }
            gvCursos.DataSource = cursosFiltrados;
            gvCursos.DataBind();
        }
    }
}