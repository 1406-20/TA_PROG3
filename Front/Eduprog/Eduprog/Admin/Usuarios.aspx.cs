using Eduprog.Docente;
using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class Usuarios : System.Web.UI.Page
    {

        private EduprogWSClient daoServicio;
        private BindingList<alumno> alumnos;
        private BindingList<docente> docentes;
        private BindingList<trabajador> trabajadores;
        private BindingList<superUsuario> superUsuarios;
        private BindingList<apoderado> apoderados;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio=new EduprogWSClient();
            if (rbAlumno.Checked == true)
                alumnos = new BindingList<alumno>(daoServicio.listarTodosAlumnos().ToList());
            if (!IsPostBack)
            {
                gvUsuarios.DataSource = alumnos;
                gvUsuarios.DataBind();
            }
            if (rbApoderado.Checked == true)
                apoderados = new BindingList<apoderado>(daoServicio.listarTodosApoderados().ToList());
            if (rbDocente.Checked == true)
                docentes = new BindingList<docente>(daoServicio.listarTodosDocentes().ToList());
            if (rbPersonal.Checked == true)
                trabajadores = new BindingList<trabajador>(daoServicio.listarTodosTrabajadores().ToList());
            if (rbAdministrador.Checked == true)
                superUsuarios = new BindingList<superUsuario>(daoServicio.listarTodosSuperusuarios().ToList());
            
        }

        protected void listarAlumno_click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            gvUsuarios.DataSource = alumnos;
            gvUsuarios.DataBind();
        }

        protected void listarApoderado_click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            
            gvUsuarios.DataSource = apoderados;
            gvUsuarios.DataBind();
        }

        protected void listarDocente_click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            
            gvUsuarios.DataSource = docentes;
            gvUsuarios.DataBind();
        }

        protected void listarTrabajador_click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            gvUsuarios.DataSource = trabajadores;
            gvUsuarios.DataBind();
        }

        protected void listarSuperusuario_click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            gvUsuarios.DataSource = superUsuarios;
            gvUsuarios.DataBind();
        }

        protected void registrarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("addUser.aspx");
        }

        protected void modificarUsuario_Click(object sender, EventArgs e)
        {
            int idUsuario = Int32.Parse(((LinkButton)sender).CommandArgument);

            if (rbAlumno.Checked == true)
            {
                foreach (alumno usuario in alumnos)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAModificar"] = usuario;
                }
                Session["modificarUsuario"] = "alumno";
            }
            if (rbApoderado.Checked == true)
            {
                foreach(apoderado usuario in apoderados)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAModificar"] = usuario;
                }
                Session["modificarUsuario"] = "apoderado";
            }
            if (rbDocente.Checked == true)
            {
                foreach (docente usuario in docentes)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAModificar"] = usuario;
                }
                Session["modificarUsuario"] = "docente";
            }
            if (rbPersonal.Checked == true)
            {
                foreach (trabajador usuario in trabajadores)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAModificar"] = usuario;
                }
                Session["modificarUsuario"] = "trabajador";
            }
            if (rbAdministrador.Checked == true)
            {
                foreach (superUsuario usuario in superUsuarios)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAModificar"] = usuario;
                }
                Session["modificarUsuario"] = "superusuario";
            }
            
            Response.Redirect("addUser.aspx");
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            int idUsuario = Int32.Parse(((LinkButton)sender).CommandArgument);
            daoServicio = new EduprogWSClient();
            if (rbAlumno.Checked == true)
            {
                int resultado=daoServicio.eliminarAlumno(idUsuario);
            }
            if (rbApoderado.Checked == true)
            {
                int resultado = daoServicio.eliminarApoderado(idUsuario);
            }
            if (rbDocente.Checked == true)
            {
                int resultado = daoServicio.eliminarDocente(idUsuario);
            }
            if (rbPersonal.Checked == true)
            {
                int resultado = daoServicio.eliminarTrabajador(idUsuario);
            }
            if (rbAdministrador.Checked == true)
            {
                int resultado = daoServicio.eliminarSuperusuario(idUsuario);
            }
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
        }

        protected void mostrar_Click(object sender, EventArgs e)
        {
            int idUsuario = Int32.Parse(((LinkButton)sender).CommandArgument);

            if (rbAlumno.Checked == true)
            {
                foreach (alumno usuario in alumnos)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAMostrar"] = usuario;
                }
                Session["mostrarUsuario"] = "alumno";
            }
            if (rbApoderado.Checked == true)
            {
                foreach (apoderado usuario in apoderados)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAMostrar"] = usuario;
                }
                Session["mostrarUsuario"] = "apoderado";
            }
            if (rbDocente.Checked == true)
            {
                foreach (docente usuario in docentes)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAMostrar"] = usuario;
                }
                Session["mostrarUsuario"] = "docente";
            }
            if (rbPersonal.Checked == true)
            {
                foreach (trabajador usuario in trabajadores)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAMostrar"] = usuario;
                }
                Session["mostrarUsuario"] = "trabajador";
            }
            if (rbAdministrador.Checked == true)
            {
                foreach (superUsuario usuario in superUsuarios)
                {
                    if (usuario.idUsuario == idUsuario)
                        Session["usuarioAMostrar"] = usuario;
                }
                Session["mostrarUsuario"] = "superusuario";
            }

            Response.Redirect("addUser.aspx");
        }

        protected void gvUsuarios_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsuarios.PageIndex = e.NewPageIndex;
            if (rbAlumno.Checked == true)
            {
                gvUsuarios.DataSource = alumnos;
            }
            if (rbApoderado.Checked == true)
            {
                gvUsuarios.DataSource = apoderados;
            }
            if (rbDocente.Checked == true)
            {
                gvUsuarios.DataSource = docentes;
            }
            if (rbPersonal.Checked == true)
            {
                gvUsuarios.DataSource = trabajadores;
            }
            if (rbAdministrador.Checked == true)
            {
                gvUsuarios.DataSource = superUsuarios;
            }
            gvUsuarios.DataBind();
        }

    }
}