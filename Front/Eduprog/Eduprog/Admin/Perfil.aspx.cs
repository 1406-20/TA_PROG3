using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.Admin
{
    public partial class Perfil : System.Web.UI.Page
    {
        private int idUsuario;
        private string tipoUsuario;
        private usuario usuario;

        private EduprogWSClient daoServicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            idUsuario = int.Parse((string)Session["idUsuarioActivo"]);
            tipoUsuario = (string)Session["tipoUsuarioActivo"];
            lbFoto.Attributes.Add("onclick", "document.getElementById('" + fileFoto.ClientID + "').click();return false;");
            switch (tipoUsuario)
            {
                case "apoderado":
                    usuario = new apoderado();
                    usuario = daoServicio.obtenerApoderadoPorID(idUsuario);
                    break;
                case "alumno":
                    usuario = new alumno();
                    usuario = daoServicio.obtenerAlumnoPorID(idUsuario);
                    break;
                case "docente":
                    usuario = new docente();
                    usuario = daoServicio.obtenerDocentePorID(idUsuario);
                    break;
                case "trabajador":
                    usuario = new trabajador();
                    usuario = daoServicio.obtenerUsuarioTrabajadorPorID(idUsuario);
                    break;
                case "superusuario":
                    usuario = new superUsuario();
                    usuario = daoServicio.obtenerUsuarioSUperUsuarioPorID(idUsuario);
                    break;
            }
            if (!IsPostBack)
            {
                txtNombre.Text = usuario.nombre;
                txtPaterno.Text = usuario.apellidoPaterno;
                txtMaterno.Text = usuario.apellidoMaterno;
                txtCorreo.Text = usuario.correoElectronico;
                txtContrasenha.Text = new String('*', usuario.contrasenha.Length);
                if(usuario.foto!=null)
                    imagenUsuario.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(usuario.foto);
            }
            
        }

        protected void cambiarContrasenha(object sender, EventArgs e)
        {
            txtContrasenha.TextMode = TextBoxMode.Password;
            lblContrasenhaNueva.Attributes["style"] = "display:block";
            txtContrasenhaNueva.Attributes["style"] = "display:block";
            lblRepetirContrasenha.Attributes["style"] = "display:block";
            txtRepetirContrasenha.Attributes["style"] = "display:block";
            btnEditarContrasenha.Attributes["style"] = "display:none";
            btnGuardarContrasenha.Attributes["style"] = "display:block";
            btnCancelarGuardado.Attributes["style"] = "display:block";
            lblContraseña.Text = "Contraseña actual:";
            txtContrasenha.Enabled = true;
            txtContrasenha.Text = "";
            txtContrasenhaNueva.Text = "";
            txtRepetirContrasenha.Text = "";
        }

        protected void guardarContrasenha(object sender, EventArgs e)
        {
            if (txtContrasenha.Text == usuario.contrasenha)
            {
                errorContrasenhaAntigua.Attributes["style"] = "display:none";
                lblErrorContrasenhaNueva.Attributes["style"] = "display:none";
                if (txtContrasenhaNueva.Text == txtRepetirContrasenha.Text)
                {
                    usuario.contrasenha = txtContrasenha.Text;
                    usuario.fechaCreacionSpecified = true;
                    int resultado;
                    switch (tipoUsuario)
                    {
                        case "apoderado":
                            resultado = daoServicio.modificarApoderado((apoderado)usuario, usuario.foto);
                            break;
                        case "alumno":
                            resultado = daoServicio.modificarAlumno((alumno)usuario, usuario.foto);
                            break;
                        case "docente":
                            resultado = daoServicio.modificarDocente((docente)usuario, usuario.foto);
                            break;
                        case "trabajador":
                            resultado = daoServicio.modificarTrabajador((trabajador)usuario, usuario.foto);
                            break;
                        case "superusuario":
                            resultado = daoServicio.modificarSuperusuario((superUsuario)usuario, usuario.foto);
                            break;
                    }
                    txtContrasenha.TextMode = TextBoxMode.SingleLine;
                    lblContrasenhaNueva.Attributes["style"] = "display:none";
                    txtContrasenhaNueva.Attributes["style"] = "display:none";
                    lblRepetirContrasenha.Attributes["style"] = "display:none";
                    txtRepetirContrasenha.Attributes["style"] = "display:none";
                    btnEditarContrasenha.Attributes["style"] = "display:block";
                    btnGuardarContrasenha.Attributes["style"] = "display:none";
                    btnCancelarGuardado.Attributes["style"] = "display:none";
                    lblContraseña.Text = "Contraseña:";
                    txtContrasenha.Enabled = false;
                    txtContrasenha.Text = new String('*', usuario.contrasenha.Length);
                }
                else
                {
                    lblErrorContrasenhaNueva.Attributes["style"] = "display:block";
                }
            }
            else
            {
                errorContrasenhaAntigua.Attributes["style"] = "display:block";
            }
            
            
        }

        protected void cancelarGuardado(object sender, EventArgs e)
        {
            txtContrasenha.TextMode = TextBoxMode.SingleLine;
            lblContrasenhaNueva.Attributes["style"] = "display:none";
            txtContrasenhaNueva.Attributes["style"] = "display:none";
            lblRepetirContrasenha.Attributes["style"] = "display:none";
            txtRepetirContrasenha.Attributes["style"] = "display:none";
            btnEditarContrasenha.Attributes["style"] = "display:block";
            btnGuardarContrasenha.Attributes["style"] = "display:none";
            btnCancelarGuardado.Attributes["style"] = "display:none";
            errorContrasenhaAntigua.Attributes["style"] = "display:none";
            lblErrorContrasenhaNueva.Attributes["style"] = "display:none";
            lblContraseña.Text = "Contraseña:";
            txtContrasenha.Enabled = false;
            txtContrasenha.Text = new String('*', usuario.contrasenha.Length);
            txtRepetirContrasenha.Text = "";
            txtContrasenhaNueva.Text = "";
        }

        protected void cambiarFoto(object sender, EventArgs e)
        {
            lbEditarFoto.Attributes["style"] = "display:none";
            txtFoto.Attributes["style"] = "display:block";
            lbFoto.Attributes["style"] = "display:block";
            btnSubirFoto.Attributes["style"] = "display:block";
            btnGuardarFoto.Attributes["style"] = "display:block";
            btnCancelarFoto.Attributes["style"] = "display:block";
        }

        protected void cargarFoto(object sender, EventArgs e)
        {
            if (fileFoto.HasFile)
            {
                string extension = System.IO.Path.GetExtension(fileFoto.FileName);
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png")
                {
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileFoto.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    imagenUsuario.ImageUrl = "~/Uploads/" + filename;
                    imagenUsuario.Visible = true;
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["fotoUsuario"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
            else
            {
                Response.Write("Por favor, selecciona un archivo de imagen.");
            }
        }

        protected void guardarFoto(object sender, EventArgs e)
        {
            byte[] foto = (byte[])Session["fotoUsuario"];
            int resultado;
            switch (tipoUsuario)
            {
                case "apoderado":
                    resultado = daoServicio.modificarApoderado((apoderado)usuario, foto);
                    break;
                case "alumno":
                    resultado = daoServicio.modificarAlumno((alumno)usuario, foto);
                    break;
                case "docente":
                    resultado = daoServicio.modificarDocente((docente)usuario, foto);
                    break;
                case "trabajador":
                    resultado = daoServicio.modificarTrabajador((trabajador)usuario, foto);
                    break;
                case "superusuario":
                    resultado = daoServicio.modificarSuperusuario((superUsuario)usuario, foto);
                    break;
            }
        }
        protected void cancelarGuardadoFoto(object sender, EventArgs e)
        {
            lbEditarFoto.Attributes["style"] = "display:block";
            txtFoto.Attributes["style"] = "display:none";
            lbFoto.Attributes["style"] = "display:none";
            btnSubirFoto.Attributes["style"] = "display:none";
            btnGuardarFoto.Attributes["style"] = "display:none";
            btnCancelarFoto.Attributes["style"] = "display:none";
            if (usuario.foto != null)
                imagenUsuario.ImageUrl = "data:image/jpeg;base64," + Convert.ToBase64String(usuario.foto);
            else
                imagenUsuario.ImageUrl = "../Imágenes/logo.png";
        }
    }
}