using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Docente
{
    public partial class GestionarIncidencia : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<alumno> alumnos;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(
                    daoServicio.listarTodosAlumnos().ToList());
            if (!IsPostBack)
            {
                dtpFechaNacimiento.Text = DateTime.Now.ToString("yyyy-MM-ddTHH:mm");
            }
        }


        private incidencia ObtenerTipoIncidenciaSeleccionada()
        {
            if (rbAtencionMedica.Checked)
            {

                return new atencionMedica();
            }
            else if (rbMerito.Checked)
            {

                return new merito();
            }
            else if (rbDemerito.Checked)
            {

                return new demerito();
            }
            else
            {
                // Puedes manejar el caso cuando ningún radio button está seleccionado según tu lógica
                return null;
            }
        }

        protected void btnInsertarIncidencia_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            incidencia inciden;//= ObtenerTipoIncidenciaSeleccionada();

            string alumno = TextBox5.Text;

            string fechaHora = dtpFechaNacimiento.Text;
            string diagnostico = txtDianostico.Text;
            string tratamiento = txtTratamiento.Text;
            string comentarios = comAdicional.Text;
            int insercionExitosa = 0, id, idDocente = int.Parse((string)Session["idUsuarioActivo"]);
            /*
            inciden.docenteRegistro = 1;
            inciden.estado = 1;
            inciden.fechaRegistro = DateTime.Parse(fechaHora);
            inciden.descripcion = comentarios;*/

            if (rbAtencionMedica.Checked)
            {
                inciden = new atencionMedica();
                id = ((alumno)Session["alumno"]).idAlumno;
                ((atencionMedica)inciden).docenteRegistro = idDocente;
                ((atencionMedica)inciden).estado = 1;
                ((atencionMedica)inciden).fechaRegistro = DateTime.Now;
                ((atencionMedica)inciden).fechaRegistroSpecified = true;
                ((atencionMedica)inciden).descripcion = comentarios;
                ((atencionMedica)inciden).tipoAtencion = "A";
                ((atencionMedica)inciden).diagnostico = diagnostico;
                ((atencionMedica)inciden).tratamiento = tratamiento;
                ((atencionMedica)inciden).tipo = 'A';
                ((atencionMedica)inciden).hora = DateTime.Now;
                ((atencionMedica)inciden).idAlumno = id;

                insercionExitosa = daoServicio.insertarAtencionMedica(((atencionMedica)inciden), id);

            }
            else if (rbMerito.Checked)
            {
                inciden = new merito();
                id = ((alumno)Session["alumno"]).idAlumno;
                inciden.docenteRegistro = idDocente;
                inciden.estado = 1;
                inciden.fechaRegistro = DateTime.Now;
                inciden.fechaRegistroSpecified = true;
                inciden.descripcion = comentarios;
                ((merito)inciden).comentario = comentarios;
                ((merito)inciden).idAlumno = id;
                ((merito)inciden).tipo = 'M';

                insercionExitosa = daoServicio.insertarMerito(((merito)inciden), id);
            }
            else if (rbDemerito.Checked)
            {
                inciden = new demerito();
                id = ((alumno)Session["alumno"]).idAlumno;
                inciden.docenteRegistro = idDocente;
                inciden.estado = 1;
                inciden.fechaRegistro = DateTime.Now;
                inciden.fechaRegistroSpecified = true;
                inciden.descripcion = comentarios;
                ((demerito)inciden).tipo = 'D';
                ((demerito)inciden).comentario = comentarios;
                ((demerito)inciden).idAlumno = id;

                insercionExitosa = daoServicio.insertarDemerito(((demerito)inciden), id);
            }
            /*
            int insercionExitosa = daoServicio.insertarAtencionMedica(inciden, 1);//true/*InsertarEnBD(alumno, tipoIncidencia, fechaHora, diagnostico, tratamiento, comentarios)*/;
            if (insercionExitosa != 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "insertSuccessScript", "mostrarMensajeExito();", true);
            }
        }

        protected void btnBuscarAlumnoModal_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(
                    daoServicio.listarTodosAlumnos().ToList());
            gvAlumnosModal.DataSource = alumnos;
            gvAlumnosModal.DataBind();
        }

        protected void gvAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAlumnosModal.PageIndex = e.NewPageIndex;
            gvAlumnosModal.DataSource = alumnos;
            gvAlumnosModal.DataBind();
        }

        protected void btnSeleccionarAlumnoModal_Click(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(((LinkButton)sender).CommandArgument);
            alumno alumnoSeleccionado = alumnos.SingleOrDefault(x => x.idAlumno == idAlumno);
            Session["alumno"] = alumnoSeleccionado;
            TextBox5.Text = alumnoSeleccionado.nombre + " " + alumnoSeleccionado.apellidoPaterno + " " + alumnoSeleccionado.apellidoMaterno;
            TextBox5.Enabled = false;
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
        }
    }
}