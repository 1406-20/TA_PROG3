using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Apoderado
{
    public partial class horario : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                List<string> listaAlumnos = new List<string>(daoServicio.listarAlumnosApoderado(idUsuario));
                foreach (string alumno in listaAlumnos)
                {
                    string[] partes = alumno.Split(';');
                    ddlAlumnos.Items.Add(new ListItem(partes[1], partes[0]));
                }

                // Establecer la imagen por defecto usando el primer elemento de listaAlumnos
                if (listaAlumnos.Count > 0)
                {
                    string[] primerAlumno = listaAlumnos[0].Split(';');
                    int idPrimerAlumno = Int32.Parse(primerAlumno[0]);
                    aula aulaPrimerAlumno = daoServicio.obtenerAulaxIDAlumno(idPrimerAlumno);
                    if (aulaPrimerAlumno.horario != null)
                    {
                        string base64String = "data:image/jpeg;base64," + Convert.ToBase64String(aulaPrimerAlumno.horario);
                        fotoHorario.Src = base64String;
                    }
                    else
                    {
                        fotoHorario.Src = "../Imágenes/Bauhaus-Dessau_main_building.jpg"; // Imagen por defecto si no hay horario
                    }
                }


                fotoHorario.Width = (800);
                fotoHorario.Height = (600);
            }
        }

        protected void ddlAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(ddlAlumnos.SelectedValue);
            daoServicio = new EduprogWSClient();
            if (idAlumno != 0)
            {
                aula aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
                if (aula.horario != null)
                {
                    string base64String = "data:image/jpeg;base64," + Convert.ToBase64String(aula.horario);
                    fotoHorario.Src = base64String;
                }
                else
                {
                    fotoHorario.Src = "../Imágenes/Bauhaus-Dessau_main_building.jpg"; // Imagen por defecto si no hay horario
                }
            }
        }
    }
}