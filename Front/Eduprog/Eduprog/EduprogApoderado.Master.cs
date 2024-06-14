using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class EduprogApoderado : System.Web.UI.MasterPage
    {
        private EduprogWSClient daoServicio;
        private apoderado apoderado;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                apoderado = new apoderado();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                apoderado = daoServicio.obtenerApoderadoPorID(idUsuario);
                lblNombreApoderado.Text = apoderado.nombre + " " + apoderado.apellidoPaterno;
            }
        }
    }
}