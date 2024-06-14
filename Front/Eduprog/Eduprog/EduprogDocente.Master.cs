using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class EduprogDocente : System.Web.UI.MasterPage
    {
        private EduprogWSClient daoServicio;
        private docente profesor;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                profesor = new docente();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                profesor = daoServicio.obtenerDocentePorID(idUsuario);
                lblNombreProfesor.Text = profesor.nombre + " " + profesor.apellidoPaterno;
            }
        }
    }
}