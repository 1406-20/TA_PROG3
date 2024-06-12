using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Alumno
{
    public partial class horario : System.Web.UI.Page
    {
        private aula aula = new aula();
        private EduprogWSClient daoServicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
            daoServicio = new EduprogWSClient();
            aula = daoServicio.obtenerAulaxIDAlumno(idUsuario);
            if (aula.horario != null)
            {
                string base64String = "data:image/jpeg;base64," + Convert.ToBase64String(aula.horario);
                fotoHorario.Src = base64String;
            }

        }
    }
}