using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Docente
{
    public partial class horario : System.Web.UI.Page        
    {
        private EduprogWSClient daoServicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            if (!IsPostBack)
            {
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                if (daoServicio.obtener_horario_idDocente(idUsuario) != null)
                {
                    string base64String = "data:image/jpeg;base64," + Convert.ToBase64String(daoServicio.obtener_horario_idDocente(idUsuario));
                    fotoHorario.Src = base64String;
                }
                else
                {
                    fotoHorario.Src = "../Imágenes/logo.png"; // Imagen por defecto si no hay horario
                }
                fotoHorario.Width = 800;
                fotoHorario.Height = 600;
            }
        }
    }
}