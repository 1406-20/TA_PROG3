using Eduprog;
using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Collections.Specialized.BitVector32;

namespace EduprogAdmin
{

    public partial class Salones : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<aula> aulas;
        private docente tutorSalon;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            aula[] aux = daoServicio.listarTodasAulas();
            if (aux != null)
                aulas = new BindingList<aula>(aux.ToList());
            gvSalones.DataSource = aulas;
            gvSalones.DataBind();
        }

        protected void registrarSalon_Click(object sender, EventArgs e)
        {
            Response.Redirect("addSalon.aspx");
        }

        protected void gvSalones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvSalones.PageIndex = e.NewPageIndex;
            gvSalones.DataSource = aulas;
            gvSalones.DataBind();
        }

        protected String ConvertirNivel(object nivel)
        {
            string nombre = "-";
            int numero;
            int.TryParse(nivel.ToString(), out numero);
            switch (numero)
            {
                case 1:
                    nombre = "Inicial";
                    break;
                case 2:
                    nombre = "Primaria";
                    break;
                case 3:
                    nombre = "Secundaria";
                    break;
            }
            return nombre;
        }

        protected void eliminar_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string[] arg = new string[3];
            arg = btn.CommandArgument.ToString().Split(';');
            int nivel; int grado; int seccion;
            Int32.TryParse(arg[0], out nivel);
            Int32.TryParse(arg[1], out grado);
            int.TryParse(arg[2], out seccion);
            daoServicio.eliminarAula(grado, ((char)seccion), nivel);
            Response.Redirect("Salones.aspx");
        }

        protected string ConvertirSeccion(object seccion, object grado)
        {
            if (seccion == null || seccion == DBNull.Value)
            {
                return "-";
            }

            int asciiCode;
            if (int.TryParse(seccion.ToString(), out asciiCode))
            {
                return grado.ToString() + ((char)asciiCode).ToString();
            }

            return grado.ToString() + seccion.ToString();
        }

        protected string obtenerNombreTutor(object tutor)
        {
            string nombre = "-";
            docente tutorAula = (docente)tutor;
            if (tutor != null)
            {

                nombre = tutorAula.apellidoPaterno + " " + tutorAula.apellidoMaterno +
                    ", " + tutorAula.nombre;
            }
            return nombre;
        }

        protected void modificarSalon_Click(object sender, EventArgs e)
        {
            int idSalon = Int32.Parse(((LinkButton)sender).CommandArgument);

            foreach (aula salon in aulas)
            {
                if (salon.idAula == idSalon)
                    Session["aulaAModificar"] = salon;
            }

            Response.Redirect("addSalon.aspx");
        }
    }
}