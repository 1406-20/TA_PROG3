using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class EduprogUsuarioAdministrativo : System.Web.UI.MasterPage
    {
        private EduprogWSClient daoServicio;
        private trabajador trabajador;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                trabajador = new trabajador();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                trabajador = daoServicio.obtenerUsuarioTrabajadorPorID(idUsuario);
                lblNombreAdministra.Text = trabajador.nombre + " " + trabajador.apellidoPaterno;
            }
        }
    }
}