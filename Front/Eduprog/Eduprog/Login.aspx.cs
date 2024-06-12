using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Linq;
using System.ServiceModel.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class Login : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<string> datosUsuario;
        private bool credencialesError = false;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["credencialesError"]!=null)  
                credencialesError =(bool) Session["credencialesError"];
            errorCredenciales.Attributes["style"] = "display:none";
            if (credencialesError == true)
            {
                //ScriptManager.RegisterStartupScript(this, GetType(), "OcultarParrafo", "document.getElementById('errorCredenciales').setAttribute('hidden', 'true');", true);
                errorCredenciales.Attributes["style"] = "display:none";
                Session["credencialesError"] = false;
            }
        }

        protected void iniciarSesion_Click(object sender, EventArgs e)
        {
            /*
            Datos[0]=id
            Datos[1]=correo
            Datos[2]=contraseña
            Datos[3]=tipo
             */
            daoServicio = new EduprogWSClient();
            string correo = user.Text;
            string contrasenha = password.Text;
            datosUsuario = new BindingList<string>(daoServicio.obtenerUsuarioPorCE(correo));
            if (datosUsuario[2] == contrasenha)
            {
                switch (datosUsuario[3])
                {
                    case "alumno":
                        Session["credencialesError"] = null;
                        Session["idUsuarioActivo"] = datosUsuario[0];
                        Session["tipoUsuarioActivo"] = datosUsuario[3];
                        Response.Redirect("/Alumno/Publicaciones.aspx");
                        break;
                    case "docente":
                        Session["credencialesError"] = null;
                        Session["idUsuarioActivo"] = datosUsuario[0];
                        Session["tipoUsuarioActivo"] = datosUsuario[3];
                        Response.Redirect("/Docente/Publicaciones.aspx");
                        break;
                    case "trabajador":
                        Session["credencialesError"] = null;
                        Session["idUsuarioActivo"] = datosUsuario[0];
                        Session["tipoUsuarioActivo"] = datosUsuario[3];
                        Response.Redirect("/UsuarioAdministrativo/Publicaciones.aspx");
                        break;
                    case "apoderado":
                        Session["credencialesError"] = null;
                        Session["idUsuarioActivo"] = datosUsuario[0];
                        Session["tipoUsuarioActivo"] = datosUsuario[3];
                        Response.Redirect("/Apoderado/Publicaciones.aspx");
                        break;
                    case "superusuario":
                        Session["credencialesError"] = null;
                        Session["idUsuarioActivo"] = datosUsuario[0];
                        Session["tipoUsuarioActivo"] = datosUsuario[3];
                        Response.Redirect("/Admin/adminPublicaciones.aspx");
                        break;
                }
            }
            else
            {
                errorCredenciales.Attributes["style"] = "display:block";
                //ScriptManager.RegisterStartupScript(this, GetType(), "MostrarParrafo", "document.getElementById('errorCredenciales').removeAttribute('hidden');", true);
                Session["credencialesError"] = true;
            }
            
        }
    }
}