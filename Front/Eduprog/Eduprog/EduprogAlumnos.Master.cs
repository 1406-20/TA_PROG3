using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class EduprogAlumnos : System.Web.UI.MasterPage
    {
        private EduprogWSClient daoServicio;
        private alumno alumno;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                alumno = new alumno();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                alumno = daoServicio.obtenerAlumnoPorID(idUsuario);                               
                lblNombreAlumno.Text = alumno.nombre + " " + alumno.apellidoPaterno;
            }
        }
    }
}