using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Apoderado
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
                int idAula = 0;
                int idPrimerAlumno = 0;

                List<string> listaAlumnos = new List<string>(daoServicio.listarAlumnosApoderado(idUsuario));
                foreach (string alumno in listaAlumnos)
                {
                    string[] partes = alumno.Split(';');
                    ddlAlumnos.Items.Add(new ListItem(partes[1], partes[0]));
                }

                if (listaAlumnos.Count > 0)
                {
                    string[] primerAlumno = listaAlumnos[0].Split(';');
                    idPrimerAlumno = Int32.Parse(primerAlumno[0]);
                    aula aulaPrimerAlumno = daoServicio.obtenerAulaxIDAlumno(idPrimerAlumno);
                    idAula = aulaPrimerAlumno.idAula;
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertMessage", "alert('No hay Alumnos registrados a su cargo'); window.location='publicaciones.aspx';", true);
                }
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
                else
                {
                    fotoProfesor.Src = "../Imágenes/profesor.png"; // Imagen por defecto si no hay horario
                }

                lblNombreTutor.Text = profesorAula.nombre + " " + profesorAula.apellidoPaterno + " " + profesorAula.apellidoMaterno;
                lblCorreoTutor.Text = profesorAula.correoElectronico;

                if (aula.nivel == 1) lblNivel.Text = "Inicial";
                else
                   if (aula.nivel == 2) lblNivel.Text = "Primaria";
                else
                    lblNivel.Text = "-";

                lblAula.Text = aula.grado.ToString();
                lblSeccion.Text = ((char)aula.seccion).ToString();
                lstMiSalon.DataSource = alumnosXAula;
                lstMiSalon.DataBind();
            }
        }

        protected void lstMiSalon_DataBound(object sender, EventArgs e)
        {
            int cantidadResultados = lstMiSalon.Rows.Count;
            lblResultados.Text = cantidadResultados.ToString();
        }

        protected void ddlAlumnos_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(ddlAlumnos.SelectedValue);
            daoServicio = new EduprogWSClient();
            if (idAlumno != 0)
            {
                aula aula = daoServicio.obtenerAulaxIDAlumno(idAlumno);
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
                else
                {
                    fotoProfesor.Src = "../Imágenes/profesor.png"; // Imagen por defecto si no hay horario
                }

                lblNombreTutor.Text = profesorAula.nombre + " " + profesorAula.apellidoPaterno + " " + profesorAula.apellidoMaterno;
                lblCorreoTutor.Text = profesorAula.correoElectronico;

                if (aula.nivel == 1) lblNivel.Text = "Inicial";
                else
                   if (aula.nivel == 2) lblNivel.Text = "Primaria";
                else
                    lblNivel.Text = "-";

                lblAula.Text = aula.grado.ToString();
                lblSeccion.Text = ((char)aula.seccion).ToString();
                lstMiSalon.DataSource = alumnosXAula;
                lstMiSalon.DataBind();

            }
        }
    }
}