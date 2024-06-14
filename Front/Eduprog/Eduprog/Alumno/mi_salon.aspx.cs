using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class mi_salon : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<alumno> alumnos;
        private BindingList<alumno> alumnosXAula;
        private BindingList<docente> profesores;
        private BindingList<int> idsAlumnosXAula;
        private BindingList<aula> aulas;
        private aula aula = new aula();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                daoServicio = new EduprogWSClient();
                int idUsuario = Int32.Parse(Session["idUsuarioActivo"].ToString());
                aula = daoServicio.obtenerAulaxIDAlumno(idUsuario);
                int idAula = aula.idAula;


                alumnos = new BindingList<alumno>(daoServicio.listarTodosAlumnos());
                idsAlumnosXAula = new BindingList<int>(daoServicio.listarAlumnossAulasXId(idAula));
                alumnosXAula = new BindingList<alumno>();
                foreach (alumno alumno in alumnos)
                    foreach (int id in idsAlumnosXAula)
                        if (id == alumno.idAlumno)
                            alumnosXAula.Add(alumno);

                aulas = new BindingList<aula>(daoServicio.listarTodasAulas());
                foreach (aula aux in aulas)
                    if (aux.idAula == idAula)
                        aula = aux;

                profesores = new BindingList<docente>(daoServicio.listarTodosDocentes());
                docente profesorAula = new docente();
                foreach (docente profesor in profesores)
                    if (profesor.idDocente == aula.tutor.idDocente)
                        profesorAula = profesor;
                if (profesorAula.foto != null)
                {
                    string base64String = "data:image/jpeg;base64," + Convert.ToBase64String(profesorAula.foto);
                    fotoProfesor.Src = base64String;
                }

                lblNombreTutor.Text = profesorAula.nombre + " " + profesorAula.apellidoPaterno + " " + profesorAula.apellidoMaterno;
                lblCorreoTutor.Text = profesorAula.correoElectronico;

                lblAula.Text = aula.grado.ToString();
                lblSeccion.Text = ((char)aula.seccion).ToString();
                if (aula.nivel == 1) lblNivel.Text = "Inicial";
                else
                   if (aula.nivel == 2) lblNivel.Text = "Primaria";
                else
                    lblNivel.Text = "-";
                lstMiSalon.DataSource = alumnosXAula;
                lstMiSalon.DataBind();
            }
        }

        protected void lstMiSalon_DataBound(object sender, EventArgs e)
        {
            int cantidadResultados = lstMiSalon.Rows.Count;
            lblResultados.Text = cantidadResultados.ToString();
        }
    }
}