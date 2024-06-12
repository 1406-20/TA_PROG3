using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EduprogAdmin
{
    public partial class addSalon : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<docente> docentes;
        private BindingList<alumno> alumnos;
        private BindingList<alumno> listaAlumnos;
        private aula salon = new aula();
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            docentes = new BindingList<docente>(
                daoServicio.listarTodosDocentes().ToList());
            if (!IsPostBack)
            {
                alumno[] auxLista = daoServicio.listarAlumnosSinSalon();
                if (auxLista != null)
                    listaAlumnos = new BindingList<alumno>(auxLista.ToList());
                else
                    listaAlumnos = new BindingList<alumno>();
                Session["ListadoAlumnos"] = listaAlumnos;
                Session["alumno"] = null;
                if (Session["aulaAModificar"] != null)
                {
                    salon = (aula)Session["aulaAModificar"];
                    tituloAddSalon.Text = "Modificar Salón";
                    dlNivel.SelectedValue = salon.nivel.ToString();
                    dlNivel.Enabled = false;
                    dlGrado.SelectedValue = salon.grado.ToString();
                    dlGrado.Enabled = false;
                    dlSeccion.SelectedValue = (Convert.ToChar(salon.seccion)).ToString();
                    dlSeccion.Enabled = false;
                    txtNombreTutor.Attributes["placeholder"] = salon.tutor.nombre + " " +
                        salon.tutor.apellidoPaterno + " " + salon.tutor.apellidoMaterno;
                    Session["foto"] = salon.foto;
                    Session["horario"] = salon.horario;
                    Session["tutor"] = (docente)salon.tutor;
                    alumno[] auxAlumnos = daoServicio.listarAlumnosEnAula(salon.idAula);
                    if (auxAlumnos != null)
                        alumnos = new BindingList<alumno>(auxAlumnos.ToList());
                    else
                        alumnos = new BindingList<alumno>();
                    gvAlumnos.DataSource = alumnos;
                    gvAlumnos.DataBind();
                    Session["alumnosSalon"] = alumnos;
                    if (salon.foto != null)
                        imagenAula.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(salon.foto);
                }
            }
            else
            {
                alumnos = ((BindingList<alumno>)Session["alumnosSalon"]);
                listaAlumnos = ((BindingList<alumno>)Session["ListadoAlumnos"]);
            }

        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Session["aulaAModificar"] = null;
            Response.Redirect("Salones.aspx");
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

            daoServicio = new EduprogWSClient();
            if (Session["aulaAModificar"] != null)
                salon.idAula = ((aula)Session["aulaAModificar"]).idAula;
            salon.anhoEscolar = new anhoEscolar();
            salon.anhoEscolar.anho = 1;
            salon.tutor = (docente)Session["tutor"];
            salon.grado = Int32.Parse(dlGrado.Text);
            salon.nivel = Int32.Parse(dlNivel.SelectedValue);
            salon.seccion = (dlSeccion.Text).ElementAt(0);
            byte[] foto = (byte[])Session["foto"];
            byte[] horario = (byte[])Session["horario"];
            salon.foto = foto;
            salon.horario = horario;
            if (alumnos != null)
                salon.alumnos = alumnos.ToArray();
            else
                salon.alumnos = null;
            int resultado = 0;
            if (Session["aulaAModificar"] != null)
                resultado = daoServicio.modificarAula((aula)salon, (byte[])salon.foto, (byte[])salon.horario);
            else
                resultado = daoServicio.insertarAula(salon);

            if (resultado != 0)
            {
                Response.Write("Se ha registrado con exito...");
                Response.Redirect("Salones.aspx");
            }
        }

        protected void btnBuscarTutor_Click(object sender, EventArgs e)
        {
            //string script = "window.onload = function() { showModalFormTutor(e) };";
            //ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }

        protected void btnBuscarTutorModal_Click(object sender, EventArgs e)
        {
            gvDocentesModal.DataSource = docentes;
            gvDocentesModal.DataBind();
        }

        protected void gvDocentesModal_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvDocentesModal.PageIndex = e.NewPageIndex;
            gvDocentesModal.DataSource = docentes;
            gvDocentesModal.DataBind();
        }

        protected void btnSeleccionarTutorModal_Click(object sender, EventArgs e)
        {
            int idTutor = Int32.Parse(((LinkButton)sender).CommandArgument);
            docente docenteSeleccionado = docentes.SingleOrDefault(x => x.idDocente == idTutor);
            Session["tutor"] = docenteSeleccionado;
            txtNombreTutor.Text = docenteSeleccionado.nombre + " " + docenteSeleccionado.apellidoPaterno + " " + docenteSeleccionado.apellidoMaterno;
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
            string script = "document.getElementById('campoTutor').style.display='block';";
            ClientScript.RegisterStartupScript(GetType(), "", script, true);
        }

        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            //Verificar si se seleccionó un archivo
            if (fileUploadFoto.HasFile)
            {
                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fileUploadFoto.FileName);
                // Verificar si el archivo es una imagen
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    // Guardar la imagen en el servidor
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadFoto.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    imagenAula.ImageUrl = "~/Uploads/" + filename;
                    imagenAula.Visible = true;
                    // Guardamos la referencia en una variable de sesión llamada foto
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["foto"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    // Mostrar un mensaje de error si el archivo no es una imagen
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
            else
            {
                // Mostrar un mensaje de error si no se seleccionó ningún archivo
                Response.Write("Por favor, selecciona un archivo de imagen.");
            }
        }

        protected void btnSubirHorario_Click(object sender, EventArgs e)
        {
            //Verificar si se seleccionó un archivo
            if (fileUploadHorario.HasFile)
            {
                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fileUploadHorario.FileName);
                // Verificar si el archivo es una imagen
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    // Guardar la imagen en el servidor
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadHorario.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    // Guardamos la referencia en una variable de sesión llamada horario
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["horario"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    // Mostrar un mensaje de error si el archivo no es una imagen
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
            else
            {
                // Mostrar un mensaje de error si no se seleccionó ningún archivo
                Response.Write("Por favor, selecciona un archivo de imagen.");
            }
        }

        protected void lbAgregarAlumno_Click(object sender, EventArgs e)
        {
            if (Session["alumno"] == null)
            {
                Response.Write("No puede añadir sin haber seleccionado un alumno...");
                return;
            }
            alumno alumnoAula = (alumno)Session["alumno"];
            if (alumnos == null)
                alumnos = new BindingList<alumno>();
            alumnos.Add(alumnoAula);
            listaAlumnos.Remove(listaAlumnos.First(x => x.idUsuario == alumnoAula.idUsuario));
            gvAlumnosModal.DataBind();
            Session["alumnosSalon"] = alumnos;
            gvAlumnos.DataSource = alumnos;
            gvAlumnos.DataBind();
            txtNombreAlumno.Text = "";
        }

        protected void btnEliminarAlumno_Click(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(((LinkButton)sender).CommandArgument);
            foreach (alumno alumno in alumnos)
            {
                int cont = 0;
                if (alumno.idAlumno == idAlumno)
                {
                    alumnos.RemoveAt(cont);
                    listaAlumnos.Add(alumno);
                    gvAlumnosModal.DataBind();
                    break;
                }
                cont++;
            }
            Session["alumnosSalon"] = alumnos;
            gvAlumnos.DataSource = alumnos;
            gvAlumnos.DataBind();
        }

        protected void btnBuscarAlumnoModal_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            gvAlumnosModal.DataSource = listaAlumnos;
            gvAlumnosModal.DataBind();
        }

        protected void gvAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAlumnosModal.PageIndex = e.NewPageIndex;
            gvAlumnosModal.DataSource = listaAlumnos;
            gvAlumnosModal.DataBind();
        }

        protected void btnSeleccionarAlumnoModal_Click(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(((LinkButton)sender).CommandArgument);
            alumno alumnoSeleccionado = listaAlumnos.SingleOrDefault(x => x.idAlumno == idAlumno);
            Session["alumno"] = alumnoSeleccionado;
            txtNombreAlumno.Text = alumnoSeleccionado.nombre + " " + alumnoSeleccionado.apellidoPaterno + " " + alumnoSeleccionado.apellidoMaterno;
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
        }

    }
}