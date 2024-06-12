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
    public partial class Profesores : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<docente> listaDocentes;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                daoServicio = new EduprogWSClient();
                listaDocentes= new BindingList<docente>(daoServicio.listarTodosDocentes());
                rptProfesores.DataSource = listaDocentes;
                rptProfesores.DataBind();
            }
        }


        private class Profesor
        {
            private string nombre;
            private string correo;

            public Profesor(string nombre, string correo)
            {
                this.Nombre = nombre;
                this.Correo = correo;
            }

            public string Nombre { get => nombre; set => nombre = value; }
            public string Correo { get => correo; set => correo = value; }
        }
    }
}