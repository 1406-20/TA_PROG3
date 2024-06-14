using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class EduprogAdmin : System.Web.UI.MasterPage
    {
        private EduprogWSClient daoServicio;
        private superUsuario admin;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                admin = new superUsuario();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                admin = daoServicio.obtenerUsuarioSUperUsuarioPorID(idUsuario);
                lblNombreAdmin.Text = admin.nombre + " " + admin.apellidoPaterno;
            }
        }
    }
}